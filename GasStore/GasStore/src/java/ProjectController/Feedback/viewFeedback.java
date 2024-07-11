/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ProjectController.Feedback;

import DAO.FeedbackDAO;
import DAO.ProductDAO;
import DTO.FeedbackDTO;
import DTO.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author vip2021
 */
@WebServlet(name="viewFeedback", urlPatterns={"/viewFeedback"})
public class viewFeedback extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet viewFeedback</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewFeedback at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productid"));
        int orderId = Integer.parseInt(request.getParameter("orderid"));
        int customerId = Integer.parseInt(request.getParameter("customerid")); // Lấy ID khách hàng từ session hoặc request

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        FeedbackDTO feedback = feedbackDAO.getFeedbackByProductAndOrder(productId, orderId, customerId);

        if (feedback != null) {
            ProductDAO productDAO = new ProductDAO();
            ProductDTO product = productDAO.getProductByID(productId);
            feedback.setProductDTO(product);

            request.setAttribute("feedback", feedback);
            request.getRequestDispatcher("viewFeedback.jsp").forward(request, response);
        } else {
            response.sendRedirect("mypurchase"); // Nếu không tìm thấy phản hồi, chuyển hướng về trang "My Purchase"
        }
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
        processRequest(request, response);
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
