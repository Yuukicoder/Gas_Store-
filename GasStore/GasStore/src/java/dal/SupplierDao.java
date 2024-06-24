/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import model.Administrator;
import model.Customer;
import model.Supplier;

/**
 *
 * @author vip2021
 */
public class SupplierDao extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Supplier> list;
    List<Administrator> li;

    // Admin DAO
    public List<Supplier> getAll() {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from Supplier";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {

                Supplier em = new Supplier(rs.getInt("supplierId"),
                        rs.getString("companyName"), rs.getBoolean("status"),
                        rs.getDate("createdDate"), rs.getString("email"),
                        rs.getString("phone"), rs.getString("homePage"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     public List<Supplier> getAllAdminByName(String name) {
         
        list = new ArrayList<>();
         String[] chars = name.trim().toLowerCase().split(" ");
        
        // Construct the SQL query dynamically
           // Split the input string based on spaces
        String[] parts = name.trim().toLowerCase().split("\\s+");

        // Construct the SQL query dynamically
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM Supplier WHERE ");
        for (int i = 0; i < parts.length; i++) {
            queryBuilder.append("(companyName LIKE ? OR email LIKE ? OR homePage LIKE ?)");
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
                    Supplier supplier = new Supplier(
                        rs.getInt("supplierId"),
                        rs.getString("companyName"),
                        rs.getBoolean("status"),
                        rs.getDate("createdDate"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("homePage")
                    );
                    list.add(supplier);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalSupplier() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM Supplier";
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

    public Supplier getSupplierByID(int id) {
        list = new ArrayList<>();
        try {
            String strSelect = "Select * from Supplier where supplierId = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {

                Supplier em = new Supplier(rs.getInt("supplierId"),
                        rs.getString("companyName"), rs.getBoolean("status"),
                        rs.getDate("createdDate"), rs.getString("email"),
                        rs.getString("phone"), rs.getString("homePage"));
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteSupplier(String id) {
        String query = "delete from Supplier\n" 
                + "where supplierId = ?";
        try {

            stm = connection.prepareStatement(query);
            stm.setInt(1, Integer.parseInt(id));
            stm.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void updateSupplier(Supplier s) {
        String sql = "update Supplier set companyName = ? , email= ?, phone = ?, homePage =?  where supplierId = ?";
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        Timestamp createdTimestamp = Timestamp.valueOf(LocalDateTime.now());
            // Set values for parameters

            preparedStatement.setString(1, s.getCompanyName());
            preparedStatement.setString(2, s.getEmail());

            preparedStatement.setString(3, s.getPhone());
            preparedStatement.setString(4, s.getHomePage());

            preparedStatement.setInt(5, s.getSupplierId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insertSupplier(Supplier s) {
        try {
            String sql = "INSERT INTO Supplier (companyName, email, phone,homePage) "
                    + "VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            // Set values for parameters
            preparedStatement.setString(1, s.getCompanyName());
            preparedStatement.setString(2, s.getEmail());

            preparedStatement.setString(3, s.getPhone());
            preparedStatement.setString(4, s.getHomePage());


            // Execute the query
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting customer: " + e.getMessage());
        }
    }
  public int getTotal() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM Supplier";
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

    public List<Supplier> getPaginated(int pageNum, int pageSize) {
        list = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY supplierId) AS rownum FROM Supplier) AS temp WHERE rownum BETWEEN ? AND ?";
            stm = connection.prepareStatement(strSelect);
            int startRow = (pageNum - 1) * pageSize + 1;
            int endRow = startRow + pageSize - 1;
            stm.setInt(1, startRow);
            stm.setInt(2, endRow);
            rs = stm.executeQuery();
            while (rs.next()) {
                Supplier em = new Supplier(rs.getInt("supplierId"),
                        rs.getString("companyName"), rs.getBoolean("status"),
                        rs.getDate("createdDate"), rs.getString("email"),
                        rs.getString("phone"), rs.getString("homePage"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        SupplierDao sus = new SupplierDao();
        List<Supplier> li = sus.getAllAdminByName("a");
        for(Supplier l: li){
            System.out.println(l.getCompanyName());
        }
        
        
    }
}
