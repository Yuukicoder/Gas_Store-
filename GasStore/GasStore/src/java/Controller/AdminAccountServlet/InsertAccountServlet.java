/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.AdminAccountServlet;

import static Controller.MaHoa.toSHA1;
import DTO.AdminDTO;
import dal.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;

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
//        String s = request.getParameter("search");
        String uid = request.getParameter("account_id");
        String name = request.getParameter("username");
        String pass = request.getParameter("password");
        String first = request.getParameter("first_name");
        String last = request.getParameter("last_name");
        String mail = request.getParameter("email");
        String phone = request.getParameter("phone_number");
//        String uimage = request.getParameter("uimg");
        
        if (uid != null && !uid.isEmpty()) {
            Customer newCustomer = new Customer(uid != null && !uid.isEmpty() ? Integer.parseInt(uid) : 0, name,
                pass, first, last, phone, mail);
            cus.updateUser(newCustomer);
            response.sendRedirect("ManageUser");
            return;
        } else {
            Customer newCustomer = new Customer(uid != null && !uid.isEmpty() ? Integer.parseInt(uid) : 0, name,
                toSHA1(pass), first, last, phone, mail);
            cus.insertCustomer(newCustomer);
            response.sendRedirect("ManageUser");
            return;
        }
//        response.sendRedirect("ManageUser");
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