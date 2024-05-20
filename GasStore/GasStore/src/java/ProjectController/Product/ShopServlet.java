/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Product;

import DAO.CategoryDAO;
import DAO.PostListDAO;
import DAO.ProductDAO;
import DTO.PostDTO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author msi
 */
@WebServlet(name = "ShopServlet", urlPatterns = {"/shop"})
public class ShopServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cdao = new CategoryDAO();
         ProductDAO productDAO = new ProductDAO();
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        PostListDAO pldao = new PostListDAO();
        postDTOs = pldao.getAllPost();
        PostDTO pdto = postDTOs.get(0);
        request.setAttribute("post", postDTOs);
        request.setAttribute("pdto", pdto);
        
        List<ProductDTO> products = productDAO.getAllProduct();
        String pageNumberString = request.getParameter("page");
        Integer pageNumber = (pageNumberString != null && !pageNumberString.isEmpty())
                ? Integer.valueOf(pageNumberString)
                : 1;
        
        double pageSize = 12.0;
        int startIndex = (int) ((pageNumber - 1) * pageSize);
        int endIndex = (int) Math.min(pageNumber * pageSize, products.size());
        List<ProductDTO> paginatedProducts = products.subList(startIndex, endIndex);
//        double pageSize = 12.0;
//        List<ProductDTO> paginatedProducts = products.subList(
//              (pageNumber - 1) * pageSize, 
//                pageNumber * pageSize
//        );
//        int endPage = (int) Math.ceil(products.size() / pageSize);
//        int endPage = 2;
//        int endPage = products.size() / 12;
//        if (products.size() % 12 != 0){
//            endPage++;
//        }
////        int endPage = numProduct / 5;
////                if (numProduct % 5 != 0) {
////                    endPage++;
////                }
        request.setAttribute("maxPage",  Math.ceil(products.size() / pageSize));
//        request.setAttribute("maxPage", endPage);
        request.setAttribute("product", paginatedProducts);
        request.setAttribute("currentPage", pageNumber);
        
        request.setAttribute("options_ram", productDAO.getRamOptions());
        request.setAttribute("options_cpu", productDAO.getCpuOptions());
        request.setAttribute("options_vga", productDAO.getVgaOptions());
        request.setAttribute("options_disk", productDAO.getDiskCapacityOptions());

        
        request.setAttribute("cate", cdao.getAllCategory());
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
   
}
