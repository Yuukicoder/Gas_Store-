///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package ProjectController.Product;
//
//
//import DAO.CategoryDAO;
//import DAO.ProductDAO;
//import DAO.ProductImgDAO;
//import DAO.SupplierDAO;
//import DTO.Category;
//import DTO.ProductImg;
//import DTO.Supplier;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import jakarta.servlet.http.Part;
//import java.io.File;
//import java.util.List;
//import model.Product;
//
///**
// *
// * @author 1234
// */
//public class EditProductDBServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet EditProductDBServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet EditProductDBServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String product_id_raw = request.getParameter("pid");
//        try {
//            int product_id = Integer.parseInt(product_id_raw);
//            ProductImgDAO pidao = new ProductImgDAO();
//            List<ProductImg> pimgs = pidao.getPImgByPid(product_id);
//            request.setAttribute("pimgs", pimgs);
//            ProductDAO productDAO = new ProductDAO();
//            CategoryDAO categoryDAO = new CategoryDAO();
//            SupplierDAO s = new SupplierDAO();
//            Product pdto = productDAO.getProductByID(product_id);
//            Category category = categoryDAO.getCategoryByID(pdto.getCategoryID());
//            List<Category> categoryDTOs = categoryDAO.getAllCategory();
//            Supplier supplier = s.getSupplierByID(pdto.getCategoryID());
//            List<Supplier> supplierDTOs = s.getAllSupplier();
//            request.setAttribute("pdto", pdto);
//            request.setAttribute("categoryName", category.getName());
//            request.setAttribute("categoryID", category.getCategoryID());
//            request.setAttribute("categoryDTOs", categoryDTOs);
//            request.setAttribute("supplierName", supplier.getCompanyName());
//            request.setAttribute("supplierID", supplier.getSupplierID());
//            request.setAttribute("supplierDTOs", supplierDTOs);
//            request.getRequestDispatcher("EditProductDB.jsp").forward(request, response);
//
//        } catch (Exception e) {
//        }
////            } else {
////                response.sendRedirect("403.jsp");
////            }
////        } else {
////            response.sendRedirect("403.jsp");
////        }
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//         HttpSession session = request.getSession();
//        String pid_raw = (String)request.getParameter("pid");
//        String name = (String)request.getParameter("name");
//        String category_raw =(String)request.getParameter("category");
//        String supplier_raw = (String)request.getParameter("supplier");
//        String stock_raw = (String)request.getParameter("stock");
//        String price_raw = (String)request.getParameter("price");
//        String unitOnOrders_raw = (String)request.getParameter("unitOnOrders");
//        String descrip = (String)request.getParameter("descrip");
//        String code_raw = (String)request.getParameter("code");
//        String keyword_raw = (String)request.getParameter("keyword");
//        String shortDes_raw = (String)request.getParameter("shortDes");
//        String button = (String)request.getParameter("update");
//        ProductImgDAO pidao = new ProductImgDAO();
//        
////        try {
//            int pid = Integer.parseInt(pid_raw);
//            int stock = Integer.parseInt(stock_raw);
//            int categoryID = Integer.parseInt(category_raw);
//            float price = Float.parseFloat(price_raw);
//            int supplierID = Integer.parseInt(supplier_raw);
//            int unitOnOrders = Integer.parseInt(unitOnOrders_raw);
//            int checkUpdateProduct = 0;
//            ProductDAO pdao = new ProductDAO();
//            int checkImg = 1;
//            if (button.equals("product")) {
//                Part p = request.getPart("ipro");
//                String fileName = p.getSubmittedFileName();
//                
//                if (!fileName.isEmpty()) {
//                    System.out.println(fileName);
//                    Product productDTO = new Product(pid, code_raw, name, keyword_raw, shortDes_raw, descrip, categoryID, supplierID, true, price, fileName, stock, unitOnOrders, null, 1);
//                    checkUpdateProduct = pdao.updateProduct(productDTO, checkImg);
//                } else {
//                    checkImg = 0;
//                    Product productDTO = new Product(pid, code_raw, name, keyword_raw, shortDes_raw, descrip, categoryID, supplierID, true, price, null, stock, unitOnOrders, null, 1);
//                    checkUpdateProduct = pdao.updateProduct(productDTO, checkImg);
//                }
//                if (checkUpdateProduct == 1) {
//                    if (!fileName.isEmpty()) {
//                       String path = getServletContext().getRealPath("") + "images/product_detail";
//                        
//                        File file = new File(path);
//                        p.write(path + File.separator + fileName);
//                        session.setAttribute("msg", "Update Success!");
//                        response.sendRedirect("productManage");
//                    } else {
//                        session.setAttribute("msg", "Update Success!");
//                        response.sendRedirect("productManage");
//                    }
//
//                }
//            }
//
////            if (button.equals("image")) {
////                boolean isUpdated = false;  // Biến kiểm tra xem có cập nhật thành công ít nhất một tệp không
////
////                List<Part> idesList = new ArrayList<>(request.getParts());
////                for (Part ides : idesList) {
////                    String fieldName = ides.getName();
////                    if (fieldName.startsWith("ides-")) {
////                        String fileDes = ides.getSubmittedFileName();
////
////                        if (fileDes != null && !fileDes.isEmpty()) {
////                            int i = Integer.parseInt(fieldName.substring(5));
////                            String imgID_raw = request.getParameter("imgID-" + i);
////                            int imgID = Integer.parseInt(imgID_raw);
////                            ProductImgDTO productImgDTO = new ProductImgDTO(imgID, pid, fileDes);
////
////                            checkUpdateProduct = pidao.updateProductImage(productImgDTO);
////
////                            if (checkUpdateProduct == 1) {
////                                String path = getServletContext().getRealPath("") + "images/Product";
////                                File file = new File(path);
////                                ides.write(path + File.separator + fileDes);
////                                isUpdated = true;  // Đánh dấu là đã cập nhật thành công ít nhất một tệp
////                            }
////                        }
////                    }
////                }
////
////                if (isUpdated) {
////                    session.setAttribute("msg", "Update Success!");
////                } else {
////                    session.setAttribute("msg", "No update for ImageProduct");
////                }
////                response.sendRedirect("ProductDashboard");
////            }
////            if (button.equals("imageAdd")) {
////                String[] ides = request.getParameterValues("ides[]");
////                List<Part> parts = new ArrayList<>();
////                Collection<Part> requestParts = request.getParts();
////                ArrayList<String> list = new ArrayList<>();
////                for (Part part : requestParts) {
////                    if (part.getName().equals("ides[]")) {
////                        parts.add(part);
////                        String fiString = part.getSubmittedFileName();
////
////                        list.add(fiString);
////                    }
////                }
////                if (list.size() != 0) {
////                    int check = pidao.addNewImageProduct(list, pid);
////                    if (check != 0) {
////                        for (int i = 0; i < list.size(); i++) {
////                            String path = getServletContext().getRealPath("") + "images/Product";
////
////                            // Sử dụng Part từ danh sách parts, không phải requestParts
////                            Part part = parts.get(i);
////                            part.write(path + File.separator + list.get(i));
////                        }
////                        session.setAttribute("msg", "Update ImageProduct Sucess!");
////                        response.sendRedirect("ProductDashboard");
////                    } else {
////                        session.setAttribute("msg", "Have no update for ImageProduct");
////                        response.sendRedirect("ProductDashboard");
////                    }
////                } else {
////                    session.setAttribute("msg", "Have no update for ImageProduct");
////                    response.sendRedirect("ProductDashboard");
////                }
////
////            }
////            if (button.equals("delete")) {
////                String[] checkboxValues = request.getParameterValues("deleteImg");
////                if (checkboxValues != null) {
////                    ArrayList<Integer> listImge = new ArrayList<>();
////                    for (int i = 0; i < checkboxValues.length; i++) {
////                        try {
////                            int imgID = Integer.parseInt(checkboxValues[i]);
////                            listImge.add(imgID);
////                        } catch (Exception e) {
////                        }
////
////                    }
////                    int checkDeleteImg = pidao.deleteImage(listImge);
////                    if (checkDeleteImg != 0) {
////                        session.setAttribute("msg", "Update ImageProduct Sucess!");
////                        response.sendRedirect("ProductDashboard");
////
////                    }
////                } else {
////                    session.setAttribute("msg", "Have no update for ImageProduct");
////                    response.sendRedirect("ProductDashboard");
////                }
////
////            }
//
////        } catch (Exception e) {
////            System.out.println(e);
////        }
//
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//    public static String  getDigit(String str) {
//        String ditgString = "";
//        for (char c : str.toCharArray()) {
//            if (Character.isDigit(c)) {
//                ditgString+=c;
//            }
//            else{
//                return ditgString;
//            }
//           
//        }
//        return ditgString;
//    }
//}
