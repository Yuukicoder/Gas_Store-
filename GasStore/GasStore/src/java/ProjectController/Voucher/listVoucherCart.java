/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Voucher;

import DAO.ProductDAO;
import DAO.VoucherDAO;
import DTO.Cart;
import DTO.Product;
import DTO.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author phung
 */
@WebServlet(name = "listVoucherCart", urlPatterns = {"/listVoucherCart"})
public class listVoucherCart extends HttpServlet {

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
            out.println("<title>Servlet listVoucherCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listVoucherCart at " + request.getContextPath() + "</h1>");
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
        ProductDAO d = new ProductDAO();
        List<Product> list = d.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);
        request.setAttribute("cart", cart);

        //voucher
        String vouchercode = request.getParameter("vouchercode");
        String date = request.getParameter("date");

        VoucherDAO aO = new VoucherDAO();

        List<Voucher> vouchers = aO.getidVoucher(vouchercode);
        List<Voucher> voucherQuantity = aO.getQuantityVoucher(vouchercode);
        List<Voucher> voucherDate = aO.getDateVoucher(vouchercode,date);
        List<Voucher> voucherStartDate = aO.getDateStartVoucher(vouchercode,date);
        System.out.println(vouchers);
        if (vouchers == null || vouchers.isEmpty()) {
            request.setAttribute("used", "Voucher does not exist");
        } else if (voucherStartDate.isEmpty()) {
            request.setAttribute("used", "Voucher has expired ");
        }else if (voucherDate.isEmpty()) {
            request.setAttribute("used", "Voucher has expired ");
        } else if (!voucherQuantity.isEmpty()) {
            request.setAttribute("used", "Voucher has expired ");
        }  else {
            request.setAttribute("used1", aO.getidVoucher(vouchercode));
        }
        System.out.println(voucherStartDate);
         System.out.println(voucherDate);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
