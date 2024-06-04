/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProjectController;

import DAO.AccountDAO;
import DAO.PostCategoryDAO;
import DAO.PostListDAO;
import DTO.AccountDTO;
import DTO.AdminDTO;
import DTO.PostCategoryDTO;
import DTO.PostDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author 1234
 */
public class PostDashboardServlet extends HttpServlet {

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
            out.println("<title>Servlet PostDashboardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostDashboardServlet at " + request.getContextPath() + "</h1>");
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
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRoleID()== 1 || account.getRoleID()== 2) {
                String pcateID_raw = request.getParameter("postCategoryID");
                String indexPage_raw = request.getParameter("indexPage");

                String message = (String) session.getAttribute("msg");
                session.removeAttribute("msg");

                PostListDAO pldao = new PostListDAO();
                ArrayList<PostDTO> postDTOs = new ArrayList<>();

                try {
                    int indexPage = 0;
                    if (indexPage_raw == null) {
                        indexPage = 1;
                    } else {
                        indexPage = Integer.parseInt(indexPage_raw);
                    }
                    int endPage = 0;
                    if (pcateID_raw != null) {
                        int pcateID = Integer.parseInt(pcateID_raw);
                        postDTOs = pldao.getAllPostWithCondition(pcateID);
                        int numPost = postDTOs.size();
                        endPage = numPost / 5;
                        if (numPost % 5 != 0) {
                            endPage++;
                        }
                        postDTOs = pldao.pagingPostWithCondition(pcateID, indexPage);
                    } else {
                        postDTOs = pldao.getAllPost();
                        int numPost = postDTOs.size();
                        endPage = numPost / 5;
                        if (numPost % 5 != 0) {
                            endPage++;
                        }
                        postDTOs = pldao.pagingPost(indexPage);
                    }
                    PostCategoryDAO postCategoryDAO = new PostCategoryDAO();
                    ArrayList<PostCategoryDTO> postCategoryDTOs = postCategoryDAO.getAllPostCategory();



                    request.setAttribute("endPage", endPage);
                    request.setAttribute("postCategoryDTOs", postCategoryDTOs);
                    request.setAttribute("postDTOs", postDTOs);
                    request.setAttribute("msg", message);
                    request.setAttribute("tag", indexPage);
                    request.getRequestDispatcher("PostManage.jsp").forward(request, response);
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
                String searchKey = request.getParameter("search").trim();
        System.out.println(searchKey);
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        PostListDAO pldao = new PostListDAO();
        PostCategoryDAO postCategoryDAO = new PostCategoryDAO();

        postDTOs = pldao.getPostSearch(searchKey);
        ArrayList<PostCategoryDTO> postCategoryDTOs = postCategoryDAO.getAllPostCategory();

        request.setAttribute("postCategoryDTOs", postCategoryDTOs);
        System.out.println("size post" + postDTOs.size());
        request.setAttribute("size", postDTOs.size());
        request.setAttribute("postDTOs", postDTOs);
        request.getRequestDispatcher("PostSearchAdmin.jsp").forward(request, response);
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
