/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author dell456
 */
public class CustomerDAO extends DBcontext{
    public Customer getCustomerByID(int id) {
        String sql = "SELECT * FROM Customer WHERE customerID = ?";
        Customer customer = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setCustomerID(rs.getInt("customerID"));
                customer.setUserName(rs.getString("userName"));
                customer.setPassword(rs.getString("password"));
                customer.setCreated(rs.getDate("created"));
                customer.setLastLogin(rs.getDate("lastLogin"));
                customer.setStatus(rs.getBoolean("status"));
                customer.setGender(rs.getBoolean("gender"));
                customer.setImage(rs.getString("image"));
                customer.setFirstName(rs.getString("firstName"));
                customer.setLastName(rs.getString("lastName"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setTotalMoney(rs.getInt("totalMoney"));
                customer.setEmail(rs.getString("email"));
                customer.setIsCustomer(rs.getBoolean("isCustomer"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return customer;
    }
    
    public static void main(String[] args) {
        CustomerDAO cDAO = new CustomerDAO();
        System.out.println(cDAO.getCustomerByID(10).toString());
    }
    
}
