/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;


import DAO.CategoryDAO;
import DAO.FeedbackDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DAO.SupplierDAO;
import DTO.FeedbackDTO;
import DTO.Product;
import DTO.ProductImg;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
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
            FeedbackDAO fd = new FeedbackDAO();
             List<FeedbackDTO> productFeedback = fd.getFeedbackByProductId(id);
            request.setAttribute("pimgs", pimgs);
            request.setAttribute("detail", pro);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("supplierName", supplierName);
            request.setAttribute("formattedPrice", pro.getFormattedPrice());
            request.setAttribute("alsoLike", list);
            request.setAttribute("productFeedback", productFeedback);

            request.getRequestDispatcher("detail.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
            // Optionally, send an error response
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
        }
    }
    
}
