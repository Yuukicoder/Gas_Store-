/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.AdminAccountServlet;

import static Controller.MaHoa.toSHA1;
import DAO.FeedbackDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.OrderHistoryDAO;
import DAO.ProductDAO;
import DTO.AdminDTO;
import dal.CustomerDao;
import dal.RoleDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import DTO.Customer;
import DTO.FeedbackDTO;
import DTO.OrderDetail;
import DTO.OrderHistoryDTO;
import dal.OrdersDao;
import java.util.HashMap;
import java.util.Map;
import model.Orders;
import model.Role;
import DTO.Customer;

/**
 *
 * @author vip2021
 */
public class InsertAccountServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            if (account.getRoleID() == 1) {
          
       String pid = request.getParameter("id");
        String t = request.getParameter("type");
        CustomerDao cus = new CustomerDao();
       
        if (pid != null && !pid.isEmpty() && t != null && !t.isEmpty()) {
            if (t.equals("0")) {
                Customer u = cus.getAllByID(Integer.parseInt(pid));
                request.setAttribute("detailaccount", u);
            }
        }
        String statusParam = request.getParameter("status");
        int status = statusParam != null ? Integer.parseInt(statusParam) : -1; // Default value or handle null case

        // Instantiate DAO objects
        OrderDAO odao = new OrderDAO();
        OrderDetailDAO odDAO = new OrderDetailDAO();
        ProductDAO pDAO = new ProductDAO();
        OrdersDao ord = new OrdersDao();
        List<Orders> orderList;
        if (status != -1) {
            // Get the orders for the customer filtered by status
            orderList = ord.getAllByID(Integer.parseInt(pid), status);
        } else {
            orderList = ord.getAllByID(Integer.parseInt(pid));
        }
        // Create a map to hold order details for each order
        Map<Integer, List<OrderDetail>> orderDetailsMap = new HashMap<>();

        // Fetch order details for each order
        for (Orders order : orderList) {
            List<OrderDetail> orderDetails = odDAO.getOrderDetailByID(order.getOrderID());
            orderDetailsMap.put(order.getOrderID(), orderDetails);
        }
          FeedbackDAO fd = new FeedbackDAO();
        Map<Integer, Integer> feedbackCountMap = new HashMap<>();
        for (Orders order : orderList) {
            int feedbackCount = fd.getCount(order.getOrderID(), Integer.parseInt(pid));
            feedbackCountMap.put(order.getOrderID(), feedbackCount);
        }
//        FeedbackDAO fd = new FeedbackDAO();
             List<FeedbackDTO> productFeedback = fd.getFeedbackById(Integer.parseInt(pid));
        // Set attributes for the request
         request.setAttribute("feedbackCountMap", feedbackCountMap);
        request.setAttribute("odDAO", odDAO);
        request.setAttribute("order", orderList);
        request.setAttribute("pDAO", pDAO);
        request.setAttribute("purchase", orderList);
        request.setAttribute("orderDetailsMap", orderDetailsMap);
        request.setAttribute("productFeedback", productFeedback);

        request.getRequestDispatcher("InsertAccount.jsp").forward(request, response);
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    CustomerDao cus = new CustomerDao();
    String uid = request.getParameter("account_id");
    String name = request.getParameter("username");
    String pass = request.getParameter("password");
    String first = request.getParameter("first_name");
    String last = request.getParameter("last_name");
    String mail = request.getParameter("email");
    String phone = request.getParameter("phone_number");

    // Check if username or email is available
    boolean isUsernameAvailable = cus.isUsernameAvailable(name);
    boolean isEmailAvailable = cus.isEmailAvailable(mail);

    if (!isUsernameAvailable) {
        request.setAttribute("error", "Username is already taken");
        request.getRequestDispatcher("ManageUser").forward(request, response);
        return;
    }

    if (!isEmailAvailable) {
        request.setAttribute("error", "Email is already registered");
        request.getRequestDispatcher("ManageUser").forward(request, response);
        return;
    }

    if (uid != null && !uid.isEmpty()) {
        Customer newCustomer = new Customer(Integer.parseInt(uid), name, pass, first, last, phone, mail);
        cus.updateUser(newCustomer);
        response.sendRedirect("ManageUser");
    } else {
        Customer newCustomer = new Customer(0, name, toSHA1(pass), first, last, phone, mail);
        cus.insertCustomer(newCustomer);
        response.sendRedirect("ManageUser");
    }
}


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
