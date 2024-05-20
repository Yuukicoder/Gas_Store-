/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.OrderHistoryDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phung
 */
public class OrderHistoryDAO extends DBcontext {

    public List<OrderHistoryDTO> getAllOrderHistory(String orderid, String account) {
        String sql = "SELECT [OrderHistoryID]\n"
                + "      ,[OrderID]\n"
                + "      ,[AccountID]\n"
                + "      ,[Status]\n"
                + "      ,[UpdatedDate]\n"
                + "  FROM [SWP_Laptop﻿].[dbo].[OrderHistory] where [OrderID] = ? and [AccountID] = ?  ORDER BY [UpdatedDate] DESC, [Status] DESC ";
        List<OrderHistoryDTO> lp = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, orderid);
            ps.setString(2, account);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderHistoryDTO or = new OrderHistoryDTO();
                or.setOrderid(rs.getInt("OrderID"));
                or.setAccountID(rs.getInt("AccountID"));
                or.setDate(rs.getString("UpdatedDate"));
                or.setStatus(rs.getInt("Status"));
                lp.add(or);
            }
        } catch (Exception e) {
        }
        return lp;
    }
    
    LocalDate curDate = LocalDate.now();
    String date = curDate.toString();

    public void insertOrderHistory(String orderID, String accountID, String status) {
        String insertOrderHistoryQuery = "INSERT INTO OrderHistory VALUES (?, ?, ?, ?)";
        try ( PreparedStatement insertOrderHistoryStatement = connection.prepareStatement(insertOrderHistoryQuery)) {

            insertOrderHistoryStatement.setString(1, orderID);
            insertOrderHistoryStatement.setString(2, accountID);
            insertOrderHistoryStatement.setString(3, status);
            insertOrderHistoryStatement.setString(4, date);
            insertOrderHistoryStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public static void main(String[] args) {
        OrderHistoryDAO aO = new OrderHistoryDAO();
        System.out.println(aO.getAllOrderHistory("46", "2".toString()));
    }
}
