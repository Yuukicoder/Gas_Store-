/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.DiscountDAO;
import DTO.AdminDTO;
import DTO.Discount;
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
@WebServlet(name="DiscountDetailServlet", urlPatterns={"/discountDetail"})
public class DiscountDetailServlet extends HttpServlet {
   
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
            out.println("<title>Servlet DiscountDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiscountDetailServlet at " + request.getContextPath () + "</h1>");
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
        if(account!=null){
            String discountName = request.getParameter("discountName");
            DiscountDAO disocuntDAO = new DiscountDAO();
            Discount d = disocuntDAO.getDataByName(discountName);
            request.setAttribute("discount", d);
            request.getRequestDispatcher("VoucherDetail.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if(account != null){
            String action = request.getParameter("action");

            if ("update".equals(action)) {
                // Update existing discount
                String currentName = request.getParameter("currentName");
                String name = request.getParameter("name");
                String start = request.getParameter("start");
                String end = request.getParameter("end");
                String type = request.getParameter("discountType");
                String amountRaw = request.getParameter("discountAmount");
                String quantityRaw = request.getParameter("quantity");
                String code = request.getParameter("code");

                try {
                    DiscountDAO discountDAO = new DiscountDAO();
                    boolean nameChanged = !currentName.equals(name);
                    if (nameChanged && discountDAO.isNameExists(name)) {
                        String errorMessage = "Discount name already exists.";
                        request.setAttribute("errorMessage", errorMessage);
                        request.setAttribute("discount", discountDAO.getDataByName(currentName));
                        request.getRequestDispatcher("VoucherDetail.jsp").forward(request, response);
                    } else {
                        int amount = Integer.parseInt(amountRaw);
                        int quantity = Integer.parseInt(quantityRaw);
                        discountDAO.updateDiscount(name, code, start, end, type, amount, quantity);
                        response.sendRedirect("discountTable");
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
            } else if ("add".equals(action)) {
                // Add new discount
                String name = request.getParameter("name").toUpperCase();
                String start = request.getParameter("start");
                String end = request.getParameter("end");
                int discountAmount = Integer.parseInt(request.getParameter("discountAmount"));
                String discountType = request.getParameter("discountType");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String code = request.getParameter("code").toUpperCase();

                DiscountDAO discountDAO = new DiscountDAO();
                boolean isNameExists = discountDAO.isNameExists(name);
                boolean isCodeExists = discountDAO.isCodeExists(code);

                if (isNameExists || isCodeExists) {
                    String errorMessage = "";
                    if (isNameExists) {
                        errorMessage += "Discount name already exists. ";
                    }
                    if (isCodeExists) {
                        errorMessage += "Discount code already exists.";
                    }
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("TableVoucher.jsp").forward(request, response);
                } else {
                    discountDAO.addDiscount(name, code, start, end, discountAmount, discountType, quantity);
                    response.sendRedirect("discountTable");
                }
            }
        } else {
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
