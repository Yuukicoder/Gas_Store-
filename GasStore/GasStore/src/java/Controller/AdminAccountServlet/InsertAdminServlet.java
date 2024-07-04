package Controller.AdminAccountServlet;

import Controller.MaHoa;
import DTO.AdminDTO;
import dal.CustomerDao;
import dal.RoleDao;
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
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Random;
import java.security.SecureRandom;
import model.Administrator;
import DTO.Customer;
import model.Role;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class InsertAdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRoleID() == 1) {
                CustomerDao cus = new CustomerDao();
                RoleDao ro = new RoleDao();
                List<Role> rli = ro.getAll();
                request.setAttribute("rdata", rli);
                String pid = request.getParameter("aid");
                String tp = request.getParameter("atype");
                if (pid != null && !pid.isEmpty() && tp != null && !tp.isEmpty() && tp.equals("0")) {
                    Administrator u = cus.getAdminByID(Integer.parseInt(pid));
                    request.setAttribute("detail", u);
                }
                request.getRequestDispatcher("InsertAdmin.jsp").forward(request, response);
            } else {
                response.sendRedirect("403.jsp");
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CustomerDao cus = new CustomerDao();
        String adid = request.getParameter("accountID");
        String aname = request.getParameter("admin_name");
        String apass = request.getParameter("passWord");
        String amail = request.getParameter("aemail");
        String ac = request.getParameter("active");
        String arole = request.getParameter("roleid");

        int roleID = Integer.parseInt(arole);
        Part p = request.getPart("pimg");
        String image = p.getSubmittedFileName();
        String mage = request.getParameter("timg");
        String fileName = !image.isEmpty() && isImageFile(image) ? image : mage;

        if (!fileName.isEmpty()) {
            String path = getServletContext().getRealPath("");
            p.write(path + File.separator + fileName);
        }

        if (!fileName.isEmpty() && !isImageFile(fileName)) {
            request.setAttribute("errorMessage", "The file you uploaded is not a valid image.");
            request.getRequestDispatcher("InsertAdmin.jsp").forward(request, response);
            return;
        }

        if (roleID == 3) {
            Customer em = new Customer(aname, apass, amail);
            cus.insertCustomer(em);
            if (adid != null && !adid.isEmpty()) {
                cus.deleteStaff(adid);
            }
            response.sendRedirect("ManageUser");
        } else if (roleID == 1 || roleID == 2) {
            if (adid != null && !adid.isEmpty()) {
                Administrator newAdmin = new Administrator(
                        Integer.parseInt(adid), aname, apass, roleID, amail, fileName, Boolean.parseBoolean(ac)
                );
                cus.updateStaff(newAdmin);
            } else {
                if (apass == null || apass.isEmpty()) {
                    apass = generateRandomPassword();
                }
                Administrator newAdmin = new Administrator(
                        0, aname, apass, roleID, amail, !fileName.isEmpty() ? fileName : "anno.jpg", Boolean.parseBoolean(ac)
                );
                cus.insertStaff(newAdmin);
            }
            response.sendRedirect("ManageStaff");
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
            return "";
        }
        return fileName.substring(lastIndexOfDot + 1);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
