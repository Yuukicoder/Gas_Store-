/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

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
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/productUpdate"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class UpdateProductServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
         HttpSession session = request.getSession();
        String pid_raw = (String)request.getParameter("pid");
        String name = (String)request.getParameter("name");
        String category_raw =(String)request.getParameter("category");
        String supplier_raw = (String)request.getParameter("supplier");
        String stock_raw = (String)request.getParameter("stock");
        String price_raw = (String)request.getParameter("price");
        String unitOnOrders_raw = (String)request.getParameter("unitOnOrders");
        String descrip = (String)request.getParameter("descrip");
        String code_raw = (String)request.getParameter("code");
        String keyword_raw = (String)request.getParameter("keyword");
        String shortDes_raw = (String)request.getParameter("shortDes");
        String button = (String)request.getParameter("update");
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
                
                if (!fileName.isEmpty()) {
                    System.out.println(fileName);
                    Product productDTO = new Product(pid, code_raw, name, keyword_raw, shortDes_raw, descrip, categoryID, supplierID, true, price, fileName, stock, unitOnOrders, null, 1);
                    checkUpdateProduct = pdao.updateProduct(productDTO, checkImg);
                } else {
                    checkImg = 0;
                    Product productDTO = new Product(pid, code_raw, name, keyword_raw, shortDes_raw, descrip, categoryID, supplierID, true, price, null, stock, unitOnOrders, null, 1);
                    checkUpdateProduct = pdao.updateProduct(productDTO, checkImg);
                }
                if (checkUpdateProduct == 1) {
                    if (!fileName.isEmpty()) {
                       String path = getServletContext().getRealPath("") ;
                        
                        File file = new File(path);
                        p.write(path + File.separator + fileName);
                        session.setAttribute("msg", "Update Success!");
                        response.sendRedirect("productManage");
                    } else {
                        session.setAttribute("msg", "Update Success!");
                        response.sendRedirect("productManage");
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
                        parts.add(part);
                        String fiString = part.getSubmittedFileName();

                        list.add(fiString);
                    }
                }
                if (list.size() != 0) {
                    int check = pidao.addNewImageProduct(list, pid);
                    if (check != 0) {
                        for (int i = 0; i < list.size(); i++) {
                            String path = getServletContext().getRealPath("");

                            // Sử dụng Part từ danh sách parts, không phải requestParts
                            Part part = parts.get(i);
                            part.write(path + File.separator + list.get(i));
                        }
                        session.setAttribute("msg", "Update ImageProduct Sucess!");
                        response.sendRedirect("productManage");
                    } else {
                        session.setAttribute("msg", "Have no update for ImageProduct");
                        response.sendRedirect("productManage");
                    }
                } else {
                    session.setAttribute("msg", "Have no update for ImageProduct");
                    response.sendRedirect("productManage");
                }

            }
            if (button.equals("delete")) {
                String[] checkboxValues = request.getParameterValues("deleteImg");
                if (checkboxValues != null) {
                    ArrayList<Integer> listImge = new ArrayList<>();
                    for (int i = 0; i < checkboxValues.length; i++) {
                        try {
                            int imgID = Integer.parseInt(checkboxValues[i]);
                            listImge.add(imgID);
                        } catch (Exception e) {
                        }

                    }
                    int checkDeleteImg = pidao.deleteImage(listImge);
                    if (checkDeleteImg != 0) {
                        session.setAttribute("msg", "Update ImageProduct Sucess!");
                        response.sendRedirect("productManage");

                    }
                } else {
                    session.setAttribute("msg", "Have no update for ImageProduct");
                    response.sendRedirect("productManage");
                }

            }

        } catch (Exception e) {
        }
//            public ProductDTO(int productID, int categoryID, String name, String image, int quantity, double price, String ram, String storage, String cpu, String vga, int Status, String description, int sold) {
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            Supplier supplier = s.getSupplierByID(pdto.getSupplierID());
            List<Supplier> supplierDTOs = s.getAllSupplier();
            request.setAttribute("pdto", pdto);
            request.setAttribute("categoryName", category.getName());
            request.setAttribute("categoryID", category.getCategoryID());
            request.setAttribute("categoryDTOs", categoryDTOs);
            request.setAttribute("supplierName", supplier.getCompanyName());
            request.setAttribute("supplierID", supplier.getSupplierID());
            request.setAttribute("supplierDTOs", supplierDTOs);
            request.getRequestDispatcher("EditProductDB.jsp").forward(request, response);

        } catch (Exception e) {
        }
    }
    
}
