package ProjectController.Order;

import DAO.FeedbackDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DTO.OrderDetail;
import dal.OrdersDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Customer;
import model.Orders;

@WebServlet(name = "MyPurschaseServlet", urlPatterns = {"/mypurchase"})
public class MyPurschaseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Get customer from session
        DTO.Customer cus = (DTO.Customer) session.getAttribute("account");
        if (cus == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get selected status from the dropdown filter
        String statusParam = request.getParameter("status");
        int status = statusParam != null ? Integer.parseInt(statusParam) : -1; // Default value or handle null case

        // Instantiate DAO objects
        OrderDAO odao = new OrderDAO();
        OrderDetailDAO odDAO = new OrderDetailDAO();
        ProductDAO pDAO = new ProductDAO();
        OrdersDao ord = new OrdersDao();
        List<Orders> orderList;
        if (status != -1) {
            // Get the orders for the customer filtered by status
            orderList = ord.getAllByID1(cus.getCustomerID(), status);
        } else {
            orderList = ord.getAllByID1(cus.getCustomerID());
        }
        
        // Create a map to hold order details for each order
        Map<Integer, List<OrderDetail>> orderDetailsMap = new HashMap<>();
        FeedbackDAO fd = new FeedbackDAO();
        Map<Integer, Map<Integer, Boolean>> feedbackMap = new HashMap<>();
        
        // Fetch order details for each order
        for (Orders order : orderList) {
            List<OrderDetail> orderDetails = odDAO.getOrderDetailByID(order.getOrderID());
            orderDetailsMap.put(order.getOrderID(), orderDetails);
            
            Map<Integer, Boolean> productFeedbackMap = new HashMap<>();
            for (OrderDetail detail : orderDetails) {
                boolean hasFeedback = fd.hasFeedback(detail.getProductID(), order.getOrderID(), cus.getCustomerID());
                productFeedbackMap.put(detail.getProductID(), hasFeedback);
            }
            feedbackMap.put(order.getOrderID(), productFeedbackMap);
        }

        // Set attributes for the request
        request.setAttribute("feedbackMap", feedbackMap);
        request.setAttribute("odDAO", odDAO);
        request.setAttribute("order", orderList);
        request.setAttribute("pDAO", pDAO);
        request.setAttribute("purchase", orderList);
        request.setAttribute("orderDetailsMap", orderDetailsMap);

        // Forward to the JSP page
        request.getRequestDispatcher("MyPurchase.jsp").forward(request, response);
    }

    public String formatMoney(long money) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator('.');
        symbols.setDecimalSeparator(',');

        DecimalFormat formatter = new DecimalFormat("###,### VNĐ", symbols);
        return formatter.format(money);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            // Get customer from session
            Customer cus = (Customer) session.getAttribute("account");
            if (cus == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Get selected status from the dropdown filter
            int status = Integer.parseInt(request.getParameter("status"));

            // Instantiate DAO objects
            OrderDAO odao = new OrderDAO();
            OrderDetailDAO odDAO = new OrderDetailDAO();
            ProductDAO pDAO = new ProductDAO();
            OrdersDao ord = new OrdersDao();

            // Get the orders for the customer filtered by status
            List<Orders> orderList = ord.getAllByID(cus.getCustomerID(), status);

            // Create a map to hold order details for each order
            Map<Integer, List<OrderDetail>> orderDetailsMap = new HashMap<>();

            // Fetch order details for each order
            for (Orders order : orderList) {
                List<OrderDetail> orderDetails = odDAO.getOrderDetailByID(order.getOrderID());
                orderDetailsMap.put(order.getOrderID(), orderDetails);
            }

            // Set attributes for the request
            request.setAttribute("odDAO", odDAO);
            request.setAttribute("pDAO", pDAO);
            request.setAttribute("purchase", orderList);
            request.setAttribute("orderDetailsMap", orderDetailsMap);

            // Forward to the JSP page
            request.getRequestDispatcher("MyPurchase.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for debugging
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
