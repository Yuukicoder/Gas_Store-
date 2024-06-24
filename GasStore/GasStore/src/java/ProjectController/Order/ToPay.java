package ProjectController.Order;
import DAO.FeedbackDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DTO.AccountDTO;
import DTO.Order;
import DTO.OrderDetail;
import dal.OrdersDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Customer;
import model.Orders;

/**
 *
 * @author phung
 */
@WebServlet(name="ToPay", urlPatterns={"/topay"})
public class ToPay extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ToPay</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ToPay at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        HttpSession session = request.getSession();
       Customer cus = (Customer) session.getAttribute("account");
        if (cus == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        OrderDAO odao = new OrderDAO();
        OrderDetailDAO odDAO = new OrderDetailDAO();
        ProductDAO pDAO = new ProductDAO();
        FeedbackDAO fdao = new FeedbackDAO();
        
        List<Order> purchaseList = odao.myPurchase1(cus.getCustomerID());
        Map<Integer, List<OrderDetail>> orderDetailsMap = new HashMap<>();
        
        for (Order order : purchaseList) {
            List<OrderDetail> orderDetails = odDAO.getOrderDetailByID(order.getOrderID());
            orderDetailsMap.put(order.getOrderID(), orderDetails);
        }
        
        request.setAttribute("odDAO", odDAO);
        request.setAttribute("pDAO", pDAO);
        request.setAttribute("fdao", fdao);
        request.setAttribute("purchase", purchaseList);
        request.setAttribute("orderDetailsMap", orderDetailsMap);
  
        request.getRequestDispatcher("ToPay.jsp").forward(request, response);
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
        processRequest(request, response);
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
