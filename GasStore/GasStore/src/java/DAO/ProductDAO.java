/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import DTO.Product;

/**
 *
 * @author dell456
 */
public class ProductDAO extends DBcontext {

    PreparedStatement stm;
    ResultSet rs;

    public List<Product> getAllProduct() {
        String sql = "SELECT * FROM Product WHERE isActive = 1";
        List<Product> lp = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setKeywords(rs.getString("keywords"));
                product.setShortDescription(rs.getString("shortDescription"));
                product.setDescription(rs.getString("description"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setSupplierID(rs.getInt("supplierID"));
                product.setIsActive(rs.getBoolean("isActive"));
                product.setUnitPrice(rs.getFloat("unitPrice"));
                product.setImage(rs.getString("image"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setUnitOnOrders(rs.getInt("unitOnOrders"));
                product.setCreatedDate(rs.getString("createdDate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                lp.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();  // Consider logging the exception
        }
        return lp;
    }

    public Product getProductByID(int id) {
        String sql = "SELECT * FROM Product WHERE productID = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setKeywords(rs.getString("keywords"));
                product.setShortDescription(rs.getString("shortDescription"));
                product.setDescription(rs.getString("description"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setSupplierID(rs.getInt("supplierID"));
                product.setIsActive(rs.getBoolean("isActive"));
                product.setUnitPrice(rs.getFloat("unitPrice"));
                product.setImage(rs.getString("image"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setUnitOnOrders(rs.getInt("unitOnOrders"));
                product.setCreatedDate(rs.getString("createdDate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                return product;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductByCategory(int id) {
        String sql = "SELECT p.productID, p.code, p.name, p.keywords, p.shortDescription, p.description, "
                + "p.categoryID, p.supplierID, p.isActive, p.unitPrice, p.image, p.stockQuantity, "
                + "p.unitOnOrders, p.createdDate, p.createdBy "
                + "FROM Product p "
                + "JOIN Category c ON c.categoryID = p.categoryID "
                + "WHERE c.categoryID = ? AND p.isActive = 1";
        List<Product> lp = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setKeywords(rs.getString("keywords"));
                product.setShortDescription(rs.getString("shortDescription"));
                product.setDescription(rs.getString("description"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setSupplierID(rs.getInt("supplierID"));
                product.setIsActive(rs.getBoolean("isActive"));
                product.setUnitPrice(rs.getFloat("unitPrice"));
                product.setImage(rs.getString("image"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setUnitOnOrders(rs.getInt("unitOnOrders"));
                product.setCreatedDate(rs.getString("createdDate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                lp.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();  // Consider logging the exception
        }
        return lp;
    }

    public List<Product> searchByKeywords(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE isActive = 1 AND keywords LIKE ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setKeywords(rs.getString("keywords"));
                product.setShortDescription(rs.getString("shortDescription"));
                product.setDescription(rs.getString("description"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setSupplierID(rs.getInt("supplierID"));
                product.setIsActive(rs.getBoolean("isActive"));
                product.setUnitPrice(rs.getFloat("unitPrice"));
                product.setImage(rs.getString("image"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setUnitOnOrders(rs.getInt("unitOnOrders"));
                product.setCreatedDate(rs.getString("createdDate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();  // Consider logging the exception
        }
        return list;
    }

    public List<Product> getSearchResult(String search) {
        String[] s = search.split(" ");
        List<Product> result = new ArrayList<>();
        for (int i = 0; i < s.length; i++) {
            if (s[i] != "") {
                List<Product> SearchName = searchByName("%" + s[i] + "%");
                if (SearchName.size() > 0) {
                    for (Product p : SearchName) {
                        result.add(p);
                    }
                }
            }
        }
        return result;
    }

    public List<Product> searchByName(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE isActive = 1 AND name LIKE ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setKeywords(rs.getString("keywords"));
                product.setShortDescription(rs.getString("shortDescription"));
                product.setDescription(rs.getString("description"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setSupplierID(rs.getInt("supplierID"));
                product.setIsActive(rs.getBoolean("isActive"));
                product.setUnitPrice(rs.getFloat("unitPrice"));
                product.setImage(rs.getString("image"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setUnitOnOrders(rs.getInt("unitOnOrders"));
                product.setCreatedDate(rs.getString("createdDate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();  // Consider logging the exception
        }
        return list;
    }

    public int actionWithProductById(int id, String action) {
        String sql = "";
        if (action.equals("hide")) {
            sql = "update Product set isActive = 0\n"
                    + "where productID = ?";
        }
        if (action.equals("show")) {
            sql = "update Product set isActive = 1\n"
                    + "where productID = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            int check = st.executeUpdate();
            return check;
        } catch (SQLException e) {
            System.out.println("Hide" + e.getMessage());
        }
        return 0;
    }

    public HashMap<Product, String> getProductWithCategory(String action) {
        String sql = "";
        if (action.equals("hide")) {
            sql = "SELECT c.name AS categoryName, p.productID FROM Product p "
                    + "JOIN Category c ON p.categoryID = c.categoryID WHERE p.isActive = 0";
        } else {
            sql = "SELECT c.name AS categoryName, p.productID FROM Product p "
                    + "JOIN Category c ON p.categoryID = c.categoryID WHERE p.isActive = 1";
        }

        HashMap<Product, String> productCMap = new HashMap<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String categoryName = rs.getString("categoryName");
                Product product = getProductByID(rs.getInt("productID"));
                productCMap.put(product, categoryName);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return productCMap;
    }

    public int updateProduct(Product productDTO, int checkImg) {
        String sql;
        if (checkImg == 1) {
            sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [categoryID] = ?,\n"
                    + "      [code] = ?,\n"
                    + "      [name] = ?,\n"
                    + "      [keywords] = ?,\n"
                    + "      [shortDescription] = ?,\n"
                    + "      [description] = ?,\n"
                    + "      [supplierID] = ?,\n"
                    + "      [isActive] = ?,\n"
                    + "      [unitPrice] = ?,\n"
                    + "      [image] = ?,\n"
                    + "      [stockQuantity] = ?,\n"
                    + "      [unitOnOrders] = ?\n"
                    + " WHERE productID = ?";
        } else {
            sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [categoryID] = ?,\n"
                    + "      [code] = ?,\n"
                    + "      [name] = ?,\n"
                    + "      [keywords] = ?,\n"
                    + "      [shortDescription] = ?,\n"
                    + "      [description] = ?,\n"
                    + "      [supplierID] = ?,\n"
                    + "      [isActive] = ?,\n"
                    + "      [unitPrice] = ?,\n"
                    + "      [stockQuantity] = ?,\n"
                    + "      [unitOnOrders] = ?\n"
                    + " WHERE productID = ?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productDTO.getCategoryID());
            st.setString(2, productDTO.getCode());
            st.setString(3, productDTO.getName());
            st.setString(4, productDTO.getKeywords());
            st.setString(5, productDTO.getShortDescription());
            st.setString(6, productDTO.getDescription());
            st.setInt(7, productDTO.getSupplierID());
            st.setBoolean(8, productDTO.isIsActive());
            st.setBigDecimal(9, BigDecimal.valueOf(productDTO.getUnitPrice()));
            if (checkImg == 1) {
                st.setString(10, productDTO.getImage());
                st.setInt(11, productDTO.getStockQuantity());
                st.setInt(12, productDTO.getUnitOnOrders());
                st.setInt(13, productDTO.getProductID());
            } else {
                st.setInt(10, productDTO.getStockQuantity());
                st.setInt(11, productDTO.getUnitOnOrders());
                st.setInt(12, productDTO.getProductID());
            }

            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return 0;
    }

    public int addNewProduct(Product productDTO) {
        String sql = "INSERT INTO [dbo].[Product] "
                + "([code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierID], "
                + "[isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productDTO.getCode());
            st.setString(2, productDTO.getName());
            st.setString(3, productDTO.getKeywords());
            st.setString(4, productDTO.getShortDescription());
            st.setString(5, productDTO.getDescription());
            st.setInt(6, productDTO.getCategoryID());
            st.setInt(7, productDTO.getSupplierID());
            st.setBoolean(8, productDTO.isIsActive());
            st.setFloat(9, productDTO.getUnitPrice());
            st.setString(10, productDTO.getImage());
            st.setInt(11, productDTO.getStockQuantity());
            st.setInt(12, productDTO.getUnitOnOrders());
            st.setTimestamp(13, Timestamp.valueOf(productDTO.getCreatedDate()));
            st.setInt(14, productDTO.getCreatedBy());

            int checkUpdate = st.executeUpdate();
            if (checkUpdate == 1) {
                // Assuming 'getNewProductID()' fetches the last inserted ID correctly
                return getNewProductID();
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            System.out.println("Date formatting issue: " + e.getMessage());
        }
        return 0;
    }

    private int getNewProductID() {
        String sql = "select top(1) productID from Product order by productID desc";
        try {
            int productID = 0;

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                productID = rs.getInt("productID");

            }
            return productID;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public LinkedHashMap<Product, String> pagingProduct(String action, int index, int numPage) {
        LinkedHashMap<Product, String> productCMap = new LinkedHashMap<>();
        String sql = "";
        if (action.equals("hide")) {
            // Assuming isActive 'false' means hide
            sql = "SELECT c.name, p.productID FROM Product p JOIN Category c ON p.categoryID = c.categoryID "
                    + "WHERE p.isActive = 0 ORDER BY p.productID DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            // Assuming isActive 'true' means show
            sql = "SELECT c.name, p.productID FROM Product p JOIN Category c ON p.categoryID = c.categoryID "
                    + "WHERE p.isActive = 1 ORDER BY p.productID DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * numPage);
            st.setInt(2, numPage == Integer.MAX_VALUE ? Integer.MAX_VALUE : numPage); // Fetch all if numPage is Integer.MAX_VALUE
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productID");
                String categoryName = rs.getString("name");

                // Fetch the full product details
                Product product = getProductByID(productId); // Assuming this method fetches all product details
                if (product != null) {
                    productCMap.put(product, categoryName);
                }
            }
            return productCMap;
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }

        return null;
    }

    public LinkedHashMap<Product, String> searchProductsPaging(String action, int index, int numPage, String searchQuery) {
        LinkedHashMap<Product, String> productCMap = new LinkedHashMap<>();
        StringBuilder queryBuilder = new StringBuilder();

        // Remove extra spaces and split the searchQuery into words
        String[] keywords = searchQuery.trim().replaceAll("\\s+", " ").split(" ");

        if (action.equals("hide")) {
            // Assuming isActive 'false' means hide
            queryBuilder.append("SELECT c.name, p.productID FROM Product p JOIN Category c ON p.categoryID = c.categoryID ")
                    .append("WHERE p.isActive = 0 AND (");
        } else {
            // Assuming isActive 'true' means show
            queryBuilder.append("SELECT c.name, p.productID FROM Product p JOIN Category c ON p.categoryID = c.categoryID ")
                    .append("WHERE p.isActive = 1 AND (");
        }

        // Build the dynamic SQL query for each keyword
        for (int i = 0; i < keywords.length; i++) {
            queryBuilder.append("p.name LIKE ? ");
            if (i < keywords.length - 1) {
                queryBuilder.append("OR ");
            }
        }
        queryBuilder.append(") ORDER BY p.productID DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        String sql = queryBuilder.toString();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            // Set the keyword parameters
            for (int i = 0; i < keywords.length; i++) {
                st.setString(i + 1, "%" + keywords[i] + "%");
            }
            // Set the pagination parameters
            st.setInt(keywords.length + 1, (index - 1) * numPage);
            st.setInt(keywords.length + 2, numPage == Integer.MAX_VALUE ? Integer.MAX_VALUE : numPage);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productID");
                String categoryName = rs.getString("name");

                // Fetch the full product details
                Product product = getProductByID(productId); // Assuming this method fetches all product details
                if (product != null) {
                    productCMap.put(product, categoryName);
                }
            }
            return productCMap;
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }

        return null;
    }

    public int countProducts(String action, String searchQuery) {
        String sql = "";
        if (action.equals("hide")) {
            // Assuming isActive 'false' means hide
            sql = "SELECT COUNT(*) FROM Product p JOIN Category c ON p.categoryID = c.categoryID "
                    + "WHERE p.isActive = 0 AND p.name LIKE ? ";
        } else {
            // Assuming isActive 'true' means show
            sql = "SELECT COUNT(*) FROM Product p JOIN Category c ON p.categoryID = c.categoryID "
                    + "WHERE p.isActive = 1 AND p.name LIKE ? ";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            String searchPattern = "%" + searchQuery + "%";
            st.setString(1, searchPattern);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); // Return the count
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }

        return 0; // Return 0 if there is an error or no matching products
    }

    public int getTotalNewProduct() {
        String sql = "SELECT COUNT(productID) AS Count FROM Product WHERE CAST(createdDate AS DATE) = CAST(GETDATE() AS DATE)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int count = 0; // It's a good practice to use camelCase for variable names in Java
            if (rs.next()) {
                count = rs.getInt("Count");
            }
            return count;
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
        }
        return 0;
    }

    public int getTotalProduct() {
        String sql = "SELECT COUNT(productID) AS Count FROM Product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("Count");
            }
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
        }
        return 0;
    }

    public LinkedHashMap<Product, String> pagingProduct2(String action, int index, int numPage, int id) {
        LinkedHashMap<Product, String> productCMap = new LinkedHashMap<>();
        String sql = "";
        if (action.equals("hide")) {
            // Assuming isActive 'false' means hide
            sql = "SELECT c.name, p.productID FROM Product p JOIN Category c ON p.categoryID = c.categoryID "
                    + "WHERE p.isActive = 0 and p.supplierId = ?  ORDER BY p.productID DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            // Assuming isActive 'true' means show
            sql = "SELECT c.name, p.productID FROM Product p JOIN Category c ON p.categoryID = c.categoryID "
                    + "WHERE p.isActive = 1 and p.supplierId = ?  ORDER BY p.productID DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, (index - 1) * numPage);
            st.setInt(3, numPage == Integer.MAX_VALUE ? Integer.MAX_VALUE : numPage); // Fetch all if numPage is Integer.MAX_VALUE
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productID");
                String categoryName = rs.getString("name");

                // Fetch the full product details
                Product product = getProductByID(productId); // Assuming this method fetches all product details
                if (product != null) {
                    productCMap.put(product, categoryName);
                }
            }
            return productCMap;
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }

        return null;
    }

    public List<Product> getAllProductBySupplier(int id) {
        String sql = "SELECT * FROM Product WHERE isActive = 1";
        List<Product> lp = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setKeywords(rs.getString("keywords"));
                product.setShortDescription(rs.getString("shortDescription"));
                product.setDescription(rs.getString("description"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setSupplierID(rs.getInt("supplierID"));
                product.setIsActive(rs.getBoolean("isActive"));
                product.setUnitPrice(rs.getFloat("unitPrice"));
                product.setImage(rs.getString("image"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setUnitOnOrders(rs.getInt("unitOnOrders"));
                product.setCreatedDate(rs.getString("createdDate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                lp.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();  // Consider logging the exception
        }
        return lp;
    }

    public List<Product> getAllProductHide() {
        String sql = "SELECT * FROM Product where isActive = 0";
        List<Product> lp = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setKeywords(rs.getString("keywords"));
                product.setShortDescription(rs.getString("shortDescription"));
                product.setDescription(rs.getString("description"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setSupplierID(rs.getInt("supplierID"));
                product.setIsActive(rs.getBoolean("isActive"));
                product.setUnitPrice(rs.getFloat("unitPrice"));
                product.setImage(rs.getString("image"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setUnitOnOrders(rs.getInt("unitOnOrders"));
                product.setCreatedDate(rs.getString("createdDate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                lp.add(product);
            }
        } catch (Exception e) {
        }
        return lp;
    }

    public LinkedHashMap<Product, String> getSearchProduct(String searchKey, String action) {
        LinkedHashMap<Product, String> productCMap = new LinkedHashMap<>();
        StringBuilder queryBuilder = new StringBuilder();

        // Remove extra spaces and split the searchKey into words
        String[] keywords = searchKey.trim().replaceAll("\\s+", " ").split(" ");

        if (action.equals("hide")) {
            queryBuilder.append("SELECT * FROM Product WHERE isActive = 0 AND (");
        } else {
            queryBuilder.append("SELECT * FROM Product WHERE isActive = 1 AND (");
        }

        // Build the dynamic SQL query
        for (int i = 0; i < keywords.length; i++) {
            queryBuilder.append("name LIKE N'%").append(keywords[i]).append("%'");
            if (i < keywords.length - 1) {
                queryBuilder.append(" OR ");
            }
        }
        queryBuilder.append(");");

        String sql = queryBuilder.toString();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String categoryName;
                Product product = getProductByID(rs.getInt("productID"));
                categoryName = rs.getString("name");
                productCMap.put(product, categoryName);
            }
        } catch (SQLException e) {
            System.out.println("Hide" + e.getMessage());
        }

        return productCMap;
    }

    public List<Product> filterProductsBySupplierPriceCategory(Integer supplierID, Integer priceRange, Integer cateId) {
        List<Product> filteredProducts = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE 1=1";

        if (supplierID != null) {
            sql += " AND SupplierID = " + supplierID;
        }
        if (priceRange != null) {
            sql += " AND UnitPrice <= " + priceRange;
        }
        //Filter theo ID - Vu anh
        if (cateId != 0) {
            sql += "AND categoryID = " + cateId;
        }

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setKeywords(rs.getString("keywords"));
                product.setShortDescription(rs.getString("shortDescription"));
                product.setDescription(rs.getString("description"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setSupplierID(rs.getInt("supplierID"));
                product.setIsActive(rs.getBoolean("isActive"));
                product.setUnitPrice(rs.getFloat("unitPrice"));
                product.setImage(rs.getString("image"));
                product.setStockQuantity(rs.getInt("stockQuantity"));
                product.setUnitOnOrders(rs.getInt("unitOnOrders"));
                product.setCreatedDate(rs.getString("createdDate"));
                product.setCreatedBy(rs.getInt("createdBy"));
                filteredProducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return filteredProducts;
    }

    public List<Product> getTop3ProductByEachCategory(int cateId) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select top 3 p.productID, sum(quantity) as totalSell\n"
                + "from OrderDetails as o \n"
                + "inner join Product as p \n"
                + "on o.ProductID = p.ProductId\n"
                + "where p.categoryID = ?\n"
                + "group by p.productID\n"
                + "order by totalSell desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productID");

                Product product = getProductByID(productId);
                if (product != null) {
                    products.add(product);
                }
            }
            return products;
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }

        return null;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        List<Product> list = p.getProductByCategory(2);
        for (Product product : list) {
            System.out.println(product.toString());
        }
    }
}
