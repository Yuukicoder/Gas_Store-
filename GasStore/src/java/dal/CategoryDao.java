/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import DAO.DBcontext;
import DTO.CategoryDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDao extends DBcontext {

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
                category.setDescription(rs.getString(4));
                lc.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lc;
    }

    public List<CategoryDTO> searchCategory(String name) {
        String sql = "SELECT * FROM Category WHERE name LIKE ?";
        List<CategoryDTO> lc = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryDTO category = new CategoryDTO();
                category.setCategoryID(rs.getInt(1));
                category.setCode(rs.getString(2));
                category.setName(rs.getString(3));
                category.setDescription(rs.getString(4));
                lc.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
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
            System.out.println("update: " + e.getMessage());
        }
    }

    public void deleteCategory(int id) {
        try {
            String strQSL = "delete from Category where categoryID = ?";
            PreparedStatement ps = connection.prepareStatement(strQSL);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            System.out.println("delete: " + e.getMessage());
        }
    }

    public List<CategoryDTO> pagging(int pageIndex) {
        String sql = "select * from Category order by categoryID offset ? rows fetch next 5 rows only";
        ArrayList<CategoryDTO> lc = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (pageIndex - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int categoryID;
                categoryID = rs.getInt("CategoryID");
                CategoryDTO c = getCategoryByID(categoryID);
                lc.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lc;
    }
    
    public List<CategoryDTO> paggingSearch(int pageIndex, String search) {
        String sql = "select * from Category where name like ? order by categoryID offset ? rows fetch next 5 rows only";
        ArrayList<CategoryDTO> lc = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, (pageIndex - 1) * 5);          
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int categoryID;
                categoryID = rs.getInt("CategoryID");
                CategoryDTO c = getCategoryByID(categoryID);
                lc.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lc;
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
                categoryDTO.setDescription(rs.getString(4));
            }
            return categoryDTO;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
