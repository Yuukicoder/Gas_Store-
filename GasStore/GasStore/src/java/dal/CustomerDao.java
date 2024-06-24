/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import DTO.AccountDTO;
import DTO.AdminDTO;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Administrator;
import model.Customer;

/**
 *
 * @author vip2021
 */
public class CustomerDao extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Customer> list;
    List<Administrator> li;

    // Admin DAO
    public List<Administrator> getAllAdmin() {

        li = new ArrayList<>();
        try {
            String strSelect = "Select *  from Administrator\n"
                    + "left join Role on Administrator.roleID = Role.roleID";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {

                Administrator em = new Administrator(rs.getInt("administratorID"),
                        rs.getString("userName"), rs.getString("password"),
                        rs.getInt("roleID"), rs.getString("email"),
                        rs.getString("img"), rs.getString("name"), rs.getBoolean("isActive"));
                li.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return li;
    }

    public List<Administrator> getAllAdminByName(String name) {
        List<Administrator> li = new ArrayList<>();
        String[] parts = name.trim().toLowerCase().split("\\s+");

        // Construct the SQL query dynamically for word search
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM Administrator ")
                .append("LEFT JOIN Role ON Administrator.roleID = Role.roleID WHERE ");
        for (int i = 0; i < parts.length; i++) {
            queryBuilder.append("(userName LIKE ? OR email LIKE ? OR name LIKE ?)");
            if (i < parts.length - 1) {
                queryBuilder.append(" OR ");
            }
        }

        boolean hasResults = false;

        try (PreparedStatement stm = connection.prepareStatement(queryBuilder.toString())) {
            // Set the parameters for each part
            for (int i = 0; i < parts.length; i++) {
                String searchPattern = "%" + parts[i] + "%";
                stm.setString(i * 3 + 1, searchPattern);
                stm.setString(i * 3 + 2, searchPattern);
                stm.setString(i * 3 + 3, searchPattern);
            }

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Administrator em = new Administrator(
                            rs.getInt("administratorID"),
                            rs.getString("userName"),
                            rs.getString("password"),
                            rs.getInt("roleID"),
                            rs.getString("email"),
                            rs.getString("img"),
                            rs.getString("name"),
                            rs.getBoolean("isActive")
                    );
                    li.add(em);
                    hasResults = true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        // If no results are found, perform search by individual letters
        if (!hasResults) {
            li.clear();
            parts = name.trim().toLowerCase().split(""); // Split by individual letters

            // Construct the SQL query dynamically for letter search
            queryBuilder = new StringBuilder("SELECT * FROM Administrator ")
                    .append("LEFT JOIN Role ON Administrator.roleID = Role.roleID WHERE ");
            for (int i = 0; i < parts.length; i++) {
                queryBuilder.append("(userName LIKE ? OR email LIKE ? OR name LIKE ?)");
                if (i < parts.length - 1) {
                    queryBuilder.append(" OR ");
                }
            }

            try (PreparedStatement stm = connection.prepareStatement(queryBuilder.toString())) {
                // Set the parameters for each part
                for (int i = 0; i < parts.length; i++) {
                    String searchPattern = "%" + parts[i] + "%";
                    stm.setString(i * 3 + 1, searchPattern);
                    stm.setString(i * 3 + 2, searchPattern);
                    stm.setString(i * 3 + 3, searchPattern);
                }

                try (ResultSet rs = stm.executeQuery()) {
                    while (rs.next()) {
                        Administrator em = new Administrator(
                                rs.getInt("administratorID"),
                                rs.getString("userName"),
                                rs.getString("password"),
                                rs.getInt("roleID"),
                                rs.getString("email"),
                                rs.getString("img"),
                                rs.getString("name"),
                                rs.getBoolean("isActive")
                        );
                        li.add(em);
                    }
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }

        return li;
    }

    public Administrator getAdminByID(int id) {
        list = new ArrayList<>();
        try {
            String strSelect = "Select *  from Administrator\n"
                    + "left join Role on Administrator.roleID = Role.roleID\n"
                    + "where administratorID = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {

                Administrator em = new Administrator(rs.getInt("administratorID"),
                        rs.getString("userName"), rs.getString("password"),
                        rs.getInt("roleID"), rs.getString("email"),
                        rs.getString("img"), rs.getString("name"), rs.getBoolean("isActive"));
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteStaff(String id) {
        String query = "delete from Administrator\n" + "where administratorID = ?";
        try {

            stm = connection.prepareStatement(query);
            stm.setInt(1, Integer.parseInt(id));
            stm.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void updateStaff(Administrator admin) {
        String sql = "UPDATE Administrator SET userName = ?, password = ?, isActive = ?, roleID = ?, email = ?, img = ? WHERE administratorID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            // Set values for parameters
            preparedStatement.setString(1, admin.getUserName());
            preparedStatement.setString(2, admin.getPassword());
            preparedStatement.setBoolean(3, admin.isIsActive());
            preparedStatement.setInt(4, admin.getRoleID());
            preparedStatement.setString(5, admin.getEmail());
            preparedStatement.setString(6, admin.getImg());
            preparedStatement.setInt(7, admin.getAdministratorID());

            // Execute the update
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("An existing admin was updated successfully!");
            } else {
                System.out.println("No admin found with the provided ID.");
            }
        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void insertStaff(Administrator admin) {
        try {
            String sql = "INSERT INTO Administrator (userName, password, isActive,roleID, email,img) "
                    + "VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            // Set values for parameters
            preparedStatement.setString(1, admin.getUserName());
            preparedStatement.setString(2, admin.getPassword());

            preparedStatement.setBoolean(3, admin.isIsActive());
            preparedStatement.setInt(4, admin.getRoleID());

            preparedStatement.setString(5, admin.getEmail());
            preparedStatement.setString(6, admin.getImg());

            // Execute the query
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting customer: " + e.getMessage());
        }
    }

    public int getTotalAdmin() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM Administrator";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public List<Administrator> getPaginatedAdmin(int pageNum, int pageSize) {
        li = new ArrayList<>();
        try {
            String strSelect = "WITH tempTable AS (\n"
                    + "    SELECT ROW_NUMBER() OVER (ORDER BY administratorID) AS rownum, *\n"
                    + "    FROM Administrator\n"
                    + ")\n"
                    + "SELECT * FROM  tempTable\n"
                    + "LEFT JOIN Role ON tempTable.roleID = Role.roleID\n"
                    + "where tempTable.rownum between ? and ?";
            stm = connection.prepareStatement(strSelect);
            int startRow = (pageNum - 1) * pageSize + 1;
            int endRow = startRow + pageSize - 1;
            stm.setInt(1, startRow);
            stm.setInt(2, endRow);
            rs = stm.executeQuery();
            while (rs.next()) {

                Administrator em = new Administrator(rs.getInt("administratorID"),
                        rs.getString("userName"), rs.getString("password"),
                        rs.getInt("roleID"), rs.getString("email"),
                        rs.getString("img"), rs.getString("name"), rs.getBoolean("isActive"));
                li.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return li;
    }

    public List<Administrator> SearchPaginatedAdmin(int pageNum, int pageSize, String tname) {
        li = new ArrayList<>();
        try {
            String strSelect = "WITH tempTable AS (\n"
                    + "    SELECT ROW_NUMBER() OVER (ORDER BY administratorID) AS rownum, *\n"
                    + "    FROM Administrator\n"
                    + ")\n"
                    + "SELECT * FROM  tempTable\n"
                    + "LEFT JOIN Role ON tempTable.roleID = Role.roleID\n"
                    + "where tempTable.rownum between ? and ? and userName like ?";
            stm = connection.prepareStatement(strSelect);
            int startRow = (pageNum - 1) * pageSize + 1;
            int endRow = startRow + pageSize - 1;
            stm.setInt(1, startRow);
            stm.setInt(2, endRow);
            stm.setString(3, "%" + tname + "%");
            rs = stm.executeQuery();
            while (rs.next()) {

                Administrator em = new Administrator(rs.getInt("administratorID"),
                        rs.getString("userName"), rs.getString("password"),
                        rs.getInt("roleID"), rs.getString("email"),
                        rs.getString("img"), rs.getString("name"), rs.getBoolean("isActive"));
                li.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return li;
    }

    /**
     * CustomerDao
     *
     * @return list
     */
    public List<Customer> getAll() {
        list = new ArrayList<>();
        try {
            String strSelect = "select * from Customer";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {

                Customer em = new Customer(rs.getInt("customerID"),
                        rs.getString("userName"), rs.getString("password"), rs.getString("image"),
                        rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("phone"), rs.getString("email"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Customer getAllByID(int id) {
        list = new ArrayList<>();
        try {
            String strSelect = "select * from Customer where customerID = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {

                Customer em = new Customer(rs.getInt("customerID"), rs.getString("userName"),
                        rs.getString("password"), rs.getString("image"), rs.getString("firstName"),
                        rs.getString("lastName"), rs.getString("address"),
                        rs.getString("phone"), rs.getString("email"));
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Customer> getAllByAccount(String name) {
        list = new ArrayList<>();
        try {
            String strSelect = "select * from Customer where userName like ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, '%' + name.toLowerCase().trim() + '%');
            rs = stm.executeQuery();
            while (rs.next()) {

                Customer em = new Customer(rs.getInt("customerID"), rs.getString("userName"),
                        rs.getString("password"), rs.getString("image"), rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("phone"), rs.getString("email"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteAccount(String uid) {
        String query = "delete from Customer\n" + "where customerID = ?";
        try {

            stm = connection.prepareStatement(query);
            stm.setInt(1, Integer.parseInt(uid));
            stm.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void updateUser(Customer customer) {
        String sql = "UPDATE Customer SET userName = ?, password = ?, firstName = ?, lastName = ?, phone = ?, email = ?, image = ?, address = ? WHERE customerID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, customer.getUserName());
            preparedStatement.setString(2, customer.getPassword());
            preparedStatement.setString(3, customer.getFirstName());
            preparedStatement.setString(4, customer.getLastName());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getImage());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getCustomerID());

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertCustomer(Customer customer) {
        try {
            String sql = "INSERT INTO Customer (userName, password, firstName, lastName, phone, email) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            Timestamp createdTimestamp = Timestamp.valueOf(LocalDateTime.now());
            // Set values for parameters
            preparedStatement.setString(1, customer.getUserName());
            preparedStatement.setString(2, customer.getPassword());
//            preparedStatement.setString(3, customer.getImage());

            preparedStatement.setString(3, customer.getFirstName());
            preparedStatement.setString(4, customer.getLastName());

            preparedStatement.setString(5, customer.getPhone());

            preparedStatement.setString(6, customer.getEmail());

            // Execute the query
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting customer: " + e.getMessage());
        }
    }

    public List<Customer> getPaginatedCustomers(int pageNum, int pageSize) {
        list = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY customerID) AS rownum FROM Customer) AS temp WHERE rownum BETWEEN ? AND ?";
            stm = connection.prepareStatement(strSelect);
            int startRow = (pageNum - 1) * pageSize + 1;
            int endRow = startRow + pageSize - 1;
            stm.setInt(1, startRow);
            stm.setInt(2, endRow);
            rs = stm.executeQuery();
            while (rs.next()) {
                Customer em = new Customer(rs.getInt("customerID"), rs.getString("userName"),
                        rs.getString("password"), rs.getString("image"), rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("phone"), rs.getString("email"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Customer> SearchPaginatedCustomers(int pageNum, int pageSize, String tname) {
        list = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY customerID) AS rownum FROM Customer) AS temp WHERE rownum BETWEEN ? AND ? and userName like ?";
            stm = connection.prepareStatement(strSelect);
            int startRow = (pageNum - 1) * pageSize + 1;
            int endRow = startRow + pageSize - 1;
            stm.setInt(1, startRow);
            stm.setInt(2, endRow);
            stm.setString(3, "%" + tname + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Customer em = new Customer(rs.getInt("customerID"), rs.getString("userName"),
                        rs.getString("password"), rs.getString("image"), rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("phone"), rs.getString("email"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalCustomers() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM Customer";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public boolean isUsernameAvailable(String username) {
        String sql = "SELECT COUNT(*) AS count FROM Customer WHERE userName = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("count") == 0;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error checking username availability: " + e.getMessage());
        }
        return false;
    }

    public boolean isAdminAvailable(String username) {
        String sql = "SELECT COUNT(*) AS count FROM Administrator WHERE userName = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("count") == 0;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error checking username availability: " + e.getMessage());
        }
        return false;
    }

    // Helper method to check if email is available
    public boolean isEmailAvailable(String email) {
        String sql = "SELECT COUNT(*) AS count FROM Customer WHERE email = ? ";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("count") == 0;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error checking email availability: " + e.getMessage());
        }
        return false;
    }

    public boolean isEmailAdmin(String email) {
        String sql = "SELECT COUNT(*) AS count FROM Administrator WHERE email = ? ";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("count") == 0;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error checking email availability: " + e.getMessage());
        }
        return false;
    }

    public Customer checkgmail(String Email) {
        String sql = "SELECT [email]\n"
                + "  FROM [dbo].[Customer] where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setEmail(rs.getString("Email"));
                return cus;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer checkuser(String username) {
        String sql = "select [userName] from [Customer] where userName = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setUserName(rs.getString("Username"));
                return cus;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer checkuserandPass(String username, String password) {
        String sql = "SELECT * FROM [Customer] WHERE userName = ? AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer cus = new Customer();
                cus.setCustomerID(rs.getInt("customerID"));
                cus.setUserName(rs.getString("userName"));
                cus.setPassword(rs.getString("password"));
                cus.setImage(rs.getString("image"));
                cus.setFirstName(rs.getString("firstName"));
                cus.setLastName(rs.getString("lastName"));
                cus.setPhone(rs.getString("phone"));
                cus.setAddress(rs.getString("address"));
                cus.setEmail(rs.getString("email"));

//                cus.setIsCustomer(rs.getBoolean("isCustomer"));
                return cus;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updatePassword(String username, String newPassword) {
        String sql = "UPDATE [Customer] SET password = ? WHERE userName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Customer registerCustomer(String firstName, String lastName, String username, String password, String email, String phone, String address) {
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([userName]\n"
                + "           ,[password]\n"
                + "           ,[created]\n"
                + "           ,[lastLogin]\n"
                + "           ,[status]\n"
                + "           ,[gender]\n"
                + "           ,[image]\n"
                + "           ,[firstName]\n"
                + "           ,[lastName]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[email]\n"
                + "           ,[totalMoney]\n"
                + "           ,[isCustomer])\n"
                + "     VALUES\n"
                + "           (?, ?, CURRENT_TIMESTAMP, NULL, 1, NULL, NULL, ?, ?, ?, ?, ?, 0, 1)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.setString(7, email);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        CustomerDao cus = new CustomerDao();
//        Customer c = new Customer(1,"anhducokok")
        Customer c = cus.checkuserandPass("anhducokok", "Qua3CCUdJoXNHnIq6rQW/tVqu1M=");
        System.out.println(c.getImage());
    }
}
