/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
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
import DTO.Order;

/**
 *
 * @author dell456
 */
@WebServlet(name = "OrderTableServlet", urlPatterns = {"/orderTable"})
public class OrderTableServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            String message = (String) session.getAttribute("msg");
            session.removeAttribute("msg");
            OrderDAO orderDAO = new OrderDAO();
            LinkedHashMap<Order, Customer> orderMap = new LinkedHashMap<>();
            String numPage_raw = request.getParameter("numPage");
            double totalRevenue = orderDAO.getRevenue();
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

                request.setAttribute("totalRevenue", totalRevenue);
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);
                request.setAttribute("msg", message);
                request.setAttribute("listOrder", orderMap);
                request.setAttribute("numPage", numPage_raw);
                request.getRequestDispatcher("TableOrder.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }
    
}
