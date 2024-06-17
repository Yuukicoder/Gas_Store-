/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Account;

import DAO.AccountDAO;
import DTO.AccountDTO;
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
 * @author 1234
 */
public class UserProfile extends HttpServlet {

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
         String aid_raw = request.getParameter("aid");
            int aid = Integer.parseInt(aid_raw);
            HttpSession session = request.getSession();
            AccountDAO accountDAO = new AccountDAO();
            CustomerDao cus = new CustomerDao();
            Customer c =  cus.getAllByID(aid);
            request.setAttribute("account", c);
//            request.setAttribute("passAcc", account.getPassword());
            request.getRequestDispatcher("ProfileUser.jsp").forward(request, response);
        
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
        String name = request.getParameter("name");
        String user = request.getParameter("user");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String aid_raw = request.getParameter("aid");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        String button = request.getParameter("update");

        AccountDTO accountDTO = new AccountDTO();
        AccountDAO adao = new AccountDAO();

        try {
            int aid = Integer.parseInt(aid_raw);

            if (button.equals("profile")) {
                accountDTO.setFullname(name);
                accountDTO.setUsername(user);
                accountDTO.setPhone(mobile);
                accountDTO.setAddress(address);
                accountDTO.setEmail(email);
                accountDTO.setAccountID(aid);
                int checkUpdate = adao.updateProfile(accountDTO);
                if (checkUpdate != 0) {
                    doGet(request, response);
                } else {
                    System.out.println("error server");
                }
            }
            if (button.equals("password")) {
                int checkChangePass = adao.changePassword(newpass, aid);
                if (checkChangePass != 0) {
                    doGet(request, response);
                } else {
                    System.out.println("error server");
                }
            }

        } catch (Exception e) {
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
