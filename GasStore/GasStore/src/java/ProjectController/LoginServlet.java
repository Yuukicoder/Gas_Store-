/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import Controller.MaHoa;
import DAO.AccountDAO;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import dal.CustomerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import DTO.Customer;
import DTO.NotificationDTO;
import dal.SupplierDao;
import java.util.ArrayList;
import model.Supplier;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

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
//                String code = request.getParameter("code");
//                String accessToken = getToken(code);
// //               System.out.println(accessToken);
//                UserGoogleDTO user = getUserInfo(accessToken);

    }
//    public static String getToken(String code) throws ClientProtocolException, IOException {
//		// call api to get token
//		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
//				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
//						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
//						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
//						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
//				.execute().returnContent().asString();
//
//		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//		return accessToken;
//	}
//
//	public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
//		String response = Request.Get(link).execute().returnContent().asString();
//
//		UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);
//
//		return googlePojo;
//	}
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
//         String code = request.getParameter("code");
//    if (code == null || code.isEmpty()) {
////      RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
//      RequestDispatcher dis = request.getRequestDispatcher("TestLoginGG.jsp");
//
//      dis.forward(request, response);
//    } else {
//      String accessToken = getToken(code);
//      UserGoogleDTO googlePojo = getUserInfo(accessToken);
//      request.setAttribute("id", googlePojo.getId());
//      request.setAttribute("name", googlePojo.getName());
//      request.setAttribute("email", googlePojo.getEmail());
//      RequestDispatcher dis = request.getRequestDispatcher("TestLoginGG.jsp");
//      dis.forward(request, response);
//    }
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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = MaHoa.toSHA1(request.getParameter("password"));
        System.out.println("Login: username " + username + " pass" + password);
        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        AdminDTO account = accountDAO.checkLogin(username, password);
        if (account == null) {
          CustomerDao cus = new CustomerDao();
                Customer customer = cus.checkuserandPass(username, password);
                if (customer == null) {
                    String msg = "Username or Password is not correct!";
                    request.setAttribute("mess", msg);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                else{
                    session.setAttribute("account", customer);
                    response.sendRedirect("home");
                }
        } else {
            if (isSpecialCharacter(username)) {
                String msg = "Username don't use special character";
                request.setAttribute("mess", msg);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                // Compare username and password case-sensitive
            } else if (!account.getUserName().equals(username) || !account.getPassword().equals(password)) {
                CustomerDao cus = new CustomerDao();
                Customer customer = cus.checkuserandPass(username, password);
                if (customer == null) {
                    String msg = "Username or Password is not correct!";
                    request.setAttribute("mess", msg);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                else{
                    session.setAttribute("account", customer);
                    response.sendRedirect("home");
                }
            } else if (account.getRoleID() == 1) {
                session.setAttribute("account", account);
                response.sendRedirect("adminHome");
            } else if (account.getRoleID() == 2) {
                session.setAttribute("account", account);
                response.sendRedirect("adminHome");
=======
=======
>>>>>>> Stashed changes
        throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = MaHoa.toSHA1(request.getParameter("password"));
    System.out.println("Login: username " + username + " pass " + password);
    HttpSession session = request.getSession();
    AccountDAO accountDAO = new AccountDAO();
    AdminDTO account = accountDAO.checkLogin(username, password);
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

    if (account == null) {
        CustomerDao cus = new CustomerDao();
        Customer customer = cus.checkuserandPass(username, password);
        Supplier supplier = new SupplierDao().getByEmailAndPassword(username, password);

        if (supplier != null) {
            session.setAttribute("supplier", supplier);
            System.out.println(supplier);
            response.sendRedirect("supplier/home");
            return;
        } else if (customer != null) {
            NotificationDAO nDAO = new NotificationDAO();
<<<<<<< Updated upstream
            ArrayList<NotificationDTO> n = nDAO.getAllOtherTypeNotification(1, customer.getCustomerID());
=======
            ArrayList<NotificationDTO> n = nDAO.getOther3NewestUnreadNoti(1, customer.getCustomerID());
            session.removeAttribute("notiList");
>>>>>>> Stashed changes
            session.setAttribute("notiList", n);
            session.setAttribute("account", customer);
            session.setAttribute("customerID", customer.getCustomerID());
            
            response.sendRedirect("home");
            return;
        } else {
            String msg = "Username or Password is not correct!";
            request.setAttribute("mess", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
    } else {
        if (isSpecialCharacter(username)) {
            String msg = "Username don't use special character";
            request.setAttribute("mess", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        } else {
            session.setAttribute("account", account);
            if (account.getRoleID() == 1) {
                NotificationDAO nDAO = new NotificationDAO();
                ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
<<<<<<< Updated upstream
=======
                session.removeAttribute("notiList");
>>>>>>> Stashed changes
                session.setAttribute("notiList", n);
                response.sendRedirect("adminHome");
                return;
            } else if (account.getRoleID() == 2) {
                response.sendRedirect("adminHome");
                return;
            } else {
                response.sendRedirect("adminHome");
                return;
            }
        }
    }
}

    private boolean isSpecialCharacter(String username) {

        String specialCharacters = "!@#$%^&*()-_=+<>?[]{}";
        for (char c : username.toCharArray()) {
            if (specialCharacters.contains(String.valueOf(c))) {
                return true;
            }
        }
        return false;

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}