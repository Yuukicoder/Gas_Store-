/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.supplier;

import DAO.AccountDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DTO.AdminDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Supplier;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SupplerHomeController", urlPatterns = {"/supplier/home"})
public class SupplerHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession session = request.getSession();
        OrderDAO odao = new OrderDAO();
        ProductDAO pdao = new ProductDAO();
        AccountDAO adao = new AccountDAO();
        Supplier account = (Supplier) session.getAttribute("supplier");
        if (account != null) {

            //get income
            int orderDelivered = odao.getTotalSupplierOrdersDelivered(account.getSupplierId());
            int orderCanceled = odao.getTotalSupplierOrdersCancled(account.getSupplierId());
            int totalProductA = pdao.getTotalSupplierProduct(account.getSupplierId());
            int totalAccount = adao.getTotalAccount();
           
            request.setAttribute("listUser", account);
            request.setAttribute("totalOrderDelivered", orderDelivered);
            request.setAttribute("totalOrderCanceled", orderCanceled);
            request.setAttribute("totalProduct", totalProductA);
            request.setAttribute("totalCustomer", totalAccount);
            
            request.getRequestDispatcher("SupplierHome.jsp").forward(request, response);
        } else {
            response.sendRedirect("../login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
