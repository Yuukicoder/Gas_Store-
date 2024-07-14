package Controller.AdminAccountServlet;

/*

Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import static Controller.MaHoa.toSHA1;
import DAO.NotificationDAO;
import DTO.AdminDTO;
import GMAIL.Gmail;
import GMAIL.Randompassword;
import dal.CustomerDao;
import dal.RoleDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import java.util.Random;
import java.security.SecureRandom;
import model.Administrator;
import DTO.Customer;
import DTO.NotificationDTO;
import java.util.ArrayList;
import model.Role;

/**
 *
 *
 * @author vip2021
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class InsertAdminServlet extends HttpServlet {

    /**
     *
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     *
     * methods.
     *
     * @param request servlet request
     *
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     *
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            //Reset noti-time on navbar - Vu Anh
            NotificationDAO nDAO = new NotificationDAO();
            ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
            session.setAttribute("notiList", n);
            //
            if (account.getRoleID() == 1) {
//                List User
//                response.sendRedirect("ManageAccount.jsp");

                CustomerDao cus = new CustomerDao();
                RoleDao ro = new RoleDao();
                List<Role> rli = ro.getAll();
                request.setAttribute("rdata", rli);
                String pid = request.getParameter("aid");
                String tp = request.getParameter("atype");
                if (pid != null && !pid.isEmpty() && tp != null && !tp.isEmpty()) {
                    if (tp.equals("0")) {
                        Administrator u = cus.getAdminByID(Integer.parseInt(pid));
                        request.setAttribute("detail", u);

                    }
                }
                request.getRequestDispatcher("InsertAdmin.jsp").forward(request, response);
            } else {
                response.sendRedirect("403.jsp");
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     *
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
     *
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     *
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     *
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
// Other form fields
        CustomerDao cus = new CustomerDao();
        String adid = request.getParameter("accountID");
        String aname = request.getParameter("admin_name");
        String apass = request.getParameter("passWord");
        String amail = request.getParameter("aemail");
        String ac = request.getParameter("active");
        String arole = request.getParameter("roleid");

        int roleID = Integer.parseInt(arole);
        Part p = request.getPart("pimg");
        String uploadedFileName = p.getSubmittedFileName();
        String existingFileName = request.getParameter("timg");

        String fileName = existingFileName; // Default to existing image

        if (uploadedFileName != null && !uploadedFileName.isEmpty()) {
            if (isImageFile(uploadedFileName)) {
                // Save the new image file
                fileName = uploadedFileName;
                String path = getServletContext().getRealPath("");
                File fileSaveDir = new File(path);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdirs();
                }
                p.write(path + File.separator + fileName);
            }
        }
// Handling other form data
        if (roleID == 3) {
            if (apass == null || apass.isEmpty()) {
                Gmail gmail = new Gmail();
                //goi ham random
                Randompassword randompassword = new Randompassword();
                apass = randompassword.generateRandomString();

                gmail.sendEmail(
                        "<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "<head>\n"
                        + "<title>Page Title</title>\n"
                        + "</head>\n"
                        + "<body>\n"
                        + "\n" + "<h1>Your username is :" + aname + " </h1>\n"
                        + "<h1>Your password is :" + apass + " </h1>\n"
                        + "<p>Log in  <a href=\"http://localhost:8088/GasStore2/login\">Here</a></p>\n"
                        + "\n"
                        + "</body>\n"
                        + "</html>", amail);
            }
            Customer em = new Customer(aname, apass, amail);
            cus.insertCustomer(em);
            if (adid != null && !adid.isEmpty()) {
                cus.deleteStaff(adid);
            }
            response.sendRedirect("ManageUser");
            return;
        } else if (roleID == 1 || roleID == 2) {

            if (adid != null && !adid.isEmpty()) {

                Administrator newAdmin = new Administrator(
                        adid != null && !adid.isEmpty() ? Integer.parseInt(adid) : 0, aname,
                        apass, roleID,
                        amail, !fileName.isEmpty() && isImageFile(fileName) ? fileName : "anno.jpg",
                        Boolean.parseBoolean(ac)
                );
                cus.updateStaff(newAdmin);
            } else {

                if (cus.isAdminAvailable(aname) && cus.isEmailAdmin(amail)) {
                    if (apass == null || apass.isEmpty()) {
                        Gmail gmail = new Gmail();
                        //goi ham random
                        Randompassword randompassword = new Randompassword();
                        apass = randompassword.generateRandomString();

                        gmail.sendEmail(
                                "<!DOCTYPE html>\n"
                                + "<html>\n"
                                + "<head>\n"
                                + "<title>Page Title</title>\n"
                                + "</head>\n"
                                + "<body>\n"
                                + "\n"
                                + "<h1>Your password is :" + apass + " </h1>\n"
                                + "<p>Log in  <a href=\"http://localhost:8088/GasStore2/login\">Here</a></p>\n"
                                + "\n"
                                + "</body>\n"
                                + "</html>", amail);
                    }

                    Administrator newAdmin = new Administrator(
                            adid != null && !adid.isEmpty() ? Integer.parseInt(adid) : 0,
                            aname,
                            toSHA1(apass), // Assuming toSHA1() method is used to hash the password
                            roleID,
                            amail,
                            !fileName.isEmpty() && isImageFile(fileName) ? fileName : "anno.jpg",
                            Boolean.parseBoolean(ac)
                    );
                    cus.insertStaff(newAdmin);
                    request.setAttribute("alertMessage", "Admin account created successfully. Username: " + aname + ", Password: " + apass);
                    request.getRequestDispatcher("InsertAdmin.jsp").forward(request, response);
                    return;
                } else {

                    request.setAttribute("err", "Account name or email is available");

                    request.getRequestDispatcher("InsertAdmin.jsp").forward(request, response);
                    return;

                }
            }
            response.sendRedirect("ManageStaff");
            return;
        }

    }
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+<>?";
    private static final int PASSWORD_LENGTH = 10;
    private static final Random RANDOM = new SecureRandom();

    public static String generateRandomPassword() {
        StringBuilder password = new StringBuilder(PASSWORD_LENGTH);
        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            password.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }
        return password.toString();
    }

    public static boolean isImageFile(String fileName) {
        String[] imageExtensions = {"jpg", "jpeg", "png", "gif", "bmp", "tiff", "webp"};
        String fileExtension = getFileExtension(fileName);
        for (String extension : imageExtensions) {
            if (extension.equalsIgnoreCase(fileExtension)) {
                return true;
            }
        }
        return false;
    }

    private static String getFileExtension(String fileName) {
        if (fileName == null || fileName.isEmpty()) {
            return "";
        }
        int lastIndexOfDot = fileName.lastIndexOf('.');
        if (lastIndexOfDot == -1) {
            return ""; // No extension found
        }
        return fileName.substring(lastIndexOfDot + 1);
    }

    /**
     *
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
