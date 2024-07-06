/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import DTO.AdminDTO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import DTO.Product;

/**
 *
 * @author dell456
 */
@WebServlet(name = "ProductManageServlet", urlPatterns = {"/productManage"})
public class ProductManageServlet extends HttpServlet{

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    AdminDTO account = (AdminDTO) session.getAttribute("account");
    if (account != null) {
        ProductDAO productDAO = new ProductDAO();
        String searchKey = request.getParameter("search");
        System.out.println(searchKey);
        String action = request.getParameter("action");
        String indexPage_raw = request.getParameter("indexPage");
        String numPage_raw = request.getParameter("numPage");
        LinkedHashMap<Product, String> allSearchProduct = productDAO.getSearchProduct(searchKey, action);
        LinkedHashMap<Product, String> productCmap = new LinkedHashMap<>();
        
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

            if (action == null || action.equals("show")) {
                action = "normal";
                if (isAll) {
                    productCmap = productDAO.searchProductsPaging(action, indexPage, Integer.MAX_VALUE, searchKey);
                } else {
                    productCmap = productDAO.searchProductsPaging(action, indexPage, numPage, searchKey);
                }
                
                int productCount = allSearchProduct.size();
                int endPage = isAll ? 1 : (productCount / numPage + (productCount % numPage == 0 ? 0 : 1));
                
                request.setAttribute("endPage", endPage);
                request.setAttribute("search", searchKey);
                request.setAttribute("action", "show");
                request.setAttribute("tag", indexPage);
                request.setAttribute("size", productCount);
                request.setAttribute("productCmap", productCmap);
                request.setAttribute("numPage", numPage_raw);
                request.getRequestDispatcher("ProductSearch.jsp").forward(request, response);

            } else {
                if (isAll) {
                    productCmap = productDAO.searchProductsPaging(action, indexPage, Integer.MAX_VALUE, searchKey);
                } else {
                    productCmap = productDAO.searchProductsPaging(action, indexPage, numPage, searchKey);
                }
                
                int productCount = allSearchProduct.size();
                int endPage = isAll ? 1 : (productCount / numPage + (productCount % numPage == 0 ? 0 : 1));
                
                request.setAttribute("action", "hide");
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);
                request.setAttribute("search", searchKey);
                request.setAttribute("productCmap", productCmap);
                request.setAttribute("numPage", numPage_raw);
                request.getRequestDispatcher("HideProduct.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        response.sendRedirect("403.jsp");
    }        
}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    AdminDTO account = (AdminDTO) session.getAttribute("account");
    if (account != null) {
        String message = (String) session.getAttribute("msg");
        session.removeAttribute("msg");
        List<Product> productDTOs = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        LinkedHashMap<Product, String> productCmap = new LinkedHashMap<>();
        String action = request.getParameter("action");
        String indexPage_raw = request.getParameter("indexPage");
        String numPage_raw = request.getParameter("numPage");

        try {
            int indexPage = 0;
            if (indexPage_raw == null) {
                indexPage = 1;
            } else {
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

            if (action == null || action.equals("show")) {
                action = "normal";
                if (isAll) {
                    productCmap = productDAO.pagingProduct(action, indexPage, Integer.MAX_VALUE); 
                } else {
                    productCmap = productDAO.pagingProduct(action, indexPage, numPage);
                }
                productDTOs = productDAO.getAllProduct();

                int numProduct = productDTOs.size();
                int endPage = isAll ? 1 : (numProduct / numPage + (numProduct % numPage == 0 ? 0 : 1));
                request.setAttribute("endPage", endPage);
                request.setAttribute("action", "show");
                request.setAttribute("tag", indexPage);
                request.setAttribute("msg", message);
                request.setAttribute("productCmap", productCmap);
                request.setAttribute("numPage", numPage_raw); 
                request.getRequestDispatcher("ProductManage.jsp").forward(request, response);

            } else {
                if (isAll) {
                    productCmap = productDAO.pagingProduct(action, indexPage, Integer.MAX_VALUE); 
                } else {
                    productCmap = productDAO.pagingProduct(action, indexPage, numPage);
                }
                productDTOs = productDAO.getAllProductHide();
                int numProduct = productDTOs.size();
                int endPage = isAll ? 1 : (numProduct / numPage + (numProduct % numPage == 0 ? 0 : 1));

                request.setAttribute("action", "hide");
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);
                request.setAttribute("msg", message);
                request.setAttribute("productCmap", productCmap);
                request.setAttribute("numPage", numPage_raw); 
                request.getRequestDispatcher("HideProduct.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        response.sendRedirect("403.jsp");
    }
}
}
