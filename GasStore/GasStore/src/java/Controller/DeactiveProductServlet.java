/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
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
@WebServlet(name = "DeactiveProductServlet", urlPatterns = {"/productDeactive"})
public class DeactiveProductServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            try {
                String id_raw = request.getParameter("id");
                String action = request.getParameter("action");
                ProductDAO productDAO = new ProductDAO();
                int id = Integer.parseInt(id_raw);
                int checkHide = productDAO.actionWithProductById(id, action);
                String message = "hello";
                if (checkHide > 0 && action.equals("hide")) {
                    session.setAttribute("msg", "Hide Product Success!");
                    response.sendRedirect("productManage");
                }
                if (checkHide > 0 && action.equals("show")) {
                    session.setAttribute("msg", "Show Product Success!");
                    response.sendRedirect("productManage?action=hide");
                }
            } catch (Exception e) {
            }
        }else{
            response.sendRedirect("403.jsp");
        }
    }
    
}
