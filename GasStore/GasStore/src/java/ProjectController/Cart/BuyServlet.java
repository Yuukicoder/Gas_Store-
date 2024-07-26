/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Cart;

import DAO.ProductDAO;
import DTO.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "BuyServlet", urlPatterns = {"/buy"})
public class BuyServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        ProductDAO d = new ProductDAO();

        List<Product> list = d.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String num = request.getParameter("num");
        String id = request.getParameter("id");
        int requestedQuantity = Integer.parseInt(num);
        Product product = d.getProductByID(Integer.parseInt(id));
        if (product != null) {
            int currentStock = product.getStockQuantity();
            if (requestedQuantity <= 0){
                response.sendRedirect("DetailProduct?id="+id+"error=invalid_quantity");
            }
            if (requestedQuantity <= currentStock) {
                // Cập nhật số lượng tồn kho mới
                int newStock = currentStock - requestedQuantity;
                product.setStockQuantity(newStock);
                d.updateProduct2(product);

                // Cập nhật giỏ hàng trong cookie
                if (txt.isEmpty()) {
                    txt = id + ":" + num;
                } else {
                    txt = txt + "/" + id + ":" + num;
                }
                Cookie c = new Cookie("cart", txt);
                c.setMaxAge(2 * 24 * 60 * 60);
                response.addCookie(c);

                // Chuyển hướng về trang chi tiết sản phẩm
                response.sendRedirect("DetailProduct?id=" + id);
            } else {
                // Xử lý khi số lượng yêu cầu vượt quá số lượng tồn kho
                response.sendRedirect("DetailProduct?id=" + id + "&error=insufficient_stock");
            }
        } else {
            // Xử lý khi không tìm thấy sản phẩm
            response.sendRedirect("shop?error=product_not_found");
        }
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
