/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Order;

import DAO.AccountDAO;
import DAO.FeedbackDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.OrderHistoryDAO;
import DAO.ProductDAO;
import DTO.AccountDTO;
import DTO.OrderDTO;
import DTO.OrderDetail;
import DTO.OrderHistoryDTO;
import dal.CustomerDao;
import dal.OrdersDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Orders;

/**
 *
 * @author phung
 */
@WebServlet(name = "OrderTracking", urlPatterns = {"/ordertracking"})
public class OrderTracking extends HttpServlet {

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
            out.println("<title>Servlet OrderTracking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderTracking at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        HttpSession session = request.getSession();

            // Get customer from session
            CustomerDao cust = new CustomerDao();
            DTO.Customer cus = (DTO.Customer) session.getAttribute("account");
            if (cus == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            DTO.Customer uss = cust.getAllByID(cus.getCustomerID());
        String orderid_raw = request.getParameter("orderid");
        String acountid_raw = request.getParameter("acountid");
        OrderHistoryDAO aO = new OrderHistoryDAO();
        OrderDAO odao = new OrderDAO();
        OrdersDao ord = new OrdersDao();
        
        ProductDAO pDAO = new ProductDAO();
        OrderDetailDAO odDAO = new OrderDetailDAO();
        FeedbackDAO fdao = new FeedbackDAO();
        List<Orders> orderList = ord.getAllByID(Integer.parseInt(acountid_raw));
        Orders or = ord.getByID1(Integer.parseInt(orderid_raw));
        request.setAttribute("purchase", orderList);
        request.setAttribute("purchase_detail", odao.getPurchaseByID(orderid_raw));
        request.setAttribute("orderid", orderid_raw);
        request.setAttribute("ordao", or);
        request.setAttribute("pDAO", pDAO);
        request.setAttribute("odDAO", odDAO);
        request.setAttribute("pDAO", pDAO);
        request.setAttribute("fdao", fdao);
        request.setAttribute("custo", uss);

        List<OrderHistoryDTO> orderlist = aO.getAllOrderHistory(orderid_raw, acountid_raw);
        List<OrderDetail> listDetail = odDAO.getOrderDetailByID(Integer.parseInt(orderid_raw));
        request.setAttribute("ordertracking", listDetail);
        request.setAttribute("odDAO", listDetail);
        request.getRequestDispatcher("OrderTracking.jsp").forward(request, response);
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
        processRequest(request, response);
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
