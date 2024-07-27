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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author phung
 */
public class FeedbackReplyDAO extends DBcontext {

    public ArrayList<FeedbackReplyDTO> getLisfeedbackreply() {
        String sql = """
                     SELECT  A.userName,FE.reply,FE.date 
                      FROM Feedback F                                   
                      LEFT JOIN FeedbackReply FE ON FE.feedback_id = F.FeedbackID
                      JOIN Administrator A ON FE.account_id = A.administratorID
                      ORDER BY FE.id DESC
                     """;
        ArrayList<FeedbackReplyDTO> al = new ArrayList<>();
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
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
            System.out.println("FeedbackReplyDAO - getLisfeedbackreply: " + e.getMessage());
        }
        return al;
    }

    public ArrayList<FeedbackReplyDTO> getLisfeedbackreplyByID(int id) {
        String sql = "SELECT  A.userName,FE.reply,FE.replydate,FE.feedbackID FROM Feedback F                                   \n"
                + "                    LEFT JOIN FeedbackReply FE ON FE.FeedbackID = F.FeedbackID\n"
                + "                    JOIN Administrator A ON FE.account_id = A.administratorID\n"
                + "                     where FE.feedbackID = ?  ORDER BY FE.feedbackReplyID DESC";
        ArrayList<FeedbackReplyDTO> al = new ArrayList<>();
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                FeedbackDTO ft = new FeedbackDTO();
                ft.setFeedBackID(rs.getInt("feedbackID"));
                AdminDTO aO = new AdminDTO();
                aO.setUserName(rs.getString("userName"));
//                aO.setRole(rs.getInt("Role"));
                FeedbackReplyDTO dTO = new FeedbackReplyDTO();
                dTO.setReply(rs.getString("reply"));
                dTO.setDate(rs.getDate("replydate"));
                dTO.setdTO(ft);
                dTO.setAccountDTO(aO);
                al.add(dTO);
            }
        } catch (SQLException e) {
            System.out.println("FeedbackReplyDAO - getLisfeedbackreplyByID: " + e.getMessage());
        }
        return al;
    }

    public void insertfeedbackreply(String feedbackid, String accountid, String text, String date) {
        String sql = "INSERT INTO [dbo].[FeedbackReply] (reply,[date],account_id,feedback_id) VALUES (?,?,?,?)";
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setString(1, text);
            pt.setString(2, date);
            pt.setString(3, accountid);
            pt.setString(4, feedbackid);
            int inster = pt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("FeedbackReplyDAO - insertfeedbackreply: " + e.getMessage());
        }

    }

    public ArrayList<FeedbackReplyDTO> getLisfeedbackreply1() {
        String sql = "SELECT  A.userName,FE.reply,FE.replydate FROM Feedback F                                   \n"
                + "LEFT JOIN FeedbackReply FE ON FE.FeedbackID = F.FeedbackID\n"
                + "JOIN Administrator A ON FE.account_id = A.administratorID\n"
                + " ORDER BY FE.feedbackReplyID DESC\n";
        ArrayList<FeedbackReplyDTO> al = new ArrayList<>();
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
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
            System.out.println("FeedbackReplyDAO - getLisfeedbackreply1: " + e.getMessage());
        }
        return al;
    }

    public Map<Integer, FeedbackReplyDTO> getLisfeedbackreplyByID1(int id) {
        String sql = "SELECT  A.userName,FE.reply,FE.date,FE.feedback_id FROM Feedback F                                  \n"
                + "                                   LEFT JOIN FeedbackReply FE ON FE.feedback_id = F.FeedbackID\n"
                + "                                   JOIN Administrator A ON FE.account_id = A.administratorID\n"
                + "                                    where FE.feedback_id = ?  ORDER BY FE.feedback_id";
        Map<Integer, FeedbackReplyDTO> al = new HashMap<>();
        try (PreparedStatement pt = connection.prepareStatement(sql)) {
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                FeedbackDTO ft = new FeedbackDTO();
                ft.setFeedBackID(rs.getInt("feedback_id"));
                AdminDTO aO = new AdminDTO();
                aO.setUserName(rs.getString("userName"));
//                aO.setRole(rs.getInt("Role"));
                FeedbackReplyDTO dTO = new FeedbackReplyDTO();
                dTO.setReply(rs.getString("reply"));
                dTO.setDate(rs.getDate("date"));
                dTO.setdTO(ft);
                dTO.setAccountDTO(aO);
                al.put(id, dTO);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    public static void main(String[] args) {
        Map<Integer, Map<Integer, FeedbackReplyDTO>> allReplies = new HashMap<>();
        FeedbackDAO fd = new FeedbackDAO();

        List<FeedbackDTO> productFeedback = fd.getFeedbackByProductId(9);
        System.out.println(productFeedback);
        FeedbackReplyDAO frDAO = new FeedbackReplyDAO();
        for (FeedbackDTO feedback : productFeedback) {
//                List<FeedbackReplyDTO> replies = frDAO.getLisfeedbackreplyByID(feedback.getFeedBackID());
//                request.setAttribute("feedbackReplies_" + feedback.getFeedBackID(), replies);
            Map<Integer, FeedbackReplyDTO> replies = frDAO.getLisfeedbackreplyByID1(feedback.getFeedBackID());
            allReplies.put(feedback.getFeedBackID(), replies);
//                request.setAttribute("feedbackReplies_" + feedback.getFeedBackID(), replies);
        }
        System.out.println(allReplies.get(2).get(2).getReply());
    }

}
