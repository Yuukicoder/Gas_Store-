/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import Controller.MaHoa;
import DAO.AccountDAO;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import dal.CustomerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import DTO.Customer;
import DTO.NotificationDTO;
import dal.SupplierDao;
import java.util.ArrayList;
import model.Supplier;

/**
 *
 * @author msi
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet2 extends HttpServlet {

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
        System.out.println(request.getParameter("code"));
    }

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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
    String username = request.getParameter("username");
    String password = MaHoa.toSHA1(request.getParameter("password"));
    System.out.println("Login: username " + username + " pass " + password);
    HttpSession session = request.getSession();
    AccountDAO accountDAO = new AccountDAO();
    AdminDTO account = accountDAO.checkLogin(username, password);

    if (account == null) {
        CustomerDao cus = new CustomerDao();
        Customer customer = cus.checkuserandPass(username, password);
        Supplier supplier = new SupplierDao().getByEmailAndPassword(username, password);

        if (supplier != null) {
            session.setAttribute("supplier", supplier);
            System.out.println(supplier);
            response.sendRedirect("supplier/home");
            return;
        } else if (customer != null) {
            session.setAttribute("account", customer);
            session.setAttribute("customerID", customer.getCustomerID());
            response.sendRedirect("home");
            return;
        } else {
            String msg = "Username or Password is not correct!";
            request.setAttribute("mess", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
    } else {
        if (isSpecialCharacter(username)) {
            String msg = "Username don't use special character";
            request.setAttribute("mess", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        } else {
            session.setAttribute("account", account);
            if (account.getRoleID() == 1) {
                NotificationDAO nDAO = new NotificationDAO();
                ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
                session.setAttribute("notiList", n);
                response.sendRedirect("adminHome");
                return;
            } else if (account.getRoleID() == 2) {
                response.sendRedirect("adminHome");
                return;
            } else {
                response.sendRedirect("adminHome");
                return;
            }
        }
    }
}

    private boolean isSpecialCharacter(String username) {

        String specialCharacters = "!@#$%^&*()-_=+<>?[]{}";
        for (char c : username.toCharArray()) {
            if (specialCharacters.contains(String.valueOf(c))) {
                return true;
            }
        }
        return false;

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
