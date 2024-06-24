/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Chart;

import DAO.StatisticDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.Locale;
import java.util.Map;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChartServlet", urlPatterns = {"/Chart"})
public class ChartServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChartServlet at " + request.getContextPath() + "</h1>");
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

        //Date data
        if (revenueChartRange.equals("1M")) {
            revenue = statisticData.getRevenueOf30Days();

            LocalDate[] datesArray = revenue.keySet().toArray(new LocalDate[0]);
            String[] formattedDates = new String[datesArray.length];

            for (int i = 0; i < datesArray.length; i++) {
                //labels: [2024-06-01,2024-06-02,2024-06-03]
                formattedDates[i] = '"' + datesArray[i].toString() + '"';
                //labels: ["2024-06-01","2024-06-02","2024-06-03"]
            }

            request.setAttribute("revenueDateSet", String.join(",", formattedDates));

        } else if (revenueChartRange.equals("1Y")) {
            revenue = statisticData.getRevenueOf12Months();
            LocalDate[] datesArray = revenue.keySet().toArray(new LocalDate[0]);
            String[] formattedDates = new String[datesArray.length];

            for (int i = 0; i < datesArray.length; i++) {
                formattedDates[i] = '"' + "Tháng " + datesArray[i].toString().split("-")[1] + '"';
            }

            request.setAttribute("revenueDateSet", String.join(",", formattedDates));

        } else {
            revenue = statisticData.getRevenueOf7Days();
            LocalDate[] datesArray = revenue.keySet().toArray(new LocalDate[0]);
            String[] formattedDates = new String[datesArray.length];

            for (int i = 0; i < datesArray.length; i++) {
                //labels: [2024-06-01,2024-06-02,2024-06-03]
                formattedDates[i] = '"' + datesArray[i].toString() + '"';
                //labels: ["2024-06-01","2024-06-02","2024-06-03"]
            }

            request.setAttribute("revenueDateSet", String.join(",", formattedDates));

        }
        //

        //Revenue data
        Double[] revenueArray = revenue.values().toArray(new Double[0]);
        double totalRevenue = statisticData.getTotalMoney(revenueArray);
        String[] formattedValues = new String[revenueArray.length];
        for (int i = 0; i < revenueArray.length; i++) {
            formattedValues[i] = revenueArray[i].toString();
        }
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        currencyFormatter.setMaximumFractionDigits(0);
        request.setAttribute("TotalRevenue", currencyFormatter.format(totalRevenue));
        request.setAttribute("revenueSumSet", String.join(",", formattedValues));
        //

        //Best seller data
        Map<String, Integer> bestSellers = statisticData.getTop10BestSellerProducts();

        //Product name data
        String[] nameArray = bestSellers.keySet().toArray(new String[0]);
        String[] formattedNames = new String[nameArray.length];
        for (int i = 0; i < nameArray.length; i++) {
            formattedNames[i] = '"' + nameArray[i] + '"';
        }
        request.setAttribute("bestSellersNameSet", String.join(",", formattedNames));
        //

        //Quantity data
        var quantityArray = bestSellers.values().toArray();
        String[] formattedQuantities = new String[quantityArray.length];
        for (int i = 0; i < quantityArray.length; i++) {
            formattedQuantities[i] = quantityArray[i].toString();
        }
        request.setAttribute("bestSellersQuantitySet", String.join(",", formattedQuantities));
        //

        request.getRequestDispatcher("Chart.jsp").forward(request, response);
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
