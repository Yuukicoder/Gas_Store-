/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.DiscountDAO;
import DAO.PostCategoryDAO;
import DAO.PostListDAO;
import DTO.Customer;
import DTO.Discount;
import DTO.PostCategoryDTO;
import DTO.PostDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ViewDiscount extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                HttpSession session = request.getSession();
                        Customer account = (Customer) session.getAttribute("account");
                                    request.setAttribute("acc", account);
        request.getRequestDispatcher("ViewDiscount.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("account");
        String num_raw = request.getParameter("num");
        ArrayList<Discount> Discounts = new ArrayList<>();
        DiscountDAO discountDAO = new DiscountDAO();
        try {
            if (num_raw != null) {
                int num = Integer.parseInt(num_raw);
//                Discounts = pldao.getAllPostWithCondition(num);
            } else {
                Discounts = discountDAO.getAllDiscount();
            }

            String pageNumberString = request.getParameter("page");
            Integer pageNumber = (pageNumberString != null && !pageNumberString.isEmpty())
                    ? Integer.valueOf(pageNumberString)
                    : 1;

            double pageSize = 3.0;
            int startIndex = (int) ((pageNumber - 1) * pageSize);
            int endIndex = (int) Math.min(pageNumber * pageSize, Discounts.size());
            List<Discount> paginatedPosts = Discounts.subList(startIndex, endIndex);

            request.setAttribute("maxPage", (int) Math.ceil(Discounts.size() / pageSize));
            request.setAttribute("paginatedPosts", paginatedPosts);
            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("postCategoryDTOs", postCategoryDTOs);
//            request.setAttribute("postDTOs", postDTOs);
            request.setAttribute("size", Discounts.size());
            request.setAttribute("acc", account);

            request.getRequestDispatcher("ViewDiscount.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String searchKey = request.getParameter("search").trim();
        ArrayList<Discount> postDTOs = new ArrayList<>();
        DiscountDAO pldao = new DiscountDAO();
//        PostDAO postCategoryDAO = new PostCategoryDAO();

//        postDTOs = pldao.getPostSearch(searchKey);
//        ArrayList<PostCategoryDTO> postCategoryDTOs = postCategoryDAO.getAllPostCategory();

//        request.setAttribute("postCategoryDTOs", postCategoryDTOs);
        request.setAttribute("size", postDTOs.size());
        request.setAttribute("postDTOs", postDTOs);
        request.getRequestDispatcher("PostSearch.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
