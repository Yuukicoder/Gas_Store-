/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import DAO.NotificationDAO;
import DAO.PostCategoryDAO;
import DAO.PostDetailDAO;
import DTO.AdminDTO;
import DTO.NotificationDTO;
import DTO.PostCategoryDTO;
import DTO.PostDTO;
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
import java.util.ArrayList;

/**
 *
 * @author 1234
 */
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class EditPostServlet extends HttpServlet {

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
            out.println("<title>Servlet EditPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPostServlet at " + request.getContextPath() + "</h1>");
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
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRoleID()== 1 || account.getRoleID()== 2) {
                //Reset noti-time on navbar
                NotificationDAO nDAO = new NotificationDAO();
                ArrayList<NotificationDTO> n = nDAO.getAdmin3NewestUnreadNoti();
                session.setAttribute("notiList", n);
                //
                
                //List User
                String poid_raw = request.getParameter("pcid");

                PostDetailDAO pddao = new PostDetailDAO();
                PostCategoryDAO postCategoryDAO = new PostCategoryDAO();
                ArrayList<PostCategoryDTO> postCategoryDTOs = postCategoryDAO.getAllPostCategory();

                try {
                    int poid = Integer.parseInt(poid_raw);
                    PostDTO pdto = pddao.getPostDTOByID(poid);
                    request.setAttribute("postCategoryDTOs", postCategoryDTOs);
                    request.setAttribute("pdto", pdto);
                    request.getRequestDispatcher("EditPost.jsp").forward(request, response);

                } catch (Exception e) {
                }
            } else {
                response.sendRedirect("403.jsp");
            }
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
    String pid_raw = request.getParameter("pid");
    String banner_raw = request.getParameter("pbanner");
    String content = request.getParameter("content");
    String title = request.getParameter("title");

    try {
        int pid = Integer.parseInt(pid_raw);
        Part banner = request.getPart("banner");
        String fileBanner = banner.getSubmittedFileName();

        PostDTO pdto;
        if (fileBanner.isEmpty()) {
            // Không có file banner mới được tải lên
            pdto = new PostDTO(pid, title, banner_raw, content, "updated");
        } else {
            // Kiểm tra kiểu MIME của file
            String mimeType = getServletContext().getMimeType(fileBanner);
            if (mimeType == null || !mimeType.startsWith("image/")) {
                session.setAttribute("msg", "Chỉ được tải lên tệp hình ảnh (JPG, PNG, GIF).");
                response.sendRedirect("postDashboard?pid=" + pid);
                return;
            }

            pdto = new PostDTO(pid, title, fileBanner, content, "updated");
        }

        PostDetailDAO postDetailDAO = new PostDetailDAO();
        int checkUpdatePost = postDetailDAO.updatePost(pdto);
        if (checkUpdatePost != 0) {
            if (!fileBanner.isEmpty()) {
                // Lưu file banner mới
                String path = getServletContext().getRealPath("") + "images/Post";
                File file = new File(path);
                banner.write(path + File.separator + fileBanner);
            }
            session.setAttribute("msg", "Cập nhật bài viết thành công!");
            response.sendRedirect("postDashboard");
        } else {
            session.setAttribute("msg", "Lỗi máy chủ. Vui lòng thử lại sau.");
            response.sendRedirect("postDashboard");
        }
    } catch (Exception e) {
        e.printStackTrace();
        session.setAttribute("msg", "Lỗi: " + e.getMessage());
        response.sendRedirect("postDashboard");
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
