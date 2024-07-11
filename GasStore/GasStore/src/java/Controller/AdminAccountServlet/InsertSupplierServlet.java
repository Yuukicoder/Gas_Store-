package Controller;

import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import dal.SupplierDao;
import model.Supplier;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "InsertSupplierServlet", urlPatterns = {"/insertSupplier"})
public class InsertSupplierServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            //Reset noti-time on navbar
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //
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
                request.getRequestDispatcher("InsertSupplier.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null && account.getRoleID() == 1) {
            SupplierDao sus = new SupplierDao();
            String uid = request.getParameter("account_id");
            String name = request.getParameter("username");
            String smail = request.getParameter("email");
            String phone = request.getParameter("phone");
            String home = request.getParameter("HomePage");
            Supplier newSup = new Supplier(!uid.isEmpty() ? Integer.parseInt(uid) : 0, name, smail, phone, home);
            sus.insertSupplier(newSup);
            response.sendRedirect("ManageSupplier");
        } else {
            response.sendRedirect("403.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "InsertSupplierServlet";
    }
}
