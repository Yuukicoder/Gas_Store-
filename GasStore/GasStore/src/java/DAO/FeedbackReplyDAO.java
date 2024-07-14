/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.AccountDTO;
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

    public ArrayList<FeedbackReplyDTO> getLisfeedbackreply(int id) {
        String sql = """
                     SELECT  A.Fullname,FE.Reply,FE.DateCreate ,A.Role FROM Feedback F                                   
                     LEFT JOIN FeedbackReply FE ON FE.FeedbackID = F.FeedbackID
                     JOIN Account A ON FE.AccountID = A.AccountID
                     WHERE F.FeedbackID= ? ORDER BY FE.ReplyID DESC
                     """;
        ArrayList<FeedbackReplyDTO> al = new ArrayList<>();
        try ( PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {

                AccountDTO aO = new AccountDTO();
                aO.setFullname(rs.getString("Fullname"));
                aO.setRole(rs.getInt("Role"));
                FeedbackReplyDTO dTO = new FeedbackReplyDTO();
                dTO.setReply(rs.getString("Reply"));
                dTO.setDate(rs.getDate("DateCreate"));
                dTO.setAccountDTO(aO);
                al.add(dTO);
            }
        } catch (SQLException e) {
            System.out.println("FeedbackReplyDAO - getLisfeedbackreply: " + e.getMessage());
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
