/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Shipper;

import DAO.NotificationDAO;
import DAO.OrderDAO;
import DTO.Customer;
import DTO.NotificationDTO;
import DTO.Order;
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
import java.util.LinkedHashMap;

/**
 *
 * @author vu anh
 */
@WebServlet(name = "ShipperOrderListServlet", urlPatterns = {"/ShipperOrderList"})
public class ShipperOrderListServlet extends HttpServlet {

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
            out.println("<title>Servlet ShipperOrderListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShipperOrderListServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        ShipperDTO account = (ShipperDTO) session.getAttribute("account");
        if (account != null) {
            //Reset notification-navbar
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getOther3NewestUnreadNoti(1, account.getShipperID());
            session.setAttribute("notiList", n);
            //
            
            int sId = account.getShipperID();
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
                        System.out.println("Page Size: " + numPage);
                    }
                }

                if (isAll) {
                    orderMap = orderDAO.pagingShipperOrder(1, orderDAO.countAllShipperOrders(sId), sId); // Lấy tất cả đơn hàng được phân
                    request.setAttribute("numPage", numPage_raw);
                } else {
                    orderMap = orderDAO.pagingShipperOrder(indexPage, numPage, sId); // Lấy số lượng đơn hàng trên mỗi trang
                    int numOrder = orderDAO.countAllShipperOrders(sId);
                    int endPage = isAll ? 1 : (numOrder / numPage + (numOrder % numPage == 0 ? 0 : 1));
                    request.setAttribute("endPage", endPage);
                    request.setAttribute("numPage", numPage_raw);
                }

                request.setAttribute("tag", indexPage);
                request.setAttribute("listOrder", orderMap);

                request.getRequestDispatcher("ShipperHome.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("403.jsp");
        }
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
