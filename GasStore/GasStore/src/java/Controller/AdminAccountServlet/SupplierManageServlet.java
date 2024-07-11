package Controller.AdminAccountServlet;

import DAO.NotificationDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import dal.SupplierDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Supplier;

public class SupplierManageServlet extends HttpServlet {

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

                int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
                int pageSize = 5;
                List<Supplier> suppliers = supplierDao.getPaginated(pageNum, pageSize);
                request.setAttribute("sdata", suppliers);

                int totalSuppliers = supplierDao.getTotal();
                int totalPages = (int) Math.ceil((double) totalSuppliers / pageSize);

                request.setAttribute("pageNum", pageNum);
                request.setAttribute("totalPages", totalPages);

                if (pid != null && !pid.isEmpty() && t != null && !t.isEmpty()) {
                    if (t.equals("1")) {

                        supplierDao.deleteSupplier(pid);
                        response.sendRedirect("ManageSupplier");
                        return;
                    }
                }
                request.getRequestDispatcher("TableSupplier.jsp").forward(request, response);
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
        String s = request.getParameter("search");
        SupplierDao sus = new SupplierDao();
        if (!s.isEmpty()) {
            List<Supplier> l = sus.getAllAdminByName(s);
            request.setAttribute("sdata", l);
        } else {
            int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
            int pageSize = 5;
            List<Supplier> suppliers = sus.getPaginated(pageNum, pageSize);
            request.setAttribute("sdata", suppliers);

            int totalSuppliers = sus.getTotal();
            int totalPages = (int) Math.ceil((double) totalSuppliers / pageSize);
            request.setAttribute("pageNum", pageNum);
            request.setAttribute("totalPages", totalPages);

        }
        request.getRequestDispatcher("TableSupplier.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
