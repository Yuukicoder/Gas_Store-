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
        String sql = "SELECT  ProductID, OrderID, Quantity, UnitPrice FROM OrderDetail";
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProduct_id(rs.getInt("ProductID"));
                orderDetail.setOrder_id(rs.getInt("OrderID"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                orderDetail.setPrice(rs.getDouble("UnitPrice"));
                orderDetails.add(orderDetail);
            }
        } catch (Exception e) {
            // Handle the exception appropriately
        }
        return orderDetails;
    }

    public List<OrderDetail> getOrderDetailByID(int orderID) {
        String sql = "SELECT ProductID, OrderID, Quantity, UnitPrice FROM OrderDetail WHERE OrderID = ?";
        List<OrderDetail> t = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
         
                orderDetail.setProduct_id(rs.getInt("ProductID"));
                orderDetail.setOrder_id(rs.getInt("OrderID"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                orderDetail.setPrice(rs.getDouble("UnitPrice"));
                t.add(orderDetail) ;
            }
        } catch (Exception e) {
            // Handle the exception appropriately
        }
        return t; // Return null if the order detail with the specified ID is not found
    }
    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        ProductDAO pDAO = new ProductDAO();
        System.out.println(dao.getOrderDetailByID(29).size());
    }
}
