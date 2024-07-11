/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Home;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DTO.Product;
import dal.SupplierDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Supplier;

/**
 *
 * @author vu anh
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
        String key = request.getParameter("key");

        if (key == null) {
            key = "";
        }

        CategoryDAO cdao = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();

        List<Product> products = productDAO.getSearchResult(key);

        SupplierDao supDAO = new SupplierDao();

        Map<Integer, String> supplierMap = new HashMap<>();

        for (Product product : products) {
            if (!supplierMap.containsKey(product.getSupplierID())) {
                Supplier supplier = supDAO.getSupplierById(product.getSupplierID());
                supplierMap.put(product.getSupplierID(), supplier.getCompanyName());
            }
        }

        String pageNumberString = request.getParameter("page");
        Integer pageNumber = (pageNumberString != null && !pageNumberString.isEmpty())
                ? Integer.valueOf(pageNumberString)
                : 1;

        double pageSize = 12.0;
        int startIndex = (int) ((pageNumber - 1) * pageSize);
        int endIndex = (int) Math.min(pageNumber * pageSize, products.size());
        List<Product> paginatedProducts = products.subList(startIndex, endIndex);

        request.setAttribute("maxPage", Math.ceil(products.size() / pageSize));
        request.setAttribute("product", paginatedProducts);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("cate", cdao.getAllCategory());
        request.setAttribute("suppliers", supplierMap);

        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

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
        processRequest(request, response);
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
