/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.DiscountDAO;
import DAO.VoucherDAO;
import DTO.AdminDTO;
import DTO.Discount;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author dell456
 */
@WebServlet(name = "DiscountServlet", urlPatterns = {"/discountTable"})
public class DiscountServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if(account!=null){
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
                request.setAttribute("discount", discountDAO.listDiscount());
                request.getRequestDispatcher("TableVoucher.jsp").forward(request, response);
            } else {
                discountDAO.addDiscount(name, code, start, end, discountAmount, discountType, quantity);
                response.sendRedirect("discountTable");
            }
        }else{
            response.sendRedirect("403.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if(account!=null){
            String action = request.getParameter("action");
            if (action == null) {
                DiscountDAO discountDAO = new DiscountDAO();
                request.setAttribute("discount", discountDAO.listDiscount());
                request.getRequestDispatcher("TableVoucher.jsp").forward(request, response);
            }else if (action.equals("detail")) {
                response.setContentType("text/html;charset=UTF-8");
                String name = request.getParameter("voucherName").trim();
                DiscountDAO discountDAO = new DiscountDAO();
                Discount d = discountDAO.getDataByName(name);
                request.setAttribute("v", d);
                request.getRequestDispatcher("VoucherDetail.jsp").forward(request, response);
            }
        }else{
            response.sendRedirect("403.jsp");
        }
    }
    
}
