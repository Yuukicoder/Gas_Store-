/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.NotificationDAO;
import DAO.OrderDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author dell456
 */
@WebServlet(name = "ChangeOrderStatusServlet", urlPatterns = {"/changeStatus"})
public class ChangeOrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            //Reset noti-time on navbar - Vu Anh
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //
            
            String idRaw = request.getParameter("id");
            String statusRaw = request.getParameter("status");
            try {
                int id = Integer.parseInt(idRaw);
                int status = Integer.parseInt(statusRaw);
                OrderDAO oDAO = new OrderDAO();
                oDAO.changeStatusOrder(id, status);
                response.sendRedirect("orderTable");
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

}
