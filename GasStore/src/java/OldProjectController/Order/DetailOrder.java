/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package OldProjectController.Order;

import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author msi
 */
@WebServlet(name = "DetailOrder", urlPatterns = {"/detailOrder"})
public class DetailOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDetailDAO odDAO = new OrderDetailDAO();
        ProductDAO pDAO = new ProductDAO();
        request.setAttribute("order", odDAO.getOrderDetailByID(Integer.parseInt(request.getParameter("id"))));
        request.setAttribute("pDAO", pDAO);
        request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
