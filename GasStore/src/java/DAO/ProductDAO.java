/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.ProductDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author msi
 */
public class ProductDAO extends DBcontext {

    public List<ProductDTO> getAllProduct() {
        String sql = "SELECT * FROM Product where status = 1";
        List<ProductDTO> lp = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductID(rs.getInt(1));
                product.setCategoryID(rs.getInt(2));
                product.setName(rs.getString(3));
                product.setImage(rs.getString(4));
                product.setQuantity(rs.getInt(5));
                product.setPrice(rs.getInt(6));
                product.setRam(rs.getString(7));
                product.setStorage(rs.getString(8));
                product.setCpu(rs.getString(9));
                product.setVga(rs.getString(10));
//                product.setStatus(rs.getInt(11));
                lp.add(product);
            }
        } catch (Exception e) {
        }
        return lp;
    }

    public ProductDTO getProductByID(int id) {
        String sql = "SELECT * FROM Product WHERE ProductID = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductID(rs.getInt(1));
                product.setCategoryID(rs.getInt(2));
                product.setName(rs.getString(3));
                product.setImage(rs.getString(4));
                product.setQuantity(rs.getInt(5));
                product.setPrice(rs.getInt(6));
                product.setRam(rs.getString(7));
                product.setStorage(rs.getString(8));
                product.setCpu(rs.getString(9));
                product.setVga(rs.getString(10));
                product.setStatus(rs.getInt(11));
                product.setDescription(rs.getString(12));
                return product;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addProduct(int CateID, String name, int quantity, double price, String ram, String storage, String cpu, String vga, int Status) {
        String sql = "";
    }

    public List<ProductDTO> getProductByCategory(int id) {
        String sql = "SELECT p.ProductID, p.Name, p.Image, p.QuantityAvailable, p.UnitPrice, p.RamCapacity, p.StorageCapacity,p.CpuBrand, p.VgaBrand FROM Product p\n"
                + "JOIN Category c\n"
                + "ON c.CategoryID = p.CategoryID \n"
                + "WHERE c.CategoryID = ? and p.Status = 1";
        List<ProductDTO> lp = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO pro = new ProductDTO();
                pro.setProductID(rs.getInt(1));
                pro.setName(rs.getString(2));
                pro.setImage(rs.getString(3));
                pro.setQuantity(rs.getInt(4));
                pro.setPrice(rs.getInt(5));
                pro.setRam(rs.getString(6));
                pro.setStorage(rs.getString(7));
                pro.setCpu(rs.getString(8));
                pro.setVga(rs.getString(9));
                lp.add(pro);
            }
        } catch (Exception e) {
        }
        return lp;
    }

    public List<ProductDTO> searchByKey(String key) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE Status = 1 and Name LIKE '%" + key + "%'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductID(rs.getInt(1));
                product.setCategoryID(rs.getInt(2));
                product.setName(rs.getString(3));
                product.setImage(rs.getString(4));
                product.setQuantity(rs.getInt(5));
                product.setPrice(rs.getInt(6));
                product.setRam(rs.getString(7));
                product.setStorage(rs.getString(8));
                product.setCpu(rs.getString(9));
                product.setVga(rs.getString(10));
                product.setStatus(rs.getInt(11));
                product.setDescription(rs.getString(12));

                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ProductDTO> filterProducts(String brandName, String brandCPU, String storage, String ram, String vga, Integer priceRange) {
        StringBuilder sql = new StringBuilder("SELECT * FROM dbo.Product p INNER JOIN dbo.Category c ON p.CategoryID = c.CategoryID WHERE 1 = 1 and p.status = 1 and c.Status = 1");
        List<ProductDTO> lp = new ArrayList<>();

        HashMap<Integer, String> priceRangeMappings = new HashMap<>();
        priceRangeMappings.put(200, " AND p.unitPrice BETWEEN 0 AND 200");
        priceRangeMappings.put(300, " AND p.unitPrice BETWEEN 200 AND 300");
        priceRangeMappings.put(400, " AND p.unitPrice BETWEEN 300 AND 400");
        priceRangeMappings.put(500, " AND p.unitPrice > 500");

        try {
            if (brandName != null && !brandName.isEmpty()) {
                sql.append(" AND c.Name = '" + brandName + "'");
            }

            if (brandCPU != null && !brandCPU.isEmpty()) {
                sql.append(" AND p.CpuBrand LIKE '%" + brandCPU + "%'");
            }

            if (storage != null && !storage.isEmpty()) {
                sql.append(" AND p.StorageCapacity LIKE '%" + storage + "%'");
            }

            if (ram != null && !ram.isEmpty()) {
                sql.append(" AND p.RamCapacity LIKE '%" + ram + "%'");
            }
            if (vga != null && !vga.isEmpty()) {
                sql.append(" AND p.VgaBrand LIKE '%" + vga + "%'");
            }
            if (priceRange != null) {
                sql.append(priceRangeMappings.get(priceRange));
            }

            PreparedStatement ps = connection.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductID(rs.getInt(1));
                product.setCategoryID(rs.getInt(2));
                product.setName(rs.getString(3));
                product.setImage(rs.getString(4));
                product.setQuantity(rs.getInt(5));
                product.setPrice(rs.getDouble(6));
                product.setRam(rs.getString(7));
                product.setStorage(rs.getString(8));
                product.setCpu(rs.getString(9));
                product.setVga(rs.getString(10));
                product.setStatus(rs.getInt(11));
                product.setDescription(rs.getString(12));
                lp.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lp;
    }

    public int actionWithProductById(int id, String action) {
        String sql = "";
        if (action.equals("hide")) {
            sql = "update Product set Status = 0\n"
                    + "where ProductID = ?";
        }
        if (action.equals("show")) {
            sql = "update Product set Status = 1\n"
                    + "where ProductID = ?";
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

    public HashMap<ProductDTO, String> getProductWithCategory(String action) {
        String sql = "";
        if (action.equals("hide")) {
            sql = "select c.Name, p.ProductID from Product p join Category c on p.CategoryID = c.CategoryID where p.Status = 0";
        } else {
            sql = "select c.Name, p.ProductID from Product p join Category c on p.CategoryID = c.CategoryID where p.Status = 1";
        }

        HashMap<ProductDTO, String> productCMap = new HashMap<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String categoryName;
                ProductDTO product = getProductByID(rs.getInt("ProductID"));
                categoryName = rs.getString("Name");
                productCMap.put(product, categoryName);
            }
            return productCMap;
        } catch (SQLException e) {
            System.out.println("Hide" + e.getMessage());

        }
        return null;
    }

    public int updateProduct(ProductDTO productDTO, int checkImg) {
        if (checkImg == 1) {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [CategoryID] = ?,\n"
                    + "      [Name] = ?,\n"
                    + "      [QuantityAvailable] = ?,\n"
                    + "      [UnitPrice] = ?,\n"
                    + "      [RamCapacity] = ?,\n"
                    + "      [StorageCapacity] = ?,\n"
                    + "      [CpuBrand] = ?,\n"
                    + "      [VgaBrand] =  ?,\n "
                    + "      [Image] = ?\n     "
                    + "      ,[Description] = ?"
                    + " WHERE ProductID = ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, productDTO.getCategoryID());
                st.setString(2, productDTO.getName());
                st.setInt(3, productDTO.getQuantity());
                st.setDouble(4, productDTO.getPrice());
                st.setString(5, productDTO.getRam());
                st.setString(6, productDTO.getStorage());
                st.setString(7, productDTO.getCpu());
                st.setString(8, productDTO.getVga());
                st.setString(9, productDTO.getImage());
                st.setString(10, productDTO.getDescription());

                st.setInt(11, productDTO.getProductID());
                int checkUpdate = st.executeUpdate();
                return checkUpdate;
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } else {
            System.out.println(productDTO.getDescription());
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [CategoryID] = ?,\n"
                    + "      [Name] = ?,\n"
                    + "      [QuantityAvailable] = ?,\n"
                    + "      [UnitPrice] = ?,\n"
                    + "      [RamCapacity] = ?,\n"
                    + "      [StorageCapacity] = ?,\n"
                    + "      [CpuBrand] = ?,\n"
                    + "      [VgaBrand] = ?,\n"
                    + "      [Description] = ?\n"
                    + " WHERE ProductID = ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, productDTO.getCategoryID());
                st.setString(2, productDTO.getName());
                st.setInt(3, productDTO.getQuantity());
                st.setDouble(4, productDTO.getPrice());
                st.setString(5, productDTO.getRam());
                st.setString(6, productDTO.getStorage());
                st.setString(7, productDTO.getCpu());
                st.setString(8, productDTO.getVga());
                st.setString(9, productDTO.getDescription());
                st.setInt(10, productDTO.getProductID());
                int checkUpdate = st.executeUpdate();
                return checkUpdate;
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }

        }

        return 0;
    }

    public int addNewProduct(ProductDTO productDTO) {
        String sql = "INSERT INTO [dbo].[Product] "
                + "([CategoryID], [Name], [Image], [QuantityAvailable], [UnitPrice], "
                + "[RamCapacity], [StorageCapacity], [CpuBrand], [VgaBrand], [Description], [Status]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productDTO.getCategoryID());
            st.setString(2, productDTO.getName());
            st.setString(3, productDTO.getImage());
            st.setInt(4, productDTO.getQuantity());
            st.setDouble(5, productDTO.getPrice());
            st.setString(6, productDTO.getRam());
            st.setString(7, productDTO.getStorage());
            st.setString(8, productDTO.getCpu());
            st.setString(9, productDTO.getVga());
            st.setString(10, productDTO.getDescription());
            st.setInt(11, 1);
            int checkUpdate = st.executeUpdate();
            int productID = 0;
            if (checkUpdate == 1) {
                productID = getNewProductID();

            }
            return productID;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    private int getNewProductID() {
        String sql = "select top(1) ProductID from Product order by ProductID desc";
        try {
            int productID = 0;

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                productID = rs.getInt("ProductID");

            }
            return productID;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

//  
    public LinkedHashMap<ProductDTO, String> pagingProduct(String action, int index) {
        LinkedHashMap<ProductDTO, String> productCMap = new LinkedHashMap<>();
        String sql = "";
        if (action.equals("hide")) {
            sql = "select c.Name, p.ProductID from Product p join Category c on p.CategoryID = c.CategoryID\n"
                    + "where p.Status = 0 order by p.ProductID desc offset ? rows fetch next 5 rows only";
        } else {
            sql = "select c.Name, p.ProductID from Product p join Category c on p.CategoryID = c.CategoryID\n"
                    + "where p.Status = 1 order by p.ProductID desc offset ? rows fetch next 5 rows only";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String categoryName;
                ProductDTO product = getProductByID(rs.getInt("ProductID"));
                categoryName = rs.getString("Name");
                productCMap.put(product, categoryName);
            }
            return productCMap;
        } catch (SQLException e) {
            System.out.println("Hide" + e.getMessage());

        }

        return null;
    }

    public int getTotalNewProduct() {
        String sql = "SELECT COUNT(ProductID) AS Count\n"
                + "FROM Product\n"
                + "WHERE CAST(DateCreate AS DATE) = CAST(GETDATE() AS DATE);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int Count = 0;
            if (rs.next()) {
                Count = rs.getInt("Count");
            }
            return Count;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int getTotalProduct() {
        String sql = "SELECT COUNT(ProductID) AS Count\n"
                + "FROM Product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int Count = 0;
            if (rs.next()) {
                Count = rs.getInt("Count");
            }
            return Count;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public List<ProductDTO> getAllProductHide() {
        String sql = "SELECT * FROM Product where status = 0";
        List<ProductDTO> lp = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductID(rs.getInt(1));
                product.setCategoryID(rs.getInt(2));
                product.setName(rs.getString(3));
                product.setImage(rs.getString(4));
                product.setQuantity(rs.getInt(5));
                product.setPrice(rs.getInt(6));
                product.setRam(rs.getString(7));
                product.setStorage(rs.getString(8));
                product.setCpu(rs.getString(9));
                product.setVga(rs.getString(10));
//                product.setStatus(rs.getInt(11));
                lp.add(product);
            }
        } catch (Exception e) {
        }
        return lp;
    }

    private List<String> getDistinctOptions(String property) {
        String sql = String.format("SELECT DISTINCT %s FROM Product", property);
        List<String> options = new ArrayList<>();
        try {
            ResultSet rs = connection.prepareStatement(sql).executeQuery();
            while (rs.next()) {
                String resultString = rs.getString(1);
                if (resultString != null && !resultString.isEmpty()) {
                    options.add(rs.getString(1));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return options;
    }

    public List<String> getRamOptions() {
        return this.getDistinctOptions("RamCapacity");
    }

    public List<String> getVgaOptions() {
        return this.getDistinctOptions("VgaBrand");
    }

    public List<String> getDiskCapacityOptions() {
        return this.getDistinctOptions("StorageCapacity");
    }

    public List<String> getCpuOptions() {
        return this.getDistinctOptions("CpuBrand");
    }

    public LinkedHashMap<ProductDTO, String> getSearchProduct(String searchKey, String action) {
        LinkedHashMap<ProductDTO, String> productCMap = new LinkedHashMap<>();
        String sql = "";
        if (action.equals("hide")) {
            sql = "SELECT * FROM Product WHERE Name LIKE N'%' + ? + '%' and Status = 0;";
        } else {
            sql = "SELECT * FROM Product WHERE Name LIKE N'%' + ? + '%' and Status = 1;";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, searchKey);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String categoryName;
                ProductDTO product = getProductByID(rs.getInt("ProductID"));
                categoryName = rs.getString("Name");
                productCMap.put(product, categoryName);
            }
            return productCMap;
        } catch (SQLException e) {
            System.out.println("Hide" + e.getMessage());

        }

        return null;
    }

    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        LinkedHashMap<ProductDTO, String> productCMap = pd.getSearchProduct("ac", "show");
        System.out.println(productCMap.size());

    }
}
