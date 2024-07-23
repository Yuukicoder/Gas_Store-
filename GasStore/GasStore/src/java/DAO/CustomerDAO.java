/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
                customer.setTotalPoint(rs.getInt("totalPoint"));
                customer.setMemberShipTier(rs.getInt("memberShipTier"));
            }
        } catch (Exception e) {
            System.out.println("CustomerDAO - getCustomerByID: " + e.getMessage());
        }

        return customer;
    }
    public void updateCustomerAddress(int id, String newAddress) {
        String sql = "UPDATE Customer SET address = ? WHERE customerID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newAddress);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("CustomerDAO - updateCustomerAddress: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        CustomerDAO cDAO = new CustomerDAO();
        System.out.println(cDAO.getCustomerByID(1).toString());
    }
    
    public void updateCustomerMemberShip(Customer c) {
        String sql = "UPDATE Customer SET isMember = 1 WHERE customerID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getCustomerID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("CustomerDAO - updateCustomerMemberShip: " + e.getMessage());
        }
    }

    public ArrayList<Customer> SearchMember(String s) {
        String sql = "select * from Customer where (firstName + lastName like ?)";
        ArrayList<Customer> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + s + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
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
                customer.setTotalPoint(rs.getInt("totalPoint"));
                customer.setMemberShipTier(rs.getInt("memberShipTier"));

                list.add(customer);
            }
        } catch (Exception e) {
            System.out.println("CustomerDAO - SearchMember: " + e.getMessage());
        }

        return list;
    }

    public ArrayList<Customer> pagging(int pageIndex, int pageSize, String search) {
        String sql = "select * from Customer where (firstName + lastName like ?) order by customerID offset ? rows fetch next ? rows only";
        ArrayList<Customer> lc = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, (pageIndex - 1) * pageSize);
            ps.setInt(3, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id;
                id = rs.getInt("customerID");

                Customer c = getCustomerByID(id);
                lc.add(c);
            }
        } catch (SQLException e) {
            System.out.println("CustomerDAO - pagging: " + e.getMessage());
        }
        return lc;
    }
    
    public void updateCustomerTotalPoint(int id, int newPoint) {
        String sql = "UPDATE Customer SET totalPoint = ? WHERE customerID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newPoint);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("CustomerDAO - updateCustomerTotalPoint: " + e.getMessage());
        }
    }
    
    public void updateCustomerTier(int id, int tierId) {
        String sql = "UPDATE Customer SET memberShipTier = ? WHERE customerID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, tierId);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("CustomerDAO - updateCustomerTier: " + e.getMessage());
        }
    }
    
}
