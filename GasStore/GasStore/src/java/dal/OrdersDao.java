/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import DAO.CustomerDAO;
import DAO.OrderDetailDAO;
import DTO.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import model.Administrator;
import model.Customer;
import model.Orders;

import java.sql.Timestamp;
import java.util.Date;
import java.util.stream.Collectors;

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
      
      
      
      
      
     public List<DTO.Orders> getAllOrderForSupplier(int sid) {
        List<DTO.Orders> orders = new ArrayList<>();
        List<Object> list = new ArrayList<>();
        OrderDetailDAO oddao = new OrderDetailDAO();

        try {
            StringBuilder query = new StringBuilder();
            query.append("""
                         select o.*
                             from [Order] o
                             inner join OrderDetails od
                             on o.orderID = od.orderID
                             inner join Product p 
                             on p.productID = od.productID
                             where p.supplierId = ?""");

            PreparedStatement preparedStatement = connection.prepareStatement(query.toString());
            preparedStatement.setInt(1, sid);
            mapParams(preparedStatement, list);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    DTO.Orders ord = new DTO.Orders();
                    ord.setOrderId(rs.getInt("orderID"));

                    ord.setTrackingNumber(rs.getInt("trackingNumber"));
                    ord.setTotalMoney(rs.getDouble("totalMoney"));
                    ord.setOrderDate(rs.getDate("orderDate"));
                    ord.setShipAddress(rs.getString("shipAddress"));
                    ord.setStatus(rs.getInt("status"));
                    ord.setShipVia(rs.getInt("shipVia"));
                    ord.setPayment(rs.getInt("payment"));
                    ord.setNotes(rs.getString("notes"));
                    CustomerDAO customerDAO = new CustomerDAO();
                    DTO.Customer cust = customerDAO.getCustomerByID(rs.getInt("customerID"));
                    List<OrderDetail> orderDetails = oddao.getOrderDetail(rs.getInt("orderID"));
                    ord.setOrderDetails(orderDetails);
                    ord.setCustomer(cust);
                    orders.add(ord);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    public List<DTO.Orders> paginateProducts(List<DTO.Orders> orders, int page, int pageSize) {
        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, orders.size());

        if (fromIndex > toIndex) {
            fromIndex = toIndex;
        }

        return orders.subList(fromIndex, toIndex);
    }
     
    
    
    public List<DTO.Orders> filterOrders(List<DTO.Orders> allOrders, LocalDate date, Float minAmount, Float maxAmount, Integer status) {
        return allOrders.stream()
                .filter(order -> (date == null || order.getOrderDate().toLocalDate().equals(date) || order.getOrderDate().toLocalDate().isAfter(date)))
                .filter(order -> (minAmount == null || order.getTotalMoney() >= minAmount))
                .filter(order -> (maxAmount == null || order.getTotalMoney() <= maxAmount))
                .filter(order -> (status == null || order.getStatus() == status))
                .collect(Collectors.toList());
    }
     
     
     public void mapParams(PreparedStatement ps, List<Object> args) throws SQLException {
        int i = 1;
        for (Object arg : args) {
            if (arg instanceof Date) {
                ps.setTimestamp(i++, new Timestamp(((Date) arg).getTime()));
            } else if (arg instanceof Integer) {
                ps.setInt(i++, (Integer) arg);
            } else if (arg instanceof Long) {
                ps.setLong(i++, (Long) arg);
            } else if (arg instanceof Double) {
                ps.setDouble(i++, (Double) arg);
            } else if (arg instanceof Float) {
                ps.setFloat(i++, (Float) arg);
            } else {
                ps.setString(i++, (String) arg);
            }

        }
    }
     public List<Orders> getAll1() {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from  [Order]";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {

                Orders em = new Orders(rs.getInt("orderID"),rs.getInt("customerID"),rs.getInt("trackingNumber"),
                rs.getInt("totalMoney"),rs.getDate("orderDate"),rs.getString("shipAddress"),rs.getInt("status"),
                        rs.getInt("shipVia"),rs.getString("payment"),rs.getString("notes"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     
    
     public List<Orders> getAllByID1(int id) {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from  [Order] where customerID = ? order by orderDate DESC";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {

                Orders em = new Orders(rs.getInt("orderID"),rs.getInt("customerID"),rs.getInt("trackingNumber"),
                rs.getInt("totalMoney"),rs.getDate("orderDate"),rs.getString("shipAddress"),rs.getInt("status"),
                        rs.getInt("shipVia"),rs.getString("payment"),rs.getString("notes"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     public List<Orders> getAllByID1(int id, int status) {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from  [Order] where customerID = ? and status = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            stm.setInt(2, status);
            rs = stm.executeQuery();
            while (rs.next()) {

                Orders em = new Orders(rs.getInt("orderID"),rs.getInt("customerID"),rs.getInt("trackingNumber"),
                rs.getInt("totalMoney"),rs.getDate("orderDate"),rs.getString("shipAddress"),rs.getInt("status"),
                        rs.getInt("shipVia"),rs.getString("payment"),rs.getString("notes"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
      public Orders getByID1(int id) {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from  [Order] where orderID = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            
            rs = stm.executeQuery();
            while (rs.next()) {

                Orders em = new Orders(rs.getInt("orderID"),rs.getInt("customerID"),rs.getInt("trackingNumber"),
                rs.getInt("totalMoney"),rs.getDate("orderDate"),rs.getString("shipAddress"),rs.getInt("status"),
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
