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
                        rs.getString("img"), rs.getString("name"), rs.getBoolean("isActive"));
                li.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return li;
    }
        public List<Administrator> getAllAdminByName(String name) {

        li = new ArrayList<>();
        try {
            String strSelect = "Select *  from Administrator\n"
                    + "left join Role on Administrator.roleID = Role.roleID where userName like ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, "%"+name.toLowerCase().trim()+"%");
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
            stm.setString(3,"%"+tname+"%");
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
                        rs.getString("userName"), rs.getString("password"),rs.getString("image"),
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
                        rs.getString("password"), rs.getString("image"),rs.getString("firstName"),
                        rs.getString("lastName"),
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
                        rs.getString("password"),rs.getString("image"), rs.getString("firstName"),
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
        String sql = "update Customer set userName = ? ,password = ?, firstName = ?, lastName = ?, phone = ?, email = ?,image = ? where customerID = ?";
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        
            preparedStatement.setString(1, customer.getUserName());
            preparedStatement.setString(2, customer.getPassword());

            preparedStatement.setString(3, customer.getFirstName());
            preparedStatement.setString(4, customer.getLastName());

            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
             preparedStatement.setString(7, customer.getImage());
            preparedStatement.setInt(8, customer.getCustomerID());
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
                        rs.getString("password"), rs.getString("image"),rs.getString("firstName"),
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
            stm.setString(3, "%"+tname+"%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Customer em = new Customer(rs.getInt("customerID"), rs.getString("userName"),
                        rs.getString("password"), rs.getString("image"),rs.getString("firstName"),
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

    public static void main(String[] args) {
       CustomerDao cus = new CustomerDao();
         Customer newCus = new Customer(1,"anhducokok","Qua3CCUdJoXNHnIq6rQW/tVqu1M=",null,"Anh","Duc","0369798003","dpham1874@gmail.com");
         cus.updateUser(newCus);
        Customer cu = cus.getAllByID(1);
        System.out.println(cu.getImage());
    }
}
