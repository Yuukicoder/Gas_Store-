/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.LoyaltyProgram;

import DAO.CategoryDAO;
import DAO.CustomerDAO;
import DAO.MembershipTiersDAO;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.Category;
import DTO.Customer;
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
import java.util.List;

/**
 *
 * @author Vu Anh
 */
@WebServlet(name = "ManageProgramMemberServlet", urlPatterns = {"/ManageProgramMember"})
public class ManageProgramMemberServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageProgramMemberServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageProgramMemberServlet at " + request.getContextPath() + "</h1>");
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

            String search = request.getParameter("search");

            if (search == null) {
                search = "";
            }

            CustomerDAO cDAO = new CustomerDAO();
            List<Customer> list = cDAO.SearchMember(search);
            List<Customer> result;
            String indexPage_raw = request.getParameter("indexPage");

            String pageSize_raw = request.getParameter("pageSize");

            int pageSize = 0;

            if (pageSize_raw == null) {
                pageSize_raw = "5";
                pageSize = 5;
            } else if (pageSize_raw.equals("0")) {
                request.setAttribute("currentPageSize", pageSize_raw);
                request.setAttribute("tag", 1);
                request.setAttribute("endPage", 1);
                request.setAttribute("search", search);
                request.setAttribute("listCategory", list);
                request.getRequestDispatcher("TableCategory.jsp").forward(request, response);
            } else {
                pageSize = Integer.parseInt(pageSize_raw);
            }

            try {
                int indexPage = 0;
                if (indexPage_raw == null) {
                    indexPage = 1;
                } else {
                    indexPage = Integer.parseInt(indexPage_raw);
                }
                int numProduct = list.size();
                int endPage = numProduct / pageSize;
                if (numProduct % pageSize != 0) {
                    endPage++;
                }
                result = cDAO.pagging(indexPage, pageSize, search);

                request.setAttribute("currentPageSize", pageSize_raw);
                request.setAttribute("search", search);
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);
                request.setAttribute("listMember", result);
                request.setAttribute("memberShipDAO", new MembershipTiersDAO());
                request.getRequestDispatcher("TableMember.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e.getMessage());
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

            String search = request.getParameter("search");

            if (search == null) {
                search = "";
            }

            CustomerDAO cDAO = new CustomerDAO();
            List<Customer> list = cDAO.SearchMember(search);
            List<Customer> result;
            String indexPage_raw = request.getParameter("indexPage");

            String pageSize_raw = request.getParameter("pageSize");

            int pageSize = 0;

            if (pageSize_raw == null) {
                pageSize_raw = "5";
                pageSize = 5;
            } else if (pageSize_raw.equals("0")) {
                request.setAttribute("currentPageSize", pageSize_raw);
                request.setAttribute("tag", 1);
                request.setAttribute("endPage", 1);
                request.setAttribute("search", search);
                request.setAttribute("listCategory", list);
                request.getRequestDispatcher("TableCategory.jsp").forward(request, response);
            } else {
                pageSize = Integer.parseInt(pageSize_raw);
            }

            try {
                int indexPage = 0;
                if (indexPage_raw == null) {
                    indexPage = 1;
                } else {
                    indexPage = Integer.parseInt(indexPage_raw);
                }
                int numProduct = list.size();
                int endPage = numProduct / pageSize;
                if (numProduct % pageSize != 0) {
                    endPage++;
                }
                result = cDAO.pagging(indexPage, pageSize, search);

                request.setAttribute("currentPageSize", pageSize_raw);
                request.setAttribute("search", search);
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);
                request.setAttribute("listMember", result);
                request.setAttribute("memberShipDAO", new MembershipTiersDAO());
                request.getRequestDispatcher("TableMember.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else {
            response.sendRedirect("403.jsp");
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
