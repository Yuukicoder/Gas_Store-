package ProjectController.Product;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DTO.Product;
import dal.SupplierDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Supplier;

@WebServlet(name = "FilterProduct", urlPatterns = {"/filterProduct"})
public class FilterProduct extends HttpServlet {

    List<Product> list = new ArrayList<>();
    ProductDAO dao = new ProductDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FilterProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SortProductByPriceLogic sort = new SortProductByPriceLogic();
        ProductDAO productDAO = new ProductDAO();

        String supplierIDString = request.getParameter("supplier");
        Integer supplierID = (supplierIDString != null && !supplierIDString.isEmpty())
                ? Integer.valueOf(supplierIDString)
                : null;

        String priceRangeString = request.getParameter("priceRange");
        Integer priceRange = (priceRangeString != null && !priceRangeString.isEmpty())
                ? Integer.valueOf(priceRangeString)
                : null;

        String sortOrder = request.getParameter("sortOrder");
        
        //Filter theo ID - Vu anh
        int cateId = 0;
        try {
            cateId = Integer.parseInt(request.getParameter("cateid"));
        } catch (Exception e) {
            
        }
        //------------------------
        
        
        list = productDAO.filterProductsBySupplierPriceCategory(supplierID, priceRange, cateId);
        
        SupplierDao supDAO = new SupplierDao();

        
        System.out.println("FilterProductServlet: " + cateId);
        List<Product> products = productDAO.getAllProduct();
   
        //------------------------
        Map<Integer, String> supplierMap = new HashMap<>();

        for (Product product : products) {
            if (!supplierMap.containsKey(product.getSupplierID())) {
                Supplier supplier = supDAO.getSupplierById(product.getSupplierID());
                supplierMap.put(product.getSupplierID(), supplier.getCompanyName());
            }
        }
        

        if ("Descending".equalsIgnoreCase(sortOrder)) {
            list = sort.sortPrice(list, "Descending");
        } else if ("Ascending".equalsIgnoreCase(sortOrder)) {
            list = sort.sortPrice(list, "Ascending");
        }

        String pageNumberString = request.getParameter("pageLS");
        Integer pageNumber = (pageNumberString != null && !pageNumberString.isEmpty())
                ? Integer.valueOf(pageNumberString)
                : 1;

        double pageSize = 12.0;
        int startIndex = (int) ((pageNumber - 1) * pageSize);
        int endIndex = (int) Math.min(pageNumber * pageSize, list.size());

        List<Product> paginatedProducts = list.subList(startIndex, endIndex);

        request.setAttribute("maxPageLS", Math.ceil(list.size() / pageSize));
        request.setAttribute("currentPageLS", pageNumber);
        request.setAttribute("productsWithCategory", paginatedProducts);
        request.setAttribute("suppliers", supplierMap);

        CategoryDAO cdao = new CategoryDAO();
        request.setAttribute("cate", cdao.getAllCategory());

        String queryParams = getFilterQueryParams(request, pageNumber);
        request.setAttribute("paginationQueryParams", queryParams);
        
        //Filter theo ID - Vu anh
        request.setAttribute("cateid", cateId);

        request.getRequestDispatcher("shopListCate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String getFilterQueryParams(HttpServletRequest request, int pageNumber) {
        StringBuilder queryParams = new StringBuilder();

        String supplierID = request.getParameter("supplier");
        String priceRangeString = request.getParameter("priceRange");
        String sortOrder = request.getParameter("sortOrder");

        if (supplierID != null && !supplierID.isEmpty()) {
            queryParams.append("supplier=").append(supplierID).append("&");
        }
        if (priceRangeString != null && !priceRangeString.isEmpty()) {
            queryParams.append("priceRange=").append(priceRangeString).append("&");
        }
        if (sortOrder != null && !sortOrder.isEmpty()) {
            queryParams.append("sortOrder=").append(sortOrder);
        }

        return queryParams.toString();
    }
}