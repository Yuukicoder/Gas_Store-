/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package OldProjectController.Product;


import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DAO.SupplierDAO;
import DTO.AccountDTO;
import DTO.Category;
import DTO.ProductDTO;
import DTO.Supplier;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author 1234
 */
public class AddProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
//        AccountDTO account = (AccountDTO) session.getAttribute("account");
//        if (account != null) {
//            if (account.getRole() == 1) {
                SupplierDAO supplierDAO = new SupplierDAO();
                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> cdtos = categoryDAO.getAllCategory();
                List<Supplier> listSupplier = supplierDAO.getAllSupplier();
                request.setAttribute("listSupplier", listSupplier);
                request.setAttribute("cdtos", cdtos);
                request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
            }
//        } else {
//            response.sendRedirect("403.jsp");
//        }
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRole() == 1) {

                String name = request.getParameter("name");
                String category_raw = request.getParameter("category");
                String stock_raw = request.getParameter("stock");
                Part ipro = request.getPart("ipr");
                String fileNameIpro = ipro.getSubmittedFileName();
                String price_raw = request.getParameter("price");
                String typeRam = request.getParameter("typeRam");
                String ram = request.getParameter("ram") + typeRam;
                String typeStorage = request.getParameter("typeStorage");
                String storage = request.getParameter("storage") + typeStorage;
                String cpu = request.getParameter("cpu");
                String vga = request.getParameter("vga");
                String descrip = request.getParameter("descrip");

                System.out.println("descrop" + descrip);
                ProductDAO pdao = new ProductDAO();
                ProductImgDAO pidao = new ProductImgDAO();
                String[] ides = request.getParameterValues("ides[]");
                List<Part> parts = new ArrayList<>();

                try {
                    Collection<Part> requestParts = request.getParts();
                    System.out.println("Reskdfs   " + requestParts.size());
                    parts.add(ipro);
                    ArrayList<String> listSummitedFile = new ArrayList<>();
                    int categoryID = Integer.parseInt(category_raw);
                    int stock = Integer.parseInt(stock_raw);
                    double price = Double.parseDouble(price_raw);
                    ProductDTO productDTO = new ProductDTO(0, categoryID, name, fileNameIpro, stock, price, ram, storage, cpu, vga, 1, descrip, 0);
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
                                    String path = getServletContext().getRealPath("") + "images/Product";
                                    Part part = parts.get(i);
                                    part.write(path + File.separator + listSummitedFile.get(i));
                                }
                                session.setAttribute("msg", "Add New Product Sucess!");
                                response.sendRedirect("ProductDashboard");
                            }
                        } else {
                            session.setAttribute("msg", "Add New Product Not Sucess!");
                            response.sendRedirect("ProductDashboard");
                        }
                    } else {
                        System.out.println("error server");
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
            } else {
                response.sendRedirect("403.jsp");
            }
        } else {
            response.sendRedirect("403.jsp");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
