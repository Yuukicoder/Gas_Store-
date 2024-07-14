/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.AdminAccountServlet;

import DAO.AccountDAO;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.regex.Pattern;

/**
 *
 * @author Vu Anh
 */
@WebServlet(name = "AdminProfileServlet", urlPatterns = {"/AdminProfile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AdminProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminProfileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProfileServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            
            //Reset noti-time on navbar
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //
            
            AccountDAO aDAO = new AccountDAO();
            int uid = account.getAdminID();
            String name = request.getParameter("adminName");
            String user = request.getParameter("username");
            String email = request.getParameter("email");
            Part p = request.getPart("pimg");

            if (name == null || name.isEmpty()) {
                request.setAttribute("mess", "Admin name can't be empty!");
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            }

            if (user == null || user.isEmpty()) {
                request.setAttribute("mess", "Account can't be empty!");
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            }

            if (aDAO.checkuser(user) != null) {
                if (aDAO.checkuser(user).getAdminID() != uid) {
                    System.out.println("adao: " + aDAO.checkuser(user).getAdminID());
                    System.out.println("UID: " + uid);

                    request.setAttribute("mess", "This account already exist!");
                    request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                    return;
                }
            }

            if (email == null || email.isEmpty()) {
                request.setAttribute("mess", "Email can't be empty!");
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            }

            //check format gmail 
            String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
            Pattern pattern = Pattern.compile(EMAIL_REGEX);
            if (!pattern.matcher(email).matches()) {
                request.setAttribute("mess", "Wrong email format!");
                request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
                return;
            }

            AdminDTO acc = aDAO.getAccountById(uid);

            String contentType = p.getContentType();
            System.out.println("contentType: " + contentType);
            if (contentType.startsWith("image/")) {
                String fileName = p.getSubmittedFileName();
                System.out.println("Filename: " + fileName);
                if (fileName != null && !fileName.isEmpty()) {
                    acc.setImg(fileName);
                }
                
            } else if(!p.getSubmittedFileName().isEmpty()){
                request.setAttribute("mess", "The uploaded file is not an image!");
            }

            acc.setUserName(user.trim());
            acc.setAdminName(name.trim());
            acc.setEmail(email.trim());

            aDAO.updateProfile(acc);

            session.setAttribute("account", aDAO.getAccountById(uid));
            request.setAttribute("success", "Update profile success!");
            request.getRequestDispatcher("ProfileAdmin.jsp").forward(request, response);
        } else {
            response.sendRedirect("403.jsp");
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
