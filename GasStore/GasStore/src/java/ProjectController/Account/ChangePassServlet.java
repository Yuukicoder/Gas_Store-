package ProjectController.Account;

import static Controller.MaHoa.toSHA1;
import dal.CustomerDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DTO.Customer;

public class ChangePassServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        // Get customer from session
        Customer cus = (Customer) session.getAttribute("account");
        if (cus == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        session.setAttribute("passW", cus.getPassword());
        request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
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

        // Get customer from session
        Customer cus = (Customer) session.getAttribute("account");
        if (cus == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String oldPassword = request.getParameter("oldpass");
        String newPassword = request.getParameter("newpass");
        String rePassword = request.getParameter("repass");

        String hashedOldPassword = toSHA1(oldPassword); // Assuming toSHA1() is a method to hash passwords

        // Validate old password
        if (!hashedOldPassword.equals(cus.getPassword())) {
            request.setAttribute("passwordMismatchOld", true);
            request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
            return;
        }

        // Validate new password format
        if (!isValidPassword(newPassword)) {
            request.setAttribute("passwordMismatchRegex", true);
            request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
            return;
        }

        // Validate new password match
        if (!newPassword.equals(rePassword)) {
            request.setAttribute("passwordMismatch", true);
            request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
            return;
        }

        // Hash the new password and update the account
        String hashedNewPassword = toSHA1(newPassword);
        cus.setPassword(hashedNewPassword);

        CustomerDao customerDao = new CustomerDao();
        customerDao.updatePassword2(cus.getCustomerID(), cus.getPassword());

        // Invalidate the current session to log out the user
        session.invalidate();

        // Redirect to login page
        response.sendRedirect("login.jsp");
    }

    private boolean isValidPassword(String password) {
        return password.length() >= 6 && password.matches(".*[A-Z].*") && password.matches(".*[a-z].*");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
