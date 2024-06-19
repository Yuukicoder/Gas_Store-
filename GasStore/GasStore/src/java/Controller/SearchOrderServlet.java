package Controller;


import DAO.OrderDAO;
import DAO.ProductDAO;
import DTO.AdminDTO;
import DTO.Customer;
import DTO.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author dell456
 */
@WebServlet(name = "SearchOrderServlet", urlPatterns = {"/searchOrder"})
public class SearchOrderServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            OrderDAO orderDAO = new OrderDAO();
            String searchKey = request.getParameter("search");
            System.out.println(searchKey);
            String indexPage_raw = request.getParameter("indexPage");
            String numPage_raw = request.getParameter("numPage");
            LinkedHashMap<Order, Customer> allSearchOrder = orderDAO.searchOrders(searchKey);
            LinkedHashMap<Order, Customer> orderMap = new LinkedHashMap<>();

            try {
                int indexPage = 1;
                if (indexPage_raw != null) {
                    indexPage = Integer.parseInt(indexPage_raw);
                }

                int numPage = 5;
                boolean isAll = false;
                if (numPage_raw != null) {
                    if (numPage_raw.equals("all")) {
                        isAll = true;
                    } else {
                        numPage = Integer.parseInt(numPage_raw);
                    }
                }

                if (isAll) {
                    orderMap = orderDAO.searchOrdersPaging(searchKey, indexPage, Integer.MAX_VALUE);
                } else {
                    orderMap = orderDAO.searchOrdersPaging(searchKey, indexPage, numPage);
                }

                int orderCount = allSearchOrder.size();
                int endPage = isAll ? 1 : (orderCount / numPage + (orderCount % numPage == 0 ? 0 : 1));

                request.setAttribute("endPage", endPage);
                request.setAttribute("search", searchKey);
                request.setAttribute("tag", indexPage);
                request.setAttribute("size", orderCount);
                request.setAttribute("listOrder", orderMap);
                request.setAttribute("numPage", numPage_raw);
                request.getRequestDispatcher("TableOrderSearch.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("403.jsp");
        }   
    }
    
}
