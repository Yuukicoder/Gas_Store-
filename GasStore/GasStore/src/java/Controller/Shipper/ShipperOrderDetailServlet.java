/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Shipper;

import DAO.CustomerDAO;
import DAO.NotificationDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DTO.AdminDTO;
import DTO.Customer;
import DTO.NotificationDTO;
import DTO.Order;
import DTO.OrderDetail;
import DTO.ShipperDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="ShipperOrderDetailServlet", urlPatterns={"/ShipperOrderDetail"})
public class ShipperOrderDetailServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ShipperOrderDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShipperOrderDetailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

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
        ShipperDTO account = (ShipperDTO) session.getAttribute("account");
        String idRaw = request.getParameter("id");
        if(account!=null){
            //Reset notification-navbar
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getOther3NewestUnreadNoti(1, account.getShipperID());
            session.setAttribute("notiList", n);
            //
            try {
                int id = Integer.parseInt(idRaw);
                OrderDetailDAO odDAO = new OrderDetailDAO();
                List<OrderDetail> orderDetails = odDAO.getOrderDetailByID(id);
                System.out.println("OrderDetail list");
                ProductDAO pDAO = new ProductDAO();        
                request.setAttribute("orderDetails", orderDetails);
                request.setAttribute("pDAO", pDAO);
                
                OrderDAO orderDAO = new OrderDAO();
                Order o = orderDAO.getOrderById(id);
                CustomerDAO cDAO = new CustomerDAO();
                Customer c = cDAO.getCustomerByID(o.getCustomerID());
                request.setAttribute("order", o);
                request.setAttribute("customer", c);
                
                request.getRequestDispatcher("ShipperOrderDetail.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("ShipperOrderDetailServlet: " + e.getMessage());
            }
        }else{
            response.sendRedirect("403.jsp");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
