/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.ShipperDTO;
import dal.CustomerDao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class ShipperDAO extends DBcontext {

    public ShipperDTO checkuserandPass(String username, String password) {
        String sql = "select * from Shipments where userName = ? and [password] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ShipperDTO s = new ShipperDTO();
                s.setShipperID(rs.getInt(1));
                s.setUsername(rs.getString(2));
                s.setPassword(rs.getString(3));
                s.setImage(rs.getString(4));
                s.setFullname(rs.getString(5));
                s.setGender(rs.getInt(6));
                s.setAddress(rs.getString(7));
                s.setPhoneNumber(rs.getString(8));
                s.setEmail(rs.getString(9));
                s.setIsActive(rs.getInt(10));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ShipperDTO checkuser(String username) {
        String sql = "select * from Shipments where userName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ShipperDTO s = new ShipperDTO();
                s.setShipperID(rs.getInt(1));
                s.setUsername(rs.getString(2));
                s.setPassword(rs.getString(3));
                s.setImage(rs.getString(4));
                s.setFullname(rs.getString(5));
                s.setGender(rs.getInt(6));
                s.setAddress(rs.getString(7));
                s.setPhoneNumber(rs.getString(8));
                s.setEmail(rs.getString(9));
                s.setIsActive(rs.getInt(10));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ShipperDTO getAccountById(int uid) {
        String sql = "select * from Shipments where shipmentID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ShipperDTO s = new ShipperDTO();
                s.setShipperID(uid);
                s.setUsername(rs.getString(2));
                s.setPassword(rs.getString(3));
                s.setImage(rs.getString(4));
                s.setFullname(rs.getString(5));
                s.setGender(rs.getInt(6));
                s.setAddress(rs.getString(7));
                s.setPhoneNumber(rs.getString(8));
                s.setEmail(rs.getString(9));
                s.setIsActive(rs.getInt(10));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateProfile(ShipperDTO s) {
        String sql = """
                     update Shipments
                     set [userName] = ?,
                     	 [image] = ?,
                         [fullName] = ?,
                     	 [gender] = ?,
                         [address] = ?,
                         [phone] = ?,
                         [email] = ?
                     where shipmentID = ?
                     """;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, s.getUsername());
            ps.setString(2, s.getImage());
            ps.setString(3, s.getFullname());
            ps.setInt(4, s.getGender());
            ps.setString(5, s.getAddress());
            ps.setString(6, s.getPhoneNumber());
            ps.setString(7, s.getEmail());
            ps.setInt(8, s.getShipperID());

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean changePassword(String newpass, int uid) {
        String sql = """
                     update Shipments
                     set [password] = ?
                     where shipmentID = ?
                     """;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setInt(2, uid);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    
    public ArrayList<ShipperDTO> getAllShipper(){
        String sql = "select * from Shipments";
        ArrayList<ShipperDTO> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShipperDTO s = new ShipperDTO();
                s.setShipperID(rs.getInt(1));
                s.setUsername(rs.getString(2));
                s.setPassword(rs.getString(3));
                s.setImage(rs.getString(4));
                s.setFullname(rs.getString(5));
                s.setGender(rs.getInt(6));
                s.setAddress(rs.getString(7));
                s.setPhoneNumber(rs.getString(8));
                s.setEmail(rs.getString(9));
                s.setIsActive(rs.getInt(10));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
