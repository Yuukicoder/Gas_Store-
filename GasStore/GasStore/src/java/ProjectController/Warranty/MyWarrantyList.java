/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ProjectController.Warranty;

import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DAO.SerialNumberDAO;
import DTO.Customer;
import DTO.OrderDTO;
import DTO.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author dell456
 */
@WebServlet(name="MyWarrantyList", urlPatterns={"/myWarranty"})
public class MyWarrantyList extends HttpServlet {
   
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyPurschaseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyPurschaseServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("account") == null) {
            response.sendRedirect("login");
            return;
        }
        Customer cus = (Customer) session.getAttribute("account");
//        OrderDAO odao = new OrderDAO();
//        OrderDetailDAO odDAO = new OrderDetailDAO();
//        ProductDAO pDAO = new ProductDAO();
//        FeedbackDAO fdao = new FeedbackDAO();
        OrderDAO ord  = new OrderDAO();
        //chua xac dinh cusid
        List<OrderDTO> li = ord.getAllOrder(cus.getCustomerID());
        SerialNumberDAO serialDAO = new SerialNumberDAO();
        OrderDetailDAO dao = new OrderDetailDAO();
        ProductDAO pDAO = new ProductDAO();
        List<OrderDetail> odDetail = dao.getAllOrderDetail2();
        System.out.println("li"+li);
        request.setAttribute("serialDAO", serialDAO);
        request.setAttribute("odDAO", li);
        request.setAttribute("odDetails", odDetail);
        request.getRequestDispatcher("MyWarranty.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
