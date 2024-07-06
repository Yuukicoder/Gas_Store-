/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.DiscountDAO;
import DTO.AdminDTO;
import DTO.Customer;
import DTO.Discount;
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
@WebServlet(name="DiscountCondition", urlPatterns={"/discountCondition"})
public class DiscountCondition extends HttpServlet {
   
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
            out.println("<title>Servlet DiscountCondition</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiscountCondition at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if(account!=null){
            String conditionType = request.getParameter("conditionType");
            String minSpendingStr = request.getParameter("minSpending");
            String numberOfCustomerStr = request.getParameter("numberOfCustomer");
            Double minSpending = null;
            int numberOfCustomer = 0;
            
            if (minSpendingStr != null && !minSpendingStr.isEmpty()) {
                minSpending = Double.parseDouble(minSpendingStr);
            }
            if (numberOfCustomerStr != null && !numberOfCustomerStr.isEmpty()) {
                numberOfCustomer = Integer.parseInt(numberOfCustomerStr);
            }
            
            DiscountDAO discountDAO = new DiscountDAO();
            List<Customer> eligibleCustomers = null;
            switch (conditionType) {
                case "SPENDING":
                    if (minSpending != null) {
                        eligibleCustomers = discountDAO.findCustomersBySpending(minSpending);
                    }
                    request.setAttribute("minSpending", minSpending);
                    break;
                case "LOYAL_CUSTOMER":
                    if (numberOfCustomer != 0) {
                        eligibleCustomers = discountDAO.findLoyalCustomers(numberOfCustomer);
                    }
                    request.setAttribute("numberOfCustomer", numberOfCustomer);
                    break;
                case "NEW_CUSTOMER":
                    eligibleCustomers = discountDAO.findNewCustomers();
                    break;
                default:
                    break;
            }
            String discountName = request.getParameter("discountName");
            DiscountDAO disocuntDAO = new DiscountDAO();
            Discount d = disocuntDAO.getDataByName(discountName);
            request.setAttribute("conditionType", conditionType);
            request.setAttribute("eligibleCustomers", eligibleCustomers);
            request.setAttribute("discount", d);
            request.getRequestDispatcher("VoucherDetail.jsp").forward(request, response);
        }else{
            response.sendRedirect("403.jsp");
        }
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
