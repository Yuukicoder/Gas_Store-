package ProjectController;

import DAO.AccountDAO;
import DAO.PostCategoryDAO;
import DAO.PostListDAO;
import DTO.AccountDTO;
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
import java.util.List;

public class PostListController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        String num_raw = request.getParameter("num");
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        PostCategoryDAO postCategoryDAO = new PostCategoryDAO();
        ArrayList<PostCategoryDTO> postCategoryDTOs = postCategoryDAO.getAllPostCategory();
        PostListDAO pldao = new PostListDAO();

        try {
            if (num_raw != null) {
                int num = Integer.parseInt(num_raw);
                postDTOs = pldao.getAllPostWithCondition(num);
            } else {
                postDTOs = pldao.getAllPost();
            }

            String pageNumberString = request.getParameter("page");
            Integer pageNumber = (pageNumberString != null && !pageNumberString.isEmpty())
                    ? Integer.valueOf(pageNumberString)
                    : 1;

            double pageSize = 3.0;
            int startIndex = (int) ((pageNumber - 1) * pageSize);
            int endIndex = (int) Math.min(pageNumber * pageSize, postDTOs.size());
            List<PostDTO> paginatedPosts = postDTOs.subList(startIndex, endIndex);

            request.setAttribute("maxPage", (int) Math.ceil(postDTOs.size() / pageSize));
            request.setAttribute("paginatedPosts", paginatedPosts);
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("postCategoryDTOs", postCategoryDTOs);
            request.setAttribute("postDTOs", postDTOs);
            request.setAttribute("size", postDTOs.size());
            request.setAttribute("acc", account);

            request.getRequestDispatcher("PostList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchKey = request.getParameter("search").trim();
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        PostListDAO pldao = new PostListDAO();
        PostCategoryDAO postCategoryDAO = new PostCategoryDAO();

        postDTOs = pldao.getPostSearch(searchKey);
        ArrayList<PostCategoryDTO> postCategoryDTOs = postCategoryDAO.getAllPostCategory();

        request.setAttribute("postCategoryDTOs", postCategoryDTOs);
        request.setAttribute("size", postDTOs.size());
        request.setAttribute("postDTOs", postDTOs);
        request.getRequestDispatcher("PostSearch.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
