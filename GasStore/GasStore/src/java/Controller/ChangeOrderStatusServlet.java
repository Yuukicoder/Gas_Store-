/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import DTO.AdminDTO;
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
@WebServlet(name = "ChangeOrderStatusServlet", urlPatterns = {"/changeStatus"})
public class ChangeOrderStatusServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if(account!=null){
            String idRaw = request.getParameter("id");
            String statusRaw = request.getParameter("status");
            try {
                int id = Integer.parseInt(idRaw);
                int status = Integer.parseInt(statusRaw);
                OrderDAO oDAO = new OrderDAO();
                oDAO.changeStatusOrder(id, status);
                response.sendRedirect("orderTable");
            } catch (Exception e) {
                System.out.println(e);
            }
        }else{
            response.sendRedirect("403.jsp");
        }
    }
    
}
