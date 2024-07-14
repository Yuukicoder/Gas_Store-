/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Discount;
import com.oracle.wls.shaded.org.apache.xalan.lib.ExsltDatetime;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell456
 */
public class DiscountDAO extends DBcontext {

    public void addDiscount(String name, String code, String start, String end, int discountAmount, String discountType, int quantity) {
        String sql = "INSERT INTO [dbo].[Discount]\n"
                + "           ([name]\n"
                + "           ,[discountCode]\n"
                + "           ,[startDate]\n"
                + "           ,[endDate]\n"
                + "           ,[discountAmount]\n"
                + "           ,[discountType]\n"
                + "           ,[quantity])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, code);
            ps.setString(3, start);
            ps.setString(4, end);
            ps.setInt(5, discountAmount);
            ps.setString(6, discountType);
            ps.setInt(7, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("DiscountDAO - addDiscount: " + e.getMessage());

        }
    }

    public List<Discount> listDiscount() {
        String sql = "SELECT [discountID]\n"
                + "      ,[name]\n"
                + "      ,[discountCode]\n"
                + "      ,[startDate]\n"
                + "      ,[endDate]\n"
                + "      ,[discountAmount]\n"
                + "      ,[discountType]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Discount] ORDER BY discountID DESC";
        List<Discount> listDiscount = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscountID(rs.getInt(1));
                d.setName(rs.getString(2));
                d.setDiscountCode(rs.getString(3));
                d.setStartDate(rs.getString(4));
                d.setEndDate(rs.getString(5));
                d.setDiscountAmount(rs.getInt(6));
                d.setDiscountType(rs.getString(7));
                d.setQuantity(rs.getInt(8));
                listDiscount.add(d);
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - listDiscount: " + e.getMessage());

        }
        return listDiscount;
    }
    
      public List<Discount> getidDiscount(String id) {
        String sql = "select discountID, name, discountCode, startDate, endDate, quantity from Discount\n" +
"where discountCode = ?";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
//                v.setVourcherID(rs.getInt(1));
//                v.setName(rs.getString(2));
//                v.setVoucherCode(rs.getString(3));
//                v.setStart(rs.getString(4));
//                v.setEnd(rs.getString(5));
//                v.setQuantity(rs.getInt(6));
//                v.setDiscount(rs.getInt(7));
                    v.setDiscountID(rs.getInt(1));
                    v.setName(rs.getString(2));
                    v.setDiscountCode(rs.getString(3));
                    v.setStartDate(rs.getString(4));
                    v.setEndDate(rs.getString(5));
                    v.setQuantity(rs.getInt(6));
                lv.add(v);
            }
        } catch (Exception e) {
        }
        return lv;
    }
    public Discount getDataByName(String name) {
        Discount discount = null;
        String sql = "SELECT * FROM [dbo].[Discount] WHERE [name] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setDiscountID(rs.getInt("discountID"));
                d.setDiscountAmount(rs.getInt("discountAmount"));
                d.setDiscountType(rs.getString("discountType"));
                d.setStartDate(rs.getString("startDate"));
                d.setEndDate(rs.getString("endDate"));
                d.setName(rs.getString("name"));
                d.setQuantity(rs.getInt("quantity"));
                d.setDiscountCode(rs.getString("discountCode"));
                return d;
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - getDataByName: " + e.getMessage());
        }
        return discount;
    }

    public boolean isNameExists(String name) {
        String query = "SELECT COUNT(*) FROM Discount WHERE name = ?";
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - isNameExists: " + e.getMessage());
        }
        return false;
    }

    public boolean isCodeExists(String code) {
        String query = "SELECT COUNT(*) FROM Discount WHERE discountCode = ?";
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, code);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            System.out.println("DiscountDAO - isCodeExists: " + e.getMessage());
        }
        return false;
    }

    public void updateDiscount(String name, String code, String start, String end, String discountType, int discountAmount, int quantity) {
        String sql = "UPDATE [dbo].[Discount]\n"
                + "SET [name] = ?,\n"
                + "    [startDate] = ?,\n"
                + "    [endDate] = ?,\n"
                + "    [discountType] = ?,\n"
                + "    [discountAmount] = ?,\n"
                + "    [quantity] = ?\n"
                + "WHERE [discountCode] = ?";
        List<Discount> listDiscount = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, start);
            ps.setString(3, end);
            ps.setString(4, discountType);
            ps.setInt(5, discountAmount);
            ps.setInt(6, quantity);
            ps.setString(7, code);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("DiscountDAO - updateDiscount: " + e.getMessage());
        }
    }

    public void deleteDiscount(int id) {
        String sql = "DELETE FROM Discount WHERE discountID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("DiscountDAO - deleteDiscount: " + e.getMessage());
        }
    }
    
      public List<Discount> getQuantityDiscount(String id) {
        String sql = "select discountID, name,discountCode, startDate, endDate, quantity from Discount where discountCode = ? and quantity = 0";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
//                v.setVourcherID(rs.getInt(1));
                v.setDiscountID(1);
                v.setName(rs.getString(2));
//                v.setVoucherCode(rs.getString(3));
                v.setDiscountCode(rs.getString(3));
//                v.setStart(rs.getString(4));
                v.setStartDate(rs.getString(4));
//                v.setEnd(rs.getString(5));
                v.setEndDate(rs.getString(5));
                v.setQuantity(rs.getInt(6));
             
                lv.add(v);
            }
        } catch (Exception e) {
        }
        return lv;
    }
       public List<Discount> getDateDiscount(String name,String id) {
        String sql = "select discountID, name,discountCode, startDate, endDate, quantity from Discount where discountCode = ? and endDate >= ? ";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
                  v.setDiscountID(1);
                v.setName(rs.getString(2));
//                v.setVoucherCode(rs.getString(3));
                v.setDiscountCode(rs.getString(3));
//                v.setStart(rs.getString(4));
                v.setStartDate(rs.getString(4));
//                v.setEnd(rs.getString(5));
                v.setEndDate(rs.getString(5));
                v.setQuantity(rs.getInt(6));
                lv.add(v);
            }
        } catch (Exception e) {
        }
        return lv;
    }
      public List<Discount> getDateStartDiscounts(String name,String id) {
        String sql = "select discountID, name,discountCode, startDate, endDate, quantity from Discount where discountCode = ? and startDate <= ? ";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, id);
   
            ResultSet rs = ps.executeQuery();
           while (rs.next()) {
                Discount v = new Discount();
                  v.setDiscountID(1);
                v.setName(rs.getString(2));
//                v.setVoucherCode(rs.getString(3));
                v.setDiscountCode(rs.getString(3));
//                v.setStart(rs.getString(4));
                v.setStartDate(rs.getString(4));
//                v.setEnd(rs.getString(5));
                v.setEndDate(rs.getString(5));
                v.setQuantity(rs.getInt(6));
                lv.add(v);
            }
        } catch (Exception e) {
        }
        return lv;
    }
    public static void main(String[] args) {
        DiscountDAO discountDAO = new DiscountDAO();
        System.out.println(discountDAO.isNameExists("hhhh"));
    }
}
