/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import DAO.DBcontext;
import DTO.SerialNumber;
import DTO.Warranty;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class SerialNumberDAO extends DBcontext{
    
    public SerialNumber getSerialById(int serialId) {
        String sql = "SELECT * FROM [dbo].[SerialNumbers] where SerialID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, serialId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                return new SerialNumber(
                       rs.getInt("SerialID"),
                       rs.getInt("ProductID"), 
                       rs.getInt("SerialNumber")
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    
}
