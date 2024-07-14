package Controller.supplier;

import DAO.CategoryDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DAO.SupplierDAO;
import DTO.Category;
import DTO.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import DTO.Orders;
import dal.OrdersDao;
import model.Supplier;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "OrderManagerSupplier", urlPatterns = {"/supplier/order-manager"})
@MultipartConfig
public class OrderManagerSupplier extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Supplier currentSupplier = (Supplier) session.getAttribute("supplier");
        if (currentSupplier != null) {
            String limitParam = request.getParameter("limit");
            String pageParam = request.getParameter("page");
            String dateParam = request.getParameter("date");
            String minAmountParam = request.getParameter("minAmount");
            String maxAmountParam = request.getParameter("maxAmount");
            String statusParam = request.getParameter("status");

            Integer limit = (limitParam != null && !limitParam.isEmpty()) ? Integer.valueOf(limitParam) : 10;
            Integer page = (pageParam != null && !pageParam.isEmpty()) ? Integer.valueOf(pageParam) : 1;

            LocalDate date = (dateParam != null && !dateParam.isEmpty()) ? LocalDate.parse(dateParam) : null;
            Float minAmount = (minAmountParam != null && !minAmountParam.isEmpty()) ? Float.valueOf(minAmountParam) : null;
            Float maxAmount = (maxAmountParam != null && !maxAmountParam.isEmpty()) ? Float.valueOf(maxAmountParam) : null;
            Integer status = (statusParam != null && !statusParam.isEmpty()) ? Integer.valueOf(statusParam) : null;

            OrdersDao orderDAO = new OrdersDao();
            List<Orders> allOrders = orderDAO.getAllOrderForSupplier(currentSupplier.getSupplierId());
            
            System.out.println(allOrders);
            // Filtering
            List<Orders> filteredOrders = orderDAO.filterOrders(allOrders, date, minAmount, maxAmount, status);

            int totalPages = (int) Math.ceil((double) filteredOrders.size() / limit);
            List<Orders> paginatedOrders = orderDAO.paginateProducts(filteredOrders, page, limit);

            SupplierDAO supplierDAO = new SupplierDAO();
            DTO.Supplier supplier = supplierDAO.getSupplierByID(currentSupplier.getSupplierId());

            System.out.println(supplier.getCompanyName());

            request.setAttribute("orders", paginatedOrders);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("date", dateParam);
            request.setAttribute("minAmount", minAmountParam);
            request.setAttribute("maxAmount", maxAmountParam);
            request.setAttribute("status", statusParam);
            request.getRequestDispatcher("OrderManager.jsp").forward(request, response);
        } else {
            response.sendRedirect("../login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        model.Supplier currentSupplier = (model.Supplier) session.getAttribute("supplier");
        if (currentSupplier != null) {
            String action = request.getParameter("action");
            ProductDAO pdao = new ProductDAO();
            if (action.equals("add")) {

                String name = request.getParameter("name");
                String category_raw = request.getParameter("category");
                String stock_raw = request.getParameter("stock");
                Part ipro = request.getPart("ipr");
                String fileNameIpro = ipro.getSubmittedFileName();
                String price_raw = request.getParameter("price");
                String supplier_raw = (String) request.getParameter("supplier");
                String unitOnOrders_raw = (String) request.getParameter("unitOnOrders");
                String descrip = (String) request.getParameter("descrip");
                String code = (String) request.getParameter("code");
                String keyword = (String) request.getParameter("keyword");
                String shortDes = (String) request.getParameter("shortDes");

                System.out.println("descrop" + descrip);

                ProductImgDAO pidao = new ProductImgDAO();
                String[] ides = request.getParameterValues("ides[]");
                List<Part> parts = new ArrayList<>();

                try {
                    Collection<Part> requestParts = request.getParts();
                    parts.add(ipro);
                    ArrayList<String> listSummitedFile = new ArrayList<>();
                    int categoryID = Integer.parseInt(category_raw);
                    int stock = Integer.parseInt(stock_raw);
                    float price = Float.parseFloat(price_raw);
                    int supplierID = Integer.parseInt(supplier_raw);
                    int unitOnOrders = Integer.parseInt(unitOnOrders_raw);
                    LocalDateTime now = LocalDateTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    String formattedDate = now.format(formatter);
                    Product productDTO = new Product(0, code, name, keyword, shortDes, descrip, categoryID, supplierID, true, price, fileNameIpro, stock, unitOnOrders, formattedDate, 1);
                    int newProductID = pdao.addNewProduct(productDTO);
                    System.out.println("newProductId" + newProductID);
                    listSummitedFile.add(fileNameIpro);
                    if (newProductID != 0) {
                        System.out.println("size " + listSummitedFile.size());
                        for (Part part : requestParts) {
                            if (part.getName().equals("ides[]")) {
                                parts.add(part);
                                String fiString = part.getSubmittedFileName();
                                String mimeType = getServletContext().getMimeType(fiString);
                                if (mimeType != null && mimeType.startsWith("image/")) {
                                    listSummitedFile.add(fiString);
                                } else {
                                    session.setAttribute("msg", "Only image files are allowed!");
                                    response.sendRedirect("product-manager");
                                    return;
                                }
                            }
                        }
                        if (!listSummitedFile.isEmpty()) {
                            int check = pidao.addNewImageProduct(listSummitedFile, newProductID);
                            if (check != 0) {

                                for (int i = 0; i < listSummitedFile.size(); i++) {
                                    String path = getServletContext().getRealPath("");
                                    Part part = parts.get(i);
                                    part.write(path + File.separator + listSummitedFile.get(i));
                                }
                                session.setAttribute("msg", "Add New Product Sucess!");
                                response.sendRedirect("product-manager");
                            }
                        } else {
                            session.setAttribute("msg", "Add New Product Not Sucess!");
                            response.sendRedirect("product-manager");
                        }
                    } else {
                        System.out.println("error server");
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                
            }
            if (action.equals("change-status")) {
                System.out.println("IIIIIIIIIIIIIII");
                int id = Integer.parseInt(request.getParameter("id"));
                String status = request.getParameter("status");
                System.out.println(id + ""+ status);
                if (status.equals("show")) {
                    pdao.changeProductStatus(id, false);
                    session.setAttribute("msg", "Hide product success!");
                    response.sendRedirect("product-manager");
                }
                if (status.equals("hide")) {
                    pdao.changeProductStatus(id, true);
                    session.setAttribute("msg", "Show product success!");
                    response.sendRedirect("product-manager");
                }
            }
        } else {
            response.sendRedirect("403.jsp");
        }
    }
}
