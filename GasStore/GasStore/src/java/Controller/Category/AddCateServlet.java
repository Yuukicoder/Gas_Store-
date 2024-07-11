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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author vu anh
 */
@WebServlet(name = "AddCateServlet", urlPatterns = {"/addCate"})
public class AddCateServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCateServlet at " + request.getContextPath() + "</h1>");
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
        
        //Reset noti-time on navbar
        HttpSession session = request.getSession();
        NotificationDAO nDAO = new NotificationDAO();
        ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
        session.setAttribute("notiList", n);
        //
        
        request.getRequestDispatcher("AddCategory.jsp").forward(request, response);
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
            String cateName_raw = request.getParameter("name");
            String cateCode_raw = request.getParameter("code");
            String cateDes_raw = request.getParameter("des");
            try {
                CategoryDAO cdao = new CategoryDAO();
                cdao.addCategory(cateCode_raw, cateName_raw, cateDes_raw);

                //Notification - vu anh
//                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));
//
//                NotificationDTO noti = new NotificationDTO();
//                noti.setTitle("New Category Added");
//                noti.setContent("<p>Admin " + account.getAdminName() + "</p>\n"
//                        + "<p>Create a new Category: " + cateName_raw + " Category</p>\n"
//                        + "<p>At " + currentDateTime);
//                noti.setDateSended(currentDateTime);
//                noti.setStatus(0);
//                noti.setNotiCateId(1);
//
                NotificationDAO nDAO = new NotificationDAO();
                //nDAO.addNoti(noti);
                ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
                session.setAttribute("notiList", n);
                //

                response.sendRedirect("manageCate");
            } catch (Exception e) {
                System.out.println("AddCateServlet doPost: " + e.getMessage());
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
