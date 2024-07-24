/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.LoyaltyProgram;

import DAO.CustomerDAO;
import DAO.MembershipTiersDAO;
import DTO.MembershipTiersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Vu Anh
 */
@WebServlet(name = "UpdateMemberPointsServlet", urlPatterns = {"/UpdateMemberPoints"})
public class UpdateMemberPointsServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateMemberPointsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateMemberPointsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        CustomerDAO cDAO = new CustomerDAO();
        int cID = 0;
        int newPoint = 0;
        try {
            cID = Integer.parseInt(request.getParameter("memberId"));
            newPoint = Integer.parseInt(request.getParameter("totalPoints"));
            
            MembershipTiersDAO mDAO = new MembershipTiersDAO();
            ArrayList<MembershipTiersDTO> l = mDAO.getAll();
            for (MembershipTiersDTO m : l) {
                if(m.getMinPoints() <= newPoint && m.getMaxPoints() >= newPoint){
                    cDAO.updateCustomerTier(cID, m.getTierID());
                }
            }
            
            cDAO.updateCustomerTotalPoint(cID, newPoint);
            response.sendRedirect("ManageProgramMember");
        } catch (Exception e) {
            System.out.println("UpdateMemberPointsServlet: " + e.getMessage());
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
