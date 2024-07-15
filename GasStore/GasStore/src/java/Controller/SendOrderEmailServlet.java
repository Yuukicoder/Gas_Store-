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
import DTO.Customer;
import DTO.Order;
import DTO.OrderDetail;
import DTO.Product;
import GMAIL.GmailOrder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author dell456
 */
@WebServlet(name = "SendOrderEmailServlet", urlPatterns = {"/sendOrderEmail"})
public class SendOrderEmailServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if(account != null) {
            GmailOrder gmail = new GmailOrder();
            String customerEmail = request.getParameter("customerEmail");
            String orderID = request.getParameter("orderID");
            if (customerEmail.isEmpty()) {
                request.setAttribute("err", "Email or Order Details are missing!");
                request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
            } else {
                String emailContent = createEmailContent(request);
                gmail.sendEmail(emailContent, customerEmail);
                request.setAttribute("msg", "Order details have been sent to customer's email!");
                request.getRequestDispatcher("orderDetail?id=" + orderID).forward(request, response);
            }
            
        } else {
            response.sendRedirect("403.jsp");
      }
    }
    
    private String createEmailContent(HttpServletRequest request) throws ServletException, IOException{
        String totalMoneyRaw = request.getParameter("totalMoney");
        double totalMoney = Double.parseDouble(totalMoneyRaw);
        String orderID = request.getParameter("orderID");
        String orderDate = request.getParameter("orderDate");
        String customerFirstName = request.getParameter("customerFirstName");
        String customerLastName = request.getParameter("customerLastName");
        String customerPhone = request.getParameter("customerPhone");
        String customerAddress = request.getParameter("customerAddress");
        String customerEmail = request.getParameter("customerEmail");
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")); // Sử dụng locale của Việt Nam để định dạng VND
        String formattedTotalMoney = currencyFormat.format(totalMoney);
        ProductDAO pDAO = new ProductDAO();
        HttpSession session = request.getSession();
        List<OrderDetail> orderDetails = (List<OrderDetail>)session.getAttribute("orderDetails");
        // Tạo HTML cho chi tiết đơn hàng
        StringBuilder orderDetailsHtml = new StringBuilder();
        orderDetailsHtml.append("<table style=\"border-collapse: collapse; width: 100%;\">")
                        .append("<thead>")
                        .append("<tr style=\"background-color: #f2f2f2;\">")
                        .append("<th style=\"border: 1px solid #dddddd; text-align: center; padding: 8px;\">No</th>")
                        .append("<th style=\"border: 1px solid #dddddd; text-align: left; padding: 8px;\">Product's Name</th>")
                        .append("<th style=\"border: 1px solid #dddddd; text-align: right; padding: 8px;\">Unit Price</th>")
                        .append("<th style=\"border: 1px solid #dddddd; text-align: right; padding: 8px;\">Quantity</th>")
                        .append("<th style=\"border: 1px solid #dddddd; text-align: right; padding: 8px;\">Total</th>")
                        .append("</tr>")
                        .append("</thead>")
                        .append("<tbody>");
        
        int index = 1;
        
        for (OrderDetail item : orderDetails) {
            Product product = pDAO.getProductByID(item.getProductID());
            
            orderDetailsHtml.append("<tr>")
                            .append("<td style=\"border: 1px solid #dddddd; text-align: center; padding: 8px;\">").append(index++).append("</td>")
                            .append("<td style=\"border: 1px solid #dddddd; text-align: left; padding: 8px;\">").append(product.getName()).append("</td>")
                            .append("<td style=\"border: 1px solid #dddddd; text-align: right; padding: 8px;\">").append(String.format("%,.0f", item.getUnitPrice())).append(" VND</td>")
                            .append("<td style=\"border: 1px solid #dddddd; text-align: right; padding: 8px;\">").append(item.getQuantity()).append("</td>")
                            .append("<td style=\"border: 1px solid #dddddd; text-align: right; padding: 8px;\">").append(String.format("%,.0f", item.getTotalPrice())).append(" VND</td>")
                            .append("</tr>");
        }

        orderDetailsHtml.append("</tbody>")
                .append("</table>");
        
        // Đoạn HTML
        String emailContent = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Order Detail - GAS STORE</title>\n"
                + "    <!-- Bootstrap CSS -->\n"
                + "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                + "    <!-- Local Bootstrap CSS -->\n"
                + "    <link href=\"admin/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                + "    <!-- Template Stylesheet -->\n"
                + "    <link href=\"admin/css/style.css\" rel=\"stylesheet\">\n"
                + "    <!-- Custom styles -->\n"
                + "    <style>\n"
                + "        body { font-family: 'Roboto', sans-serif; }\n"
                + "        .header {display: flex; " +
"                              }\n"
                + "        .header-left { float: left; }\n"
                + "        .header-right { float: right; margin-left: 400px;}\n"
                + "        .body-content { padding: 20px; }\n"
                + "        .order-info { text-align: center; margin-bottom: 20px; }\n"
                + "        .order-actions { text-align: right; margin-bottom: 20px; }\n"
                + "        .customer-info { text-align: left; margin-bottom: 20px; }\n"
                + "        .order-table { margin-top: 20px; }\n"
                + "        .total-amount { text-align: right; margin-top: 20px; font-weight: bold; }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <!-- Header -->\n"
                + "    <header class=\"header\">\n"
                + "        <div class=\"header-left\">\n"
                + "            <h2>GAS STORE COMPANY</h2>\n"
                + "        </div>\n"
                + "        <div class=\"header-right\">\n"
                + "            <p>Địa chỉ: Residential land Hoa Lac, Km29,Thach Hoa, Thach That, Ha Noi</p>\n"
                + "            <p>ĐT: 012 345 67890</p>\n"
                + "            <p>Email: info@gasstore.com</p>\n"
                + "        </div>\n"
                + "    </header>\n"
                + "\n"
                + "    <!-- Body Content -->\n"
                + "    <div class=\"body-content\">\n"
                + "        <!-- Order Information -->\n"
                + "        <div class=\"order-info\">\n"
                + "            <h3>ORDER: #" + orderID + "</h3>\n"
                + "        </div>\n"
                + "        <div class=\"order-actions\">\n"
                + "            <span>Date: " + orderDate + "</span> "
                + "        </div>\n"
                + "\n"
                + "        <!-- Customer Information -->\n"
                + "        <div class=\"customer-info\">\n"
                + "            <h4>CUSTOMER INFORMATION</h4>\n"
                + "            <p><strong>Full Name:</strong> " + customerFirstName + " " + customerLastName + "</p>\n"
                + "            <p><strong>Phone:</strong> " + customerPhone + "</p>\n"
                + "            <p><strong>Email:</strong> " + customerEmail + "</p>\n"
                + "            <p><strong>Address:</strong> " + customerAddress + "</p>\n"
                + "        </div>\n"
                + "\n"
                + "        <!-- Order Details Table -->\n"
                + "        <div class=\"order-table\">\n"
                + "            <h4>ORDER DETAILS</h4>\n"
                + "            <p style=\"text-align: right\"><strong>Price Unit:</strong> VND</p>\n"
                +              orderDetailsHtml.toString() + "\n"
                + "        </div>\n"
                + "\n"
                + "        <!-- Total Amount -->\n"
                + "        <div class=\"total-amount\">\n"
                + "            <p><strong>Total Amount:</strong> " + formattedTotalMoney + " VND</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "\n"
                + "</body>\n"
                + "</html>";

        return emailContent;
    }
    
}
