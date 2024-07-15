package ProjectController.Product;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DTO.Product;
import dal.SupplierDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Supplier;

@WebServlet(name = "ShopServlet", urlPatterns = {"/shop"})
public class ShopServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdao = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        SupplierDao supDAO = new SupplierDao();

        //Filter theo ID - Vu anh
        String cateId = request.getParameter("cateid");
        List<Product> products ;
        if(cateId == null){
            products = productDAO.getAllProduct();
        }else{
            products = productDAO.getProductByCategory(Integer.parseInt(cateId));
        }   
        //------------------------
        
        Map<Integer, String> supplierMap = new HashMap<>();

        for (Product product : products) {
            if (!supplierMap.containsKey(product.getSupplierID())) {
                Supplier supplier = supDAO.getSupplierById(product.getSupplierID());
                supplierMap.put(product.getSupplierID(), supplier.getCompanyName());
            }
        }

        String pageNumberString = request.getParameter("page");
        Integer pageNumber = (pageNumberString != null && !pageNumberString.isEmpty())
                ? Integer.valueOf(pageNumberString)
                : 1;

        double pageSize = 12.0;
        int startIndex = (int) ((pageNumber - 1) * pageSize);
        int endIndex = (int) Math.min(pageNumber * pageSize, products.size());
        List<Product> paginatedProducts = products.subList(startIndex, endIndex);

        request.setAttribute("maxPage", Math.ceil(products.size() / pageSize));
        request.setAttribute("product", paginatedProducts);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("cate", cdao.getAllCategory());       
        request.setAttribute("suppliers", supplierMap);
        
        //Filter theo ID - Vu anh
        request.setAttribute("cateid", cateId);

        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}
