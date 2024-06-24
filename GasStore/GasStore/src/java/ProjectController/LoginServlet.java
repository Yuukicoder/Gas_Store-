/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import Controller.MaHoa;
import DAO.AccountDAO;
import DTO.AccountDTO;
import DTO.AdminDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author msi
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        System.out.println("Login: username " + username + " pass" + password);
        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        AdminDTO account = accountDAO.checkLogin(username, password);
        if (account == null) {
            String msg = "Username or Password is not correct!";
            request.setAttribute("mess", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } 
        else 
        {
            if (isSpecialCharacter(username)) {
                String msg = "Username don't use special character";
                request.setAttribute("mess", msg);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                // Compare username and password case-sensitive
            } else if (!account.getUserName().equals(username) || !account.getPassword().equals(password)) {
                String msg = "Username or Password is not correct!";
                request.setAttribute("mess", msg);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (account.getRoleID()== 1) {
                session.setAttribute("account", account);
                response.sendRedirect("adminHome");
            }
            else
            {
                 session.setAttribute("account", account);
                response.sendRedirect("adminHome");
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
