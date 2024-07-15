/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author msi
 */
public class CategoryDAO extends DBcontext {

    public List<Category> getAllCategory() {
        String sql = "SELECT * FROM Category";
        ArrayList<Category> lc = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt(1));
                category.setCode(rs.getString(2));
                category.setName(rs.getString(3));
                category.setDescription(rs.getString(4));
                lc.add(category);
            }
        } catch (SQLException e) {
            System.out.println("CategoryDAO - getAllCategory: " + e.getMessage());
        }
        return lc;
    }

    public List<Category> searchCategory(String name) {
        String sql = "SELECT * FROM Category WHERE name LIKE ?";
        List<Category> lc = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt(1));
                category.setCode(rs.getString(2));
                category.setName(rs.getString(3));
                category.setDescription(rs.getString(4));
                lc.add(category);
            }
        } catch (SQLException e) {
            System.out.println("CategoryDAO - searchCategory: " + e.getMessage());
        }
        return lc;
    }

    public void addCategory(String code, String name, String des) {
        String sql = "insert into Category(code, name, description) Values (?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, des);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("CategoryDAO - addCategory: " + e.getMessage());
        }
    }

    public void updateCategory(int id, String code, String name, String des) {
        System.out.println("update in dao: " + des);
        try {
            String sql = "update Category set code = ?, name = ?, description = ? where categoryID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, des);
            System.out.println("update in dao: " + des);
            ps.setInt(4, id);
            ps.execute();
        } catch (Exception e) {
            System.out.println("CategoryDAO - updateCategory: " + e.getMessage());
        }
    }

    public void deleteCategory(int id) {
        try {
            String strQSL = "delete from Category where categoryID = ?";
            PreparedStatement ps = connection.prepareStatement(strQSL);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            System.out.println("CategoryDAO - deleteCategory: " + e.getMessage());
        }
    }

    public List<Category> pagging(int pageIndex, int pageSize, String search) {
        System.out.println("pageSize: " + pageSize);
        String sql = "select * from Category where name like ? order by categoryID offset ? rows fetch next ? rows only";
        ArrayList<Category> lc = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, (pageIndex - 1) * pageSize);
            ps.setInt(3, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int categoryID;
                categoryID = rs.getInt("categoryID");

                Category c = getCategoryByID(categoryID);
                lc.add(c);
            }
        } catch (SQLException e) {
            System.out.println("CategoryDAO - pagging: " + e.getMessage());
        }
        System.out.println("list size: " + lc.size());
        return lc;
    }

    public List<Category> displayCategoryinHome() {
        String sql = "SELECT * FROM Category";
        ArrayList<Category> lc = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt(1));
                category.setCode(rs.getString(2));
                category.setName(rs.getString(3));
                category.setDescription(rs.getString(4));
                lc.add(category);
            }
        } catch (SQLException e) {
            System.out.println("CategoryDAO - displayCategoryinHome: " + e.getMessage());
        }
        return lc;
    }

    public Category getCategoryByColumnName(String columnName, String input) {
        String sql = "SELECT * FROM Category WHERE [" + columnName + "] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, input);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setName(rs.getString(3));
                return category;
            }
        } catch (SQLException e) {
            System.out.println("CategoryDAO - getCategoryByColumnName: " + e.getMessage());
        }
        return null;
    }

    public void changeStatusCategoryByID(int status, int id) {
        String sql = "UPDATE Category SET Status = ? WHERE CategoryID  = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("CategoryDAO - changeStatusCategoryByID: " + e.getMessage());
        }
    }

    public HashMap<Category, Integer> getQuantityCategory(String action) {
        String sql = "select c.CategoryID, count(p.ProductID) as NumProduct from Product p right join Category c \n"
                + "                on p.CategoryID = c.CategoryID where p.Status = 1\n"
                + "                group by c.CategoryID";
        if (action.equals("hide")) {
            sql = "select c.CategoryID, count(p.ProductID) as NumProduct from Product p right join Category c \n"
                    + "                on p.CategoryID = c.CategoryID where p.Status = 0\n"
                    + "                group by c.CategoryID";
        }
        HashMap<Category, Integer> countProduct = new HashMap<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int categoryID;
                categoryID = rs.getInt("CategoryID");
                int numProduct = rs.getInt("NumProduct");
                Category categoryDTO = getCategoryByID(categoryID);
                countProduct.put(categoryDTO, numProduct);
            }
            return countProduct;

        } catch (SQLException e) {
            System.out.println("CategoryDAO - getQuantityCategory: " + e.getMessage());
        }
        return null;

    }

    public Category getCategoryByID(int categoryID) {
        String sql = "SELECT * FROM Category WHERE CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            Category categoryDTO = new Category();
            if (rs.next()) {
                categoryDTO.setCategoryID(categoryID);
                categoryDTO.setCode(rs.getString(2));
                categoryDTO.setName(rs.getString(3));
                categoryDTO.setDescription(rs.getString(4));
            }
            return categoryDTO;
        } catch (SQLException e) {
            System.out.println("CategoryDAO - getCategoryByID: " + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        CategoryDAO cDAO = new CategoryDAO();
        System.out.println(cDAO.getCategoryByID(1).getName());
    }

}
