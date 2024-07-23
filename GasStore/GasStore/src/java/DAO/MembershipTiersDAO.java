/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.MembershipTiersDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Vu Anh
 */
public class MembershipTiersDAO extends DBcontext{
    
    public MembershipTiersDTO getMembershipTierByID(int id) {
        String sql = "select * from MembershipTier where TierID = ?";
        MembershipTiersDTO m = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                m = new MembershipTiersDTO();
                m.setTierID(rs.getInt("TierID"));
                m.setTierName(rs.getString("TierName"));
                m.setMinPoints(rs.getInt("MinPoints"));
                m.setMaxPoints(rs.getInt("MaxPoints"));
                m.setDiscountPercentage(rs.getDouble("DiscountPercentage"));
                m.setBonusPointsRate(rs.getDouble("BonusPointsRate"));
            }
        } catch (Exception e) {
            System.out.println("MembershipTiersDAO - getMembershipTierByID: " + e.getMessage());
        }

        return m;
    }

    public ArrayList<MembershipTiersDTO> getAll() {
        String sql = "select * from MembershipTier";
        ArrayList<MembershipTiersDTO> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MembershipTiersDTO m = new MembershipTiersDTO();
                m.setTierID(rs.getInt("TierID"));
                m.setTierName(rs.getString("TierName"));
                m.setMinPoints(rs.getInt("MinPoints"));
                m.setMaxPoints(rs.getInt("MaxPoints"));
                m.setDiscountPercentage(rs.getDouble("DiscountPercentage"));
                m.setBonusPointsRate(rs.getDouble("BonusPointsRate"));
                list.add(m);
            }
        } catch (Exception e) {
            System.out.println("MembershipTiersDAO - getAll: " + e.getMessage());
        }

        return list;
    }

    public boolean checkNameExist(String name) {
        String sql = "select * from MembershipTier where TierName = ?";
        MembershipTiersDTO m = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("MembershipTiersDAO - checkNameExist: " + e.getMessage());
        }
        return false;
    }

    public void add(MembershipTiersDTO m) {
        String sql = "insert into MembershipTier values (?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, m.getTierName());
            ps.setInt(2, m.getMinPoints());
            ps.setInt(3, m.getMaxPoints());
            ps.setDouble(4, m.getDiscountPercentage());
            ps.setDouble(5, m.getBonusPointsRate());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("MembershipTiersDAO - add: " + e.getMessage());
        }
    }

    public void update(MembershipTiersDTO m) {
        try {
            String sql = "update MembershipTier set TierName = ?, MinPoints = ?, MaxPoints = ?, DiscountPercentage = ?, BonusPointsRate = ? where TierID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, m.getTierName());
            ps.setInt(2, m.getMinPoints());
            ps.setInt(3, m.getMaxPoints());
            ps.setDouble(4, m.getDiscountPercentage());
            ps.setDouble(5, m.getBonusPointsRate());
            ps.setInt(6, m.getTierID());
            ps.execute();
        } catch (Exception e) {
            System.out.println("MembershipTiersDAO - update: " + e.getMessage());
        }
    }

    public void delete(int id) {
        try {
            String strQSL = "delete from MembershipTier where TierID = ?";
            PreparedStatement ps = connection.prepareStatement(strQSL);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            System.out.println("MembershipTiersDAO - delete: " + e.getMessage());
        }
    }
}
