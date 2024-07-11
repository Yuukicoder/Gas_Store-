/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.AdminAccountServlet;

import Controller.MaHoa;
import DAO.AccountDAO;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminChangePassServlet", urlPatterns = {"/AdminChangePass"})
public class AdminChangePassServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminChangePassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminChangePassServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            //Reset noti-time on navbar
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //

            int uid = account.getAdminID();
            AccountDAO aDAO = new AccountDAO();
            String oldpass = request.getParameter("oldpass");
            String newpass = request.getParameter("newpass");
            String repass = request.getParameter("repass");

            if (oldpass.isEmpty()) {
                request.setAttribute("wrongOldPass", "Mustn't be epty");
                request.setAttribute("openPasswordModal", true);
                request.setAttribute("newpass", newpass);
                request.setAttribute("repass", repass);
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            } else if (!MaHoa.toSHA1(oldpass).equals(account.getPassword())) {
                request.setAttribute("wrongOldPass", "Password incorrect. Please re-enter!");
                request.setAttribute("openPasswordModal", true);
                request.setAttribute("newpass", newpass);
                request.setAttribute("repass", repass);
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            }

            String PASSWORD_REGEX = "^(?=.*[a-z])(?=.*[A-Z]).{6,}$";
            Pattern pattern = Pattern.compile(PASSWORD_REGEX);
            if (newpass.isEmpty()) {
                request.setAttribute("wrongNewPass", "Mustn't be epty");
                request.setAttribute("openPasswordModal", true);
                request.setAttribute("oldpass", oldpass);
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            } else if (!pattern.matcher(newpass).matches()) {
                request.setAttribute("wrongNewPass", "Password must have at least 6 characters, including uppercase and lowercase letters");
                request.setAttribute("openPasswordModal", true);
                request.setAttribute("oldpass", oldpass);
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            }

            if (repass.isEmpty()) {
                request.setAttribute("wrongRePass", "Mustn't be epty");
                request.setAttribute("openPasswordModal", true);
                request.setAttribute("oldpass", oldpass);
                request.setAttribute("newpass", newpass);
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            } else if (!repass.equals(newpass)) {
                request.setAttribute("wrongRePass", "Password does not match. Please re-enter!");
                request.setAttribute("openPasswordModal", true);
                request.setAttribute("oldpass", oldpass);
                request.setAttribute("newpass", newpass);
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            }

            if (aDAO.changePassword(MaHoa.toSHA1(newpass), uid)) {
                request.setAttribute("mess", "Change password success");
            } else {
                request.setAttribute("mess", "Change password Fail");
            }

            session.setAttribute("account", aDAO.getAccountById(account.getAdminID()));
            request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
        } else {
            response.sendRedirect("403.jsp");
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
