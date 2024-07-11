/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ProjectController.Warranty;

import DAO.CustomerDAO;
import DAO.DAOWarranty;
import DAO.ProductDAO;
import DAO.SerialNumberDAO;
import DTO.Customer;
import DTO.Product;
import DTO.SerialNumber;
import DTO.Warranty;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author HP
 */
public class ManageWarranty extends HttpServlet {
   
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
            out.println("<title>Servlet ManageWarranty</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageWarranty at " + request.getContextPath () + "</h1>");
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
        Customer account = (Customer) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }
        String service = request.getParameter("Service");
        DAOWarranty daoWa = new DAOWarranty();
        CustomerDAO cusDao = new CustomerDAO();
        if(service == null) {
           List<Warranty> list = daoWa.getAllWarrantyWithSerial();
           request.setAttribute("list", list);
           request.getRequestDispatcher("manageWarranty.jsp").forward(request, response);
           return;
        } else if(service.equals("accept") || service.equals("viewDetail")) {
            String warId = request.getParameter("warId");
            Warranty war = daoWa.getWarrantyById(Integer.parseInt(warId));
            
            request.setAttribute("warr", war);
            ProductDAO proDao = new ProductDAO();
            Product pro = proDao.getProductBySerialID(war.getSerialID());
            request.setAttribute("pro", pro);
            Customer cus = cusDao.getCustomerByID(war.getCustomerID());
            int empId = daoWa.getEmployeeIdBySerialId(war.getSerialID());
            Customer emp = cusDao.getCustomerByID(empId);
            request.setAttribute("cus", cus);
            request.setAttribute("emp", emp);
            request.getRequestDispatcher("warrantyPaper.jsp").forward(request, response);
        } else if(service.equals("updateStatus")) {
            String warId = request.getParameter("warrantyId");
            String warStatus = request.getParameter("status");
            Warranty war = new Warranty();
            war.setWarrantyID(Integer.parseInt(warId));
            war.setStatus(warStatus);
             
            LocalDate now = LocalDate.now();
        
            Date nowDate = Date.valueOf(now);
            
            
            if(warStatus.equals("done")) {
                war.setDoneDate(nowDate);
            }
            daoWa.updateWarrantyStatus(war);
            response.sendRedirect("manageWarranty");
        } else if(service.equals("search")) {
            String serialNumber = request.getParameter("serialNumber");
            request.setAttribute("serialNumber", serialNumber);
            SerialNumberDAO daoSerial = new SerialNumberDAO();
            int seriaId = daoSerial.getSerialIdBySerialNumber(serialNumber);
            if(seriaId < 0) {
                request.setAttribute("mess", "this serial invalid");
            }
            List<Warranty> list = daoWa.getAllWarrantyBySerial(seriaId);
            request.setAttribute("list", list);
            request.getRequestDispatcher("manageWarranty.jsp").forward(request, response);
        } else if(service.equals("addWarranty")) {
            response.sendRedirect("addWarranty");
            return;
        }
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
        HttpSession session = request.getSession();
         Customer account = (Customer) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }
        String service = request.getParameter("Service");
        DAOWarranty daoWa = new DAOWarranty();
        CustomerDAO cusDao = new CustomerDAO();
        
        if(service.equals("updateReciver"))  {
            System.out.println("runhere");
            String warStatus = request.getParameter("warStatus");
            String expectDate = request.getParameter("expectDate");
            String warId = request.getParameter("warId");
            Warranty war = new Warranty();
            war.setWarrantyID(Integer.parseInt(warId));
            war.setStatus(warStatus);
            war.setProcess_By(account.getCustomerID());
              
            LocalDate now = LocalDate.now();
        
            Date nowDate = Date.valueOf(now);
            war.setReciverDate(nowDate);
            war.setExpectedDate(Date.valueOf(expectDate));
            daoWa.updateWarrantyStatusAccept(war);
            response.sendRedirect("manageWarranty");
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
