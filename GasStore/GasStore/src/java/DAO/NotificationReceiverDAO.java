/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.NotificationReceiverDTO;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Vu Anh
 */
public class NotificationReceiverDAO extends DBcontext{
    public void addReceiver(NotificationReceiverDTO r) {
        String sql = "insert into NotificationReceiver (notiID, receiverType, receiverID) values (?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, r.getNotiID());
            ps.setInt(2, r.getReceiverType());
            ps.setInt(3, r.getReceiverID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("NotificationReceiverDAO - addReceiver: " + e.getMessage());
        }
    }
}
