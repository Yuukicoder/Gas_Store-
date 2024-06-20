package DAO;

import DTO.PostDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * Author 1234
 */
public class PostListDAO extends DBcontext {

    public ArrayList<PostDTO> getAllPost() {
        String sql = "SELECT p.PostID, p.Title, p.DateCreated, p.DateUpdated, p.Postbanner, p.Context, p.Description, c.Name\n"
                + "FROM Post p\n"
                + "JOIN PostCategory c ON p.PostCategoryID = c.PostCategoryID";
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostDTO postDTO = new PostDTO();
                postDTO.setPostID(rs.getInt("PostID"));
                postDTO.setTitle(rs.getString("Title"));
                postDTO.setDateCreated(rs.getString("DateCreated"));
                postDTO.setDateUpdated(rs.getString("DateUpdated"));
                postDTO.setPostbanner(rs.getString("Postbanner"));
                postDTO.setDescription(rs.getString("Description"));
                postDTO.setContext(rs.getString("Context"));
                postDTO.setPostCate(rs.getString("Name"));
                postDTOs.add(postDTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return postDTOs;
    }

    public PostDTO getPostDTOByID(int postID) {
        String sql = "SELECT * FROM Post WHERE PostID = ?";
        PostDTO postDTO = new PostDTO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                postDTO.setPostID(rs.getInt("PostID"));
                postDTO.setTitle(rs.getString("Title"));
                postDTO.setDateCreated(rs.getString("DateCreated"));
                postDTO.setDateUpdated(rs.getString("DateUpdated"));
                postDTO.setPostbanner(rs.getString("Postbanner"));
                postDTO.setDescription(rs.getString("Description"));
                postDTO.setContext(rs.getString("Context"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return postDTO;
    }

    public ArrayList<PostDTO> getPostLatest(int postID) {
        String sql = "SELECT TOP(2) * FROM Post WHERE PostID != ? ORDER BY DateCreated DESC";
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostDTO postDTO = new PostDTO();
                postDTO.setPostID(rs.getInt("PostID"));
                postDTO.setTitle(rs.getString("Title"));
                postDTO.setDateCreated(rs.getString("DateCreated"));
                postDTO.setDateUpdated(rs.getString("DateUpdated"));
                postDTO.setPostbanner(rs.getString("Postbanner"));
                postDTO.setDescription(rs.getString("Description"));
                postDTO.setContext(rs.getString("Context"));
                postDTOs.add(postDTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return postDTOs;
    }

    public ArrayList<PostDTO> getAllPostWithCondition(int num) {
        String sql = "";
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        if (num == 0) {
            sql = "SELECT TOP(6) p.PostID, p.Title, p.DateCreated, p.DateUpdated, p.Postbanner, p.Context, p.Description, c.Name\n"
                    + "FROM Post p\n"
                    + "JOIN PostCategory c ON p.PostCategoryID = c.PostCategoryID\n"
                    + "ORDER BY DateCreated DESC";
        } else {
            sql = "SELECT p.PostID, p.Title, p.DateCreated, p.DateUpdated, p.Postbanner, p.Context, p.Description, c.Name\n"
                    + "FROM Post p\n"
                    + "JOIN PostCategory c ON p.PostCategoryID = c.PostCategoryID\n"
                    + "WHERE c.PostCategoryID = ? ORDER BY DateCreated DESC";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (num != 0) {
                st.setInt(1, num);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostDTO postDTO = new PostDTO();
                postDTO.setPostID(rs.getInt("PostID"));
                postDTO.setTitle(rs.getString("Title"));
                postDTO.setDateCreated(rs.getString("DateCreated"));
                postDTO.setDateUpdated(rs.getString("DateUpdated"));
                postDTO.setPostbanner(rs.getString("Postbanner"));
                postDTO.setDescription(rs.getString("Description"));
                postDTO.setContext(rs.getString("Context"));
                postDTO.setPostCate(rs.getString("Name"));
                postDTOs.add(postDTO);
            }
            return postDTOs;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<PostDTO> getPostSearch(String searchKey) {
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder();

        String[] keywords = searchKey.trim().replaceAll("\\s+", " ").split(" ");

        queryBuilder.append("SELECT * FROM Post WHERE ");

        for (int i = 0; i < keywords.length; i++) {
            queryBuilder.append("Title LIKE N'%").append(keywords[i]).append("%'");
            if (i < keywords.length - 1) {
                queryBuilder.append(" OR ");
            }
        }
        queryBuilder.append(";");

        String sql = queryBuilder.toString();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostDTO postDTO = new PostDTO();
                postDTO.setPostID(rs.getInt("PostID"));
                postDTO.setTitle(rs.getString("Title"));
                postDTO.setDateCreated(rs.getString("DateCreated"));
                postDTO.setDateUpdated(rs.getString("DateUpdated"));
                postDTO.setPostbanner(rs.getString("Postbanner"));
                postDTO.setDescription(rs.getString("Description"));
                postDTO.setContext(rs.getString("Context"));
                postDTOs.add(postDTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return postDTOs;
    }

    public int addNewPost(PostDTO pdto) {
        PostCategoryDAO postCategoryDAO = new PostCategoryDAO();
        int categoryId = postCategoryDAO.getCategoryIDByName(pdto.getPostCate());
        System.out.println(pdto.getPostCate());
        System.out.println(categoryId);
        if (categoryId == -1) {
            // Handle invalid category ID
            System.out.println("Invalid Post Category ID");
            return 0;
        }
        String sql = "INSERT INTO [dbo].[Post]\n"
                + "           ([administratorID],\n"
                + "            [Title],\n"
                + "            [DateCreated],\n"
                + "            [DateUpdated],\n"
                + "            [Postbanner],\n"
                + "            [Context],\n"
                + "            [Description],\n"
                + "            [PostCategoryID],\n"
                + "            [updatedBy])\n"
                + "     VALUES\n"
                + "           (?,?,FORMAT(GETDATE(), 'yyyy-MM-dd'),FORMAT(GETDATE(), 'yyyy-MM-dd'),?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pdto.getAdministratorID());
            ps.setString(2, pdto.getTitle());
            ps.setString(3, pdto.getPostbanner());
            ps.setString(4, pdto.getContext());
            ps.setString(5, pdto.getDescription());
            ps.setInt(6, categoryId);
            ps.setInt(7, pdto.getUpdatedBy());
            int checkAdd = ps.executeUpdate();
            return checkAdd;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int deletePostByID(int postID) {
        String sql = "DELETE FROM Post WHERE PostID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, postID);
            int checkDelete = ps.executeUpdate();
            return checkDelete;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public ArrayList<PostDTO> pagingPostWithCondition(int pcateID, int indexPage) {
        String sql = "SELECT p.PostID, p.Title, p.DateCreated, p.DateUpdated, p.Postbanner, p.Context, p.Description, c.Name\n"
                + "FROM Post p\n"
                + "JOIN PostCategory c ON p.PostCategoryID = c.PostCategoryID\n"
                + "WHERE p.PostCategoryID = ?\n"
                + "ORDER BY p.DateCreated DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pcateID);
            st.setInt(2, (indexPage - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostDTO postDTO = new PostDTO();
                postDTO.setPostID(rs.getInt("PostID"));
                postDTO.setTitle(rs.getString("Title"));
                postDTO.setDateCreated(rs.getString("DateCreated"));
                postDTO.setDateUpdated(rs.getString("DateUpdated"));
                postDTO.setPostbanner(rs.getString("Postbanner"));
                postDTO.setDescription(rs.getString("Description"));
                postDTO.setContext(rs.getString("Context"));
                postDTO.setPostCate(rs.getString("Name"));
                postDTOs.add(postDTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return postDTOs;
    }

    public ArrayList<PostDTO> pagingPost(int indexPage) {
        String sql = "SELECT p.PostID, p.Title, p.DateCreated, p.DateUpdated, p.Postbanner, p.Context, p.Description, c.Name\n"
                + "FROM Post p\n"
                + "JOIN PostCategory c ON p.PostCategoryID = c.PostCategoryID\n"
                + "ORDER BY p.DateCreated DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        ArrayList<PostDTO> postDTOs = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (indexPage - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostDTO postDTO = new PostDTO();
                postDTO.setPostID(rs.getInt("PostID"));
                postDTO.setTitle(rs.getString("Title"));
                postDTO.setDateCreated(rs.getString("DateCreated"));
                postDTO.setDateUpdated(rs.getString("DateUpdated"));
                postDTO.setPostbanner(rs.getString("Postbanner"));
                postDTO.setDescription(rs.getString("Description"));
                postDTO.setContext(rs.getString("Context"));
                postDTO.setPostCate(rs.getString("Name"));
                postDTOs.add(postDTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return postDTOs;
    }

    public static void main(String[] args) {
        PostListDAO postListDAO = new PostListDAO();

        // Create a new PostDTO instance with sample data
        PostDTO newPost = new PostDTO();
        newPost.setAdministratorID(1);  // Sample administrator ID
        newPost.setTitle("Sample Post Title");
        newPost.setPostbanner("sample_banner.jpg");
        newPost.setContext("This is a sample post context.");
        newPost.setDescription("This is a sample description.");
        newPost.setPostCate("test");  // Ensure this category exists in your PostCategory table
        newPost.setUpdatedBy(1);  // Sample updater ID

        // Add the new post
        int result = postListDAO.addNewPost(newPost);

        if (result > 0) {
            System.out.println("Post added successfully!");
        } else {
            System.out.println("Failed to add post.");
        }
    }
}
