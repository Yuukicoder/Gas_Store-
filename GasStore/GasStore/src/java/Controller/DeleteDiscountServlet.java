/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.DiscountDAO;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.Discount;
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
@WebServlet(name = "DeleteDiscountServlet", urlPatterns = {"/deleteDiscount"})
public class DeleteDiscountServlet extends HttpServlet {

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
            String discountIDRaw = request.getParameter("discountID");
            try {
                int discountID = Integer.parseInt(discountIDRaw);
                DiscountDAO discountDAO = new DiscountDAO();
                discountDAO.deleteDiscount(discountID);
                response.sendRedirect("discountTable");
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

}
