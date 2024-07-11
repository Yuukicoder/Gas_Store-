/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.CustomerDAO;
import DAO.NotificationDAO;
import DAO.NotificationReceiverDAO;
import DAO.OrderDAO;
import DAO.ShipperDAO;
import DTO.AdminDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;
import DTO.Customer;
import DTO.NotificationDTO;
import DTO.NotificationReceiverDTO;
import DTO.Order;
import DTO.ShipperDTO;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author dell456
 */
@WebServlet(name = "OrderTableServlet", urlPatterns = {"/orderTable"})
public class OrderTableServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            try {
                int newShipperId = Integer.parseInt(request.getParameter("shipperId"));
                int oldShipperId = Integer.parseInt(request.getParameter("oldShipperId"));
                int oId = Integer.parseInt(request.getParameter("orderId"));
                int status = Integer.parseInt(request.getParameter("status"));

                OrderDAO oDAO = new OrderDAO();
                Order o = oDAO.getOrderById(oId);
                CustomerDAO cDAO = new CustomerDAO();
                Customer c = cDAO.getCustomerByID(o.getCustomerID());

                if (status == 1) {
                    oDAO.changeStatusOrder(oId, 2);
                }

                if (oldShipperId == 0 && newShipperId != 0) {
                    oDAO.updateOrderShipVia(oId, newShipperId);
                    //notifi new shipper - You have been assigned a new order
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));

                    NotificationDTO noti = new NotificationDTO();
                    noti.setTitle("You have been assigned a new order");
                    noti.setContent("<p>You have an order to ship for " + c.getFullName() + "</p>\n"
                            + "<p>Ship to address: " + o.getShipAddress() + "</p>\n"
                            + "<p>Sent time: " + currentDateTime);
                    noti.setDateSend(currentDateTime);
                    noti.setIsRead(0);
                    noti.setIsForAdmins(1);

                    NotificationDAO nDAO = new NotificationDAO();
                    int notiId = nDAO.addNoti(noti);

                    NotificationReceiverDTO nr = new NotificationReceiverDTO();
                    nr.setNotiID(notiId);
                    nr.setReceiverType(1);
                    nr.setReceiverID(newShipperId);
                    NotificationReceiverDAO nrDAO = new NotificationReceiverDAO();

                    nrDAO.addReceiver(nr);
                    //
                } else if (oldShipperId != 0 && newShipperId != 0) {
                    oDAO.updateOrderShipVia(oId, newShipperId);

                    //notifi
                    NotificationDAO nDAO = new NotificationDAO();
                    NotificationReceiverDTO nr = new NotificationReceiverDTO();              
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));

                    //notifi new shipper - You have been assigned a new order
                    NotificationDTO noti = new NotificationDTO();
                    noti.setTitle("You have been assigned a new order");
                    noti.setContent("<p>You have an order to ship for " + c.getFullName() + "</p>\n"
                            + "<p>Ship to address: " + o.getShipAddress() + "</p>\n"
                            + "<p>Sent time: " + currentDateTime);
                    noti.setDateSend(currentDateTime);
                    noti.setIsRead(0);
                    noti.setIsForAdmins(0);

                    
                    int notiId = nDAO.addNoti(noti);

                    
                    nr.setNotiID(notiId);
                    nr.setReceiverType(1);
                    nr.setReceiverID(newShipperId);
                    NotificationReceiverDAO nrDAO = new NotificationReceiverDAO();

                    nrDAO.addReceiver(nr);
                    //

                    //notifi old shipper - This order shipper have been change
                    NotificationDTO noti2 = new NotificationDTO();
                    noti2.setTitle("An order assigned to you have been change");
                    noti2.setContent("<p>An order for customer:  " + c.getFullName() + "</p>\n"
                            + "<p>Ship to address: " + o.getShipAddress() + "</p>\n"
                            + "<p>Have been change to another shipper</p>\n"
                            + "<p>Sent time: " + currentDateTime);
                    noti2.setDateSend(currentDateTime);
                    noti2.setIsRead(0);
                    noti2.setIsForAdmins(0);

                    int notiId2 = nDAO.addNoti(noti2);

                    NotificationReceiverDTO nr2 = new NotificationReceiverDTO();
                    nr2.setNotiID(notiId2);
                    nr2.setReceiverType(1);
                    nr2.setReceiverID(oldShipperId);

                    nrDAO.addReceiver(nr2);
                    //
                }

                doGet(request, response);

            } catch (Exception e) {
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            //Reset noti-time on navbar
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //
            String message = (String) session.getAttribute("msg");
            session.removeAttribute("msg");
            OrderDAO orderDAO = new OrderDAO();
            LinkedHashMap<Order, Customer> orderMap = new LinkedHashMap<>();
            String numPage_raw = request.getParameter("numPage");
            try {
                int indexPage = 0;
                if (request.getParameter("indexPage") == null) {
                    indexPage = 1;
                } else {
                    indexPage = Integer.parseInt(request.getParameter("indexPage"));
                }
                int numPage = 5;
                boolean isAll = false;
                if (numPage_raw != null) {
                    if (numPage_raw.equals("all")) {
                        isAll = true;
                    } else {
                        numPage = Integer.parseInt(numPage_raw);
                    }
                }

                if (isAll) {
                    orderMap = orderDAO.pagingOrder(indexPage, Integer.MAX_VALUE); // Lấy tất cả đơn hàng
                } else {
                    orderMap = orderDAO.pagingOrder(indexPage, numPage); // Lấy số lượng đơn hàng trên mỗi trang
                }
                int numOrder = orderDAO.countAllOrders();
                int endPage = isAll ? 1 : (numOrder / numPage + (numOrder % numPage == 0 ? 0 : 1));

                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);
                request.setAttribute("msg", message);
                request.setAttribute("listOrder", orderMap);
                request.setAttribute("numPage", numPage_raw);

                ShipperDAO sDAO = new ShipperDAO();
                ArrayList<ShipperDTO> shipperList = sDAO.getAllShipper();
                request.setAttribute("shipperList", shipperList);

                request.getRequestDispatcher("TableOrder.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

}
