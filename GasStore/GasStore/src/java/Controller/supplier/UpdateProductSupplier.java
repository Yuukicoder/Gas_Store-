package Controller.supplier;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DAO.SupplierDAO;
import DTO.Category;
import DTO.ProductImg;
import DTO.Supplier;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import DTO.Product;

/**
 *
 * @author dell456
 */
@WebServlet(name = "UpdateProductSuppliers", urlPatterns = {"/supplier/productUpdate"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class UpdateProductSupplier extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        model.Supplier currentSupplier = (model.Supplier) session.getAttribute("supplier");
        if (currentSupplier != null) {
            String pid_raw = (String) request.getParameter("pid");
            String name = (String) request.getParameter("name");
            String category_raw = (String) request.getParameter("category");
            String supplier_raw = (String) request.getParameter("supplier");
            String stock_raw = (String) request.getParameter("stock");
            String price_raw = (String) request.getParameter("price");
            String unitOnOrders_raw = (String) request.getParameter("unitOnOrders");
            String descrip = (String) request.getParameter("descrip");
            String code_raw = (String) request.getParameter("code");
            String keyword_raw = (String) request.getParameter("keyword");
            String shortDes_raw = (String) request.getParameter("shortDes");
            String button = (String) request.getParameter("update");
            ProductImgDAO pidao = new ProductImgDAO();

            try {
                int pid = Integer.parseInt(pid_raw);
                int stock = Integer.parseInt(stock_raw);
                int categoryID = Integer.parseInt(category_raw);
                float price = Float.parseFloat(price_raw);
                int supplierID = Integer.parseInt(supplier_raw);
                int unitOnOrders = Integer.parseInt(unitOnOrders_raw);
                int checkUpdateProduct = 0;
                ProductDAO pdao = new ProductDAO();
                int checkImg = 1;
                if (button.equals("product")) {
                    Part p = request.getPart("ipro");
                    String fileName = p.getSubmittedFileName();
                    String mimeType = p.getContentType();

                    if (!fileName.isEmpty() && mimeType != null && mimeType.startsWith("image/")) {
                        System.out.println(fileName);
                        Product productDTO = new Product(pid, code_raw, name, keyword_raw, shortDes_raw, descrip, categoryID, supplierID, true, price, fileName, stock, unitOnOrders, null, 1);
                        checkUpdateProduct = pdao.updateProduct(productDTO, checkImg);
                    } else if (!fileName.isEmpty()) {
                        session.setAttribute("msg", "Only image files are allowed!");
                        response.sendRedirect("product-manager");
                        return;
                    } else {
                        checkImg = 0;
                        Product productDTO = new Product(pid, code_raw, name, keyword_raw, shortDes_raw, descrip, categoryID, supplierID, true, price, null, stock, unitOnOrders, null, 1);
                        checkUpdateProduct = pdao.updateProduct(productDTO, checkImg);
                    }
                    if (checkUpdateProduct == 1) {
                        if (!fileName.isEmpty()) {
                            String path = getServletContext().getRealPath("");
                            File file = new File(path);
                            p.write(path + File.separator + fileName);
                            session.setAttribute("msg", "Update Success!");
                            response.sendRedirect("product-manager");
                        } else {
                            session.setAttribute("msg", "Update Success!");
                            response.sendRedirect("product-manager");
                        }
                    }
                }

                if (button.equals("imageAdd")) {
                    String[] ides = request.getParameterValues("ides[]");
                    List<Part> parts = new ArrayList<>();
                    Collection<Part> requestParts = request.getParts();
                    ArrayList<String> list = new ArrayList<>();
                    for (Part part : requestParts) {
                        if (part.getName().equals("ides[]")) {
                            String mimeType = part.getContentType();
                            if (mimeType != null && mimeType.startsWith("image/")) {
                                parts.add(part);
                                String fiString = part.getSubmittedFileName();
                                list.add(fiString);
                            } else {
                                session.setAttribute("msg", "Only image files are allowed!");
                                response.sendRedirect("product-manager");
                                return;
                            }
                        }
                    }
                    if (list.size() != 0) {
                        int check = pidao.addNewImageProduct(list, pid);
                        if (check != 0) {
                            for (int i = 0; i < list.size(); i++) {
                                String path = getServletContext().getRealPath("");

                                // Use Part from the list of parts, not requestParts
                                Part part = parts.get(i);
                                part.write(path + File.separator + list.get(i));
                            }
                            session.setAttribute("msg", "Update ImageProduct Success!");
                            response.sendRedirect("product-manager");
                        } else {
                            session.setAttribute("msg", "No update for ImageProduct");
                            response.sendRedirect("product-manager");
                        }
                    } else {
                        session.setAttribute("msg", "No update for ImageProduct");
                        response.sendRedirect("product-manager");
                    }
                }
                if (button.equals("delete")) {
                    String[] checkboxValues = request.getParameterValues("deleteImg");
                    if (checkboxValues != null) {
                        ArrayList<Integer> listImage = new ArrayList<>();
                        for (int i = 0; i < checkboxValues.length; i++) {
                            try {
                                int imgID = Integer.parseInt(checkboxValues[i]);
                                listImage.add(imgID);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        int checkDeleteImg = pidao.deleteImage(listImage);
                        if (checkDeleteImg != 0) {
                            session.setAttribute("msg", "Update ImageProduct Success!");
                            response.sendRedirect("product-manager");
                        }
                    } else {
                        session.setAttribute("msg", "No update for ImageProduct");
                        response.sendRedirect("product-manager");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("msg", "Error during update");
                response.sendRedirect("product-manager");
            }
        } else {
            response.sendRedirect("../login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        model.Supplier currentSupplier = (model.Supplier) session.getAttribute("supplier");
        if (currentSupplier != null) {
            String product_id_raw = request.getParameter("pid");
            try {
                int product_id = Integer.parseInt(product_id_raw);
                ProductImgDAO pidao = new ProductImgDAO();
                List<ProductImg> pimgs = pidao.getPImgByPid(product_id);
                request.setAttribute("pimgs", pimgs);
                ProductDAO productDAO = new ProductDAO();
                CategoryDAO categoryDAO = new CategoryDAO();
                SupplierDAO s = new SupplierDAO();
                Product pdto = productDAO.getProductByID(product_id);
                Category category = categoryDAO.getCategoryByID(pdto.getCategoryID());
                List<Category> categoryDTOs = categoryDAO.getAllCategory();
                System.out.println(category);
                Supplier supplier = s.getSupplierByID(currentSupplier.getSupplierId());

                request.setAttribute("pdto", pdto);
                request.setAttribute("categoryID", category.getCategoryID());
                request.setAttribute("categoryDTOs", categoryDTOs);
                request.setAttribute("supplier", supplier);

                request.getRequestDispatcher("EditProductDB.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("product-manager");
            }
        } else {
            response.sendRedirect("../login.jsp");
        }
    }
}
