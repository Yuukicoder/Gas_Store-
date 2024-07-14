/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.AdminAccountServlet;

import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import dal.CustomerDao;
import dal.RoleDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Administrator;
import model.Role;

/**
 *
 * @author vip2021
 */
public class AdminManagerServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            //Reset noti-time on navbar - Vu Anh
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //
            if (account.getRoleID() == 1) {
                //List User

                CustomerDao cus = new CustomerDao();
                RoleDao ro = new RoleDao();
                String pid = request.getParameter("aid");
                String tp = request.getParameter("atype");

                int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
                int size = 5;
                int totalNumberAdmin = cus.getTotalAdmin();
                int totalPage = (int) Math.ceil((double) totalNumberAdmin / size);
                if (pid != null && !pid.isEmpty() && tp != null && !tp.isEmpty()) {
                    if (tp.equals("1")) {

                        cus.deleteStaff(pid);
                        response.sendRedirect("ManageStaff");
                        return;
                    }

                }
                List<Role> rli = ro.getAll();
                List<Administrator> li = cus.getPaginatedAdmin(pageNum, size);
                request.setAttribute("adata", li);
                request.setAttribute("pageNum", pageNum);
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("rdata", rli);
                request.getRequestDispatcher("TableAdmin.jsp").forward(request, response);
            } else {
                response.sendRedirect("403.jsp");
            }
        } else {
            response.sendRedirect("403.jsp");
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
        CustomerDao cus = new CustomerDao();
        int pageNum = 1;
        int size = 5;

        // Retrieve and parse page number from the request parameter
        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr != null && !pageNumStr.isEmpty()) {
            try {
                pageNum = Integer.parseInt(pageNumStr);
            } catch (NumberFormatException e) {
                // Log the exception and set pageNum to default value
                System.out.println("Invalid pageNum format, defaulting to 1");
            }
        }

        int totalNumberAdmin = cus.getTotalAdmin();
        int totalPage = (int) Math.ceil((double) totalNumberAdmin / size);

        // Retrieve the search parameter
        String s = request.getParameter("search");
        List<Administrator> li = new ArrayList<>();

        if (s != null && !s.isEmpty()) {
            // Perform search with pagination if search parameter is not empty
            li = cus.SearchPaginatedAdmin(pageNum, size, s);
        } else {
            // Retrieve paginated administrators without search filter
            li = cus.getPaginatedAdmin(pageNum, size);
        }

        // Set attributes for the request
        request.setAttribute("adata", li);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("totalPage", totalPage);

        // Forward the request to TableAdmin.jsp
        request.getRequestDispatcher("TableAdmin.jsp").forward(request, response);
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
