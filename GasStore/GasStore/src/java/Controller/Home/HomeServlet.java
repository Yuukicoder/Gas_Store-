/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Home;

import DAO.CategoryDAO;
import DAO.PostCategoryDAO;
import DAO.PostListDAO;
import DAO.ProductDAO;
import DAO.VoucherDAO;
import DTO.Category;
import DTO.PostDTO;
import DTO.Product;
import DTO.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="HomeServlet", urlPatterns={"/home"})
public class HomeServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CategoryDAO categoryDAO = new CategoryDAO();

        session.setAttribute("category", categoryDAO.displayCategoryinHome());
        
        ProductDAO productDAO = new ProductDAO();
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        
        PostListDAO pldao = new PostListDAO();
        PostCategoryDAO postCate = new PostCategoryDAO();
        
        postDTOs = pldao.getAllPostByGroupID(postCate.getCategoryIDByName("Banner"));
        System.out.println("Banner Id: " + postCate.getCategoryIDByName("Banner"));
        
        //get top selling product of each category
        LinkedHashMap<String, List<Product>> topSelling = new LinkedHashMap<>();
        List<Category> cateList = categoryDAO.getAllCategory();
        for (Category c : cateList) {
            List<Product> list = productDAO.getTop3ProductByEachCategory(c.getCategoryID());
            if(list.size() != 0){
                topSelling.put(c.getName(), list);
            }          
        }
        
        
        LinkedHashMap<String, List<PostDTO>> footerList = new LinkedHashMap<>();
        int[] postCateList = {postCate.getCategoryIDByName("About Us"),
                              postCate.getCategoryIDByName("Customer Service"),
                              postCate.getCategoryIDByName("Policy")};
        for (int i = 0; i < postCateList.length; i++) {
            System.out.println("Footer ListId: " + postCateList[i]);
            List<PostDTO> footerPostList = pldao.getAllPostByGroupID(postCateList[i]);
            footerList.put(postCate.getCategoryByID(postCateList[i]).getName(), footerPostList);
        }
        session.setAttribute("footerList", footerList);

        if (!postDTOs.isEmpty()) {
            PostDTO pdto = postDTOs.get(0);
            request.setAttribute("pdto", pdto);
        } else {
            // Handle the case where postDTOs is empty
            request.setAttribute("pdto", null); // or you could set some default value
        }
        
        VoucherDAO vDAO = new VoucherDAO();
        List<Voucher> voucherList = vDAO.listVoucher();

        request.setAttribute("post", postDTOs);
        //session.setAttribute("product", productDAO.getAllProduct());
        request.setAttribute("topSell", topSelling);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
