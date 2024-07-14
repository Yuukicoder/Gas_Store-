/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Administrator;
import model.Customer;
import model.Orders;

/**
 *
 * @author vip2021
 */
public class OrdersDao extends DBContext{
     PreparedStatement stm;
    ResultSet rs;
    List<Orders> list;
    List<Administrator> li;

   
    public List<Orders> getAll() {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from  [Order]";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {

                Orders em = new Orders(rs.getInt("orderID"),rs.getInt("customerID"),rs.getInt("trackingNumber"),
                rs.getInt("totalMoney"),rs.getDate("orderDate"),rs.getDate("shipperDate"),
                        rs.getDate("requiredDate"),rs.getString("shipAddress"),rs.getInt("status"),
                        rs.getInt("process"),rs.getString("payment"),rs.getString("notes"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     public List<Orders> getAllByID(int id) {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from  [Order] where customerID = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {

                Orders em = new Orders(rs.getInt("orderID"),rs.getInt("customerID"),rs.getInt("trackingNumber"),
                rs.getInt("totalMoney"),rs.getDate("orderDate"),rs.getDate("shippedDate"),
                        rs.getDate("requiredDate"),rs.getString("shipAddress"),rs.getInt("status"),
                        rs.getInt("process"),rs.getString("payment"),rs.getString("notes"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
      public List<Orders> getAllByID(int id, int status) {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from  [Order] where customerID = ? and status = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            stm.setInt(2, status);
            rs = stm.executeQuery();
            while (rs.next()) {

                Orders em = new Orders(rs.getInt("orderID"),rs.getInt("customerID"),rs.getInt("trackingNumber"),
                rs.getInt("totalMoney"),rs.getDate("orderDate"), rs.getDate("shippedDate"), rs.getDate("requiredDate"),rs.getString("shipAddress"),rs.getInt("status"),
                        rs.getInt("shipVia"),rs.getString("payment"),rs.getString("notes"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
      public Orders getByID(int id) {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from  [Order] where orderID = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            
            rs = stm.executeQuery();
            while (rs.next()) {

                Orders em = new Orders(rs.getInt("orderID"),rs.getInt("customerID"),rs.getInt("trackingNumber"),
                rs.getInt("totalMoney"),rs.getDate("orderDate"), rs.getDate("shippedDate"), rs.getDate("requiredDate"),rs.getString("shipAddress"),rs.getInt("status"),
                        rs.getInt("shipVia"),rs.getString("payment"),rs.getString("notes"));
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
     public static void main(String[] args) {
        OrdersDao o = new OrdersDao();
        List<Orders> li = o.getAllByID(1);
        for(Orders l: li){
            System.out.println(l.getOrderID());
        }
    }
}
