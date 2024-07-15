/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.DiscountDAO;
import DTO.AdminDTO;
import DTO.Discount;
import GMAIL.GmailDiscount;
import GMAIL.GmailOrder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author dell456
 */
@WebServlet(name = "SendDiscountEmailServlet", urlPatterns = {"/sendDiscountEmail"})
public class SendDiscountEmailServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SendDiscountEmailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendDiscountEmailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        DiscountDAO disocuntDAO = new DiscountDAO();
        if(account != null) {
            String[] selectedEmails = request.getParameterValues("selectedEmails");
            String conditionType = request.getParameter("conditionType");
            String discountCode = request.getParameter("discountCode");
            String discountName = request.getParameter("discountName");
            if (selectedEmails != null && selectedEmails.length > 0) {
                for (String email : selectedEmails) {
                    String emailContent = createEmailContent(conditionType, discountCode, email, request);
                    GmailDiscount gmail = new GmailDiscount();
                    gmail.sendEmail(emailContent, email);
                }
                Discount d = disocuntDAO.getDataByName(discountName);
                request.setAttribute("discount", d);
                request.setAttribute("msg", "Emails have been sent to selected customers!");
                request.getRequestDispatcher("VoucherDetail.jsp").forward(request, response);
            } else {
                Discount d = disocuntDAO.getDataByName(discountName);
                request.setAttribute("discount", d);
                request.setAttribute("msg", "No customers selected to send email!");
                request.getRequestDispatcher("VoucherDetail.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("403.jsp");
      }
    } 
    
    private String createEmailContent(String conditionType, String discountCode, String customerEmail, HttpServletRequest request) {
        String bodyContent = "";

        switch (conditionType) {
            case "SPENDING":
                bodyContent = "<p>Thank you for being a valuable customer! As a token of our appreciation for your recent spending, we are pleased to offer you a special discount. Use code: <strong style=\"color: red; font-size: 1.5em;\">" + discountCode + "</strong> at checkout to enjoy your discount.</p>";
                break;
            case "LOYAL_CUSTOMER":
                bodyContent = "<p>We greatly value your loyalty. To thank you for being with us over the years, we are excited to give you a special discount. Use code: <strong style=\"color: red; font-size: 1.5em;\">" + discountCode + "</strong> at checkout to enjoy your discount.</p>";
                break;
            case "NEW_CUSTOMER":
                bodyContent = "<p>Welcome to our store! As a new customer, we are delighted to offer you a special discount on your next purchase. Use code: <strong style=\"color: red; font-size: 1.5em;\">" + discountCode + "</strong> at checkout to enjoy your discount.</p>";
                break;
            default:
                bodyContent = "<p>Enjoy our special discount with code: <strong style=\"color: red; font-size: 1.5em;\">" + discountCode + "</strong>.</p>";
                break;
        }

        String emailContent = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Discount Code - GAS STORE</title>\n"
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
                + "        .highlight { color: red; font-size: 1.5em; }\n"
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
                + "        <!-- Discount Code Information -->\n"
                + "        <div class=\"order-info\">\n"
                + "            <h3>DISCOUNT CODE: <strong class=\"highlight\">" + discountCode + "</strong></h3>\n"
                + "        </div>\n"
                + "\n"
                + "        <!-- Email Content -->\n"
                + "        <div class=\"email-content\">\n"
                +              bodyContent + "\n"
                + "        </div>\n"
                + "    </div>\n"
                + "\n"
                + "</body>\n"
                + "</html>";

        return emailContent;
    }

    
}
