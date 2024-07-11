/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Product;

import DAO.AccountDAO;
import DAO.FeedbackDAO;
import DAO.FeedbackReplyDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DTO.AccountDTO;
import DTO.Product;
import DTO.ProductDTO;
import DTO.ProductImg;
import DTO.ProductImgDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author msi
 */
@WebServlet(name = "DetailProductServlet", urlPatterns = {"/detailProduct"})
public class DetailProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DetailProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String id_raw = request.getParameter("id");
                int id = Integer.parseInt(id_raw);
                ProductDAO proDAO = new ProductDAO();
                Product pro = proDAO.getProductByID(id);
                int categoryId = pro.getCategoryID();
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                ProductImgDAO pidao = new ProductImgDAO();
                List<Product> list = proDAO.getProductByCategory(categoryId);
                List<ProductImg> pimgs = pidao.getPImgByPid(id);
                FeedbackReplyDAO feedbackReplyDAO = new FeedbackReplyDAO();

                //phan trang 
                String indexpage = request.getParameter("index");

                if (indexpage == null) {
                    indexpage = "1";
                }
                int index = Integer.parseInt(indexpage);

                int count = feedbackDAO.getCount(id);
                int endpage = count / 5;
                if (count % 3 != 0) {
                    endpage++;
                }
                request.setAttribute("feedback", feedbackDAO.getListorder(id, index));
                request.setAttribute("feedbackReplyDAO", feedbackReplyDAO);
                request.setAttribute("endP", endpage);

                request.setAttribute("tag", index);

                request.setAttribute("pimgs", pimgs);
                request.setAttribute("detail", pro);
                
                request.setAttribute("alsolike", list);

                request.setAttribute("getcount", feedbackDAO.getCount(id));

                request.getRequestDispatcher("detail.jsp").forward(request, response);
            

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id_raw = request.getParameter("id");
        int id_pro = Integer.parseInt(request.getParameter("id"));
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        int id;
        try {

            id = Integer.parseInt(id_raw);

        } catch (Exception e) {
            System.out.println(e);
        }
        response.sendRedirect("detailProduct?id=" + id_pro);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
