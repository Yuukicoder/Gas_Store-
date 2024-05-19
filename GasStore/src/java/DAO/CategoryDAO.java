/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Category;
import DTO.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
                category.setDescription(rs.getString(3));
                lc.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
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
                category.setDescription(rs.getString(3));
                lc.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lc;
    }

    public void addCategory(String code, String name, String description) {
        String sql = "INSERT INTO [Category] (code, name, description) VALUES (?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
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
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
        }
        return null;

    }

    public Category getCategoryByID(int categoryID) {
        String sql = "SELECT * FROM Category WHERE categoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            Category category = new Category();
            if (rs.next()) {
                category.setCategoryID(rs.getInt(1));
                category.setCode(rs.getString(2));
                category.setName(rs.getString(3));
                category.setDescription(rs.getString(3));
            }
            return category;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }



}
