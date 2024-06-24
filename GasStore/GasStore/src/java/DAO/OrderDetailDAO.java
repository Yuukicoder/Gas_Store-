/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author msi
 */
public class OrderDetailDAO extends DBcontext {

    public List<OrderDetail> getAllOrderDetail() {
        String sql = "SELECT  productID, orderID, quantity, unitPrice FROM OrderDetails";
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProductID(rs.getInt("productID"));
                orderDetail.setOrderID(rs.getInt("orderID"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setUnitPrice(rs.getDouble("unitPrice"));
                orderDetails.add(orderDetail);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return orderDetails;
    }
//
    public List<OrderDetail> getOrderDetailByID(int orderID) {
        String sql = "SELECT productID, orderID, quantity, unitPrice FROM OrderDetails WHERE orderID = ?";
        List<OrderDetail> t = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProductID(rs.getInt("productID"));
                orderDetail.setOrderID(rs.getInt("orderID"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setUnitPrice(rs.getDouble("unitPrice"));
                t.add(orderDetail) ;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return t; 
    }
     public List<OrderDetail> getOrderDetailByID(int orderID, int status) {
        String sql = "SELECT productID, orderID, quantity, unitPrice FROM OrderDetails WHERE orderID = ? and status = ?";
        List<OrderDetail> t = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ps.setInt(2, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProductID(rs.getInt("productID"));
                orderDetail.setOrderID(rs.getInt("orderID"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setUnitPrice(rs.getDouble("unitPrice"));
                t.add(orderDetail) ;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return t; 
    }
    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        List<OrderDetail> li = dao.getOrderDetailByID(11);
        for(OrderDetail l: li){
            System.out.println(l.getQuantity());
        }
    }
}
