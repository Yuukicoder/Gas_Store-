/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;


import DAO.NotificationDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import DTO.OrderDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell456
 */
@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/orderDetail"})
public class OrderDetailServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        String idRaw = request.getParameter("id");
        if(account!=null){
            //Reset noti-time on navbar - Vu Anh
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //
            
            try {
                int id = Integer.parseInt(idRaw);
                OrderDetailDAO odDAO = new OrderDetailDAO();
                List<OrderDetail> orderDetails = odDAO.getOrderDetailByID(id);
                ProductDAO pDAO = new ProductDAO();
                request.setAttribute("orderDetails", orderDetails);
                request.setAttribute("pDAO", pDAO);
                request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        }else{
            response.sendRedirect("403.jsp");
        }
    }
    
}
