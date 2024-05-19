/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.CategoryDTO;
import DTO.PostCategoryDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author 1234
 */
public class PostCategoryDAO extends DBcontext {

    public ArrayList<PostCategoryDTO> getAllPostCategory() {
        String sql = "select * from PostCategory";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ArrayList<PostCategoryDTO> postCategoryDTOs = new ArrayList<>();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PostCategoryDTO pcdto = new PostCategoryDTO();
                pcdto.setCategoryID(rs.getInt(1));
                pcdto.setName(rs.getString(2));
                postCategoryDTOs.add(pcdto);

            }
            return postCategoryDTOs;
        } catch (Exception e) {
        }
        return null;
    }

    public int getCategoryIDByName(String category) {
        String sql = "SELECT PostCategoryID FROM PostCategory WHERE Name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category);
            ResultSet rs = st.executeQuery();
            int categoryID = 0;
            if (rs.next()) {
                categoryID = rs.getInt(1);
            }
            return categoryID;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        PostCategoryDAO postCategoryDAO = new PostCategoryDAO();
        PostCategoryDTO pcdto = postCategoryDAO.getCategoryByID(1);
        System.out.println(pcdto.getCategoryID());
    }

    public int addPostCategory(String categoryPost) {
        String sql = "INSERT INTO [dbo].[PostCategory]\n"
                + "           ([Name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryPost);

            int checkAdd = ps.executeUpdate();
            return checkAdd;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int deletePostCategoryById(int postCategoryID) {
        String sql = "delete PostCategory where PostCategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, postCategoryID);
            int checkDelete = ps.executeUpdate();
            return checkDelete;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public PostCategoryDTO getCategoryByID(int pcid) {
        String sql = "select * from PostCategory where PostCategoryID = ?";

        PostCategoryDTO pcdto = new PostCategoryDTO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pcid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                pcdto.setCategoryID(pcid);
                pcdto.setName(rs.getString("Name"));
            }
            return pcdto;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int updatePostCategory(PostCategoryDTO pcdto) {
        String sql = "UPDATE [dbo].[PostCategory]\n"
                + "   SET [Name] = ?\n"
                + " WHERE PostCategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pcdto.getName());
            ps.setInt(2, pcdto.getCategoryID());

            int checkUpdate = ps.executeUpdate();
            return checkUpdate;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

}
