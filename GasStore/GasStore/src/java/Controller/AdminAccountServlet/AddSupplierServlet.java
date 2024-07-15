/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.AdminAccountServlet;

import DTO.AdminDTO;
import dal.SupplierDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Supplier;

/**
 *
 * @author vip2021
 */
public class AddSupplierServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRoleID() == 1) {
                String pid = request.getParameter("id");
                String t = request.getParameter("type");
                SupplierDao supplierDao = new SupplierDao();
                if (pid != null && !pid.isEmpty() && t != null && !t.isEmpty()) {
                    if (t.equals("0")) {
                        Supplier supplier = supplierDao.getSupplierByID(Integer.parseInt(pid));
                        request.setAttribute("detail", supplier);
                    }
                }
//          
                request.getRequestDispatcher("addSupplier.jsp").forward(request, response);
            } else {
                response.sendRedirect("403.jsp");
            }
        } else {
            response.sendRedirect("403.jsp");
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
        SupplierDao sus = new SupplierDao();
        String uid = request.getParameter("account_id");
        String name = request.getParameter("username");
        String smail = request.getParameter("email");
//        
//        String mail = request.getParameter("email");
        String phone = request.getParameter("phone");
        String home = request.getParameter("HomePage");
        Supplier newSup = new Supplier(!uid.isEmpty() ? Integer.parseInt(uid) : 0, name, smail, phone, home);
        sus.insertSupplier(newSup);
        response.sendRedirect("ManageSupplier");

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
