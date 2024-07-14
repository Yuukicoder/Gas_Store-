/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Voucher;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author msi
 */
public class VoucherDAO extends DBcontext {

    public List<Voucher> listVoucher() {
        String sql = "SELECT [VoucherID]\n"
                + "      ,[Name]\n"
                + "      ,[VoucherCode]\n"
                + "      ,[DateStart]\n"
                + "      ,[DateEnd]\n"
                + "      ,[Discount]\n"
                + "      ,[Quantity]\n"
                + "  FROM [dbo].[Voucher] ORDER BY VoucherID DESC";
        List<Voucher> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setVourcherID(rs.getInt(1));
                v.setName(rs.getString(2));
                v.setVoucherCode(rs.getString(3));
                v.setStart(rs.getString(4));
                v.setEnd(rs.getString(5));
                v.setDiscount(rs.getInt(6));
                v.setQuantity(rs.getInt(7));
                lv.add(v);
            }
        } catch (Exception e) {
            System.out.println("VoucherDAO - listVoucher: " + e.getMessage());

        }
        return lv;
    }

    public List<Voucher> getidVoucher(String id) {
        String sql = "SELECT [VoucherID],[Name],[VoucherCode],[DateStart],[DateEnd],[Quantity],[Discount]\n"
                + "  FROM [dbo].[Voucher] where VoucherCode = ?";
        List<Voucher> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setVourcherID(rs.getInt(1));
                v.setName(rs.getString(2));
                v.setVoucherCode(rs.getString(3));
                v.setStart(rs.getString(4));
                v.setEnd(rs.getString(5));
                v.setQuantity(rs.getInt(6));
                v.setDiscount(rs.getInt(7));
                lv.add(v);
            }
        } catch (Exception e) {
            System.out.println("VoucherDAO - getidVoucher: " + e.getMessage());
        }
        return lv;
    }

    public List<Voucher> getQuantityVoucher(String id) {
        String sql = "SELECT [VoucherID],[Name],[VoucherCode],[DateStart],[DateEnd],[Quantity],[Discount]\n"
                + "  FROM [dbo].[Voucher] where VoucherCode = ? and Quantity = 0 ";
        List<Voucher> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setVourcherID(rs.getInt(1));
                v.setName(rs.getString(2));
                v.setVoucherCode(rs.getString(3));
                v.setStart(rs.getString(4));
                v.setEnd(rs.getString(5));
                v.setQuantity(rs.getInt(6));
                v.setDiscount(rs.getInt(7));
                lv.add(v);
            }
        } catch (Exception e) {
            System.out.println("VoucherDAO - getQuantityVoucher: " + e.getMessage());
        }
        return lv;
    }

    public List<Voucher> getDateVoucher(String name, String id) {
        String sql = "SELECT [VoucherID],[Name],[VoucherCode],[DateStart],[DateEnd],[Quantity],[Discount]\n"
                + "                 FROM [dbo].[Voucher] where VoucherCode = ? and [DateEnd] >= ? ";
        List<Voucher> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setVourcherID(rs.getInt(1));
                v.setName(rs.getString(2));
                v.setVoucherCode(rs.getString(3));
                v.setStart(rs.getString(4));
                v.setEnd(rs.getString(5));
                v.setQuantity(rs.getInt(6));
                v.setDiscount(rs.getInt(7));
                lv.add(v);
            }
        } catch (Exception e) {
            System.out.println("VoucherDAO - getDateVoucher: " + e.getMessage());
        }
        return lv;
    }

    public List<Voucher> getDateStartVoucher(String name, String id) {
        String sql = "SELECT [VoucherID],[Name],[VoucherCode],[DateStart],[DateEnd],[Quantity],[Discount]\n"
                + "                 FROM [dbo].[Voucher] where VoucherCode = ? and [DateStart] <= ?  ";
        List<Voucher> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setVourcherID(rs.getInt(1));
                v.setName(rs.getString(2));
                v.setVoucherCode(rs.getString(3));
                v.setStart(rs.getString(4));
                v.setEnd(rs.getString(5));
                v.setQuantity(rs.getInt(6));
                v.setDiscount(rs.getInt(7));
                lv.add(v);
            }
        } catch (Exception e) {
            System.out.println("VoucherDAO - getDateStartVoucher: " + e.getMessage());
        }
        return lv;
    }

    public void addVoucher(String name, String code, String start, String end, int discount, int quantity) {
        String sql = "INSERT INTO [dbo].[Voucher]\n"
                + "           ([Name]\n"
                + "           ,[VoucherCode]\n"
                + "           ,[DateStart]\n"
                + "           ,[DateEnd]\n"
                + "           ,[Discount]\n"
                + "           ,[Quantity])\n"
                + "     VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, code);
            ps.setString(3, start);
            ps.setString(4, end);
            ps.setInt(5, discount);
            ps.setInt(6, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("VoucherDAO - addVoucher: " + e.getMessage());
        }
    }

    public void UpdateVoucher(String name, String code, String start, String end, int discount, int quantity) {
        String sql = "UPDATE [dbo].[Voucher]\n"
                + "SET [Name] = ?,\n"
                + "    [DateStart] = ?,\n"
                + "    [DateEnd] = ?,\n"
                + "    [Discount] = ?,\n"
                + "    [Quantity] = ?\n"
                + "WHERE [VoucherCode] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);

            ps.setString(2, start);
            ps.setString(3, end);
            ps.setInt(4, discount);
            ps.setInt(5, quantity);
            ps.setString(6, code);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("VoucherDAO - UpdateVoucher: " + e.getMessage());
        }
    }

    public Voucher getDataByName(String name) {
        Voucher voucher = null;
        String sql = "SELECT * FROM [dbo].[Voucher] WHERE [Name] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Voucher v = new Voucher();
                v.setDiscount(rs.getInt("Discount"));
                v.setEnd(rs.getString("DateEnd"));
                v.setName(rs.getString("Name"));
                v.setQuantity(rs.getInt("Quantity"));
                v.setVoucherCode(rs.getString("VoucherCode"));
                v.setStart(rs.getString("DateStart"));
                return v;
            }
        } catch (Exception e) {
            System.out.println("VoucherDAO - getDataByName: " + e.getMessage());
        }
        return voucher;
    }

    public void UpdateQuantityVoucher(String name, String quantity) {
        String sql = "UPDATE [dbo].[Voucher] SET [Quantity] = ? WHERE [VoucherCode] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, quantity);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("VoucherDAO - UpdateQuantityVoucher: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        VoucherDAO voucherDAO = new VoucherDAO();
        voucherDAO.UpdateQuantityVoucher("BOGOCODE", "15");
    }
}
