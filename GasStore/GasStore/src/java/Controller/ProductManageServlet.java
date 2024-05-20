/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
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
                String searchKey = request.getParameter("search");
                System.out.println(searchKey);
                String action = request.getParameter("action");
                String indexPage_raw = request.getParameter("indexPage");
                LinkedHashMap<Product, String> allSearchProduct = new LinkedHashMap<>();
                LinkedHashMap<Product, String> productCmap = new LinkedHashMap<>();
                ProductDAO productDAO = new ProductDAO();
                allSearchProduct = productDAO.getSearchProduct(searchKey, action);
                int indexPage = 0;
                if (indexPage_raw == null) {
                    indexPage = 1;
                } else {
                    indexPage = Integer.parseInt(indexPage_raw);
                }
                if (action == null || action.equals("show")) {
                    action = "normal";
                    productCmap = productDAO.searchProductsPaging(action, indexPage, searchKey);
                    int productCount = productDAO.countProducts(action, searchKey);
                    int endPage = productCount / 5;
                    if (productCount % 5 != 0) {
                        endPage++;
                    }
                    request.setAttribute("endPage", endPage);
                    request.setAttribute("search", searchKey);
                    request.setAttribute("action", "show");
                    request.setAttribute("tag", indexPage);
                    request.setAttribute("size", allSearchProduct.size());
                    request.setAttribute("productCmap", productCmap);
                    request.getRequestDispatcher("ProductSearch.jsp").forward(request, response);

            } else {
                productCmap = productDAO.searchProductsPaging(action, indexPage, searchKey);
                    int productCount = productDAO.countProducts(action, searchKey);
                    int endPage = productCount / 5;
                    if (productCount % 5 != 0) {
                        endPage++;
                    }

                request.setAttribute("action", "hide");
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);

                request.setAttribute("productCmap", productCmap);
                request.getRequestDispatcher("HideProduct.jsp").forward(request, response);
            }
                

     
         
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("msg");
        session.removeAttribute("msg");
        List<Product> productDTOs = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        
        LinkedHashMap<Product, String> productCmap = new LinkedHashMap<>();
        

        //hide product 
        String action = request.getParameter("action");
        String indexPage_raw = request.getParameter("indexPage");

        try {
            int indexPage = 0;
            if (indexPage_raw == null) {
                indexPage = 1;
            } else {
                indexPage = Integer.parseInt(indexPage_raw);
            }
            if (action == null || action.equals("show")) {
                action = "normal";
                productCmap = productDAO.pagingProduct(action, indexPage);
                productDTOs = productDAO.getAllProduct();

                int numProduct = productDTOs.size();
                int endPage = numProduct / 5;
                if (numProduct % 5 != 0) {
                    endPage++;
                }
                request.setAttribute("endPage", endPage);
                request.setAttribute("action", "show");
                request.setAttribute("tag", indexPage);
                request.setAttribute("msg", message);
                request.setAttribute("productCmap", productCmap);
                request.getRequestDispatcher("ProductManage.jsp").forward(request, response);

            } else {
                productCmap = productDAO.pagingProduct(action, indexPage);
                productDTOs = productDAO.getAllProductHide();
                int numProduct = productDTOs.size();
                int endPage = numProduct / 5;
                if (numProduct % 5 != 0) {
                    endPage++;
                }

                request.setAttribute("action", "hide");
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);
                request.setAttribute("msg", message);
                request.setAttribute("productCmap", productCmap);
                request.getRequestDispatcher("HideProduct.jsp").forward(request, response);
            }
        }
         catch (Exception e) {
        }
    }
    
}
