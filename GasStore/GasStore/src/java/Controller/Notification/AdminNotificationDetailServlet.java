/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Notification;

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
import java.util.ArrayList;

/**
 *
 * @author Vu Anh
 */
@WebServlet(name = "AdminNotificationDetailServlet", urlPatterns = {"/AdminNotificationDetailServlet"})
public class AdminNotificationDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminNotificationDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminNotificationDetailServlet at " + request.getContextPath() + "</h1>");
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
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                NotificationDAO nDAO = new NotificationDAO();
                NotificationDTO n = nDAO.getNotificationById(id);

                request.setAttribute("noti", n);

                //noti
                ArrayList<NotificationDTO> noti = nDAO.getAdmin3NewestUnreadNoti();
                session.setAttribute("notiList", noti);
                //

                request.getRequestDispatcher("NotificationDetailAdmin.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("AdminNotificationDetailServlet doGet: " + e.getMessage());
            }
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
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                NotificationDAO nDAO = new NotificationDAO();
                NotificationDTO n = nDAO.getNotificationById(id);

                if (n != null) {
                    n.setIsRead(1);
                    nDAO.updateNotiStatus(id, 1);
                    request.setAttribute("noti", n);
                }

                //noti
                ArrayList<NotificationDTO> noti = nDAO.getAdmin3NewestUnreadNoti();
                session.setAttribute("notiList", noti);
                //

                request.getRequestDispatcher("NotificationDetailAdmin.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("AdminNotificationDetailServlet doGet: " + e.getMessage());
            }
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
