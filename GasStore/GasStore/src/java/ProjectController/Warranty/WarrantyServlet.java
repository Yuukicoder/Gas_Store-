/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController.Warranty;

import DAO.DAOWarranty;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import DAO.SerialNumberDAO;
import DTO.Customer;
import DTO.OrderDetail;
import DTO.Product;
import DTO.ProductDTO;
import DTO.SerialNumber;
import DTO.Warranty;
import static ProjectController.Warranty.AddWarranty.checkDateOver;
import static ProjectController.Warranty.AddWarranty.convertToLocalDate;
import static ProjectController.Warranty.AddWarranty.validateImage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author HP
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 19,
        maxRequestSize = 1024 * 1024 * 100)
public class WarrantyServlet extends HttpServlet {

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
            out.println("<title>Servlet WarrantyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WarrantyServlet at " + request.getContextPath() + "</h1>");
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
        Customer account = (Customer) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        String serialId = request.getParameter("serialId");
        String orderItemId = request.getParameter("oi");
        String productIdStr = request.getParameter("pid");

        int oi = Integer.parseInt(orderItemId);
        int proId = Integer.parseInt(productIdStr);

        ProductDAO proDao = new ProductDAO();
        OrderDetailDAO oiDao = new OrderDetailDAO();
        Product pro = proDao.getProductByID(proId);

        OrderDetail od = oiDao.getOrderDetailById(oi, proId);

        DAOWarranty daoWarr = new DAOWarranty();
        List<Warranty> listWarranty = daoWarr.getWarrantyBySerialId(Integer.parseInt(serialId));

        request.setAttribute("pro", pro);
        request.setAttribute("od", od);

        request.setAttribute("serialNumList", od);

        request.setAttribute("listWarranty", listWarranty);

        //thay tracking number hoac orderId
        request.setAttribute("oi", oi);
        request.setAttribute("serialId", serialId);
        request.getRequestDispatcher("requestWarranty.jsp").forward(request, response);
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
        Customer account = (Customer) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }
        String serialId = request.getParameter("serial");
        Part proImage = request.getPart("proImage");
        String filename = null;
        String orderItemId = request.getParameter("orderItemId");
        String productIdStr = request.getParameter("pid");
        int oi = Integer.parseInt(orderItemId);
        int proId = Integer.parseInt(productIdStr);
        ProductDAO proDao = new ProductDAO();
        OrderDetailDAO oiDao = new OrderDetailDAO();
        boolean isValid = true;
        DAOWarranty daoWarr = new DAOWarranty();
        List<Warranty> myWarranty = daoWarr.getWarrantyBySerialId(Integer.parseInt(serialId));
        for (Warranty warranty : myWarranty) {
            System.out.println(warranty);
            if (!warranty.getStatus().equals("done") && !warranty.getStatus().equals("unaccept")) {
                isValid = false;
                request.setAttribute("mess1", "product is processing");
            }
        }
        SerialNumberDAO daoSerial = new SerialNumberDAO();

        if (!validateImage(proImage)) {
            isValid = false;
            request.setAttribute("mess2", "image invalid");
        } else {
            filename = proImage.getSubmittedFileName();
            String folderPath = getServletContext().getRealPath("") + File.separator + "./images/productError";
            saveImage(proImage, folderPath, filename);
        }

        //neu ngay mua + limit > ngay hien taij +> het han
        OrderDAO orderDao = new OrderDAO();
        Date dateOrder = (Date) orderDao.getDateOrderBySerialId(Integer.parseInt(serialId));
        ProductDTO proDto = proDao.getProductBySeriaId(Integer.parseInt(serialId));
        int monthLimit = proDto.getLimit();

        boolean isOver = checkDateOver(monthLimit, convertToLocalDate(dateOrder));
        if (isOver) {
            isValid = false;
            request.setAttribute("mess3", "Product warranty expires");
        }
        if (!isValid) {
            Product pro = proDao.getProductByID(proId);
            OrderDetail od = oiDao.getOrderDetailById(oi, proId);
            request.setAttribute("pro", pro);
            request.setAttribute("od", od);
            request.setAttribute("oi", oi);
            request.setAttribute("listWarranty", myWarranty);
            request.setAttribute("serialId", serialId);

            request.getRequestDispatcher("requestWarranty.jsp").forward(request, response);
            return;
        }
        LocalDate now = LocalDate.now();
        
        Date nowDate = Date.valueOf(now);
        String note = request.getParameter("issue");
        Warranty war = new Warranty(Integer.parseInt(serialId),
                account.getCustomerID(), filename, note, nowDate, "wait");
        DAOWarranty dao = new DAOWarranty();

        dao.insertWarrantyByCus(war);
        response.sendRedirect("mypurchase");
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
