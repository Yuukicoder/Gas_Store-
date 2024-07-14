/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Supplier;
import DTO.Supplier;
import DTO.Supplier;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author dell456
 */
public class SupplierDAO extends DBcontext{
    public Supplier getSupplierByID(int supplierID) {
        String sql = "SELECT * FROM Supplier WHERE supplierId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplierID);
            ResultSet resultSet = st.executeQuery();
            Supplier supplier = new Supplier();
            if (resultSet.next()) {
                    supplier.setSupplierID(resultSet.getInt("supplierID"));
                    supplier.setCompanyName(resultSet.getString("companyName"));
                    supplier.setStatus(resultSet.getBoolean("status"));
                    supplier.setCreatedDate(resultSet.getString("createdDate"));
                    supplier.setEmail(resultSet.getString("email"));
                    supplier.setPhone(resultSet.getString("phone"));
                    supplier.setHomePage(resultSet.getString("homePage"));
            }
            return supplier;
        } catch (SQLException e) {
            System.out.println("SupplierDAO - getSupplierByID: " + e.getMessage());
        }
        return null;
    }
    
    public List<Supplier> getAllSupplier() {
        String sql = "SELECT * FROM Supplier";
        ArrayList<Supplier> lc = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                Supplier supplier = new Supplier();
                supplier.setSupplierID(resultSet.getInt("supplierID"));
                supplier.setCompanyName(resultSet.getString("companyName"));
                supplier.setStatus(resultSet.getBoolean("status"));
                supplier.setCreatedDate(resultSet.getString("createdDate"));
                supplier.setEmail(resultSet.getString("email"));
                supplier.setPhone(resultSet.getString("phone"));
                supplier.setHomePage(resultSet.getString("homePage"));
                lc.add(supplier);
            }
        } catch (SQLException e) {
            System.out.println("SupplierDAO - getAllSupplier: " + e.getMessage());
        }
        return lc;
    }
    
    public static void main(String[] args) {
        SupplierDAO s = new SupplierDAO();
        System.out.println(s.getSupplierByID(1).toString());
        List<Supplier> list = s.getAllSupplier();
        for (Supplier supplier : list) {
            System.out.println(supplier.toString());
        }
    }
            
}
