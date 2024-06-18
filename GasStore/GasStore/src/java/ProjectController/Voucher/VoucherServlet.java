/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Voucher;

import DAO.VoucherDAO;
import DTO.Voucher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author msi
 */
@WebServlet(name = "VoucherServlet", urlPatterns = {"/tableVoucher"})
public class VoucherServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VoucherServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoucherServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            VoucherDAO vdao = new VoucherDAO();
            request.setAttribute("voucher", vdao.listVoucher());
            request.getRequestDispatcher("TableVoucher.jsp").forward(request, response);
        }else if (action.equals("detail")) {
            response.setContentType("text/html;charset=UTF-8");
            String name = request.getParameter("voucherName").trim();
            VoucherDAO dao = new VoucherDAO();
            Voucher v = dao.getDataByName(name);
            request.setAttribute("v", v);
            request.getRequestDispatcher("VoucherDetail.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name").toUpperCase();
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        int discount = Integer.parseInt(request.getParameter("discount"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String code = request.getParameter("code").toUpperCase();
        VoucherDAO vdao = new VoucherDAO();
        vdao.addVoucher(name, code, start, end, discount, quantity);
        response.sendRedirect("tableVoucher");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
