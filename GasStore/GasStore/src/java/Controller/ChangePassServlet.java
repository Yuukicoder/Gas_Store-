/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;
import model.Customer;
import dal.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="ChangePassServlet", urlPatterns={"/changepass"})
public class ChangePassServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        // lay tai khoan va mat khau de tien hanh reset
        String user = request.getParameter("user");
        String passOld = MaHoa.toSHA1(request.getParameter("pass"));
        String pass =  MaHoa.toSHA1(request.getParameter("newPassword"));
        String repass = MaHoa.toSHA1(request.getParameter("confirmPassword"));
        
        CustomerDao adb = new CustomerDao();
        Customer account = adb.checkuserandPass(user, passOld);
        
        if (account == null) {
            request.setAttribute("mess", "Account does not exist or wrong password !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        if (!pass.equals(repass)) {
            request.setAttribute("mess", "password does not match!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        if (pass.equals(repass)) {
            adb.updatePassword(user, pass);
            request.setAttribute("mess", "Change Pass successfully!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
