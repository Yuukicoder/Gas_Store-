package ProjectController.Feedback;

import DAO.FeedbackDAO;
import DAO.FeedbackReplyDAO;
import DTO.AdminDTO;
import DTO.FeedbackReplyDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "FeedbackAdmin", urlPatterns = {"/tableFeedback"})
public class FeedbackAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminDTO account = (AdminDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRoleID() == 1) {
                String indexPage = request.getParameter("index");
                String statusFilter = request.getParameter("statusFilter12");

                if (indexPage == null) {
                    indexPage = "1";
                }
                if (statusFilter == null) {
                    statusFilter = "0";
                }

                int statusFilterValue = Integer.parseInt(statusFilter);
                int index = Integer.parseInt(indexPage);
                FeedbackReplyDAO fd = new FeedbackReplyDAO();
                List<FeedbackReplyDTO> f = fd.getLisfeedbackreply();
                FeedbackDAO feedbackDAO = new FeedbackDAO();

                // Pagination calculation
                int count = feedbackDAO.getCount(statusFilterValue);
                int endPage = count / 5;
                if (count % 5 != 0) {
                    endPage++;
                }
                if (statusFilterValue == 1 || statusFilterValue == 2) {
                    request.setAttribute("feedback", feedbackDAO.getlistfeedback1(index, statusFilterValue));
                } else if (statusFilterValue == 0) {
                    request.setAttribute("feedback", feedbackDAO.getlistfeedback2(index));
                }
                request.setAttribute("endP", endPage);
                request.setAttribute("tag", index);
                request.setAttribute("FReply", f);
                request.setAttribute("statusFilter12", statusFilterValue);

                request.getRequestDispatcher("TableFeedBack.jsp").forward(request, response);
            } else {
                response.sendRedirect("403.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fid = request.getParameter("feedbackID");
        String date = request.getParameter("date");
        String text = request.getParameter("text");
        String aid = request.getParameter("accountID");
        String page = request.getParameter("page");

        FeedbackReplyDAO feedbackReplyDAO = new FeedbackReplyDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        feedbackReplyDAO.insertfeedbackreply(fid, aid, text, date);
        feedbackDAO.updateFeedbackStatus(fid, true);

        response.sendRedirect("tableFeedback?index=" + page);
    }

    @Override
    public String getServletInfo() {
        return "Feedback Administration Servlet";
    }
}
