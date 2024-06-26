package ProjectController.Account;

import DAO.AccountDAO;
import DTO.AccountDTO;
import DTO.Customer;
import dal.CustomerDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
//import model.Customer;

/**
 *
 * @author 1234
 */
@MultipartConfig(
         fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
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
        HttpSession session = request.getSession();
        Integer aid = (Integer) session.getAttribute("customerID");

        if (aid == null) {
            // Assuming you have a login page or some mechanism to redirect if session is not valid
            response.sendRedirect("login.jsp");
            return;
        }

        CustomerDao cus = new CustomerDao();
        Customer c = cus.getAllByID(aid);
        Customer cu = cus.checkuserandPass(c.getUserName(),c.getPassword());
        session.setAttribute("account", c);
        request.setAttribute("acc", cu);
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
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String user = request.getParameter("user");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer aid = (Integer) session.getAttribute("customerID");
        String aimage = request.getParameter("aimg");
        Part p = request.getPart("pimg");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        String button = request.getParameter("update");

        CustomerDao customerDao = new CustomerDao();
        String fileName = p.getSubmittedFileName();
        String pimage = !fileName.isEmpty() ? fileName: aimage;
          if (!fileName.isEmpty()) {
            String path = getServletContext().getRealPath("");
            p.write(path + File.separator + fileName);
        }
        try {

            if ("profile".equals(button)) {
                Customer customer = customerDao.getAllByID(aid);

                // Split the full name into parts
                String[] nameParts = name.split(" ");
                if (nameParts.length > 0) {
                    customer.setFirstName(nameParts[0]); // Set the first name

                    if (nameParts.length > 1) {
                        // Join the remaining parts for the last name
                        StringBuilder lastNameBuilder = new StringBuilder();
                        for (int i = 1; i < nameParts.length; i++) {
                            lastNameBuilder.append(nameParts[i]);
                            if (i != nameParts.length - 1) {
                                lastNameBuilder.append(" ");
                            }
                        }
                        customer.setLastName(lastNameBuilder.toString());
                    } else {
                        customer.setLastName(""); // In case there's no last name part
                    }
                }

                customer.setUserName(user);
                customer.setPhone(mobile);
                customer.setEmail(email);
                customer.setAddress(address);
                customer.setImage(pimage);
                customerDao.updateUser(customer);

                session.setAttribute("account", customer);
                request.setAttribute("acc", customer);
                response.sendRedirect("UserProfile"); // Redirect to prevent form resubmission
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

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
