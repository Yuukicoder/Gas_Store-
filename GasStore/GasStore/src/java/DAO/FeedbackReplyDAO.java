/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.AccountDTO;
import DTO.AdminDTO;
import DTO.FeedbackDTO;
import DTO.FeedbackReplyDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phung
 */
public class FeedbackReplyDAO extends DBcontext {

    public ArrayList<FeedbackReplyDTO> getLisfeedbackreply() {
        String sql = "SELECT  A.userName,FE.reply,FE.replydate FROM Feedback F                                   \n" +
                    "LEFT JOIN FeedbackReply FE ON FE.FeedbackID = F.FeedbackID\n" +
                    "JOIN Administrator A ON FE.adminid = A.administratorID\n" +
                    " ORDER BY FE.feedbackReplyID DESC\n";
                ArrayList<FeedbackReplyDTO> al = new ArrayList<>();
        try ( PreparedStatement pt = connection.prepareStatement(sql)) {
//            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {

                AdminDTO aO = new AdminDTO();
                aO.setUserName(rs.getString("userName"));
//                aO.setRole(rs.getInt("Role"));
                FeedbackReplyDTO dTO = new FeedbackReplyDTO();
                dTO.setReply(rs.getString("reply"));
                dTO.setDate(rs.getDate("replydate"));
                dTO.setAccountDTO(aO);
                al.add(dTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    public void insertfeedbackreply(String feedbackid, String accountid, String text, String date) {
        String sql = "INSERT INTO [dbo].[FeedbackReply]\n"
                + "           ([FeedbackID]\n"
                + "           ,[AccountID]\n"
                + "           ,[Reply]\n"
                + "           ,[DateCreate])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try ( PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setString(1, feedbackid);
            pt.setString(2, accountid);
            pt.setString(3, text);
            pt.setString(4, date);
            int inster = pt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("FeedbackReplyDAO - insertfeedbackreply: " + e.getMessage());
        }

    }
    
      
}
