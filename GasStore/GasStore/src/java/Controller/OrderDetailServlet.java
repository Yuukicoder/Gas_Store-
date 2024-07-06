/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;


import DAO.CustomerDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DTO.AdminDTO;
import DTO.Order;
import DTO.OrderDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import DTO.Customer;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;


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
    if(account != null) {
        try {
            int id = Integer.parseInt(idRaw);
            OrderDetailDAO odDAO = new OrderDetailDAO();
            List<OrderDetail> orderDetails = odDAO.getOrderDetailByID(id);
            ProductDAO pDAO = new ProductDAO();
            OrderDAO oDAO = new OrderDAO();
            CustomerDAO cDAO = new CustomerDAO();
            Order order = oDAO.getOrderByID(id);
            Customer customer = cDAO.getCustomerByID(order.getCustomerID());
            String orderDateString = order.getOrderDate();
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date orderDate = inputFormat.parse(orderDateString);
            String formattedDate = outputFormat.format(orderDate);
            request.setAttribute("customer", customer);
            request.setAttribute("order", order);
            request.setAttribute("orderDetails", orderDetails);
            request.setAttribute("pDAO", pDAO);
            request.setAttribute("formattedDate", formattedDate); // Thêm ngày đã định dạng

            request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
        } catch (ParseException e) {
            System.out.println("Error parsing date: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error parsing date");
        } catch (Exception e) {
            System.out.println(e);
        }
    } else {
        response.sendRedirect("403.jsp");
    }
}

}

    

