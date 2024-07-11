/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Category;

import DAO.CategoryDAO;
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
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author vu anh
 */
@WebServlet(name = "DeleteCateServlet", urlPatterns = {"/deleteCate"})
public class DeleteCateServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteCateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCateServlet at " + request.getContextPath() + "</h1>");
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
            String cateId_raw = request.getParameter("id");
            int cateId = Integer.parseInt(cateId_raw);
            CategoryDAO cdao = new CategoryDAO();

            //Notification - vu anh
//            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));
//
//            NotificationDTO noti = new NotificationDTO();
//            noti.setTitle("Category Deleted");
//            noti.setContent("<p>Admin " + account.getAdminName() + "</p>\n"
//                    + "<p>Have Delete a Category: " + cdao.getCategoryByID(cateId).getName() + " Category</p>\n"
//                    + "<p>At " + currentDateTime);
//            noti.setDateSended(currentDateTime);
//            noti.setStatus(0);
//            noti.setNotiCateId(1);
            //
            if (cdao.deleteCategory(cateId)) {
                // Reset noti
                NotificationDAO nDAO = new NotificationDAO();
                //nDAO.addNoti(noti);
                ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
                session.setAttribute("notiList", n);
                //
            }

            response.sendRedirect("manageCate");
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
