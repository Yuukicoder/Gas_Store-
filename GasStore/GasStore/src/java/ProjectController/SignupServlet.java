/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import Controller.MaHoa;
import DTO.Customer;
import dal.CustomerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
//import model.Customer;

/**
 *
 * @author msi
 */
public class SignupServlet extends HttpServlet {

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
            out.println("<title>Servlet SignupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
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
        String firstname_raw = request.getParameter("firstname");
        String lastname_raw = request.getParameter("lastname");
        String user_raw = request.getParameter("user");
        String gamil_raw = request.getParameter("email");
        String password_raw = MaHoa.toSHA1(request.getParameter("pass"));
        String password_raw2 = request.getParameter("pass");
        String repass_raw = MaHoa.toSHA1(request.getParameter("repass"));
        String phone_raw = request.getParameter("phone");
        System.out.println(firstname_raw);
        String fullname_raw = firstname_raw + lastname_raw;
        CustomerDao dao = new CustomerDao();
        Customer accountDTO = dao.checkgmail(gamil_raw);
        Customer checkuser = dao.checkuser(user_raw);
        //check format gmail 
        String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(EMAIL_REGEX);
        Matcher matcher = pattern.matcher(gamil_raw);
        //check password 
        String PASSWORD_REGEX = "^(?=.*[a-z])(?=.*[A-Z]).{6,}$";
        Pattern pattern1 = Pattern.compile(PASSWORD_REGEX);
        Matcher matcher1 = pattern1.matcher(password_raw2);

        //check sdt 
        String regex = "^0\\d{9}$";
        Pattern number = Pattern.compile(regex);
        Matcher matcher2 = number.matcher(phone_raw);
        //check 

        if (!password_raw.equals(repass_raw)) {
            request.setAttribute("err", "you must enter the same password");
            request.setAttribute("user", user_raw);
            request.setAttribute("gmail", gamil_raw);
            request.setAttribute("pass", password_raw);
            request.setAttribute("phone", phone_raw);
            request.setAttribute("firstname", firstname_raw);
            request.setAttribute("lastname", lastname_raw);
            request.setAttribute("wrongSignUpInfo", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        if (user_raw.isEmpty() || gamil_raw.isEmpty() || password_raw.isEmpty()) {
            request.setAttribute("err", "you must enter email or password or user");
            request.setAttribute("user", user_raw);
            request.setAttribute("gmail", gamil_raw);
            request.setAttribute("pass", password_raw2);
            request.setAttribute("phone", phone_raw);
            request.setAttribute("firstname", firstname_raw);
            request.setAttribute("lastname", lastname_raw);
            request.setAttribute("wrongSignUpInfo", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (checkuser != null) {
            request.setAttribute("err", "Username already exists ");
            request.setAttribute("user", user_raw);
            request.setAttribute("gmail", gamil_raw);
            request.setAttribute("pass", password_raw2);
            request.setAttribute("phone", phone_raw);
            request.setAttribute("firstname", firstname_raw);
            request.setAttribute("lastname", lastname_raw);
            request.setAttribute("wrongSignUpInfo", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (!matcher.matches()) {
            request.setAttribute("user", user_raw);
            request.setAttribute("gmail", gamil_raw);
            request.setAttribute("pass", password_raw2);
            request.setAttribute("phone", phone_raw);
            request.setAttribute("firstname", firstname_raw);
            request.setAttribute("lastname", lastname_raw);
            request.setAttribute("wrongSignUpInfo", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (!matcher1.matches()) {
            request.setAttribute("err", "Password must have uppercase and lowercase letters and be longer than 6 characters");
            request.setAttribute("user", user_raw);
            request.setAttribute("gmail", gamil_raw);
            request.setAttribute("pass", password_raw2);
            request.setAttribute("phone", phone_raw);
            request.setAttribute("firstname", firstname_raw);
            request.setAttribute("lastname", lastname_raw);
            request.setAttribute("wrongSignUpInfo", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (accountDTO != null) {
            request.setAttribute("err", "Email already exists ");
            request.setAttribute("user", user_raw);
            request.setAttribute("gmail", gamil_raw);
            request.setAttribute("pass", password_raw2);
            request.setAttribute("phone", phone_raw);
            request.setAttribute("firstname", firstname_raw);
            request.setAttribute("lastname", lastname_raw);
            request.setAttribute("wrongSignUpInfo", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (!matcher2.matches()) {
            request.setAttribute("err", "Phone number must be 10 digits");
            request.setAttribute("user", user_raw);
            request.setAttribute("gmail", gamil_raw);
            request.setAttribute("pass", password_raw2);
            request.setAttribute("phone", phone_raw);
            request.setAttribute("firstname", firstname_raw);
            request.setAttribute("lastname", lastname_raw);
            request.setAttribute("wrongSignUpInfo", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            
            
                    
        } else {
            Customer cus = new Customer(user_raw, password_raw, firstname_raw, lastname_raw, true, phone_raw, gamil_raw);
            dao.insertCustomer(cus);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
