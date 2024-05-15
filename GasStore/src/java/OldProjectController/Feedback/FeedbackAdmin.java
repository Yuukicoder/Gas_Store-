/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package OldProjectController.Feedback;

import DAO.FeedbackDAO;
import DAO.FeedbackReplyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author phung
 */
@WebServlet(name = "FeedbackAdmin", urlPatterns = {"/tableFeedback"})
public class FeedbackAdmin extends HttpServlet {

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
            out.println("<title>Servlet FeedbackAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackAdmin at " + request.getContextPath() + "</h1>");
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
        String indexpage = request.getParameter("index");
        String statusFilter = request.getParameter("statusFilter12");

        if (indexpage == null) {
            indexpage = "1";
        }
        if (statusFilter == null) {
            statusFilter = "0";
        }
        Integer statusFilter1 = Integer.parseInt(statusFilter);
        int index = Integer.parseInt(indexpage);

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        FeedbackReplyDAO feedbackReplyDAO = new FeedbackReplyDAO();

        //phan trang 
        int count = feedbackDAO.getCount();
        int endpage = count / 5;
        if (count % 3 != 0) {
            endpage++;
        }
        request.setAttribute("feedback", feedbackDAO.getlistfeedback((index), statusFilter1));

        request.setAttribute("endP", endpage);
        request.setAttribute("feedbackDAO", feedbackDAO);
        request.setAttribute("tag", index);
        request.setAttribute("statusFilter12", statusFilter1);

        request.getRequestDispatcher("TableFeedBack.jsp").forward(request, response);
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
        String fid = request.getParameter("feedbackID");
        String date = request.getParameter("date");
        String text = request.getParameter("text");
        String aid = request.getParameter("acountID");
        String page = request.getParameter("page");

        FeedbackReplyDAO feedbackReplyDAO = new FeedbackReplyDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        feedbackReplyDAO.insertfeedbackreply(fid, aid, text, date);
        feedbackDAO.updateFeedback(fid, true);

        response.sendRedirect("tableFeedback?index=" + page);
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
