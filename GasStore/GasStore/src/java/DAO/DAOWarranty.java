/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Customer;
import DTO.OrderDetail;
import DTO.ProductDTO;
import DTO.Warranty;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell456
 */
public class DAOWarranty extends DBcontext {

    public boolean insertWarranty(Warranty war) {
        String sql = "INSERT INTO [dbo].[Warranties]\n"
                + "           ([SerialID]\n"
                + "           ,[CreateDate]\n"
                + "           ,[CustomerID]\n"
                + "           ,[ProofImg]\n"
                + "           ,[Notes]"
                + "           ,[Process_by]"
                + "           ,[status])\n"
                + "     VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, war.getSerialID());
            ps.setDate(2, (Date) war.getCreateDate());
            ps.setInt(3, war.getCustomerID());
            ps.setString(4, war.getProofImg());
            ps.setString(5, war.getNotes());
            ps.setInt(6, war.getProcess_By());
            ps.setString(7, war.getStatus());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean insertWarrantyByCus(Warranty war) {
        System.out.println("war: " + war);
        String sql = "INSERT INTO [dbo].[Warranties]\n"
                + "           ([SerialID] "
                + "           ,[CreateDate] "
                + "           ,[CustomerID] "
                + "           ,[ProofImg] "
                + "           ,[Notes]"
                + "           ,[Status],"
                + "            [expectedDate]) "
                + "     VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, war.getSerialID());
            ps.setDate(2, (Date) war.getCreateDate());
            ps.setInt(3, war.getCustomerID());
            ps.setString(4, war.getProofImg());
            ps.setString(5, war.getNotes());
            ps.setString(6, war.getStatus());
            ps.setDate(7, (Date) war.getExpectedDate());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Warranty> getAllWarranty() {
        String sql = "Select * from [dbo].[Warranties]";
        List<Warranty> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt("WarrantyID"), rs.getInt("SerialID"),
                        rs.getInt("customerID"), rs.getInt("Process_By"),
                        rs.getString("ProofImg"), rs.getString("Notes"), rs.getString("Status"),
                        rs.getDate("CreateDate"), rs.getDate("ReciverDate"), rs.getDate("DoneDate"),
                        rs.getDate("expectedDate")));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Warranty getWarrantyById(int warId) {
        String sql = "Select * from [dbo].[Warranties] where WarrantyID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, warId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Warranty(
                        rs.getInt("WarrantyID"), rs.getInt("SerialID"),
                        rs.getInt("customerID"), rs.getInt("Process_By"),
                        rs.getString("ProofImg"), rs.getString("Notes"),
                        rs.getString("Status"),
                        rs.getDate("CreateDate"),
                        rs.getDate("ReciverDate"),
                        rs.getDate("DoneDate"),
                        rs.getDate("expectedDate")
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Warranty> getAllWarrantyWithSerial() {
        String sql = "Select * from Warranties W join SerialNumbers S on W.SerialID = S.SerialID";
        List<Warranty> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt("WarrantyID"), rs.getInt("SerialID"),
                        rs.getInt("customerID"), rs.getInt("Process_By"),
                        rs.getString("ProofImg"), rs.getString("Notes"), rs.getString("Status"),
                        rs.getDate("CreateDate"), rs.getDate("ReciverDate"), rs.getDate("DoneDate"),
                        rs.getDate("expectedDate"), rs.getString("SerialNumber")));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Warranty> getAllWarrantyBySerial(int serialId) {
        String sql = "Select * from Warranties W join SerialNumbers S on W.SerialID = S.SerialID"
                + " where W.SerialID = ?";
        List<Warranty> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, serialId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt("WarrantyID"), rs.getInt("SerialID"),
                        rs.getInt("customerID"), rs.getInt("Process_By"),
                        rs.getString("ProofImg"), rs.getString("Notes"), rs.getString("Status"),
                        rs.getDate("CreateDate"), rs.getDate("ReciverDate"), rs.getDate("DoneDate"),
                        rs.getDate("expectedDate"), rs.getString("SerialNumber")));
            }
            return list;
        } catch (Exception e) {
            System.out.println("DAO.DAOWarranty.getAllWarrantyBySerial()");
            System.out.println(e);
        }
        return null;
    }

    public List<Warranty> getWarrantyBySerialId(int serialId) {
        String sql = "Select * from [dbo].[Warranties] where SerialID = ?";
        List<Warranty> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, serialId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(
                        rs.getInt("WarrantyID"), rs.getInt("SerialID"),
                        rs.getInt("customerID"), rs.getInt("Process_By"),
                        rs.getString("ProofImg"), rs.getString("Notes"),
                        rs.getString("Status"),
                        rs.getDate("CreateDate"),
                        rs.getDate("ReciverDate"),
                        rs.getDate("DoneDate"),
                        rs.getDate("expectedDate")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateWarrantyStatusAccept(Warranty war) {
        String sql = "UPDATE Warranties\n"
                + "SET Status = ?, expectedDate = ?, ReciverDate = ?, Process_By = ?\n"
                + "WHERE WarrantyID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, war.getStatus());
            ps.setDate(2, (Date) war.getExpectedDate());
            ps.setDate(3, (Date) war.getReciverDate());
            ps.setInt(4, war.getProcess_By());
            ps.setInt(5, war.getWarrantyID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateWarrantyStatus(Warranty war) {
        String sql = "UPDATE Warranties\n"
                + "SET Status = ?, DoneDate = ?\n"
                + "WHERE WarrantyID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, war.getStatus());
            ps.setDate(2, (Date) war.getDoneDate());
            ps.setInt(3, war.getWarrantyID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Customer getCustomerBySerialId(int serialId) {
        String sql = "  Select * from Customer C\n"
                + "  join [Order] O on C.customerID = O.customerID\n"
                + "  join [OrderDetails] OD on OD.orderID = O.orderID\n"
                + "  where OD.serialID = ?";
        List<Warranty> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, serialId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt("customerID"), rs.getString("userName"),
                        rs.getString("address"), rs.getString("email"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getEmployeeIdBySerialId(int serialId) {
        String sql = "SELECT top(1) Process_By FROM Warranties W\n"
                + "join Customer C on C.customerId = W.Process_By\n"
                + "where W.SerialID = ?";
        List<Warranty> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, serialId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("Process_By");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public int countNumberOfProductInWarrantyList(int productID) {
        String sql = """
                     select COUNT(*) as Total
                     from Warranties w
                     inner join SerialNumbers s
                     on w.SerialID = s.SerialID
                     where ProductID = ?""";
        int sum = 0; 
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                sum = rs.getInt(1);
                return sum;
            }
        } catch (Exception e) {
            System.out.println("countNumberOfProductInWarrantyList:" + e.getMessage());
        }
        return sum;
    }
    
    public static void main(String[] args) {
        DAOWarranty dao = new DAOWarranty();
        ProductDAO pDAO = new ProductDAO();
        ProductDTO pro = pDAO.getProductBySeriaId(111);
        System.out.println(pro.getStockQuantity());
    }
}
