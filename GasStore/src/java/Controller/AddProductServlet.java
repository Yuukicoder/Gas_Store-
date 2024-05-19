/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DAO.SupplierDAO;
import DTO.AccountDTO;
import DTO.Category;
import DTO.Product;
import DTO.ProductDTO;
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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


/**
 *
 * @author dell456
 */
@WebServlet(name = "AddProductServlet", urlPatterns = {"/productAdd"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class AddProductServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                HttpSession session = request.getSession();
                String name = request.getParameter("name");
                String category_raw = request.getParameter("category");
                String stock_raw = request.getParameter("stock");
                Part ipro = request.getPart("ipr");
                String fileNameIpro = ipro.getSubmittedFileName();
                String price_raw = request.getParameter("price");
                String supplier_raw = (String)request.getParameter("supplier");
                String unitOnOrders_raw = (String)request.getParameter("unitOnOrders");
                String descrip = (String)request.getParameter("descrip");
                String code= (String)request.getParameter("code");
                String keyword= (String)request.getParameter("keyword");
                String shortDes= (String)request.getParameter("shortDes");

                System.out.println("descrop" + descrip);
                ProductDAO pdao = new ProductDAO();
                ProductImgDAO pidao = new ProductImgDAO();
                String[] ides = request.getParameterValues("ides[]");
                List<Part> parts = new ArrayList<>();

//                try {
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
                        if (listSummitedFile.size() != 0) {
                            int check = pidao.addNewImageProduct(listSummitedFile, newProductID);
                            if (check != 0) {

                                for (int i = 0; i < listSummitedFile.size(); i++) {
                                    String path = getServletContext().getRealPath("");
                                    Part part = parts.get(i);
                                    part.write(path + File.separator + listSummitedFile.get(i));
                                }
                                session.setAttribute("msg", "Add New Product Sucess!");
                                response.sendRedirect("productManage");
                            }
                        } else {
                            session.setAttribute("msg", "Add New Product Not Sucess!");
                            response.sendRedirect("productManage");
                        }
                    } else {
                        System.out.println("error server");
                    }
//                } catch (Exception e) {
//                    System.out.println(e);
//                }
             
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                HttpSession session = request.getSession();

                SupplierDAO supplierDAO = new SupplierDAO();
                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> cdtos = categoryDAO.getAllCategory();
                List<Supplier> listSupplier = supplierDAO.getAllSupplier();
                request.setAttribute("listSupplier", listSupplier);
                request.setAttribute("cdtos", cdtos);
                request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
            }
    }
    

