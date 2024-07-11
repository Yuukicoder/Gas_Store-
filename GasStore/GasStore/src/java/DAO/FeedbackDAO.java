/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.AccountDTO;
import DTO.Customer;
import DTO.FeedbackDTO;
import DTO.OrderDetail;
import DTO.Product;
import DTO.ProductDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phung
 */
public class FeedbackDAO extends DBcontext {

    public void insertfeedback(String orderid, String productID, String tile, String text, String vode) {
        String sql = "	INSERT INTO [dbo].[Feedback]\n"
                + "           ([OrderID]\n"
                + "           ,[ProductID]\n"
                + "           ,[Title]\n"
                + "           ,[Context]\n"
                + "           ,[StarVoted],status) \n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,? \n"
                + "           ,?,?)";
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setString(1, orderid);
            pt.setString(2, productID);
            pt.setString(3, tile);
            pt.setString(4, text);
//            pt.setString(5, date);
            pt.setString(5, vode);
            pt.setInt(6, 0);
            pt.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public int getCount(int statusFilter) {
        String sql = "SELECT COUNT(*) FROM Feedback WHERE status = ?";

        if (statusFilter == 0) {
            sql = "SELECT COUNT(*) FROM Feedback";
        }

        try (PreparedStatement pt = connection.prepareStatement(sql)) {

            if (statusFilter != 0) {
                pt.setInt(1, statusFilter - 1);
            }

            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void updateFeedbackStatus(String feedbackID, boolean status) {
        String sql = "UPDATE Feedback SET status = ? WHERE feedBackID = ?";

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setBoolean(1, status);
            pt.setString(2, feedbackID);
            pt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateFeedback(String feedbackid, boolean status) {
        String sql = "UPDATE [dbo].[Feedback]\n"
                + "   SET [status] = ?\n"
                + " WHERE FeedbackID = ?";
        try (PreparedStatement pt = connection.prepareStatement(sql)) {

            pt.setBoolean(1, status);
            pt.setString(2, feedbackid);
            int inster = pt.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public ArrayList<FeedbackDTO> getListorder(int id, int indext) {
        String sql = "SELECT F.FeedbackID, A.Fullname,F.DateCreate,F.StarVoted,F.Context ,P.Name FROM Feedback F JOIN Orders O ON F.OrderID = O.OrderID \n"
                + "                        JOIN Account A ON O.AccountID = A.AccountID\n"
                + "						JOIN OrderDetail OO ON O.OrderID = OO.OrderID JOIN Product P ON P.ProductID = OO.ProductID WHERE OO.ProductID = F.ProductID AND F.ProductID = ? ORDER BY F.FeedbackID DESC OFFSET ? ROW  FETCH NEXT 5 ROW ONLY\n"
                + " ";
        ArrayList<FeedbackDTO> al = new ArrayList<>();

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, id);
            pt.setInt(2, (indext - 1) * 5);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {

//                AccountDTO aO = new AccountDTO();
//                aO.setFullname(rs.getString("Fullname"));
//                FeedbackDTO dTO = new FeedbackDTO();
//                dTO.setFeedBackID(rs.getInt("FeedbackID"));
//                dTO.setDate(rs.getDate("DateCreate"));
//                dTO.setStart(rs.getInt("StarVoted"));
//                dTO.setContext(rs.getString("Context"));
//                ProductDTO productDTO = new OrderDetail();
//                productDTO.setName(rs.getString("Name"));
//                dTO.setAccountDTO(aO);
//                dTO.setProductDTO(productDTO);
//                al.add(dTO);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    public int getCount(int id, int prid) {
        String sql = "SELECT Count(*)\n"
                + "FROM Feedback F \n"
                + "JOIN [Order] O ON F.OrderID = O.OrderID \n"
                + "JOIN Customer A ON O.CustomerID = A.CustomerID \n"
                + "JOIN Product P ON P.ProductID = F.ProductID \n"
                + "WHERE A.CustomerID = ? and p.productID = ?;\n"
                + "\n"
                + "\n"
                + "			";
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, id);
            pt.setInt(2, prid);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public ArrayList<FeedbackDTO> getlistfeedback(int index) {
        String sql = "SELECT F.ProductID, F.FeedbackID, F.Status, A.Email, A.firstName + ' ' + A.lastName as FullName, F.StarVoted, F.Context, P.Name "
                + "FROM Feedback F "
                + "JOIN [Order] O ON F.OrderID = O.OrderID "
                + "JOIN Customer A ON O.CustomerID = A.CustomerID "
                + "JOIN Product P ON P.ProductID = F.ProductID "
                + "ORDER BY F.FeedbackID DESC ";
//                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";

        ArrayList<FeedbackDTO> feedbackList = new ArrayList<>();

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
//            pt.setInt(1, (index - 1) * 5);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setFirstName(rs.getString("FullName"));
                customer.setEmail(rs.getString("Email"));

                FeedbackDTO feedbackDTO = new FeedbackDTO();
                feedbackDTO.setProductID(rs.getInt("ProductID"));
                feedbackDTO.setFeedBackID(rs.getInt("FeedbackID"));
                feedbackDTO.setStart(rs.getInt("StarVoted"));
                feedbackDTO.setContext(rs.getString("Context"));
                feedbackDTO.setStatus(rs.getBoolean("Status"));

                Product productDTO = new Product();
                productDTO.setName(rs.getString("Name"));

                feedbackDTO.setAccountDTO(customer);
                feedbackDTO.setProductDTO(productDTO);
                feedbackDTO.setProductID(productDTO.getProductID());
                feedbackDTO.setProductDTO(productDTO);
                feedbackList.add(feedbackDTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return feedbackList;
    }

    public ArrayList<FeedbackDTO> getlistfeedback1(int index, int filter) {
        String sql = "SELECT F.ProductID, F.FeedbackID, F.Status, A.Email, A.firstName + ' ' + A.lastName as FullName, F.StarVoted, F.Context, P.Name, P.image "
                + "FROM Feedback F "
                + "JOIN [Order] O ON F.OrderID = O.OrderID "
                + "JOIN Customer A ON O.CustomerID = A.CustomerID "
                + "JOIN Product P ON P.ProductID = F.ProductID ";

        // Nếu filter là 1 hoặc 2, thêm điều kiện WHERE
        if (filter == 1 || filter == 2) {
            sql += "WHERE F.status = ? ";
        }

        sql += "ORDER BY F.FeedbackID DESC "
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";

        ArrayList<FeedbackDTO> feedbackList = new ArrayList<>();

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            int parameterIndex = 1;

            // Nếu filter là 1 hoặc 2, thiết lập tham số
            if (filter == 1) {
                pt.setInt(parameterIndex++, filter);
            } else if (filter == 2) {
                pt.setInt(parameterIndex++, 0);
            }

            pt.setInt(parameterIndex, (index - 1) * 5);

            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setFirstName(rs.getString("FullName"));
                customer.setEmail(rs.getString("Email"));

                FeedbackDTO feedbackDTO = new FeedbackDTO();
                feedbackDTO.setProductID(rs.getInt("ProductID"));
                feedbackDTO.setFeedBackID(rs.getInt("FeedbackID"));
                feedbackDTO.setStart(rs.getInt("StarVoted"));
                feedbackDTO.setContext(rs.getString("Context"));
                feedbackDTO.setStatus(rs.getBoolean("Status"));

                Product productDTO = new Product();
                productDTO.setName(rs.getString("Name"));
                productDTO.setImage(rs.getString("image"));

                feedbackDTO.setAccountDTO(customer);
                feedbackDTO.setProductDTO(productDTO);

                feedbackList.add(feedbackDTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return feedbackList;
    }

    public int getCount() {
        String sql = " select count(*) from Feedback";
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public ArrayList<FeedbackDTO> getFeedbackByProductId(int productId) {
        String sql = "SELECT F.FeedbackID, F.StarVoted, F.Context, P.Name as ProductName, A.FirstName+ ' '+A.LastName as FirstName, A.Email "
                + "FROM Feedback F "
                + "JOIN [Order] O ON F.OrderID = O.OrderID "
                + "JOIN Customer A ON O.CustomerID = A.CustomerID "
                + "JOIN Product P ON P.ProductID = F.ProductID "
                + "WHERE P.ProductID = ? "
                + "ORDER BY F.FeedbackID ";

        ArrayList<FeedbackDTO> feedbackList = new ArrayList<>();

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, productId);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setFirstName(rs.getString("FirstName"));
                customer.setEmail(rs.getString("Email"));

                FeedbackDTO feedbackDTO = new FeedbackDTO();
                feedbackDTO.setFeedBackID(rs.getInt("FeedbackID"));
                feedbackDTO.setStart(rs.getInt("StarVoted"));
                feedbackDTO.setContext(rs.getString("Context"));
//            feedbackDTO.setStatus(rs.getBoolean("Status"));

                Product product = new Product();
                product.setName(rs.getString("ProductName"));

                feedbackDTO.setAccountDTO(customer);
                feedbackDTO.setProductDTO(product);

                feedbackList.add(feedbackDTO);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving feedback: " + e.getMessage());
        }

        return feedbackList;
    }

    public ArrayList<FeedbackDTO> getFeedbackByProductId1(int productId) {
        String sql = "SELECT F.FeedbackID, F.StarVoted, F.Context, P.Name as ProductName,P.image, A.FirstName+ ' '+A.LastName as FirstName, A.Email "
                + "FROM Feedback F "
                + "JOIN [Order] O ON F.OrderID = O.OrderID "
                + "JOIN Customer A ON O.CustomerID = A.CustomerID "
                + "JOIN Product P ON P.ProductID = F.ProductID "
                + "WHERE P.ProductID = ? "
                + "ORDER BY F.FeedbackID ";

        ArrayList<FeedbackDTO> feedbackList = new ArrayList<>();

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, productId);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setFirstName(rs.getString("FirstName"));
                customer.setEmail(rs.getString("Email"));

                FeedbackDTO feedbackDTO = new FeedbackDTO();
                feedbackDTO.setFeedBackID(rs.getInt("FeedbackID"));
                feedbackDTO.setStart(rs.getInt("StarVoted"));
                feedbackDTO.setContext(rs.getString("Context"));
//            feedbackDTO.setStatus(rs.getBoolean("Status"));

                Product product = new Product();
                product.setName(rs.getString("ProductName"));
                product.setImage(rs.getString("image"));
                feedbackDTO.setAccountDTO(customer);
                feedbackDTO.setProductDTO(product);

                feedbackList.add(feedbackDTO);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving feedback: " + e.getMessage());
        }

        return feedbackList;
    }

    public ArrayList<FeedbackDTO> getFeedbackById(int productId) {
        String sql = "SELECT F.FeedbackID, F.StarVoted, F.Context, P.Name as ProductName,P.image, A.FirstName+ ' '+A.LastName as FirstName, A.Email "
                + "FROM Feedback F "
                + "JOIN [Order] O ON F.OrderID = O.OrderID "
                + "JOIN Customer A ON O.CustomerID = A.CustomerID "
                + "JOIN Product P ON P.ProductID = F.ProductID "
                + "WHERE A.CustomerID = ? "
                + "ORDER BY F.FeedbackID ";

        ArrayList<FeedbackDTO> feedbackList = new ArrayList<>();

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, productId);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setFirstName(rs.getString("FirstName"));
                customer.setEmail(rs.getString("Email"));

                FeedbackDTO feedbackDTO = new FeedbackDTO();
                feedbackDTO.setFeedBackID(rs.getInt("FeedbackID"));
                feedbackDTO.setStart(rs.getInt("StarVoted"));
                feedbackDTO.setContext(rs.getString("Context"));
//            feedbackDTO.setStatus(rs.getBoolean("Status"));

                Product product = new Product();
                product.setName(rs.getString("ProductName"));
                product.setImage(rs.getString("image"));
                feedbackDTO.setAccountDTO(customer);
                feedbackDTO.setProductDTO(product);

                feedbackList.add(feedbackDTO);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving feedback: " + e.getMessage());
        }

        return feedbackList;
    }

    public List<FeedbackDTO> getListFeedback(int index, int statusFilter) {
        List<FeedbackDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE status = ? LIMIT ?, 5";

        if (statusFilter == 0) {
            sql = "SELECT * FROM Feedback LIMIT ?, 5";
        }

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            if (statusFilter != 0) {
                ps.setInt(1, statusFilter - 1);
                ps.setInt(2, (index - 1) * 5);
            } else {
                ps.setInt(1, (index - 1) * 5);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FeedbackDTO feedback = new FeedbackDTO();
                Customer cus = new Customer();
                feedback.setFeedBackID(rs.getInt("feedBackID"));
                cus.setCustomerID(rs.getInt("accountID"));
                feedback.setProductID(rs.getInt("productID"));
                feedback.setContext(rs.getString("context"));
//                feedback.setDate(rs.getString("date"));
                feedback.setStatus(rs.getBoolean("status"));
                list.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<FeedbackDTO> checkfeedback(int OrderID, int ProductID) {
        String sql = "  SELECT   [FeedbackID]\n"
                + "      ,[OrderID]\n"
                + "      ,[ProductID]\n"
                + "     \n"
                + "  FROM Feedback  where OrderID = ? and ProductID = ?";
        ArrayList<FeedbackDTO> al = new ArrayList<>();

        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, OrderID);
            pt.setInt(2, ProductID);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                FeedbackDTO dTO = new FeedbackDTO();
                dTO.setOrderID(rs.getInt("OrderID"));
                dTO.setProductID(rs.getInt("ProductID"));
                al.add(dTO);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return al;
    }
    // Create

    public void insertFeedback(FeedbackDTO feedback) {
        String sql = "INSERT INTO [dbo].[Feedback] "
                + "([OrderID], [ProductID], [Title], [Context], [StarVoted], [Status]) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, feedback.getOrderID());
            pt.setInt(2, feedback.getProductID());
            pt.setString(3, feedback.getTilte());
            pt.setString(4, feedback.getContext());
            pt.setInt(5, feedback.getStart());
            pt.setBoolean(6, feedback.isStatus());
            pt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Read
    public FeedbackDTO getFeedbackByID(int feedbackID) {
        String sql = "SELECT * FROM Feedback WHERE FeedbackID = ?";
        FeedbackDTO feedback = null;
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, feedbackID);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                feedback = new FeedbackDTO();
                feedback.setFeedBackID(rs.getInt("FeedbackID"));
                feedback.setOrderID(rs.getInt("OrderID"));
                feedback.setProductID(rs.getInt("ProductID"));
                feedback.setTilte(rs.getString("Title"));
                feedback.setContext(rs.getString("Context"));
                feedback.setStart(rs.getInt("StarVoted"));
                feedback.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return feedback;
    }

    public List<FeedbackDTO> getFeedbackByProductID(int productID) {
        String sql = "SELECT * FROM Feedback WHERE ProductID = ?";
        List<FeedbackDTO> feedbackList = new ArrayList<>();
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, productID);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                FeedbackDTO feedback = new FeedbackDTO();
                feedback.setFeedBackID(rs.getInt("FeedbackID"));
                feedback.setOrderID(rs.getInt("OrderID"));
                feedback.setProductID(rs.getInt("ProductID"));
                feedback.setTilte(rs.getString("Title"));
                feedback.setContext(rs.getString("Context"));
                feedback.setStart(rs.getInt("StarVoted"));
                feedback.setStatus(rs.getBoolean("Status"));
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return feedbackList;
    }

    public List<FeedbackDTO> getFeedbackByAccountID(int accountID) {
        String sql = "SELECT F.* FROM Feedback F "
                + "JOIN [Order] O ON F.OrderID = O.OrderID "
                + "JOIN Customer A ON O.CustomerID = A.CustomerID "
                + "WHERE A.CustomerID = ?";
        List<FeedbackDTO> feedbackList = new ArrayList<>();
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, accountID);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                FeedbackDTO feedback = new FeedbackDTO();
                feedback.setFeedBackID(rs.getInt("FeedbackID"));
                feedback.setOrderID(rs.getInt("OrderID"));
                feedback.setProductID(rs.getInt("ProductID"));
                feedback.setTilte(rs.getString("Title"));
                feedback.setContext(rs.getString("Context"));
                feedback.setStart(rs.getInt("StarVoted"));
                feedback.setStatus(rs.getBoolean("Status"));
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return feedbackList;
    }

    // Update
    public void updateFeedback(FeedbackDTO feedback) {
        String sql = "UPDATE Feedback SET "
                + "OrderID = ?, ProductID = ?, Title = ?, Context = ?, StarVoted = ?, Status = ? "
                + "WHERE FeedbackID = ?";
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, feedback.getOrderID());
            pt.setInt(2, feedback.getProductID());
            pt.setString(3, feedback.getTilte());
            pt.setString(4, feedback.getContext());
            pt.setInt(5, feedback.getStart());
            pt.setBoolean(6, feedback.isStatus());
            pt.setInt(7, feedback.getFeedBackID());
            pt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    // Delete
    public void deleteFeedback(int feedbackID) {
        String sql = "DELETE FROM Feedback WHERE FeedbackID = ?";
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, feedbackID);
            pt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public boolean hasFeedback(int productId, int orderId, int id) {
        String query = "SELECT COUNT(*) FROM feedback\n"
                + "inner join [Order] o on o.orderID = Feedback.OrderID\n"
                + "WHERE ProductID = ? AND o.OrderID = ? and CustomerID = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, productId);
            ps.setInt(2, orderId);
            ps.setInt(3, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0; // Trả về true nếu có ít nhất một dòng kết quả
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        FeedbackDAO fdao = new FeedbackDAO();
//        System.out.println(fdao.getListorder(1, 1).toString());
        ArrayList<FeedbackDTO> li = fdao.getFeedbackById(1);
        for (FeedbackDTO l : li) {
            System.out.println(l.getProductDTO().getImage());
        }
    }

}
