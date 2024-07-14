/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.NotificationDAO;
import DTO.NotificationDTO;
import dal.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Administrator;
import model.Customer;

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
        CustomerDao cus = new CustomerDao();
        String pid = request.getParameter("aid");
        String tp = request.getParameter("atype");
        List<Administrator> li = cus.getAllAdmin();
        request.setAttribute("adata", li);
        if (pid != null && !pid.isEmpty() && tp != null && !tp.isEmpty()) {
            if (tp.equals("0")) {
                Administrator u = cus.getAdminByID(Integer.parseInt(pid));
                request.setAttribute("detail", u);
            } else {
                cus.deleteStaff(pid);
                response.sendRedirect("ManageStaff");
                return;
            }
        }
        request.getRequestDispatcher("TableAdmin.jsp").forward(request, response);
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
        //Reset noti-time on navbar - Vu Anh
        HttpSession session = request.getSession();
        NotificationDAO nDAO = new NotificationDAO();
        ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
        session.setAttribute("notiList", n);
        //

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
//        String s = request.getParameter("search");
        String adid = request.getParameter("accountID");
        String aname = request.getParameter("admin_name");
        String apass = MaHoa.toSHA1(request.getParameter("passWord"));
        String amail = request.getParameter("aemail");
        String ac = request.getParameter("active");
        String arole = request.getParameter("roleid");
        Administrator newAdmin = new Administrator(adid != null && !adid.isEmpty() ? Integer.parseInt(adid) : 0, aname, apass, Boolean.parseBoolean(ac), Integer.parseInt(arole), amail);
        if (adid != null && !adid.isEmpty()) {
            cus.updateStaff(newAdmin);
        } else {
            cus.insertStaff(newAdmin);
        }
        //Reset noti-time on navbar - Vu Anh
        HttpSession session = request.getSession();
        NotificationDAO nDAO = new NotificationDAO();
        ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
        session.setAttribute("notiList", n);
        //
        
        response.sendRedirect("ManageStaff");
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
