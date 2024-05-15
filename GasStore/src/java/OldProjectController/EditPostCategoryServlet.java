/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package OldProjectController;

import DAO.AccountDAO;
import DAO.PostCategoryDAO;
import DTO.AccountDTO;
import DTO.PostCategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author 1234
 */
public class EditPostCategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet EditPostCategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPostCategoryServlet at " + request.getContextPath() + "</h1>");
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
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRole() == 1) {
                String pcid_raw = request.getParameter("pcid");

                try {
                    int pcid = Integer.parseInt(pcid_raw);
                    PostCategoryDAO pcdao = new PostCategoryDAO();
                    PostCategoryDTO pcdto = pcdao.getCategoryByID(pcid);
                    request.setAttribute("pcdto", pcdto);
                    request.getRequestDispatcher("EditPostCategory.jsp").forward(request, response);
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
        String postCategory = request.getParameter("name");
        System.out.println(postCategory);
        String postCategoryID_raw = request.getParameter("id");
        System.out.println(postCategoryID_raw);

        HttpSession session = request.getSession();

        try {
            int postCategoyID = Integer.parseInt(postCategoryID_raw);
            PostCategoryDTO pcdto = new PostCategoryDTO(postCategoyID, postCategory);
            PostCategoryDAO pcdao = new PostCategoryDAO();
            int checkUpdatePostCategory = pcdao.updatePostCategory(pcdto);
            if (checkUpdatePostCategory != 0) {
                session.setAttribute("msg", "Update PostCategory Sucess!");
                response.sendRedirect("postDashboard");
            } else {
               session.setAttribute("msg", "Update PostCategory NOT Sucess!");
                response.sendRedirect("postDashboard");
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
