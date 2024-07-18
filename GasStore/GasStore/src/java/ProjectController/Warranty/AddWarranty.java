/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package ProjectController.Warranty;

import DAO.DAOWarranty;
import DAO.NotificationDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.SerialNumberDAO;
import DTO.AdminDTO;
import DTO.Customer;
import DTO.NotificationDTO;
import DTO.ProductDTO;
import DTO.Warranty;
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
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet(name = "AddWarranty", urlPatterns = {"/addWarranty"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 19,
        maxRequestSize = 1024 * 1024 * 100)
public class AddWarranty extends HttpServlet {
   
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
            out.println("<title>Servlet AddWarranty</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddWarranty at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("AddMoreWarranty.jsp").forward(request, response);
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
        DAOWarranty daoWarr = new DAOWarranty();
        ProductDAO proDao = new ProductDAO();
        String service = request.getParameter("Service");
        SerialNumberDAO daoSerial = new SerialNumberDAO();
        if(service.equals("serialInfo")) {
            String serialNumber = request.getParameter("serialNumber");
            request.setAttribute("serialNumber", serialNumber);
            
            int serialId = daoSerial.getSerialIdBySerialNumber(serialNumber);
            //chua co ng mua
            Customer cusOrder = daoWarr.getCustomerBySerialId(serialId);
           
            
            if(serialId < 0 || cusOrder == null) {
                request.setAttribute("mess", "serial code invalid");
            } else {
                List<Warranty> myWarranty = daoWarr.getWarrantyBySerialId(serialId);
                for (Warranty warranty : myWarranty) {
                    if (!warranty.getStatus().equals("done") && !warranty.getStatus().equals("unaccept")) {
                        request.setAttribute("mess", "product is processing");
                        request.getRequestDispatcher("AddMoreWarranty.jsp").forward(request, response);
                        return;
                    }
                }
                //neu ngay mua + limit > ngay hien taij +> het han
                OrderDAO orderDao = new OrderDAO();
                Date dateOrder = (Date) orderDao.getDateOrderBySerialId(serialId);
                ProductDTO pro = proDao.getProductBySeriaId(serialId);
                int monthLimit = pro.getLimit();

                boolean isOver = checkDateOver(monthLimit, convertToLocalDate(dateOrder));
                if(isOver) {
                 request.setAttribute("mess", "Product warranty expires");
                 request.getRequestDispatcher("AddMoreWarranty.jsp").forward(request, response);
                 return;
                }
                request.setAttribute("pro", pro);
                request.setAttribute("serialId", serialId);
                request.setAttribute("cus", cusOrder);
            }
        } else if(service.equals("add")) {
        HttpSession session = request.getSession();
            AdminDTO admin = (AdminDTO) session.getAttribute("account");
            if (admin == null) {
                response.sendRedirect("login");
                return;
            }

            Collection<Part> parts = request.getParts();
            List<String> filenames = new ArrayList<>();

            for (Part part : parts) {
                if (part.getName().equals("proImage")) {
                    if (!validateImage(part)) {
                        request.setAttribute("mess", "image invalid");
                        request.getRequestDispatcher("AddMoreWarranty.jsp").forward(request, response);
                        return;
                    } else {
                        String filename = part.getSubmittedFileName();
                        String folderPath = getServletContext().getRealPath("") + File.separator + "./images/productError";
                        saveImage(part, folderPath, filename);
                        filenames.add(filename);
                    }
                }
            }

            String serialId = request.getParameter("serialId");
            String note = request.getParameter("note");
            String expectDate = request.getParameter("expectDate");

            Customer cus = daoWarr.getCustomerBySerialId(Integer.parseInt(serialId));
            LocalDate currentDate = LocalDate.now();
            Date newDate = Date.valueOf(currentDate);
            Warranty war = new Warranty(Integer.parseInt(serialId),
                    cus.getCustomerID(), String.join(",", filenames),
                    note, newDate, "wait",
                    Date.valueOf(expectDate), admin.getAdminID());

            DAOWarranty dao = new DAOWarranty();
            dao.insertWarranty(war);
            
            //Notification - Minh Duc - Warning Bad Product
            ProductDTO pro = proDao.getProductBySeriaId(Integer.parseInt(serialId));
            int numberOfProduct = dao.countNumberOfProductInWarrantyList(pro.getProductId());
            if((double)numberOfProduct / pro.getStockQuantity() >= 0.001){
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String currentDateTime = formatter.format(java.sql.Timestamp.valueOf(LocalDateTime.now()));
                NotificationDTO noti = new NotificationDTO();
                noti.setTitle("Warning: Poor Quality Product");
                noti.setContent("<p>ProductID: " + pro.getProductId() + "</p>\n"
                        + "<p>Product Name: "+ pro.getName() + "</p>\n"
                        + "<p>Taken for warranty exceed the safety limit compared to the total products in stock.</p>\n"
                        + "<p>At " + currentDateTime);
                noti.setDateSend(currentDateTime);
                noti.setIsRead(0);
                noti.setIsForAdmins(1);
                NotificationDAO nDAO = new NotificationDAO();
                nDAO.addNoti(noti);
 
            }
            
            response.sendRedirect("manageWarranty");
            return;
        }
        request.getRequestDispatcher("AddMoreWarranty.jsp").forward(request, response);
    }
    
    private void saveImage(Part part, String folderPath, String filename) throws IOException {
        File folder = new File(folderPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        String filePath = folderPath + File.separator + filename;
        try ( InputStream inputStream = part.getInputStream()) {
            Path path = Paths.get(filePath);
            Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);
        }
    }
    
    private static final List<String> ALLOWED_CONTENT_TYPES = Arrays.asList(
            "image/png", "image/jpeg", "image/jpg", "image/gif"
    );

    public static boolean validateImage(Part imagePart) throws IOException {
        if (imagePart == null) {
            return false;
        }

        String contentType = imagePart.getContentType();
        if (contentType == null) {
            return false;
        }

        return ALLOWED_CONTENT_TYPES.contains(contentType.toLowerCase());
    }
    
    //if true is het han bao hanh
    public static boolean checkDateOver(int months, LocalDate orderDate) {
        LocalDate limitDate = orderDate.plusMonths(months);
        LocalDate currentDate = LocalDate.now();
        return currentDate.isAfter(limitDate);
    }
    
    public static LocalDate convertToLocalDate(Date date) {
        return date.toLocalDate();
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
