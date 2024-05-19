/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.CategoryDTO;
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

    public List<CategoryDTO> getAllCategory() {
        String sql = "SELECT * FROM Category";
        ArrayList<CategoryDTO> lc = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoryDTO category = new CategoryDTO();
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

//    public List<CategoryDTO> displayCategoryinHome() {
//        String sql = "SELECT * FROM Category WHERE Status = 1";
//        ArrayList<CategoryDTO> lc = new ArrayList<>();
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                CategoryDTO category = new CategoryDTO();
//                category.setCategoryID(rs.getInt(1));
//                category.setName(rs.getString(2));
//                category.setDateCreated(rs.getString(3));
//                category.setDateModified(rs.getString(4));
//                category.setStatus(rs.getInt(5));
//                lc.add(category);
//            }
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//        return lc;
//    }

    public void addCategory(String name, String date, int Status) {
        String sql = "INSERT INTO [Category] (Name, DateCreated, Status) VALUES (?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setInt(3, Status);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public CategoryDTO getCategoryByColumnName(String columnName, String input) {
        String sql = "SELECT * FROM Category WHERE [" + columnName + "] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, input);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoryDTO category = new CategoryDTO();
                category.setCode(rs.getString(2));
                category.setName(rs.getString(3));
                category.setDescription(rs.getString(4));
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

    public HashMap<CategoryDTO, Integer> getQuantityCategory(String action) {
        String sql = "select c.CategoryID, count(p.ProductID) as NumProduct from Product p right join Category c \n"
                + "                on p.CategoryID = c.CategoryID where p.Status = 1\n"
                + "                group by c.CategoryID";
        if (action.equals("hide")) {
            sql = "select c.CategoryID, count(p.ProductID) as NumProduct from Product p right join Category c \n"
                    + "                on p.CategoryID = c.CategoryID where p.Status = 0\n"
                    + "                group by c.CategoryID";
        }
        HashMap<CategoryDTO, Integer> countProduct = new HashMap<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int categoryID;
                categoryID = rs.getInt("CategoryID");
                int numProduct = rs.getInt("NumProduct");
                CategoryDTO categoryDTO = getCategoryByID(categoryID);
                countProduct.put(categoryDTO, numProduct);
            }
            return countProduct;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;

    }

    public CategoryDTO getCategoryByID(int categoryID) {
        String sql = "SELECT * FROM Category WHERE CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            CategoryDTO categoryDTO = new CategoryDTO();
            if (rs.next()) {
                categoryDTO.setCategoryID(categoryID);
                categoryDTO.setCode(rs.getString(2));
                categoryDTO.setName(rs.getString(3));
                categoryDTO.setDescription(rs.getString(3));
            }
            return categoryDTO;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }



}
