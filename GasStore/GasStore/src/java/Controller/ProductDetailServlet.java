/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.FeedbackDAO;
import DAO.FeedbackReplyDAO;
import DAO.NotificationDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DAO.SupplierDAO;
import DTO.FeedbackDTO;
import DTO.FeedbackReplyDTO;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author dell456
 */
@WebServlet(name = "ProductDetailServlet", urlPatterns = {"/productDetail"})
public class ProductDetailServlet extends HttpServlet {

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
            FeedbackDAO fd = new FeedbackDAO();
            List<FeedbackDTO> productFeedback = fd.getFeedbackByProductId(id);
            request.setAttribute("productFeedback", productFeedback);
            float s = 0;
            for (FeedbackDTO l : productFeedback) {
                s += (float) l.getStart();
            }
            int feedbackCount = fd.getCount1(id);
            float average = (float) s / feedbackCount;

            // Round to one decimal place
            float roundedAverage = Math.round(average * 10) / 10.0f;
            float roundedAverage1 = Math.round(average * 10.0f) / 10.0f;
            request.setAttribute("averageRating", roundedAverage);
             Map<Integer, Map<Integer, FeedbackReplyDTO>> allReplies = new HashMap<>();
             Map<Integer, FeedbackReplyDTO> replies = new HashMap<>();
            FeedbackReplyDAO frDAO = new FeedbackReplyDAO();
            for (FeedbackDTO feedback : productFeedback) {
//                List<FeedbackReplyDTO> replies = frDAO.getLisfeedbackreplyByID(feedback.getFeedBackID());
//                request.setAttribute("feedbackReplies_" + feedback.getFeedBackID(), replies);
                 replies = frDAO.getLisfeedbackreplyByID1(feedback.getFeedBackID());
                 allReplies.put(feedback.getFeedBackID(), replies);
//                request.setAttribute("feedbackReplies_" + feedback.getFeedBackID(), replies);
            }

            request.setAttribute("averageRating1", roundedAverage1);
            request.setAttribute("totalFeedbackCount", feedbackCount);
             request.setAttribute("allReplies", allReplies);
              request.setAttribute("replyies", replies);
            request.getRequestDispatcher("detail.jsp").forward(request, response);
             for (Map.Entry<Integer, Map<Integer, FeedbackReplyDTO>> entry : allReplies.entrySet()) {
            System.out.println("Feedback ID: " + entry.getKey());
            for (Map.Entry<Integer, FeedbackReplyDTO> replyEntry : entry.getValue().entrySet()) {
                System.out.println("Reply ID: " + replyEntry.getKey());
                System.out.println("Reply Content: " + replyEntry.getValue().getReply());
            }
        }
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
            // Optionally, send an error response
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
        }
    }

}
