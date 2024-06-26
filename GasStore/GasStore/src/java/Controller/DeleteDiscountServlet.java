/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.DiscountDAO;
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
@WebServlet(name = "DeleteDiscountServlet", urlPatterns = {"/deleteDiscount"})
public class DeleteDiscountServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if(account!=null){
            String discountIDRaw = request.getParameter("discountID");
            try {
                int discountID = Integer.parseInt(discountIDRaw);
                DiscountDAO discountDAO = new DiscountDAO();
                discountDAO.deleteDiscount(discountID);
                response.sendRedirect("discountTable");
            } catch (Exception e) {
                System.out.println(e);
            }
        }else{
            response.sendRedirect("403.jsp");
        }
    }
    
}
