/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package OldProjectController.Statistic;

import DAO.StatisticDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.Map;
import java.util.stream.Collectors;

/**
 *
 * @author PC
 */
@WebServlet(name = "Charts", urlPatterns = {"/Charts"})
public class Charts extends HttpServlet {

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
            out.println("<title>Servlet Charts</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Charts at " + request.getContextPath() + "</h1>");
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
        
        StatisticDAO statisticData = new StatisticDAO();
        String revenueChartRange = request.getParameter("range");
        revenueChartRange = (revenueChartRange == null) ? "" : revenueChartRange;
        
        Map<LocalDate, Double> revenue;
        
        if (revenueChartRange.equals("1M")) {
            revenue = statisticData.getRevenueOf30Days();
        } else if (revenueChartRange.equals("1Y")) {
            revenue = statisticData.getRevenueOf12Months();
        } else {
            revenue = statisticData.getRevenueOf7Days();
        }
        
        request.setAttribute("revenueDateSet", revenue.keySet().stream()
                    .map(k -> '\"' + k.toString() + '\"')
                    .collect(Collectors.joining(","))
        );
        request.setAttribute("revenueSumSet", revenue.values().stream()
                .map(v -> v.toString())
                .collect(Collectors.joining(","))
        );
        
        Map<String, Integer> bestSellers = statisticData.getTop10BestSellerProducts();
        
        request.setAttribute("bestSellersNameSet", bestSellers.keySet().stream()
                    .map(k -> '\"' + k + '\"')
                    .collect(Collectors.joining(","))
        );
        request.setAttribute("bestSellersQuantitySet", bestSellers.values().stream()
                    .map(v -> v.toString())
                    .collect(Collectors.joining(","))
        );
        
        Map<String, Double> bestRatings = statisticData.getTop10HighestRatingProducts();
        
        request.setAttribute("bestRatingNameSet", bestRatings.keySet().stream()
                    .map(k -> '\"' + k + '\"')
                    .collect(Collectors.joining(","))
        );
        request.setAttribute("bestRatingAvgSet", bestRatings.values().stream()
                    .map(v -> v.toString())
                    .collect(Collectors.joining(","))
        );
        
        
        
        request.getRequestDispatcher("Chart.jsp").forward(request, response);
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
        processRequest(request, response);
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
