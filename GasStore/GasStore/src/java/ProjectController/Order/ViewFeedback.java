package ProjectController.Order;

import DAO.FeedbackDAO;
import DAO.ProductDAO;
import DTO.Customer;
import DTO.FeedbackDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author vip2021
 */
@WebServlet(name="ViewFeedback", urlPatterns={"/view-feedback"})
public class ViewFeedback extends HttpServlet {

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
        Customer cus = (Customer)session.getAttribute("account");
        if(cus == null){
            response.sendRedirect("login.jsp");
            return;
        }
        int productid = Integer.parseInt(request.getParameter("productid"));
        int orderid = Integer.parseInt(request.getParameter("orderid"));

        ProductDAO aO2 = new ProductDAO();
        FeedbackDAO fdao = new FeedbackDAO();
        FeedbackDTO feed = fdao.getFeedbackById(productid, orderid, cus.getCustomerID());
        
        request.setAttribute("rating", feed.getStart());
        request.setAttribute("feedbackList", feed);
        request.setAttribute("productid1", productid);
        request.setAttribute("orderid", orderid);
        request.setAttribute("productid", aO2.getProductByID(productid));
        request.getRequestDispatcher("viewFeedback.jsp").forward(request, response);
    }

    // Add a new method to handle AJAX requests for updating the rating
    private void updateRating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("account");
        if (cus == null) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
//        int productid = Integer.parseInt(request.getParameter("productid"));
//        int orderid = Integer.parseInt(request.getParameter("orderid"));
        String feedbackid = request.getParameter("id");
        String te = request.getParameter("feedbackcontent");
        int rating = Integer.parseInt(request.getParameter("rating"));

        FeedbackDAO fdao = new FeedbackDAO();
        fdao.updateFeedback1(feedbackid,te, rating);

        response.setStatus(HttpServletResponse.SC_OK);
    }

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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        Customer cus = (Customer) session.getAttribute("account");
        if (cus == null) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
//        int productid = Integer.parseInt(request.getParameter("productid"));
//        int orderid = Integer.parseInt(request.getParameter("orderid"));
        String feedbackid = request.getParameter("id");
        String te = request.getParameter("feedbackcontent");
        int rating = Integer.parseInt(request.getParameter("rating"));

        FeedbackDAO fdao = new FeedbackDAO();
        fdao.updateFeedback1(feedbackid,te, rating);

        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("mypurchase");
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
