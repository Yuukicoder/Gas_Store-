/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Category;

import DAO.CategoryDAO;
import DTO.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ManageCateServlet", urlPatterns = {"/manageCate"})
public class ManageCateServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageCateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageCateServlet at " + request.getContextPath() + "</h1>");
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
        String search = request.getParameter("search");
        
        if (search == null) {
            search = "";
        }
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> lc = categoryDAO.searchCategory(search);
        List<Category> result;
        String indexPage_raw = request.getParameter("indexPage");
        
        String pageSize_raw = request.getParameter("pageSize");
        
        int pageSize = 0;
        
        if (pageSize_raw == null) {
            pageSize_raw = "5";
            pageSize = 5;
        } else if (pageSize_raw.equals("0")) {
            request.setAttribute("currentPageSize", pageSize_raw);
            request.setAttribute("tag", 1);
            request.setAttribute("endPage", 1);
            request.setAttribute("search", search);
            request.setAttribute("listCategory", lc);
            request.getRequestDispatcher("TableCategory.jsp").forward(request, response);
        } else {
            pageSize = Integer.parseInt(pageSize_raw);
        }
        
        try {
            int indexPage = 0;
            if (indexPage_raw == null) {
                indexPage = 1;
            } else {
                indexPage = Integer.parseInt(indexPage_raw);
            }
            int numProduct = lc.size();
            int endPage = numProduct / pageSize;
            if (numProduct % pageSize != 0) {
                endPage++;
            }
            result = categoryDAO.paggingSearch(indexPage, pageSize, search);
            
            request.setAttribute("currentPageSize", pageSize_raw);
            request.setAttribute("search", search);
            request.setAttribute("endPage", endPage);
            request.setAttribute("tag", indexPage);
            request.setAttribute("listCategory", result);
            request.getRequestDispatcher("TableCategory.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
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
        String search = request.getParameter("search");
        
        if (search == null) {
            search = "";
        }
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> lc = categoryDAO.searchCategory(search);
        List<Category> result;
        String indexPage_raw = request.getParameter("indexPage");
        
        String pageSize_raw = request.getParameter("pageSize");
        
        int pageSize = 0;
        
        if (pageSize_raw == null) {
            pageSize_raw = "5";
            pageSize = 5;
        } else if (pageSize_raw.equals("0")) {
            request.setAttribute("currentPageSize", pageSize_raw);
            request.setAttribute("tag", 1);
            request.setAttribute("endPage", 1);
            request.setAttribute("search", search);
            request.setAttribute("listCategory", lc);
            request.getRequestDispatcher("TableCategory.jsp").forward(request, response);
        } else {
            pageSize = Integer.parseInt(pageSize_raw);
        }
        
        try {
            int indexPage = 0;
            if (indexPage_raw == null) {
                indexPage = 1;
            } else {
                indexPage = Integer.parseInt(indexPage_raw);
            }
            int numProduct = lc.size();
            int endPage = numProduct / pageSize;
            if (numProduct % pageSize != 0) {
                endPage++;
            }
            result = categoryDAO.paggingSearch(indexPage, pageSize, search);
            
            System.out.println("endPage: " + endPage);
            request.setAttribute("currentPageSize", pageSize_raw);
            request.setAttribute("search", search);
            request.setAttribute("endPage", endPage);
            request.setAttribute("tag", indexPage);
            request.setAttribute("listCategory", result);
            request.getRequestDispatcher("TableCategory.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
