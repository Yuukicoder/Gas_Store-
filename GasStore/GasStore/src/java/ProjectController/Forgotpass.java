/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import DAO.AccountDAO;
import DTO.AccountDTO;
import GMAIL.Gmail;
import GMAIL.Randompassword;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author phung
 */
@WebServlet(name = "Forgotpass", urlPatterns = {"/forgotpass"})
public class Forgotpass extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Forgotpass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Forgotpass at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String gamil_raw = request.getParameter("gmail");
        AccountDAO aO = new AccountDAO();

        request.getRequestDispatcher("Forgotpass.jsp").forward(request, response);
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
        String gamil_raw = request.getParameter("mail");
        AccountDAO aO = new AccountDAO();

        ArrayList<AccountDTO> adtoList = aO.getlistcheckgmail(gamil_raw);

        if (gamil_raw.isEmpty()) {
            request.setAttribute("err", "Please enter full information!");
            request.getRequestDispatcher("Forgotpass.jsp").forward(request, response);
        } else if (adtoList.isEmpty()) {
            request.setAttribute("err", "Gmail doesn't exist yet");
            request.getRequestDispatcher("Forgotpass.jsp").forward(request, response);
        } else {
            Gmail gmail = new Gmail();
            //goi ham random
            Randompassword randompassword = new Randompassword();
            String randomString = randompassword.generateRandomString();

            String emailContent = randomString;
            gmail.sendEmail(
                    "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "<head>\n"
                    + "<title>Page Title</title>\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "\n"
                    + "<h1>Your password is :" + randomString + " </h1>\n"
                    + "<p>Log in  <a href=\"http://localhost:9999/swp391-laptopshop/login\">Here</a></p>\n"
                    + "\n"
                    + "</body>\n"
                    + "</html>",gamil_raw);

            AccountDAO aO1 = new AccountDAO();
            aO1.getgmailupdate(randomString, gamil_raw);

            response.sendRedirect("signin.jsp");

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
