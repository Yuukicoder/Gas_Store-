/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.NotificationDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Vu Anh
 */
public class NotificationDAO extends DBcontext {

    public ArrayList<NotificationDTO> getAllNotification() {
        String sql = "select * from [Notification]";
        ArrayList<NotificationDTO> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NotificationDTO n = new NotificationDTO();
                n.setNotiID(rs.getInt("notiID"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setDateSend(formatDate(rs.getDate("dateSend").toLocalDate()));
                n.setIsRead(rs.getInt("isRead"));
                n.setIsForAdmins(rs.getInt("isForAdmins"));
                list.add(n);
            }
        } catch (SQLException e) {
            System.out.println("getAllNotificationCategory: " + e.getMessage());
        }
        return list;
    }

    public NotificationDTO getNotificationById(int id) {
        String sql = "select * from [Notification] where notiID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                NotificationDTO n = new NotificationDTO();
                n.setNotiID(rs.getInt("notiID"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setDateSend(formatDate(rs.getDate("dateSend").toLocalDate()));
                n.setIsRead(rs.getInt("isRead"));
                n.setIsForAdmins(rs.getInt("isForAdmins"));
                return n;
            }
        } catch (SQLException e) {
            System.out.println("getNotificationById: " + e.getMessage());
        }
        return null;
    }

    public ArrayList<NotificationDTO> getAllAdminNotification() {
        String sql = "SELECT * FROM [Notification] where isForAdmins = 1 order by notiID desc";
        ArrayList<NotificationDTO> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NotificationDTO n = new NotificationDTO();
                n.setNotiID(rs.getInt("notiID"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setDateSend(formatDate(rs.getDate("dateSend").toLocalDate()));
                n.setIsRead(rs.getInt("isRead"));
                n.setIsForAdmins(rs.getInt("isForAdmins"));
                list.add(n);
            }
        } catch (SQLException e) {
            System.out.println("getAllAdminNotification: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<NotificationDTO> getAllOtherTypeNotification(int receiverType, int uID) {
        String sql = """
                     SELECT n.*
                     FROM [Notification] n
                     JOIN [NotificationReceiver] r ON n.notiID = r.notiID
                     WHERE r.ReceiverType = ? AND r.receiverID = ?
                     order by notiID desc
                     """;
        ArrayList<NotificationDTO> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, receiverType);
            ps.setInt(2, uID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NotificationDTO n = new NotificationDTO();
                n.setNotiID(rs.getInt("notiID"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setDateSend(formatDate(rs.getDate("dateSend").toLocalDate()));
                n.setIsRead(rs.getInt("isRead"));
                n.setIsForAdmins(rs.getInt("isForAdmins"));
                list.add(n);
            }
        } catch (SQLException e) {
            System.out.println("getAllOtherTypeNotification: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<NotificationDTO> getAdmin3NewestUnreadNoti() {
        String sql = """
                     SELECT top 3 * FROM [Notification] 
                     where isForAdmins = 1 and isRead = 0
                     order by notiID desc""";

        ArrayList<NotificationDTO> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NotificationDTO n = new NotificationDTO();
                n.setNotiID(rs.getInt("notiID"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));

                //get duration when noti was sended till now
                LocalDateTime dateSended = rs.getTimestamp("dateSend").toLocalDateTime();
                Duration duration = Duration.between(dateSended, LocalDateTime.now());
                n.setDateSend(formatDuration(duration, dateSended));
                //

                n.setIsRead(rs.getInt("isRead"));
                n.setIsForAdmins(rs.getInt("isForAdmins"));
                list.add(n);
            }
        } catch (SQLException e) {
            System.out.println("getAdmin3NewestUnreadNoti: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<NotificationDTO> getOther3NewestUnreadNoti(int receiverType, int uID) {
        String sql = """
                     SELECT top 3 n.*
                     FROM [Notification] n
                     JOIN [NotificationReceiver] r ON n.notiID = r.notiID
                     WHERE r.ReceiverType = ? AND r.receiverID = ? and isRead = 0
                     order by notiID desc
                     """;

        ArrayList<NotificationDTO> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, receiverType);
            ps.setInt(2, uID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NotificationDTO n = new NotificationDTO();
                n.setNotiID(rs.getInt("notiID"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));

                //get duration when noti was sended till now
                LocalDateTime dateSended = rs.getTimestamp("dateSend").toLocalDateTime();
                Duration duration = Duration.between(dateSended, LocalDateTime.now());
                n.setDateSend(formatDuration(duration, dateSended));
                //

                n.setIsRead(rs.getInt("isRead"));
                n.setIsForAdmins(rs.getInt("isForAdmins"));
                list.add(n);
            }
        } catch (SQLException e) {
            System.out.println("getOther3NewestUnreadNoti: " + e.getMessage());
        }
        return list;
    }

    private static String formatDuration(Duration duration, LocalDateTime sendDate) {
        long seconds = duration.getSeconds();

        if (seconds < 60) {
            return seconds + " seconds";
        } else if (seconds < 3600) {
            long minutes = seconds / 60;
            return minutes + " minutes";
        } else if (seconds < 86400) {
            long hours = seconds / 3600;
            return hours + " hours";
        } else {
            return sendDate.toLocalDate().toString(); // Format as yyyy-MM-dd
        }
    }

    private String formatDate(LocalDate date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
        return date.format(formatter);
    }

    public int addNoti(NotificationDTO noti) {
        String sql = "insert into [Notification] (title, content, dateSend, isRead, isForAdmins) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, noti.getTitle());
            ps.setString(2, noti.getContent());
            ps.setString(3, noti.getDateSend());
            ps.setInt(4, 0);
            ps.setInt(5, noti.getIsForAdmins());
            ps.executeUpdate();

            // Retrieve the generated keys
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Retrieve the first generated key by column index
            }else{
            }
        } catch (SQLException e) {
            System.out.println("addNoti: " + e.getMessage());
        }
        return 0;
    }

    public void updateNotiStatus(int id, int isRead) {
        try {
            String sql = "update [Notification] set [isRead] = ? where notiID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, isRead);
            ps.setInt(2, id);
            ps.execute();
        } catch (Exception e) {
            System.out.println("updateNotiStatus: " + e.getMessage());
        }
    }
}
