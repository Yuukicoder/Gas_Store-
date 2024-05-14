/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.AdminController;

import dal.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Customer;

/**
 *
 * @author vip2021
 */
@WebServlet(name = "AdminAccountServlet", urlPatterns = {"/admin"})
public class AdminAccountServlet extends HttpServlet {

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
        CustomerDao cus = new CustomerDao();
        List<Customer> li = cus.getAll();
        request.setAttribute("ldata", li);

        String customerIdParam = request.getParameter("id");
        String typeParam = request.getParameter("type");

        if (customerIdParam != null && typeParam != null && !customerIdParam.isEmpty() && !typeParam.isEmpty()) {
            int customerId = Integer.parseInt(customerIdParam);
            int type = Integer.parseInt(typeParam);

            if (type == 0) {
                Customer u = cus.getAllByID(customerId);
                request.setAttribute("detailaccount", u);
            } else if (type == 1) {
                cus.deleteAccount(customerIdParam);
                // Redirect to the admin page after deletion
                response.sendRedirect("admin");
                return; // Return to avoid forwarding request again
            }
        }

        // Forward the request to the JSP page
        request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
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
        processRequest(request, response);

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
    CustomerDao cus = new CustomerDao();
    String uid = request.getParameter("account_id");
    String name = request.getParameter("username");
    String pass = request.getParameter("password");
    String first = request.getParameter("first_name");
    String last = request.getParameter("last_name");
    String uemail = request.getParameter("email");
    String phone = request.getParameter("phone_number");
    int roleID = Integer.parseInt(request.getParameter("role_id"));

    // Check if uid is not null and not empty
    if (uid != null && !uid.isEmpty()) {
        try {
            int userId = Integer.parseInt(uid);
            Customer newCustomer = new Customer(userId, name, pass, first, last, roleID, phone, uemail);
            // Update existing customer
            cus.updateUser(newCustomer);
        } catch (NumberFormatException e) {
            // Log the exception (could also use a logging framework)
            e.printStackTrace();
            // Handle the error appropriately, e.g., setting an error message in the request
            request.setAttribute("error", "Invalid account ID format.");
            // Forward back to a relevant JSP or page to display the error
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
            return;
        }
    } else {
        // Insert new customer
        Customer newCustomer = new Customer(0, name, pass, first, last, roleID, phone, uemail);
        cus.insertCustomer(newCustomer);
    }
    response.sendRedirect("admin");
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
