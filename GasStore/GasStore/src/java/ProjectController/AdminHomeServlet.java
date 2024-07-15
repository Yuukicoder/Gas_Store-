/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import DAO.AccountDAO;
import DAO.NotificationDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DTO.AccountDTO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author msi
 */
@WebServlet(name = "AdminHomeServlet", urlPatterns = {"/adminHome"})
public class AdminHomeServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminHomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminHomeServlet at " + request.getContextPath() + "</h1>");
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
        System.out.println("Login");
        HttpSession session = request.getSession();
        OrderDAO odao = new OrderDAO();
        ProductDAO pdao = new ProductDAO();
        AccountDAO adao = new AccountDAO();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRoleID() == 1) {
                //Reset noti-time on navbar
                NotificationDAO nDAO = new NotificationDAO();
                ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
                session.setAttribute("notiList", n);
                //

                //get income
                float incomeToday = odao.getIncomeToday();
                int orderToday = odao.getOrdersToday();
                int orderDelivered = odao.getTotalOrdersDelivered();
                int orderCanceled = odao.getTotalOrdersCancled();
                int newProduct = pdao.getTotalNewProduct();
                int totalProductA = pdao.getTotalProduct();
                int newAccount = adao.getTotalNewAccount();
                int totalAccount = adao.getTotalAccount();
                //List User
                AccountDAO accountDAO = new AccountDAO();
                request.setAttribute("listUser", account);
                request.setAttribute("incomeToday", incomeToday);
                request.setAttribute("orderToday", orderToday);
                request.setAttribute("totalOrderDelivered", orderDelivered);
                request.setAttribute("totalOrderCanceled", orderCanceled);
                request.setAttribute("newProduct", newProduct);
                request.setAttribute("totalProduct", totalProductA);
                request.setAttribute("newAccount", newAccount);
                request.setAttribute("totalCustomer", totalAccount);
                request.setAttribute("ListOrder", odao.listOrderInAdminHome(8));
                request.getRequestDispatcher("adminHome.jsp").forward(request, response);
            } else if (account.getRoleID() == 2) {
                float incomeToday = odao.getIncomeToday();
                int orderToday = odao.getOrdersToday();
                int orderDelivered = odao.getTotalOrdersDelivered();
                int orderCanceled = odao.getTotalOrdersCancled();
                int newProduct = pdao.getTotalNewProduct();
                int totalProductA = pdao.getTotalProduct();
                int newAccount = adao.getTotalNewAccount();
                int totalAccount = adao.getTotalAccount();
                AccountDAO accountDAO = new AccountDAO();
                request.setAttribute("listUser", account);
                request.setAttribute("incomeToday", incomeToday);
                request.setAttribute("orderToday", orderToday);
                request.setAttribute("totalOrderDelivered", orderDelivered);
                request.setAttribute("totalOrderCanceled", orderCanceled);
                request.setAttribute("newProduct", newProduct);
                request.setAttribute("totalProduct", totalProductA);
                request.setAttribute("newAccount", newAccount);
                request.setAttribute("totalCustomer", totalAccount);
                request.setAttribute("ListOrder", odao.listOrderInAdminHome(8));
                request.getRequestDispatcher("StaffHome.jsp").forward(request, response);
            } else {
                response.sendRedirect("403.jsp");
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
