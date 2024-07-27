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
import DTO.Customer;

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
        AdminDTO account = null;
        Customer cus = null;
        try {
            account = (AdminDTO) session.getAttribute("account");
        } catch (Exception e) {
            cus = (Customer) session.getAttribute("account");
            System.out.println("ChangeOrderStatusServlet: Not admin");
            System.out.println("cus: " + cus.toString());
        }

        if (account != null) {
            //Reset noti-time on navbar - Vu Anh
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //

            String idRaw = request.getParameter("id");
            String statusRaw = request.getParameter("status");
            String backToStaffHome = request.getParameter("backToStaffHome");
            String backToAdminHome = request.getParameter("backToAdminHome");
            try {
                int id = Integer.parseInt(idRaw);
                int status = Integer.parseInt(statusRaw);
                OrderDAO oDAO = new OrderDAO();
                oDAO.changeStatusOrder(id, status);
                if(backToStaffHome != null && backToStaffHome.equals("1")){
                    response.sendRedirect("adminHome");
                }else if(backToAdminHome != null && backToAdminHome.equals("1")){
                    response.sendRedirect("adminHome");
                }
                response.sendRedirect("orderTable");
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (cus != null && Integer.parseInt(request.getParameter("status")) == 4) {
            String idRaw = request.getParameter("id");
            String statusRaw = request.getParameter("status");
            try {
                int id = Integer.parseInt(idRaw);
                int status = Integer.parseInt(statusRaw);
                OrderDAO oDAO = new OrderDAO();
                oDAO.changeStatusOrder(id, status);
                response.sendRedirect("mypurchase");
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

}
