/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.LoyaltyProgram;

import DAO.MembershipTiersDAO;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.MembershipTiersDTO;
import DTO.NotificationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Vu Anh
 */
@WebServlet(name = "UpdateTierBenefitServlet", urlPatterns = {"/UpdateTierBenefit"})
public class UpdateTierBenefitServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateTierBenefitServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateTierBenefitServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            //Reset noti-time on navbar - Vu Anh
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //

            try {
                int id = Integer.parseInt(request.getParameter("id"));
                MembershipTiersDAO mDAO = new MembershipTiersDAO();
                MembershipTiersDTO m = mDAO.getMembershipTierByID(id);
                request.setAttribute("m", m);
                request.getRequestDispatcher("EditTierBenefit.jsp").forward(request, response);
            } catch (Exception e) {
            }
        } else {
            response.sendRedirect("403.jsp");
        }
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
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            //Reset noti-time on navbar - Vu Anh
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //
            try {
                String name = request.getParameter("name");
                int minPoint = Integer.parseInt(request.getParameter("minPoint"));
                int maxPoint = Integer.parseInt(request.getParameter("maxPoint"));
                double discount = Double.parseDouble(request.getParameter("discount"));
                double pointRate = Double.parseDouble(request.getParameter("pointRate"));
                MembershipTiersDAO mDAO = new MembershipTiersDAO();
                String currentName = mDAO.getMembershipTierByID(Integer.parseInt(request.getParameter("id"))).getTierName();
                String mess = validate(currentName, name, minPoint, maxPoint, discount, pointRate);
                if (mess.isEmpty()) {
                    MembershipTiersDTO m = new MembershipTiersDTO();
                    m.setTierID(Integer.parseInt(request.getParameter("id")));
                    m.setTierName(name);
                    m.setMaxPoints(maxPoint);
                    m.setMinPoints(minPoint);
                    m.setDiscountPercentage(discount);
                    m.setBonusPointsRate(pointRate);
                    mDAO.update(m);
                } else {
                    request.setAttribute("mess", mess);
                    request.getRequestDispatcher("EditTierBenefit.jsp").forward(request, response);
                    return;
                }

                response.sendRedirect("ManageTierBenefit");
            } catch (Exception e) {
                System.out.println("AddTierBenefitServlet - doPost: " + e.getMessage());
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

    private String validate(String currentName, String name, int minPoint, int maxPoint, double discount, double pointRate) {
        if (name.isEmpty()) {
            return "Name can't be empty";
        }

        MembershipTiersDAO mDAO = new MembershipTiersDAO();
        if (mDAO.checkNameExist(name) && !name.equals(currentName)) {
            return "This name already exist!";
        }

        if (minPoint >= maxPoint) {
            return "Min point must be smaller than Max Point";
        }

        if (discount > 100) {
            return "Discount percentage must not be bigger than 100";
        }
        
        if (discount < 0) {
            return "Discount percentage must not be smaller than 0";
        }

        if (pointRate <= 0) {
            return "Point Rate must be bigger than 0";
        }

        return "";
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
