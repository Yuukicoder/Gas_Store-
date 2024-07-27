/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Product;
import DTO.ProductDTO;
import DTO.SerialNumber;
import DTO.Warranty;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class SerialNumberDAO extends DBcontext {

    public SerialNumber getSerialById(int serialId) {
        String sql = "SELECT * FROM [dbo].[SerialNumbers] where SerialID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, serialId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new SerialNumber(
                        rs.getInt("SerialID"),
                        rs.getInt("ProductID"),
                        rs.getString("SerialNumber")
                );
            }
        } catch (Exception e) {

            System.out.println(e);
        }
        return null;
    }

    public int getSerialIdBySerialNumber(String SerialNumber) {
        String sql = "SELECT * FROM [dbo].[SerialNumbers] where SerialNumber = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, SerialNumber);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("SerialID");
            }
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e);
        }
        return -1;
    }

    public void addSerialNumber(int pId, String SerialNumber) {
        String sql = "insert into SerialNumbers values(?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pId);
            ps.setString(2, SerialNumber);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SerialNumberDAO - addSerialNumber: " + e.getMessage());
        }
    }

    public String getNewestSerialNumber() {
        String sql = "select top 1 SerialNumber\n"
                + "from SerialNumbers\n"
                + "order by SerialNumber desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("SerialNumber");
            }
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e);
        }
        return "";
    }

    public String createSerialNumber(String newestSerialNum) {
        String numberPart = newestSerialNum.replaceAll("\\D", "");
        int number = Integer.parseInt(numberPart) + 1;
        String formattedNumber = String.format("%04d", number);

        return "SN" + formattedNumber;
    }

    public int getTotalProductSerialNumber(int pId) {
        String sql = """
                     select (COUNT(ProductID)) as total
                     from SerialNumbers 
                     where ProductID=?""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e);
        }
        return -1;
    }

    public static void main(String[] args) {
        ProductDAO pDao = new ProductDAO();
        List<Product> pList = pDao.getAllProduct();

        SerialNumberDAO sDao = new SerialNumberDAO();

        for (Product p : pList) {
            int totalSeriNumber = sDao.getTotalProductSerialNumber(p.getProductID());
            if (totalSeriNumber < 25) {
                for (int i = 0; i < 25 - totalSeriNumber; i++) {
                    String newestSerialNum = sDao.createSerialNumber(sDao.getNewestSerialNumber());
                    sDao.addSerialNumber(p.getProductID(), newestSerialNum);
                }
            }
        }
    }
}
