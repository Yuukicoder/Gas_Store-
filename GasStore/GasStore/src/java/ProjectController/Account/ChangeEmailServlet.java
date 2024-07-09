/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ProjectController.Account;

import DTO.Customer;
import dal.CustomerDao;
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
@WebServlet(name="ChangeEmailServlet", urlPatterns={"/Email"})
public class ChangeEmailServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ChangeEmailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeEmailServlet at " + request.getContextPath () + "</h1>");
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
        Integer customerId = (Integer) session.getAttribute("customerID");
        
        if (customerId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String currentEmail = request.getParameter("currentEmail");
        String newEmail = request.getParameter("newEmail");
        String confirmEmail = request.getParameter("confirmEmail");
        
        // Validate current email (optional step, can be checked against session)
        CustomerDao customerDao = new CustomerDao();
        Customer customer = customerDao.getAllByID(customerId);
        
        if (!customer.getEmail().equals(currentEmail)) {
            request.setAttribute("error", "Current email does not match.");
            request.getRequestDispatcher("change-email.jsp").forward(request, response);
            return;
        }
        
        // Validate new email and confirm email
        if (!newEmail.equals(confirmEmail)) {
            request.setAttribute("error", "New email and confirm email do not match.");
            request.getRequestDispatcher("change-email.jsp").forward(request, response);
            return;
        }
        
        // Update email in database
        customer.setEmail(newEmail);
        customerDao.updateUser(customer);
        
        // Redirect to profile or success page
        response.sendRedirect("ProfileUser.jsp");
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
