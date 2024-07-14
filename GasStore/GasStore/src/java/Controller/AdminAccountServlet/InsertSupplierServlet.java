package Controller.AdminAccountServlet;

import DAO.ProductDAO;
import DTO.AdminDTO;
import DTO.Product;
import dal.SupplierDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Supplier;

@WebServlet(name = "InsertSupplierServlet", urlPatterns = {"/insert-supplier"})
public class InsertSupplierServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");

        if (account != null && account.getRoleID() == 1) {
            String pid = request.getParameter("id");
            String t = request.getParameter("type");
            SupplierDao supplierDao = new SupplierDao();

            // Handling supplier details
            if (pid != null && !pid.isEmpty() && t != null && !t.isEmpty()) {
                if (t.equals("0")) {
                    Supplier supplier = supplierDao.getSupplierByID(Integer.parseInt(pid));
                    request.setAttribute("detail", supplier);
                }
            }

            // Handling product list
            String message = (String) session.getAttribute("msg");
            session.removeAttribute("msg");
            List<Product> productDTOs = new ArrayList<>();
            ProductDAO productDAO = new ProductDAO();
            LinkedHashMap<Product, String> productCmap = new LinkedHashMap<>();
            String action = request.getParameter("action");
            String indexPage_raw = request.getParameter("indexPage");
            String numPage_raw = request.getParameter("numPage");

            try {
                int indexPage = (indexPage_raw == null) ? 1 : Integer.parseInt(indexPage_raw);
                int numPage = (numPage_raw == null) ? 10 : numPage_raw.equals("all") ? Integer.MAX_VALUE : Integer.parseInt(numPage_raw);
                boolean isAll = numPage == Integer.MAX_VALUE;

                if (action == null || action.equals("show")) {
                    action = "normal";
                    productCmap = productDAO.pagingProduct2(action, indexPage, numPage,Integer.parseInt(pid));
                    productDTOs = productDAO.getAllProductBySupplier(Integer.parseInt(pid));
                    int numProduct = productDTOs.size();
                    int endPage = isAll ? 1 : (numProduct / numPage + (numProduct % numPage == 0 ? 0 : 1));
                    request.setAttribute("endPage", endPage);
                    request.setAttribute("action", "show");
                } else {
                    productCmap = productDAO.pagingProduct2(action, indexPage, numPage,Integer.parseInt(pid));
                    productDTOs = productDAO.getAllProductHide();
                    int numProduct = productDTOs.size();
                    int endPage = isAll ? 1 : (numProduct / numPage + (numProduct % numPage == 0 ? 0 : 1));
                    request.setAttribute("action", "hide");
                    request.setAttribute("endPage", endPage);
                }

                request.setAttribute("tag", indexPage);
                request.setAttribute("msg", message);
                request.setAttribute("productCmap", productCmap);
                request.getRequestDispatcher("InsertSupplier.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
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

        if (account != null) {
            // Supplier insertion
            SupplierDao sus = new SupplierDao();
            String uid = request.getParameter("account_id");
            String name = request.getParameter("username");
            String smail = request.getParameter("email");
            String phone = request.getParameter("phone");
            String home = request.getParameter("HomePage");

            Supplier newSup = new Supplier(!uid.isEmpty() ? Integer.parseInt(uid) : 0, name, smail, phone, home);
            sus.insertSupplier(newSup);

            session.setAttribute("msg", "Supplier successfully inserted/updated");
            response.sendRedirect("insert-supplier");

        } else {
            response.sendRedirect("403.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Insert and manage suppliers and products";
    }
}
