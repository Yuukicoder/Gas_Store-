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
import java.util.ArrayList;
import java.util.List;

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
        if (account != null) {
            DiscountDAO discountDAO = new DiscountDAO();
            String searchKey = request.getParameter("search");
            String indexPage_raw = request.getParameter("indexPage");
            String numPage_raw = request.getParameter("numPage");
            List<Discount> allSearchDiscounts = discountDAO.getSearchDiscount(searchKey);
            List<Discount> pagedDiscounts = null;
            
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
                    pagedDiscounts = discountDAO.searchDiscountsPaging(indexPage, Integer.MAX_VALUE, searchKey);
                } else {
                    pagedDiscounts = discountDAO.searchDiscountsPaging(indexPage, numPage, searchKey);
                }

                int discountCount = allSearchDiscounts.size();
                int endPage = isAll ? 1 : (discountCount / numPage + (discountCount % numPage == 0 ? 0 : 1));
                
                request.setAttribute("endPage", endPage);
                request.setAttribute("search", searchKey);
                request.setAttribute("tag", indexPage);
                request.setAttribute("size", discountCount);
                request.setAttribute("discount", pagedDiscounts);
                request.setAttribute("numPage", numPage_raw);
                request.getRequestDispatcher("SearchDiscount.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("403.jsp");
        }        
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if(account!=null){
            List<Discount> discountDTOs = new ArrayList<>();
            DiscountDAO discountDAO = new DiscountDAO();
            String indexPage_raw = request.getParameter("indexPage");
            String numPage_raw = request.getParameter("numPage");

            try {
                int indexPage = (indexPage_raw == null) ? 1 : Integer.parseInt(indexPage_raw);
                int numPage = 5; 
                boolean isAll = false;

                if (numPage_raw != null) {
                    if (numPage_raw.equals("all")) {
                        isAll = true;
                    } else {
                        numPage = Integer.parseInt(numPage_raw);
                    }
                }

                List<Discount> discount;
                if (isAll) {
                    discount = discountDAO.pagingDiscount(indexPage, Integer.MAX_VALUE); 
                } else {
                    discount = discountDAO.pagingDiscount(indexPage, numPage);
                }

                discountDTOs = discountDAO.listDiscount();
                int numDiscounts = discountDTOs.size();
                int endPage = isAll ? 1 : (numDiscounts / numPage + (numDiscounts % numPage == 0 ? 0 : 1));

                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);
                request.setAttribute("discount", discount);
                request.setAttribute("numPage", numPage_raw);
                request.getRequestDispatcher("TableVoucher.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            response.sendRedirect("403.jsp");
        }
    }
    
}
