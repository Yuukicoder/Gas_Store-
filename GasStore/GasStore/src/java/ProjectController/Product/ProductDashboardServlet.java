/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Product;

import DAO.AccountDAO;
import DAO.CategoryDAO;
import DAO.PostCategoryDAO;
import DAO.PostListDAO;
import DAO.ProductDAO;
import DTO.AccountDTO;
import DTO.CategoryDTO;
import DTO.PostCategoryDTO;
import DTO.PostDTO;
import DTO.ProductDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Product;

/**
 *
 * @author 1234
 */
public class ProductDashboardServlet extends HttpServlet {

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
        
        String message = (String) session.getAttribute("msg");
        session.removeAttribute("msg");

        List<Product> productDTOs = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        
        LinkedHashMap<Product, String> productCmap = new LinkedHashMap<>();
        

        //hide product 
        String action = request.getParameter("action");
        String indexPage_raw = request.getParameter("indexPage");

        try {
            int indexPage = 0;
            if (indexPage_raw == null) {
                indexPage = 1;
            } else {
                indexPage = Integer.parseInt(indexPage_raw);
            }
            if (action == null || action.equals("show")) {
                action = "normal";
                productCmap = productDAO.pagingProduct(action, indexPage);
                productDTOs = productDAO.getAllProduct();

                int numProduct = productDTOs.size();
                int endPage = numProduct / 5;
                if (numProduct % 5 != 0) {
                    endPage++;
                }
                request.setAttribute("endPage", endPage);
                request.setAttribute("action", "show");
                request.setAttribute("tag", indexPage);

                request.setAttribute("productCmap", productCmap);
                request.setAttribute("msg", message);
                request.getRequestDispatcher("ProductManage.jsp").forward(request, response);

            } else {
                productCmap = productDAO.pagingProduct(action, indexPage);
                productDTOs = productDAO.getAllProductHide();
                int numProduct = productDTOs.size();
                int endPage = numProduct / 5;
                if (numProduct % 5 != 0) {
                    endPage++;
                }

                request.setAttribute("action", "hide");
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);

                request.setAttribute("productCmap", productCmap);
                request.setAttribute("msg", message);
                request.getRequestDispatcher("HideProduct.jsp").forward(request, response);
            }
        } catch (Exception e) {
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
                HttpSession session = request.getSession();
        
        
                String searchKey = request.getParameter("search");
                System.out.println(searchKey);
                String action = request.getParameter("action");

                LinkedHashMap<Product, String> productCmap = new LinkedHashMap<>();

                ProductDAO productDAO = new ProductDAO();

                productCmap = productDAO.getSearchProduct(searchKey, action);

                request.setAttribute("productCmap", productCmap);
                request.setAttribute("size", productCmap.size());
                request.setAttribute("action", action);
                request.getRequestDispatcher("ProductSearch.jsp").forward(request, response);
            }
        
    
        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }
    }
