/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.supplier;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DAO.SupplierDAO;
import DTO.AdminDTO;
import DTO.Category;
import DTO.Product;
import DTO.Supplier;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ProductManager", urlPatterns = {"/supplier/product-manager"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ProductManager extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        model.Supplier currentSupplier = (model.Supplier) session.getAttribute("supplier");
        if (currentSupplier != null) {
            String searchParam = request.getParameter("search");
            String limitParam = request.getParameter("limit");
            String pageParam = request.getParameter("page");
            String statusParam = request.getParameter("status");

            Integer limit = (limitParam != null && !limitParam.isEmpty()) ? Integer.valueOf(limitParam) : 10;
            Integer page = (pageParam != null && !pageParam.isEmpty()) ? Integer.valueOf(pageParam) : 1;
            Integer status = (statusParam != null && !statusParam.isEmpty()) ? Integer.valueOf(statusParam) : 1;

            ProductDAO productDAO = new ProductDAO();
            List<Product> allProducts = productDAO.getAllProductWithParam(currentSupplier.getSupplierId(), searchParam, status);
            int totalPages = (int) Math.ceil((double) allProducts.size() / limit);
            List<Product> paginatedProducts = productDAO.paginateProducts(allProducts, page, limit);

            SupplierDAO supplierDAO = new SupplierDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> cdtos = categoryDAO.getAllCategory();
            DTO.Supplier supplier = supplierDAO.getSupplierByID(currentSupplier.getSupplierId());
            System.out.println("KKKKKK");
            System.out.println(supplier.getCompanyName());
            request.setAttribute("supplier", supplier);
            request.setAttribute("cdtos", cdtos);

            request.setAttribute("products", paginatedProducts);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.getRequestDispatcher("ProductManage.jsp").forward(request, response);
        } else {
            response.sendRedirect("../login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        model.Supplier currentSupplier = (model.Supplier) session.getAttribute("supplier");
        if (currentSupplier != null) {
            String action = request.getParameter("action");
            ProductDAO pdao = new ProductDAO();
            if (action.equals("add")) {

                String name = request.getParameter("name");
                String category_raw = request.getParameter("category");
                String stock_raw = request.getParameter("stock");
                Part ipro = request.getPart("ipr");
                String fileNameIpro = ipro.getSubmittedFileName();
                String price_raw = request.getParameter("price");
                String supplier_raw = (String) request.getParameter("supplier");
                String unitOnOrders_raw = (String) request.getParameter("unitOnOrders");
                String descrip = (String) request.getParameter("descrip");
                String code = (String) request.getParameter("code");
                String keyword = (String) request.getParameter("keyword");
                String shortDes = (String) request.getParameter("shortDes");

                System.out.println("descrop" + descrip);

                ProductImgDAO pidao = new ProductImgDAO();
                String[] ides = request.getParameterValues("ides[]");
                List<Part> parts = new ArrayList<>();

                try {
                    Collection<Part> requestParts = request.getParts();
                    parts.add(ipro);
                    ArrayList<String> listSummitedFile = new ArrayList<>();
                    int categoryID = Integer.parseInt(category_raw);
                    int stock = Integer.parseInt(stock_raw);
                    float price = Float.parseFloat(price_raw);
                    int supplierID = Integer.parseInt(supplier_raw);
                    int unitOnOrders = Integer.parseInt(unitOnOrders_raw);
                    LocalDateTime now = LocalDateTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    String formattedDate = now.format(formatter);
                    Product productDTO = new Product(0, code, name, keyword, shortDes, descrip, categoryID, supplierID, true, price, fileNameIpro, stock, unitOnOrders, formattedDate, 1);
                    int newProductID = pdao.addNewProduct(productDTO);
                    System.out.println("newProductId" + newProductID);
                    listSummitedFile.add(fileNameIpro);
                    if (newProductID != 0) {
                        System.out.println("size " + listSummitedFile.size());
                        for (Part part : requestParts) {
                            if (part.getName().equals("ides[]")) {
                                parts.add(part);
                                String fiString = part.getSubmittedFileName();
                                listSummitedFile.add(fiString);
                            }
                        }
                        if (!listSummitedFile.isEmpty()) {
                            int check = pidao.addNewImageProduct(listSummitedFile, newProductID);
                            if (check != 0) {

                                for (int i = 0; i < listSummitedFile.size(); i++) {
                                    String path = getServletContext().getRealPath("");
                                    Part part = parts.get(i);
                                    part.write(path + File.separator + listSummitedFile.get(i));
                                }
                                session.setAttribute("msg", "Add New Product Sucess!");
                                response.sendRedirect("product-manager");
                            }
                        } else {
                            session.setAttribute("msg", "Add New Product Not Sucess!");
                            response.sendRedirect("product-manager");
                        }
                    } else {
                        System.out.println("error server");
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                
            }
            if (action.equals("change-status")) {
                    System.out.println("IIIIIIIIIIIIIII");
                    int id = Integer.parseInt(request.getParameter("id"));
                    String status = request.getParameter("status");
                    System.out.println(id + ""+ status);
                    if (status.equals("show")) {
                        pdao.changeProductStatus(id, false);
                        session.setAttribute("msg", "Hide product success!");
                        response.sendRedirect("product-manager");
                    }
                    if (status.equals("hide")) {
                        pdao.changeProductStatus(id, true);
                        session.setAttribute("msg", "Show product success!");
                        response.sendRedirect("product-manager");
                    }

                }

        }else{
            response.sendRedirect("../login.jsp");
        }
    }

}
