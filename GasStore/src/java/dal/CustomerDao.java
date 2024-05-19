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
import model.Customer;
/**
 *
 * @author vip2021
 */
public class CustomerDao extends DBContext {
      PreparedStatement stm;
    ResultSet rs;
    List<Customer> list;
    List<AdminDTO> li;
       public List<AdminDTO> getAllAdmin() {
           
        li = new ArrayList<>();
        try {
            String strSelect = "select * from Administrator";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                
                AdminDTO em = new AdminDTO(rs.getInt("adminID"),rs.getString("userName"),rs.getString("password"),rs.getInt("roleID"),rs.getString("email"),rs.getString("img"));
                        li.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return li;
    }
    public List<Customer> getAll() {
        list = new ArrayList<>();
        try {
            String strSelect = "select * from Customer";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                
                Customer em = new Customer(rs.getInt("customerID"),rs.getString("userName"),rs.getString("password"),rs.getString("firstName"),rs.getString("lastName"),rs.getInt("roleID"), rs.getString("phone"),rs.getString("email"));
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
                
                 Customer em = new Customer(rs.getInt("customerID"),rs.getString("userName"),
                         rs.getString("password"),rs.getString("firstName"),
                         rs.getString("lastName"),
                         rs.getInt("roleID"), rs.getString("phone"),rs.getString("email"));
                  return  em;   
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
            stm.setString(1, '%'+name+'%');
            rs = stm.executeQuery();
            while (rs.next()) {
                
                 Customer em = new Customer(rs.getInt("customerID"),rs.getString("userName"),
                         rs.getString("password"),rs.getString("firstName"),
                         rs.getString("lastName"),
                         rs.getInt("roleID"), rs.getString("phone"),rs.getString("email"));
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
        String sql = "update Customer set userName = ? ,password = ?, firstName = ?, lastName = ?, phone = ?,roleID = ?, email = ? where customerID = ?";
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        Timestamp createdTimestamp = Timestamp.valueOf(LocalDateTime.now());
        // Set values for parameters
        preparedStatement.setString(1, customer.getUserName());
        preparedStatement.setString(2, customer.getPassword());

        preparedStatement.setString(3, customer.getFirstName());
        preparedStatement.setString(4, customer.getLastName());
 
        preparedStatement.setString(5, customer.getPhone());
        preparedStatement.setInt(6, customer.getRoleID());
        preparedStatement.setString(7, customer.getEmail());
        preparedStatement.setInt(8, customer.getCustomerID());
         preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void insertCustomer(Customer customer) {
    try {
        String sql = "INSERT INTO Customer (userName, password, firstName, lastName, phone,roleID, email) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        Timestamp createdTimestamp = Timestamp.valueOf(LocalDateTime.now());
        // Set values for parameters
        preparedStatement.setString(1, customer.getUserName());
        preparedStatement.setString(2, customer.getPassword());

        preparedStatement.setString(3, customer.getFirstName());
        preparedStatement.setString(4, customer.getLastName());
 
        preparedStatement.setString(5, customer.getPhone());
        preparedStatement.setInt(6, customer.getRoleID());
        preparedStatement.setString(7, customer.getEmail());
       
        
        // Execute the query
       preparedStatement.executeUpdate();
    } catch (SQLException e) {
        System.out.println("Error inserting customer: " + e.getMessage());
    }
}

    public static void main(String[] args) {
        CustomerDao cus = new CustomerDao();
        
        List<Customer> li = cus.getAll();
        for(Customer l: li){
            System.out.println(l.getUserName());
        }
    }
}
