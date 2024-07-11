/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Shipper;

import DAO.NotificationDAO;
import DAO.OrderDAO;
import DTO.NotificationDTO;
import DTO.ShipperDTO;
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
@WebServlet(name = "ChangeShipperOrderStatusServlet", urlPatterns = {"/ChangeShipperOrderStatus"})
public class ChangeShipperOrderStatusServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangeShipperOrderStatusServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeShipperOrderStatusServlet at " + request.getContextPath() + "</h1>");
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
        ShipperDTO account = (ShipperDTO) session.getAttribute("account");
        if (account != null) {
            String idRaw = request.getParameter("id");
            String statusRaw = request.getParameter("status");
            try {
                int id = Integer.parseInt(idRaw);
                int status = Integer.parseInt(statusRaw);
                OrderDAO oDAO = new OrderDAO();
                oDAO.changeStatusOrder(id, status);
                if(status == 3){
                    oDAO.updateOrderShipedDate(id);
                }
                

                //Notification - vu anh
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));

                NotificationDTO noti = new NotificationDTO();
                noti.setTitle("An Order Have Been Shipped");
                noti.setContent("<p>Shipper " + account.getFullname() + "</p>\n"
                        + "<p>Have shipped an order</p>\n"
                        + "<p>At " + currentDateTime);
                noti.setDateSend(currentDateTime);
                noti.setIsRead(0);
                noti.setIsForAdmins(1);

                NotificationDAO nDAO = new NotificationDAO();
                nDAO.addNoti(noti);

                //Reset notification-navbar
                ArrayList<NotificationDTO> n = nDAO.getOther3NewestUnreadNoti(1, account.getShipperID());
                session.setAttribute("notiList", n);
                
                response.sendRedirect("ShipperOrderList");
            } catch (Exception e) {
                System.out.println("ChangeShipperOrderStatusServlet: " + e.getMessage());
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
