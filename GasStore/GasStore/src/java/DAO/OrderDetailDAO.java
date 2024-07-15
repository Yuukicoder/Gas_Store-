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
                t.add(orderDetail);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    public List<OrderDetail> getOrderDetail(int oid) {
        String sql = "	SELECT * FROM OrderDetails WHERE orderID = ?";
        List<OrderDetail> t = new ArrayList<>();
        ProductDAO pdao = new ProductDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProductID(rs.getInt("productID"));
                orderDetail.setOrderID(rs.getInt("orderID"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setUnitPrice(rs.getDouble("unitPrice"));
                orderDetail.setProduct(pdao.getProductByID(rs.getInt("productID")));
                t.add(orderDetail);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }
    
    public int getUnusedSerialID(int productID) {
     String sql = "SELECT TOP 1 sn.SerialID FROM SerialNumbers sn " +
                 "LEFT JOIN OrderDetails od ON sn.SerialID = od.serialID " +
                 "WHERE od.serialID IS NULL AND sn.ProductID = ?";

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, productID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("SerialID");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return -1; // Trả về -1 nếu không tìm thấy serialID chưa được sử dụng
  }
    
    public void insertOrderDetail(Cart cart, int oid) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([orderID] "
                + "           ,[productID] "
                + "           ,[quantity] "
                + "           ,[unitPrice] "
                + "           ,[serialID]) "
                + "     VALUES(?,?,?,?,?)";
        try {
            for (ItemDTO i : cart.getItems()) {
                int unusedSerialID = getUnusedSerialID(i.getProduct().getProductID());
                PreparedStatement st2 = connection.prepareStatement(sql);
                st2.setInt(1, oid);
                st2.setInt(2, i.getProduct().getProductID());
                st2.setInt(3, i.getQuantity());
                st2.setDouble(4, i.getProduct().getUnitPrice() /*tru di tien discount*/);
                st2.setInt(5, unusedSerialID);
                st2.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public List<OrderDetail> getAllOrderDetail2() {
        String sql = "SELECT * FROM OrderDetails";
        List<OrderDetail> t = new ArrayList<>();
        ProductDAO pro = new ProductDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new  OrderDetail(
                        rs.getInt("orderID"),
                        pro.getProductByID(rs.getInt("productID")),
                        rs.getInt("quantity"), 
                        rs.getInt("serialID"),
                        rs.getDouble("unitPrice")
                 );
                t.add(orderDetail);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return t; 
    }
    
    public OrderDetail getOrderDetailById(int orderId, int proId) {
        String sql = "SELECT productID, orderID, quantity, unitPrice FROM OrderDetails WHERE orderID = ? and productID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.setInt(2, proId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setProductID(rs.getInt("productID"));
                orderDetail.setOrderID(rs.getInt("orderID"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setUnitPrice(rs.getDouble("unitPrice"));
                return orderDetail;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null; 
    }

    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        ProductDAO pDAO = new ProductDAO();
        System.out.println(dao.getOrderDetailByID(4));
    }
}
