/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Warranty;

import DAO.CustomerDAO;
import DAO.DAOWarranty;
import DAO.NotificationDAO;
import DAO.NotificationReceiverDAO;
import DAO.ProductDAO;
import DAO.SerialNumberDAO;
import DTO.AdminDTO;
import DTO.Customer;
import DTO.NotificationDTO;
import DTO.NotificationReceiverDTO;
import DTO.Product;
import DTO.SerialNumber;
import DTO.Warranty;
import GMAIL.Gmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet(name = "ManageWarranty", urlPatterns = {"/manageWarranty"})
public class ManageWarranty extends HttpServlet {

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
            out.println("<title>Servlet ManageWarranty</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageWarranty at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        AdminDTO admin = (AdminDTO) session.getAttribute("account");
        if (admin == null) {
            response.sendRedirect("login");
            return;
        }
        String mess = request.getParameter("mess");
        if (mess != null) {
            request.setAttribute("mess", mess);
        }
        String service = request.getParameter("Service");
        DAOWarranty daoWa = new DAOWarranty();
        CustomerDAO cusDao = new CustomerDAO();
        if (service == null) {
            List<Warranty> list = daoWa.getAllWarrantyWithSerial();
            request.setAttribute("list", list);
            request.getRequestDispatcher("manageWarranty.jsp").forward(request, response);
            return;
        } else if (service.equals("accept") || service.equals("viewDetail")) {
            String warId = request.getParameter("warId");
            Warranty war = daoWa.getWarrantyById(Integer.parseInt(warId));
            SerialNumberDAO serDao = new SerialNumberDAO();
            request.setAttribute("warr", war);
            ProductDAO proDao = new ProductDAO();
            Product pro = proDao.getProductBySerialID(war.getSerialID());
            request.setAttribute("pro", pro);
            Customer cus = cusDao.getCustomerByID(war.getCustomerID());
            int empId = daoWa.getEmployeeIdBySerialId(war.getSerialID());
            Customer emp = cusDao.getCustomerByID(empId);
            SerialNumber serialNumber = serDao.getSerialById(war.getSerialID());
            request.setAttribute("serialNumber", serialNumber.getSerialNumber());
            request.setAttribute("cus", cus);
            request.setAttribute("emp", emp);
            request.getRequestDispatcher("warrantyPaper.jsp").forward(request, response);
        } else if (service.equals("updateStatus")) {
            String warId = request.getParameter("warrantyId");
            String warStatus = request.getParameter("status");
            Warranty war = daoWa.getWarrantyById(Integer.parseInt(warId));
            war.setStatus(warStatus);
            NotificationDAO nDAO = new NotificationDAO();
            NotificationReceiverDTO nr = new NotificationReceiverDTO();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));
            LocalDate currentDate = LocalDate.now();
            Date newDate = Date.valueOf(currentDate);
            if (warStatus.equals("done")) {
                war.setDoneDate(newDate);
            }
            daoWa.updateWarrantyStatus(war);
            
            //Notify for Customer: Update status
            SerialNumberDAO serialDAO = new SerialNumberDAO();
            SerialNumber serial = serialDAO.getSerialById(war.getSerialID());
            NotificationDTO noti = new NotificationDTO();
            noti.setTitle("Update status on your warranty");
            noti.setContent("<p>Your warranty with Serial Number:  <strong>" + serial.getSerialNumber() + "</strong></p>\n"
                    + "<p>Has an update with status: <strong>" + war.getStatus() + "</strong></p>\n"
                    + "<p>Sent time: <strong>" + currentDateTime + "</strong></p>\n");
            noti.setDateSend(currentDateTime);
            noti.setIsRead(0);
            noti.setIsForAdmins(0);

            int notiId = nDAO.addNoti(noti);
            nr.setNotiID(notiId);
            nr.setReceiverType(1);
            nr.setReceiverID(cusDao.getCustomerByID(war.getCustomerID()).getCustomerID());
            NotificationReceiverDAO nrDAO = new NotificationReceiverDAO();
            nrDAO.addReceiver(nr);
            response.sendRedirect("manageWarranty");
        } else if (service.equals("search")) {
            String serialNumber = request.getParameter("serialNumber");
            request.setAttribute("serialNumber", serialNumber);
            SerialNumberDAO daoSerial = new SerialNumberDAO();
            int seriaId = daoSerial.getSerialIdBySerialNumber(serialNumber);
            if (seriaId < 0) {
                request.setAttribute("mess", "this serial invalid");
            }
            List<Warranty> list = daoWa.getAllWarrantyBySerial(seriaId);
            request.setAttribute("list", list);
            request.getRequestDispatcher("manageWarranty.jsp").forward(request, response);
        } else if (service.equals("addWarranty")) {
            response.sendRedirect("addWarranty");
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
        AdminDTO admin = (AdminDTO) session.getAttribute("account");
        if (admin == null) {
            response.sendRedirect("login");
            return;
        }
        String service = request.getParameter("Service");
        DAOWarranty daoWa = new DAOWarranty();
        CustomerDAO cusDao = new CustomerDAO();

        if (service.equals("updateReciver")) {
            System.out.println("runhere");
            String warStatus = request.getParameter("warStatus");
            String expectDate = request.getParameter("expectDate");
            String warId = request.getParameter("warId");
            Warranty war = new Warranty();
            war.setWarrantyID(Integer.parseInt(warId));
            war.setStatus(warStatus);
            war.setProcess_By(admin.getAdminID());
            LocalDate currentDate = LocalDate.now();
            Date newDate = Date.valueOf(currentDate);
            war.setReciverDate(newDate);
            war.setExpectedDate(Date.valueOf(expectDate));
            daoWa.updateWarrantyStatusAccept(war);
            response.sendRedirect("manageWarranty");
        } else if (service.equals("sendMail")) {
            Gmail gmail = new Gmail();
            String warrId = request.getParameter("warrId");
            String proName = request.getParameter("proName");
            String serialNumber = request.getParameter("serialNumber");
            String html = "<h6 style=\"text-align: center\">YOUR WARRANTY CODE<strong style=\"color:red;\">" + warrId + "</strong></h6>"
                    + "<p>We have received your warranty application and are processing the product \""
                    + proName + "\" with serial number <span style=\"color:red;\">" + serialNumber + "</span></p>";
            String to = request.getParameter("mailTo");
            gmail.sendEmail(html, to);
            request.setAttribute("mess", "send to mail success");
            response.sendRedirect("manageWarranty?mess=sendSuccess");
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

    public static void main(String[] args) {

    }

}
