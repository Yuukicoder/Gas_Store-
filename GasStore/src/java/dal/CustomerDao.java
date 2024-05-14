/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
public class CustomerDao extends DBConnect {
      PreparedStatement stm;
    ResultSet rs;
    List<Customer> list;

    public List<Customer> getAll() {
        list = new ArrayList<>();
        try {
            String strSelect = "select * from Customer";
            stm = conn.prepareStatement(strSelect);
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
            stm = conn.prepareStatement(strSelect);
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
       public void deleteAccount(String uid) {
        String query = "delete from Customer\n" + "where customerID = ?";
        try {

            stm = conn.prepareStatement(query);
            stm.setInt(1, Integer.parseInt(uid));
            stm.executeUpdate();

        } catch (Exception e) {
        }
    }
          public void updateUser(Customer customer) {
        String sql = "update Customer set userName = ? ,password = ?, firstName = ?, lastName = ?, phone = ?,roleID = ?, email = ? where customerID = ?";
        try {

            PreparedStatement preparedStatement = conn.prepareStatement(sql);
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
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
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
        
        Customer li = cus.getAllByID(3);
        
            System.out.println(li.getUserName());
        
    }
}
