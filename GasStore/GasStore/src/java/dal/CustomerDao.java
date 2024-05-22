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
                        rs.getString("img"), rs.getString("name"),rs.getBoolean("isActive"));
                li.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
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
                        rs.getString("img"), rs.getString("name"),rs.getBoolean("isActive"));
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
        String sql = "update Administrator set userName = ? ,password = ?, isActive = ?, roleID = ?, email = ? where administratorID = ?";
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        Timestamp createdTimestamp = Timestamp.valueOf(LocalDateTime.now());
            // Set values for parameters
           
             preparedStatement.setString(1, admin.getUserName());
            preparedStatement.setString(2, admin.getPassword());

            preparedStatement.setBoolean(3, admin.isIsActive());
            preparedStatement.setInt(4, admin.getRoleID());

            preparedStatement.setString(5, admin.getEmail());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insertStaff(Administrator admin) {
        try {
            String sql = "INSERT INTO Administrator (userName, password, isActive,roleID, email) "
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            // Set values for parameters
            preparedStatement.setString(1, admin.getUserName());
            preparedStatement.setString(2, admin.getPassword());

            preparedStatement.setBoolean(3, admin.isIsActive());
            preparedStatement.setInt(4, admin.getRoleID());

            preparedStatement.setString(5, admin.getEmail());


            // Execute the query
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting customer: " + e.getMessage());
        }
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
                        rs.getString("userName"), rs.getString("password"),
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
                        rs.getString("password"), rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getBoolean("isCustomer"), rs.getString("phone"), rs.getString("email"));
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
            stm.setString(1, '%' + name + '%');
            rs = stm.executeQuery();
            while (rs.next()) {

                Customer em = new Customer(rs.getInt("customerID"), rs.getString("userName"),
                        rs.getString("password"), rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getBoolean("isCustomer"), rs.getString("phone"), rs.getString("email"));
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
        String sql = "update Customer set userName = ? ,password = ?, firstName = ?, lastName = ?, phone = ?, email = ? where customerID = ?";
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        Timestamp createdTimestamp = Timestamp.valueOf(LocalDateTime.now());
            // Set values for parameters
            preparedStatement.setString(1, customer.getUserName());
            preparedStatement.setString(2, customer.getPassword());

            preparedStatement.setString(3, customer.getFirstName());
            preparedStatement.setString(4, customer.getLastName());

            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setInt(7, customer.getCustomerID());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insertCustomer(Customer customer) {
        try {
            String sql = "INSERT INTO Customer (userName, password, firstName, lastName, phone, email) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            Timestamp createdTimestamp = Timestamp.valueOf(LocalDateTime.now());
            // Set values for parameters
            preparedStatement.setString(1, customer.getUserName());
            preparedStatement.setString(2, customer.getPassword());

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
                    rs.getString("password"), rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getBoolean("isCustomer"), rs.getString("phone"), rs.getString("email"));
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

    public static void main(String[] args) {
        CustomerDao cus = new CustomerDao();
        System.out.println(cus.isUsernameAvailable("abc"));
//        System.out.println(Boolean.parseBoolean("false"));
    }
}

