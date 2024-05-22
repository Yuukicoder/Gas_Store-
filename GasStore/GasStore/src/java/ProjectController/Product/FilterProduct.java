///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package ProjectController.Product;
//
//import DAO.CategoryDAO;
//import DAO.ProductDAO;
//import DTO.ProductDTO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.ArrayList;
//import java.util.List;
//
//@WebServlet(name = "FilterProduct", urlPatterns = {"/filterProduct"})
//public class FilterProduct extends HttpServlet {
//    
//    List<ProductDTO> list = new ArrayList<>();
//    ProductDAO dao = new ProductDAO();
//    
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//         
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet FilterProduct</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet FilterProduct at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//   
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        SortProductByPriceLogic sort = new SortProductByPriceLogic();
//        String price_raw = request.getParameter("price");
//        double price = 0;
//        ProductDAO productDAO = new ProductDAO();
//        
//        String brandName = request.getParameter("brand");
//        String ram = request.getParameter("ram");
//        String cpu = request.getParameter("cpu");
//        String storage = request.getParameter("storage");
//        String mode = request.getParameter("sortOrder");
//        String vga = request.getParameter("vga");
//        String priceRangeString = request.getParameter("priceRange");
//        Integer priceRange = (priceRangeString != null && !priceRangeString.isEmpty()) 
//                ? Integer.valueOf(priceRangeString) 
//                : null;
//
//        list = productDAO.filterProducts(brandName, cpu, storage, ram, vga, priceRange);
//
//        if (price_raw == null) {
//            list = productDAO.filterProducts(brandName, cpu, storage, ram, vga, priceRange);
//        }
//        
//        if (mode == null) {
//
//            //Giá giảm dần
//        } else if (mode.equalsIgnoreCase("Descending")) {
//            list = sort.sortPrice(list, "Descending");
//        } else {
//            
//            //Giá tăng dần
//            list = sort.sortPrice(list, "Ascending");
//        }
//        
//        String pageNumberString = request.getParameter("pageLS");
//        Integer pageNumber = (pageNumberString != null && !pageNumberString.isEmpty())
//                ? Integer.valueOf(pageNumberString)
//                : 1;
//        
//        double pageSize = 12.0;
//        int startIndex = (int) ((pageNumber - 1) * pageSize);
//        int endIndex = (int) Math.min(pageNumber * pageSize, list.size());
//
//        List<ProductDTO> paginatedProducts = list.subList(startIndex, endIndex);
//        
//        request.setAttribute("maxPageLS", Math.ceil(list.size() / pageSize));
//        request.setAttribute("currentPageLS", pageNumber);
//        request.setAttribute("productsWithCategory", paginatedProducts);
//        
//        request.setAttribute("options_ram", productDAO.getRamOptions());
//        request.setAttribute("options_cpu", productDAO.getCpuOptions());
//        request.setAttribute("options_vga", productDAO.getVgaOptions());
//        request.setAttribute("options_disk", productDAO.getDiskCapacityOptions());
//        
//        
//        CategoryDAO cdao = new CategoryDAO();
//        request.setAttribute("cate", cdao.getAllCategory());
//        
//        
//        
//        
//        String queryParams = getFilterQueryParams(request, pageNumber);
//        request.setAttribute("paginationQueryParams", queryParams);
//        
//        request.getRequestDispatcher("shopListCate.jsp").forward(request, response);
//    }
//
//  
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }
// 
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//    private String getFilterQueryParams(HttpServletRequest request, int pageNumber) {
//        StringBuilder queryParams = new StringBuilder();
//
//    String brandName = request.getParameter("brand");
//    String ram = request.getParameter("ram");
//    String cpu = request.getParameter("cpu");
//    String storage = request.getParameter("storage");
//    String vga = request.getParameter("vga");
//    String priceRangeString = request.getParameter("priceRange");
//    String mode = request.getParameter("sortOrder");
//
//    if (brandName != null && !brandName.isEmpty()) {
//        queryParams.append("brand=").append(brandName).append("&");
//    }
//    if (ram != null && !ram.isEmpty()) {
//        queryParams.append("ram=").append(ram).append("&");
//    }
//    if (cpu != null && !cpu.isEmpty()) {
//        queryParams.append("cpu=").append(cpu).append("&");
//    }
//    if (storage != null && !storage.isEmpty()) {
//        queryParams.append("storage=").append(storage).append("&");
//    }
//    if (vga != null && !vga.isEmpty()) {
//        queryParams.append("vga=").append(vga).append("&");
//    }
//    if (priceRangeString != null && !priceRangeString.isEmpty()) {
//        queryParams.append("priceRange=").append(priceRangeString).append("&");
//    }
//    if (mode != null && !mode.isEmpty()) {
//        queryParams.append("sortOrder=").append(mode);
//    }
////
////    queryParams.append("pageLS=").append(pageNumber);
//
//    return queryParams.toString();
//    }
//
//    
//
//}
