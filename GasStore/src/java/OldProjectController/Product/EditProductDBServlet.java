/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package OldProjectController.Product;

import DAO.AccountDAO;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.ProductImgDAO;
import DTO.AccountDTO;
import DTO.CategoryDTO;
import DTO.ProductDTO;
import DTO.ProductImgDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author 1234
 */
public class EditProductDBServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProductDBServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductDBServlet at " + request.getContextPath() + "</h1>");
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

        String product_id_raw = request.getParameter("pid");
        try {
            int product_id = Integer.parseInt(product_id_raw);
            ProductImgDAO pidao = new ProductImgDAO();
            List<ProductImgDTO> pimgs = pidao.getPImgByPid(product_id);
            request.setAttribute("pimgs", pimgs);
            ProductDAO productDAO = new ProductDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            ProductDTO pdto = productDAO.getProductByID(product_id);
            CategoryDTO category = categoryDAO.getCategoryByID(pdto.getCategoryID());
            List<CategoryDTO> categoryDTOs = categoryDAO.getAllCategory();
            request.setAttribute("pdto", pdto);
            request.setAttribute("ramOld", getDigit(pdto.getRam()));
            request.setAttribute("storageOld", getDigit(pdto.getStorage()));
            request.setAttribute("categoryName", category.getName());
            request.setAttribute("categoryID", category.getCategoryID());
            request.setAttribute("categoryDTOs", categoryDTOs);
            request.getRequestDispatcher("EditProductDB.jsp").forward(request, response);

        } catch (Exception e) {
        }
//            } else {
//                response.sendRedirect("403.jsp");
//            }
//        } else {
//            response.sendRedirect("403.jsp");
//        }
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
        String pid_raw = request.getParameter("pid");
        String name = request.getParameter("name");
        String category_raw = request.getParameter("category");
        String stock_raw = request.getParameter("stock");
        String price_raw = request.getParameter("price");
        String typeRam = request.getParameter("typeRam");
        String ram_raw = request.getParameter("ram");
        String ram = "";
        
            ram = ram_raw + typeRam;
        
        String typeStorage = request.getParameter("typeStorage");
        String storage_raw = request.getParameter("storage") ;
        String storage = "";
        
            storage = storage_raw + typeStorage;
        
        String cpu = request.getParameter("cpu");
        String vga = request.getParameter("vga");
        String descrip = request.getParameter("descrip");
        HttpSession session = request.getSession();

        String button = request.getParameter("update");
        ProductImgDAO pidao = new ProductImgDAO();

        try {
            int pid = Integer.parseInt(pid_raw);
            int categoryID = Integer.parseInt(category_raw);
            int stock = Integer.parseInt(stock_raw);
            double price = Double.parseDouble(price_raw);
            int checkUpdateProduct = 0;
            ProductDAO pdao = new ProductDAO();
            int checkImg = 1;
            if (button.equals("product")) {
                Part p = request.getPart("ipro");
                String fileName = p.getSubmittedFileName();
                if (!fileName.isEmpty()) {
                    ProductDTO productDTO = new ProductDTO(pid, categoryID, name, fileName, stock, price, ram, storage, cpu, vga, 1, descrip, 0);
                    checkUpdateProduct = pdao.updateProduct(productDTO, checkImg);
                } else {
                    checkImg = 0;
                    ProductDTO productDTO = new ProductDTO(pid, categoryID, name, null, stock, price, ram, storage, cpu, vga, 1, descrip, 0);
                    checkUpdateProduct = pdao.updateProduct(productDTO, checkImg);
                }
                if (checkUpdateProduct == 1) {
                    if (!fileName.isEmpty()) {
                        String path = getServletContext().getRealPath("") + "images/Product";
                        File file = new File(path);
                        p.write(path + File.separator + fileName);
                        session.setAttribute("msg", "Update Success!");
                        response.sendRedirect("ProductDashboard");
                    } else {
                        session.setAttribute("msg", "Update Success!");
                        response.sendRedirect("ProductDashboard");
                    }

                }
            }

            if (button.equals("image")) {
                boolean isUpdated = false;  // Biến kiểm tra xem có cập nhật thành công ít nhất một tệp không

                List<Part> idesList = new ArrayList<>(request.getParts());
                for (Part ides : idesList) {
                    String fieldName = ides.getName();
                    if (fieldName.startsWith("ides-")) {
                        String fileDes = ides.getSubmittedFileName();

                        if (fileDes != null && !fileDes.isEmpty()) {
                            int i = Integer.parseInt(fieldName.substring(5));
                            String imgID_raw = request.getParameter("imgID-" + i);
                            int imgID = Integer.parseInt(imgID_raw);
                            ProductImgDTO productImgDTO = new ProductImgDTO(imgID, pid, fileDes);

                            checkUpdateProduct = pidao.updateProductImage(productImgDTO);

                            if (checkUpdateProduct == 1) {
                                String path = getServletContext().getRealPath("") + "images/Product";
                                File file = new File(path);
                                ides.write(path + File.separator + fileDes);
                                isUpdated = true;  // Đánh dấu là đã cập nhật thành công ít nhất một tệp
                            }
                        }
                    }
                }

                if (isUpdated) {
                    session.setAttribute("msg", "Update Success!");
                } else {
                    session.setAttribute("msg", "No update for ImageProduct");
                }
                response.sendRedirect("ProductDashboard");
            }
            if (button.equals("imageAdd")) {
                String[] ides = request.getParameterValues("ides[]");
                List<Part> parts = new ArrayList<>();
                Collection<Part> requestParts = request.getParts();
                ArrayList<String> list = new ArrayList<>();
                for (Part part : requestParts) {
                    if (part.getName().equals("ides[]")) {
                        parts.add(part);
                        String fiString = part.getSubmittedFileName();

                        list.add(fiString);
                    }
                }
                if (list.size() != 0) {
                    int check = pidao.addNewImageProduct(list, pid);
                    if (check != 0) {
                        for (int i = 0; i < list.size(); i++) {
                            String path = getServletContext().getRealPath("") + "images/Product";

                            // Sử dụng Part từ danh sách parts, không phải requestParts
                            Part part = parts.get(i);
                            part.write(path + File.separator + list.get(i));
                        }
                        session.setAttribute("msg", "Update ImageProduct Sucess!");
                        response.sendRedirect("ProductDashboard");
                    } else {
                        session.setAttribute("msg", "Have no update for ImageProduct");
                        response.sendRedirect("ProductDashboard");
                    }
                } else {
                    session.setAttribute("msg", "Have no update for ImageProduct");
                    response.sendRedirect("ProductDashboard");
                }

            }
            if (button.equals("delete")) {
                String[] checkboxValues = request.getParameterValues("deleteImg");
                if (checkboxValues != null) {
                    ArrayList<Integer> listImge = new ArrayList<>();
                    for (int i = 0; i < checkboxValues.length; i++) {
                        try {
                            int imgID = Integer.parseInt(checkboxValues[i]);
                            listImge.add(imgID);
                        } catch (Exception e) {
                        }

                    }
                    int checkDeleteImg = pidao.deleteImage(listImge);
                    if (checkDeleteImg != 0) {
                        session.setAttribute("msg", "Update ImageProduct Sucess!");
                        response.sendRedirect("ProductDashboard");

                    }
                } else {
                    session.setAttribute("msg", "Have no update for ImageProduct");
                    response.sendRedirect("ProductDashboard");
                }

            }

        } catch (Exception e) {
        }
//            public ProductDTO(int productID, int categoryID, String name, String image, int quantity, double price, String ram, String storage, String cpu, String vga, int Status, String description, int sold) {

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

    public static String  getDigit(String str) {
        String ditgString = "";
        for (char c : str.toCharArray()) {
            if (Character.isDigit(c)) {
                ditgString+=c;
            }
            else{
                return ditgString;
            }
           
        }
        return ditgString;
    }
}
