/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Category;

import DAO.CategoryDAO;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.Category;
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
@WebServlet(name = "EditCateServlet", urlPatterns = {"/editCate"})
public class EditCateServlet extends HttpServlet {

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
            out.println("<title>Servlet EditCateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCateServlet at " + request.getContextPath() + "</h1>");
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
            String getCid = request.getParameter("cid");
            try {
                int cid = Integer.parseInt(getCid);
                CategoryDAO cdao = new CategoryDAO();
                Category cdto = cdao.getCategoryByID(cid);
                
                //noti
                NotificationDAO nDAO = new NotificationDAO();
                ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
                session.setAttribute("notiList", n);
                //
                
                request.setAttribute("cdto", cdto);
                request.getRequestDispatcher("EditCategory.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("EditCateServlet: " + e.getMessage());
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
            String cateID_raw = request.getParameter("id");
            String cateName_raw = request.getParameter("name");
            String cateCode_raw = request.getParameter("code");
            String cateDes_raw = request.getParameter("des");
            System.out.println(cateDes_raw);
            try {
                int cateID = Integer.parseInt(cateID_raw);
                CategoryDAO cdao = new CategoryDAO();

                //Notification - vu anh
//                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));
//
//                NotificationDTO noti = new NotificationDTO();
//                noti.setTitle("Category Edited");
//                if(cateName_raw.equals(cdao.getCategoryByID(cateID).getName())){
//                    noti.setContent("<p>Admin " + account.getAdminName() + "</p>\n"
//                        + "<p>Have Edited " + cdao.getCategoryByID(cateID).getName() + " Category content</p>\n"
//                        + "<p>At " + currentDateTime);
//                }else{
//                    noti.setContent("<p>Admin " + account.getAdminName() + "</p>\n"
//                        + "<p>Have Edited " + cdao.getCategoryByID(cateID).getName() + " Category, into " 
//                            + cateName_raw+" Category</p>\n"
//                        + "<p>At " + currentDateTime);
//                }
//                
//                noti.setDateSended(currentDateTime);
//                noti.setStatus(0);
//                noti.setNotiCateId(1);

                NotificationDAO nDAO = new NotificationDAO();
                //nDAO.addNoti(noti);
                ArrayList<NotificationDTO> n = nDAO.getAllAdminNotification();
                session.setAttribute("notiList", n);
                //

                cdao.updateCategory(cateID, cateCode_raw, cateName_raw, cateDes_raw);
                response.sendRedirect("manageCate");
            } catch (Exception e) {

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
