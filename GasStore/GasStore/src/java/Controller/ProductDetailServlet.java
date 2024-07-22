/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;


import DAO.CategoryDAO;
import DAO.NotificationDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DAO.SupplierDAO;
import DTO.Customer;
import DTO.NotificationDTO;
import DTO.Product;
import DTO.ProductImg;
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
@WebServlet(name = "ProductDetailServlet", urlPatterns = {"/productDetail"})
public class ProductDetailServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Reset noti-time on navbar - Vu Anh
            HttpSession session = request.getSession();
            NotificationDAO nDAO = new NotificationDAO();
            Customer customer = (Customer)session.getAttribute("account");
            ArrayList<NotificationDTO> n = nDAO.getOther3NewestUnreadNoti(1, customer.getCustomerID());
            session.setAttribute("notiList", n);
            //
            String id_raw = request.getParameter("id");
            int id = Integer.parseInt(id_raw);
            CategoryDAO categoryDAO = new CategoryDAO();
            SupplierDAO supplierDAO = new SupplierDAO();
            ProductDAO proDAO = new ProductDAO();
            Product pro = proDAO.getProductByID(id);
            int categoryId = pro.getCategoryID();
            int supplierId = pro.getSupplierID();
            ProductImgDAO pidao = new ProductImgDAO();
            String categoryName = categoryDAO.getCategoryByID(categoryId).getName();
            String supplierName = supplierDAO.getSupplierByID(supplierId).getCompanyName();
            List<Product> list = proDAO.getProductByCategory(categoryId);
            List<ProductImg> pimgs = pidao.getPImgByPid(id);
            request.setAttribute("pimgs", pimgs);
            request.setAttribute("detail", pro);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("supplierName", supplierName);
            request.setAttribute("formattedPrice", pro.getFormattedPrice());
            request.setAttribute("alsoLike", list);
            request.getRequestDispatcher("detail.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
            // Optionally, send an error response
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
        }
    }
    
}
