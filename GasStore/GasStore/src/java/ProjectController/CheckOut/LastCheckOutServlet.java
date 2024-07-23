/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.CheckOut;

import DAO.DAOWarranty;
import DAO.IndividualVoucherDAO;
import DAO.NotificationDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DAO.VoucherDAO;
//import DTO.AccountDTO;
import DTO.Cart;
import DTO.Customer;
import DTO.NotificationDTO;
import DTO.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author msi
 */
@WebServlet(name = "LastCheckOutServlet", urlPatterns = {"/lastcheck"})
public class LastCheckOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet LastCheckOutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LastCheckOutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vocherid = request.getParameter("vocherid");
        String vochername = request.getParameter("vochername");
        String vocheridname = request.getParameter("vourcherID");
        String vourcherQuantity = request.getParameter("vourcherQuantity");

        ProductDAO d = new ProductDAO();
        List<Product> list = d.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);
        request.setAttribute("cart", cart);
        request.setAttribute("vocherid", vocherid);
        request.setAttribute("vochername", vochername);
        request.setAttribute("vocheridname", vocheridname);
        request.setAttribute("vourcherQuantity", vourcherQuantity);

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paymentMethod = request.getParameter("payment");
        
        if ("vnpay".equals(paymentMethod)) {
            // Chuyển hướng tới cổng thanh toán VNPay

                request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
            return;
        }
        String totalvoucher = request.getParameter("totalvoucher");
        Double totalVoucherDouble = Double.parseDouble(totalvoucher);
        OrderDAO ord = new OrderDAO();
        OrderDetailDAO oid = new OrderDetailDAO();
        //add voucher
        int orderId = ord.getLastOrderID();
        String vocheridname = request.getParameter("vourcherID");
        String vochername = request.getParameter("vochername");
        String vourcherQuantity = request.getParameter("vourcherQuantity");
        String nameacount = request.getParameter("nameacount");
        System.out.println("a" + nameacount);
        String phone = request.getParameter("phone");
        System.out.println(phone);
        String address = request.getParameter("address");
        System.out.println(address);
        String tongtienvoucher1 = request.getParameter("tongtienvoucher");
        Double tongtienvoucher = Double.parseDouble(tongtienvoucher1);

        ProductDAO prod = new ProductDAO();
        List<Product> list = prod.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);

        HttpSession session = request.getSession();
//        AccountDTO account = (AccountDTO) session.getAttribute("account");
        Customer account = (Customer) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login ");
        } else {
            //Notification - Vu Anh
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));

            NotificationDTO noti = new NotificationDTO();
            noti.setTitle("New Order place");
            noti.setContent("<p>Customer " + account.getFullName() + "</p>\n"
                    + "<p>Have made a purchase</p>\n"
                    + "<p>At " + currentDateTime);
            noti.setDateSend(currentDateTime);
            noti.setIsRead(0);
            noti.setIsForAdmins(1);

            NotificationDAO nDAO = new NotificationDAO();
            nDAO.addNoti(noti);
            //

            int orderIdReturn = ord.addOrder(account, cart, address, totalVoucherDouble, nameacount);
            
            DAOWarranty daoWar = new DAOWarranty();
    
            oid.insertOrderDetail(cart, orderIdReturn);
            
            ord.updateStockQuantity(cart);
            request.setAttribute("cart", cart);
            Cookie c = new Cookie("cart", "");
            c.setMaxAge(0);
            response.addCookie(c);

            IndividualVoucherDAO individualVoucherDAO = new IndividualVoucherDAO();
            individualVoucherDAO.addIndividualVoucher(vocheridname, orderId, vochername);

            VoucherDAO voucherDAO = new VoucherDAO();
            voucherDAO.UpdateQuantityVoucher(vochername, vourcherQuantity);

            request.setAttribute("mess", "Order Successfully!!!");

            response.sendRedirect("shop");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
