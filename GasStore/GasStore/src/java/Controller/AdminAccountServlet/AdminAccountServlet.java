package Controller.AdminAccountServlet;

import Controller.MaHoa;
import static Controller.MaHoa.toSHA1;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import dal.CustomerDao;
import dal.RoleDao;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import DTO.Customer;
import DTO.NotificationDTO;
import java.util.ArrayList;
import model.Role;
import model.Administrator;

@MultipartConfig
public class AdminAccountServlet extends HttpServlet {

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

                String pid = request.getParameter("id");
                String t = request.getParameter("type");
                CustomerDao cus = new CustomerDao();
                RoleDao ro = new RoleDao();

                int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
                int pageSize = 5;
                List<Customer> li = cus.getPaginatedCustomers(pageNum, pageSize);
                request.setAttribute("lidata", li);

                int totalCustomers = cus.getTotalCustomers();
                int totalPages = (int) Math.ceil((double) totalCustomers / pageSize);

                request.setAttribute("pageNum", pageNum);
                request.setAttribute("totalPages", totalPages);

                if (pid != null && !pid.isEmpty() && t != null && !t.isEmpty()) {
                    if (t.equals("0")) {
                        Customer u = cus.getAllByID(Integer.parseInt(pid));
                        request.setAttribute("detailaccount", u);
                    } else {
                        cus.deleteAccount(pid);
                        response.sendRedirect("ManageUser");
                        return;
                    }
                }
                List<Role> rli = ro.getAll();
                request.setAttribute("rdata", rli);
                request.getRequestDispatcher("TableAccount.jsp").forward(request, response);
            } else {
                response.sendRedirect("403.jsp");
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Other form fields
        CustomerDao cus = new CustomerDao();
        List<Customer> li;
        String s = request.getParameter("search");
        if (s.isEmpty()) {
            int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
            int pageSize = 5;
            int totalCustomers = cus.getTotalCustomers();
            int totalPages = (int) Math.ceil((double) totalCustomers / pageSize);

            request.setAttribute("pageNum", pageNum);
            request.setAttribute("totalPages", totalPages);
            li = cus.getPaginatedCustomers(pageNum, pageSize);
        } else {
            li = cus.getAllByAccount(s);

        }
        request.setAttribute("lidata", li);
        request.getRequestDispatcher("TableAccount.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin Account Management Servlet";
    }
}
