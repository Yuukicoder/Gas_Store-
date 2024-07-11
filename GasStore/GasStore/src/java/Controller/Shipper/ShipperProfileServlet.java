/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Shipper;

import DAO.AccountDAO;
import DAO.NotificationDAO;
import DAO.ShipperDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import DTO.ShipperDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.regex.Pattern;

/**
 *
 * @author vu anh
 */
@WebServlet(name = "ShipperProfileServlet", urlPatterns = {"/ShipperProfile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ShipperProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet ShipperProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShipperProfileServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        ShipperDTO account = (ShipperDTO) session.getAttribute("account");
        if (account != null) {
            //Reset notification-navbar
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getOther3NewestUnreadNoti(1, account.getShipperID());
            session.setAttribute("notiList", n);
            //
            request.getRequestDispatcher("ProfileShipper.jsp").forward(request, response);
        } else {
            response.sendRedirect("403.jsp");
        }
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
        HttpSession session = request.getSession();
        ShipperDTO account = (ShipperDTO) session.getAttribute("account");
        if (account != null) {
            //Reset notification-navbar
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getOther3NewestUnreadNoti(1, account.getShipperID());
            session.setAttribute("notiList", n);
            //
            
            ShipperDAO sDAO = new ShipperDAO();
            int uid = account.getShipperID();
            String shipperName = request.getParameter("shipperName");
            String username = request.getParameter("username");
            int gender = 0;
            try {
                gender = Integer.parseInt(request.getParameter("gender"));
            } catch (Exception e) {
                System.out.println(e.getMessage());
                request.setAttribute("mess", "Please pick gender!");
                request.getRequestDispatcher("ProfileShipper.jsp").forward(request, response);
                return;
            }
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            Part p = request.getPart("pimg");

            String mess = checkData(uid, shipperName, username, address, phone, email);
            if (!mess.isEmpty()) {
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("ProfileShipper.jsp").forward(request, response);
                return;
            }

            ShipperDTO acc = sDAO.getAccountById(uid);

            String fileName = p.getSubmittedFileName();
            System.out.println("Filename: " + fileName);
            if (fileName != null && !fileName.isEmpty()) {
                acc.setImage(fileName);
            }

            acc.setUsername(username.trim());
            acc.setFullname(shipperName.trim());
            acc.setGender(gender);
            acc.setAddress(address);
            acc.setPhoneNumber(phone);
            acc.setEmail(email.trim());

            if (!sDAO.updateProfile(acc)) {
                request.setAttribute("mess", "Update Profile fail");
            }

            session.setAttribute("account", sDAO.getAccountById(uid));

            request.getRequestDispatcher("ProfileShipper.jsp").forward(request, response);
        } else {
            response.sendRedirect("403.jsp");
        }
    }

    private String checkData(int uid, String shipperName, String username,
            String address, String phone, String email) {
        ShipperDAO sDAO = new ShipperDAO();

        if (shipperName == null || shipperName.isEmpty()) {
            return "Shipper name can't be empty!";
        }

        if (username == null || username.isEmpty()) {
            return "Account can't be empty!";
        }

        if (sDAO.checkuser(username) != null) {
            if (sDAO.checkuser(username).getShipperID() != uid) {
                return "This account already exist!";
            }
        }

        if (address == null || address.isEmpty()) {
            return "Address can't be empty!";
        }

        String PHONE_REGEX = "^[0-9]{10}$";
        Pattern phoneNumPattern = Pattern.compile(PHONE_REGEX);
        if (phone == null || phone.isEmpty()) {
            return "Phone number can't be empty!";
        }
        if (!phoneNumPattern.matcher(phone).matches()) {
            return "Wrong phone number format!";
        }

        if (email == null || email.isEmpty()) {
            return "Email can't be empty!";
        }

        //check format gmail 
        String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern emailPattern = Pattern.compile(EMAIL_REGEX);
        if (!emailPattern.matcher(email).matches()) {
            return "Wrong email format!";
        }

        return "";
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
