/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Customer;
import DTO.Discount;
import com.oracle.wls.shaded.org.apache.xalan.lib.ExsltDatetime;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author dell456
 */
public class DiscountDAO extends DBcontext {

    public void addDiscount(String name, String code, String start, String end, int discountAmount, String discountType, int quantity) {
        String sql = "INSERT INTO [dbo].[Discount]\n"
                + "           ([name]\n"
                + "           ,[discountCode]\n"
                + "           ,[startDate]\n"
                + "           ,[endDate]\n"
                + "           ,[discountAmount]\n"
                + "           ,[discountType]\n"
                + "           ,[quantity])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, code);
            ps.setString(3, start);
            ps.setString(4, end);
            ps.setInt(5, discountAmount);
            ps.setString(6, discountType);
            ps.setInt(7, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("DiscountDAO - addDiscount: " + e.getMessage());

        }
    }

    public List<Discount> listDiscount() {
        String sql = "SELECT [discountID]\n"
                + "      ,[name]\n"
                + "      ,[discountCode]\n"
                + "      ,[startDate]\n"
                + "      ,[endDate]\n"
                + "      ,[discountAmount]\n"
                + "      ,[discountType]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Discount] ORDER BY discountID DESC";
        List<Discount> listDiscount = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscountID(rs.getInt(1));
                d.setName(rs.getString(2));
                d.setDiscountCode(rs.getString(3));
                d.setStartDate(rs.getString(4));
                d.setEndDate(rs.getString(5));
                d.setDiscountAmount(rs.getInt(6));
                d.setDiscountType(rs.getString(7));
                d.setQuantity(rs.getInt(8));
                listDiscount.add(d);
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - listDiscount: " + e.getMessage());

        }
        return listDiscount;
    }

    public List<Discount> getidDiscount(String id) {
        String sql = "select discountID, name, discountCode, startDate, endDate, quantity, discountAmount,discountType "
                + "from Discount "
                + "where discountCode = ?";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
//                v.setVourcherID(rs.getInt(1));
//                v.setName(rs.getString(2));
//                v.setVoucherCode(rs.getString(3));
//                v.setStart(rs.getString(4));
//                v.setEnd(rs.getString(5));
//                v.setQuantity(rs.getInt(6));
//                v.setDiscount(rs.getInt(7));
                v.setDiscountID(rs.getInt("discountID"));
                v.setDiscountCode(rs.getString("discountCode"));
                v.setName(rs.getString("name"));
                v.setDiscountAmount(rs.getInt("discountAmount"));
                v.setDiscountType(rs.getString("discountType"));
                v.setStartDate(rs.getDate("startDate").toLocalDate().toString());
                v.setEndDate(rs.getDate("endDate").toLocalDate().toString());
                v.setQuantity(rs.getInt("quantity"));
                lv.add(v);
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - getidDiscount: " + e.getMessage());
        }
        return lv;
    }

    public Discount getDataByName(String name) {
        Discount discount = null;
        String sql = "SELECT * FROM [dbo].[Discount] WHERE [name] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscountID(rs.getInt("discountID"));
                d.setDiscountAmount(rs.getInt("discountAmount"));
                d.setDiscountType(rs.getString("discountType"));
                d.setStartDate(rs.getString("startDate"));
                d.setEndDate(rs.getString("endDate"));
                d.setName(rs.getString("name"));
                d.setQuantity(rs.getInt("quantity"));
                d.setDiscountCode(rs.getString("discountCode"));
                return d;
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - getDataByName: " + e.getMessage());
        }
        return discount;
    }

    public boolean isNameExists(String name) {
        String query = "SELECT COUNT(*) FROM Discount WHERE name = ?";
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - isNameExists: " + e.getMessage());
        }
        return false;
    }

    public boolean isCodeExists(String code) {
        String query = "SELECT COUNT(*) FROM Discount WHERE discountCode = ?";
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, code);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - isCodeExists: " + e.getMessage());
        }
        return false;
    }

    public void updateDiscount(String name, String code, String start, String end, String discountType, int discountAmount, int quantity) {
        String sql = "UPDATE [dbo].[Discount]\n"
                + "SET [name] = ?,\n"
                + "    [startDate] = ?,\n"
                + "    [endDate] = ?,\n"
                + "    [discountType] = ?,\n"
                + "    [discountAmount] = ?,\n"
                + "    [quantity] = ?\n"
                + "WHERE [discountCode] = ?";
        List<Discount> listDiscount = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, start);
            ps.setString(3, end);
            ps.setString(4, discountType);
            ps.setInt(5, discountAmount);
            ps.setInt(6, quantity);
            ps.setString(7, code);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("DiscountDAO - updateDiscount: " + e.getMessage());
        }
    }

    public void deleteDiscount(int id) {
        String sql = "DELETE FROM Discount WHERE discountID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("DiscountDAO - deleteDiscount: " + e.getMessage());
        }
    }

    public List<Discount> getQuantityDiscount(String id) {
        String sql = "select discountID, name,discountCode, startDate, endDate, quantity from Discount where discountCode = ? and quantity = 0";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
//                v.setVourcherID(rs.getInt(1));
                v.setDiscountID(1);
                v.setName(rs.getString(2));
//                v.setVoucherCode(rs.getString(3));
                v.setDiscountCode(rs.getString(3));
//                v.setStart(rs.getString(4));
                v.setStartDate(rs.getString(4));
//                v.setEnd(rs.getString(5));
                v.setEndDate(rs.getString(5));
                v.setQuantity(rs.getInt(6));

                lv.add(v);
            }
        } catch (Exception e) {
        }
        return lv;
    }

    public List<Discount> getDateDiscount(String name, String id) {
        String sql = "select discountID, name,discountCode, startDate, endDate, quantity from Discount where discountCode = ? and endDate >= ? ";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
                v.setDiscountID(1);
                v.setName(rs.getString(2));
//                v.setVoucherCode(rs.getString(3));
                v.setDiscountCode(rs.getString(3));
//                v.setStart(rs.getString(4));
                v.setStartDate(rs.getString(4));
//                v.setEnd(rs.getString(5));
                v.setEndDate(rs.getString(5));
                v.setQuantity(rs.getInt(6));
                lv.add(v);
            }
        } catch (Exception e) {
        }
        return lv;
    }

    public ArrayList<Discount> getAllDiscount() {
        String sql = "  select * from [Discount]";
        ArrayList<Discount> Discounts = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount dis = new Discount();
//                postDTO.setPostID(rs.getInt("PostID"));
//                postDTO.setTitle(rs.getString("Title"));
//                postDTO.setDateCreated(rs.getString("DateCreated"));
//                postDTO.setDateUpdated(rs.getString("DateUpdated"));
//                postDTO.setPostbanner(rs.getString("Postbanner"));
//                postDTO.setDescription(rs.getString("Description"));
//                postDTO.setContext(rs.getString("Context"));
//                postDTO.setPostCate(rs.getString("Name"));
//                dis.setDiscountID(rs.getInt("discountID"));
//                dis.setDiscountCode(rs.getString("discountCode"));
//                dis.setName(rs.getString("name"));
//                dis.setDiscountAmount(rs.getInt("discountAmount"));
                
                dis.setDiscountID(rs.getInt("discountID"));
                dis.setDiscountAmount(rs.getInt("discountAmount"));
                dis.setDiscountType(rs.getString("discountType"));
                dis.setStartDate(rs.getString("startDate"));
                dis.setEndDate(rs.getString("endDate"));
                dis.setName(rs.getString("name"));
                dis.setQuantity(rs.getInt("quantity"));
                dis.setDiscountCode(rs.getString("discountCode"));
                
                Discounts.add(dis);
            }
        } catch (Exception e) {
            System.out.println("PostCategoryDAO - getAllPost: " + e.getMessage());
        }
        return Discounts;
    }

    public List<Discount> getDateStartDiscounts(String name, String id) {
        String sql = "select discountID, name,discountCode, startDate, endDate, quantity from Discount where discountCode = ? and startDate <= ? ";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
                v.setDiscountID(1);
                v.setName(rs.getString(2));
//                v.setVoucherCode(rs.getString(3));
                v.setDiscountCode(rs.getString(3));
//                v.setStart(rs.getString(4));
                v.setStartDate(rs.getString(4));
//                v.setEnd(rs.getString(5));
                v.setEndDate(rs.getString(5));
                v.setQuantity(rs.getInt(6));
                lv.add(v);
            }
        } catch (Exception e) {
        }
        return lv;
    }

    public static void main(String[] args) {
        DiscountDAO discountDAO = new DiscountDAO();
//        System.out.println(discountDAO.isNameExists("hhhh"));
        List<Discount> l = discountDAO.getidDiscount("DBPXUEOCVD");
        for (Discount discount : l) {
            System.out.println(discount.toString());
        }
    }

    public List<Customer> findCustomersBySpending(double minSpending) {
        List<Customer> customers = new ArrayList<>();
        CustomerDAO customerDAO = new CustomerDAO();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            // Tính thời điểm 30 ngày gần đây
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH, -30);
            Date thirtyDaysAgo = calendar.getTime();
            String sql = "SELECT c.customerID, c.firstName, c.lastName, SUM(o.totalMoney) AS totalSpending "
                    + "FROM Customer c "
                    + "JOIN [Order] o ON c.customerID = o.customerID "
                    + "WHERE o.orderDate >= ? "
                    + "  AND o.orderDate <= ? "
                    + "  AND o.status = 3 "
                    + "GROUP BY c.customerID, c.firstName, c.lastName "
                    + "HAVING SUM(o.totalMoney) > ?";
            statement = connection.prepareStatement(sql);
            statement.setTimestamp(1, new java.sql.Timestamp(thirtyDaysAgo.getTime()));
            statement.setTimestamp(2, new java.sql.Timestamp(new Date().getTime())); // Lấy ngày hiện tại
            statement.setDouble(3, minSpending);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customerID");
                Customer customer = customerDAO.getCustomerByID(customerId);
                customers.add(customer);
            }

        } catch (Exception e) {
            System.out.println("Error while fetching customers by spending: " + e.getMessage());
        }
        return customers;
    }

    public List<Customer> findLoyalCustomers(int number) {
        List<Customer> loyalCustomers = new ArrayList<>();
        CustomerDAO customerDAO = new CustomerDAO();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            // Tính thời điểm 30 ngày gần đây
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH, -30);
            Date thirtyDaysAgo = calendar.getTime();
            String query = "SELECT TOP (?) * "
                    + "FROM Customer c "
                    + "WHERE EXISTS ("
                    + "    SELECT 1 "
                    + "    FROM [Order] o "
                    + "    WHERE o.customerID = c.customerID "
                    + "      AND o.orderDate >= ? "
                    + "      AND o.orderDate <= ? "
                    + "      AND o.status = 3 "
                    + ") "
                    + "ORDER BY c.created";
            statement = connection.prepareStatement(query);
            statement.setInt(1, number);
            statement.setTimestamp(2, new java.sql.Timestamp(thirtyDaysAgo.getTime()));
            statement.setTimestamp(3, new java.sql.Timestamp(new Date().getTime())); // Lấy ngày hiện tại

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int customerId = resultSet.getInt("customerID");
                Customer customer = customerDAO.getCustomerByID(customerId);
                loyalCustomers.add(customer);
            }

        } catch (Exception e) {
            System.out.println("Error while fetching loyal customers: " + e.getMessage());
        }
        return loyalCustomers;
    }

    public List<Customer> findNewCustomers() {
        List<Customer> newCustomers = new ArrayList<>();
        CustomerDAO customerDAO = new CustomerDAO();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            // Tính thời điểm 30 ngày gần đây
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH, -30);
            Date thirtyDaysAgo = calendar.getTime();

            String query = "SELECT * "
                    + "FROM Customer "
                    + "WHERE created >= ? ";
            statement = connection.prepareStatement(query);
            statement.setTimestamp(1, new java.sql.Timestamp(thirtyDaysAgo.getTime()));

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int customerId = resultSet.getInt("customerID");
                Customer customer = customerDAO.getCustomerByID(customerId);
                newCustomers.add(customer);
            }

        } catch (Exception e) {
            System.out.println("Error while fetching new customers: " + e.getMessage());
        }
        return newCustomers;
    }

    public List<Discount> pagingDiscount(int index, int numPage) {
        List<Discount> discountList = new ArrayList<>();
        String sql = "SELECT [discountID]\n"
                + "      ,[name]\n"
                + "      ,[discountCode]\n"
                + "      ,[startDate]\n"
                + "      ,[endDate]\n"
                + "      ,[discountAmount]\n"
                + "      ,[discountType]\n"
                + "      ,[quantity]\n"
                + "  FROM Discount\n"
                + "  ORDER BY discountID DESC\n"
                + "  OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            DiscountDAO discountDAO = new DiscountDAO();
            st.setInt(1, (index - 1) * numPage);
            st.setInt(2, numPage);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                Discount discount = discountDAO.getDataByName(name);
                discountList.add(discount);
            }
        } catch (Exception e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }

        return discountList;
    }

    public List<Discount> searchDiscountsPaging(int index, int numPage, String search) {
        List<Discount> discountList = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder();
        DiscountDAO discountDAO = new DiscountDAO();
        // Remove extra spaces and split the search query into words
        String[] keywords = search.trim().replaceAll("\\s+", " ").split(" ");

        queryBuilder.append("SELECT discountID, name, discountCode, startDate, endDate, discountAmount, discountType, quantity ")
                .append("FROM Discount WHERE ");

        // Build the dynamic SQL query for each keyword
        for (int i = 0; i < keywords.length; i++) {
            queryBuilder.append("(name LIKE ? OR discountCode LIKE ?) ");
            if (i < keywords.length - 1) {
                queryBuilder.append("OR ");
            }
        }

        queryBuilder.append("ORDER BY discountID DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        String sql = queryBuilder.toString();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            for (int i = 0; i < keywords.length; i++) {
                st.setString(i * 2 + 1, "%" + keywords[i] + "%");
                st.setString(i * 2 + 2, "%" + keywords[i] + "%");
            }

            // Set the pagination parameters
            st.setInt(keywords.length * 2 + 1, (index - 1) * numPage);
            st.setInt(keywords.length * 2 + 2, numPage == Integer.MAX_VALUE ? Integer.MAX_VALUE : numPage);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                Discount discount = discountDAO.getDataByName(name);
                discountList.add(discount);
            }
        } catch (Exception e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }

        return discountList;
    }

    public List<Discount> getSearchDiscount(String searchKey) {
        List<Discount> discountList = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder();
        DiscountDAO discountDAO = new DiscountDAO();
        // Remove extra spaces and split the search key into words
        String[] keywords = searchKey.trim().replaceAll("\\s+", " ").split(" ");

        queryBuilder.append("SELECT discountID, name, discountCode, startDate, endDate, discountAmount, discountType, quantity ")
                .append("FROM Discount WHERE ");

        for (int i = 0; i < keywords.length; i++) {
            queryBuilder.append("(name LIKE ? OR discountCode LIKE ?) ");
            if (i < keywords.length - 1) {
                queryBuilder.append("OR ");
            }
        }

        queryBuilder.append("ORDER BY discountID DESC");

        String sql = queryBuilder.toString();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            // Set the keyword parameters
            for (int i = 0; i < keywords.length; i++) {
                st.setString(i * 2 + 1, "%" + keywords[i] + "%");
                st.setString(i * 2 + 2, "%" + keywords[i] + "%");
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                Discount discount = discountDAO.getDataByName(name);
                discountList.add(discount);
            }
        } catch (Exception e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }

        return discountList;
    }
}
