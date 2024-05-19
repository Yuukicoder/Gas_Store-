/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.AccountDTO;
import DTO.Cart;
import DTO.ItemDTO;
import DTO.OrderDTO;
import DTO.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author msi
 */
public class OrderDAO extends DBcontext {

    public void addOrder(AccountDTO a, Cart cart, String address, double voucher, double voucher1 , String name , String phone) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            // Thực hiện câu lệnh INSERT INTO ORDERS
            String sql = "INSERT INTO ORDERS VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, a.getAccountID());
            st.setDouble(2, cart.getTotalMoney() - (cart.getTotalMoney() * voucher1) + 10);
            st.setString(3, date);
            st.setString(4, address);
            st.setInt(5, 0);
            st.setDouble(6, voucher);
            st.setString(7, phone);
            st.setString(8, name);
            int rowsAffected = st.executeUpdate();
//
//            if (rowsAffected > 0) {
//                // Lấy id order vừa thêm
            ResultSet generatedKeys = st.getGeneratedKeys();
            int orderID = 0;
            if (generatedKeys.next()) {
                orderID = generatedKeys.getInt(1);
            }

            try {
                // Thực hiện câu lệnh INSERT INTO OrderHistory
                String insertOrderHistoryQuery = "INSERT INTO OrderHistory VALUES (?, ?, ?, ?)";
                PreparedStatement insertOrderHistoryStatement = connection.prepareStatement(insertOrderHistoryQuery);
                insertOrderHistoryStatement.setInt(1, orderID);
                insertOrderHistoryStatement.setInt(2, a.getAccountID());
                insertOrderHistoryStatement.setInt(3, 0);
                insertOrderHistoryStatement.setString(4, date);
                insertOrderHistoryStatement.executeUpdate();
            } catch (Exception ex) {
                // Xử lý ngoại lệ khi thực hiện INSERT INTO OrderHistory
                ex.printStackTrace();
            }
//            } else {
//                System.out.println("Insert into ORDERS failed. No rows affected.");
//            }
        } catch (Exception e) {
            // Xử lý ngoại lệ khi thực hiện INSERT INTO ORDERS
            e.printStackTrace();
        }

    }

    public void cancelOrder(String oid) {
        String sql = "delete from Orders\n"
                + "where OrderID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getLastOrderID() {
        String sql = "select top 1 OrderID from Orders order by OrderID desc";
        int id = 0;
        try {
            PreparedStatement st1 = connection.prepareStatement(sql);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id;
    }

    public void addOrderDetail(Cart cart, int oid) {
        String sql = "INSERT INTO OrderDetail VALUES (?,?,?,?,?)";
        try {
            for (ItemDTO i : cart.getItems()) {
                String sql_2 = "INSERT INTO OrderDetail VALUES (?,?,?,?)";
                PreparedStatement st2 = connection.prepareStatement(sql_2);
                st2.setInt(1, i.getProduct().getProductID());
                st2.setInt(2, oid);
                st2.setInt(3, i.getQuantity());
                st2.setDouble(4, i.getProduct().getPrice() /*tru di tien discount*/);
                st2.executeUpdate();
            }
        } catch (Exception e) {
        }

    }

    public void updateQuantity(Cart cart) {
        String sql_3 = "UPDATE Product SET QuantityAvailable = QuantityAvailable - ? WHERE ProductID = ?";
        try {
            PreparedStatement st3 = connection.prepareStatement(sql_3);
            for (ItemDTO i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getProductID());
                st3.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public List<OrderDTO> listOrderInAdminHome(int number) {
        String sql = "SELECT TOP " + number + " od.OrderID,od.OrderDate, a.Fullname, od.TotalPrice, od.Status ,a.AccountID FROM Orders od\n"
                + "JOIN Account a \n"
                + "ON a.AccountID = od.AccountID ORDER BY od.OrderID DESC";
        List<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO ord = new OrderDTO();

                ord.setOrderID(rs.getInt(1));
                ord.setOrderDate(rs.getString(2));
                ord.setFullname(rs.getString(3));
                ord.setTotalPrice(rs.getDouble(4));
                ord.setStatus(rs.getInt(5));
                ord.setAccountID(rs.getInt("AccountID"));
                lo.add(ord);
            }
        } catch (Exception e) {
        }
        return lo;
    }

    public double todaySale() {
        // Lấy ngày hiện tại
        java.util.Date date = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        double value = 0;
        // Tạo câu truy vấn SQL
        String query = "SELECT SUM(TotalPrice) AS TotalPriceSum FROM Orders WHERE OrderDate = '" + sqlDate + "' AND Status = 3";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                value = rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return value;
    }

    public List<OrderDTO> myPurchase(int id) {
        String sql = "SELECT o.OrderID, a.Fullname, o.TotalPrice, o.OrderDate,o.Address,o.Status FROM Orders o JOIN Account a ON a.AccountID = o.AccountID WHERE a.AccountID = ? ORDER BY o.OrderID DESC";
        List<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO();
                o.setOrderID(rs.getInt(1));
                o.setFullname(rs.getString(2));
                o.setTotalPrice(rs.getDouble(3));
                o.setOrderDate(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setStatus(rs.getInt(6));
                lo.add(o);
            }
        } catch (Exception e) {
        }
        return lo;
    }

    public List<OrderDetail> orderDetail(int oid) {
        String sql = "SELECT od.OrderDetailID, od.OrderID,p.Name,od.Quantity,od.UnitPrice FROM OrderDetail od\n"
                + "JOIN Product p \n"
                + "ON p.ProductID = od.ProductID WHERE od.OrderID = ?";
        List<OrderDetail> lod = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail o = new OrderDetail();
                o.setOrderDetailID(rs.getInt(1));
                o.setOrder_id(rs.getInt(2));
                o.setName(rs.getString(3));
                o.setQuantity(rs.getInt(4));
                o.setOprice(rs.getDouble(5));
                lod.add(o);
            }
        } catch (Exception e) {
        }
        return lod;
    }
    LocalDate curDate = LocalDate.now();
    String date = curDate.toString();

    public void changeStatusOrder(int id, int status) {
        String selectAccountIDQuery = "SELECT AccountID FROM Orders WHERE OrderID = ?";
        String sql = "UPDATE Orders SET Status = ? WHERE OrderID = ?";
        String insertOrderHistoryQuery = "INSERT INTO OrderHistory VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement selectAccountIDStatement = connection.prepareStatement(selectAccountIDQuery);
            selectAccountIDStatement.setInt(1, id);
            ResultSet resultSet = selectAccountIDStatement.executeQuery();
            if (resultSet.next()) {
                int accountID = resultSet.getInt("AccountID");

                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, status);
                ps.setInt(2, id);
                ps.executeUpdate();

                try {
                    PreparedStatement insertOrderHistoryStatement = connection.prepareStatement(insertOrderHistoryQuery);
                    insertOrderHistoryStatement.setInt(1, id);
                    insertOrderHistoryStatement.setInt(2, accountID);
                    insertOrderHistoryStatement.setInt(3, status);
                    insertOrderHistoryStatement.setString(4, date);
                    insertOrderHistoryStatement.executeUpdate();
                } catch (Exception e) {
                    // Handle the exception appropriately
                }
            } else {
                // Handle the case where no matching OrderID is found
            }
        } catch (Exception e) {
            // Handle the exception appropriately
        }
    }



    public float getIncomeToday() {
        String sql = "SELECT SUM(TotalPrice) AS total_amount\n"
                + "FROM Orders\n"
                + "WHERE CAST(OrderDate AS DATE) = CAST(GETDATE() AS DATE);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            float incomeToday = 0;
            if (rs.next()) {
                incomeToday = rs.getFloat("total_amount");
            }
            return incomeToday;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int getOrdersToday() {
        String sql = "SELECT COUNT(OrderID) AS OrderCount\n"
                + "FROM Orders\n"
                + "WHERE CAST(OrderDate AS DATE) = CAST(GETDATE() AS DATE);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int orders = 0;
            if (rs.next()) {
                orders = rs.getInt("OrderCount");
            }
            return orders;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public int getTotalOrdersDelivered() {
        String sql = "SELECT COUNT(OrderID) AS OrderCount\n" +
"                FROM Orders where Orders.Status = 3";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int orders = 0;
            if (rs.next()) {
                orders = rs.getInt("OrderCount");
            }
            return orders;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
     public int getTotalOrdersCancled() {
        String sql = "SELECT COUNT(OrderID) AS OrderCount\n" +
"                FROM Orders where Orders.Status = 4";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int orders = 0;
            if (rs.next()) {
                orders = rs.getInt("OrderCount");
            }
            return orders;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    

    //xóa list = 4 
    public void getListOrder4(String oid) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [Status] = 4\n"
                + " WHERE OrderID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, oid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    // list = 0 
    public List<OrderDTO> myPurchase1(int id) {
        String sql = " SELECT o.OrderID, a.Fullname, o.TotalPrice, o.OrderDate,o.Address,o.Status \n"
                + " FROM Orders o JOIN Account a ON a.AccountID = o.AccountID WHERE a.AccountID = ? and o.Status=0  ORDER BY o.OrderID DESC";
        List<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO();
                o.setOrderID(rs.getInt(1));
                o.setFullname(rs.getString(2));
                o.setTotalPrice(rs.getDouble(3));
                o.setOrderDate(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setStatus(rs.getInt(6));
                lo.add(o);
            }
        } catch (Exception e) {
        }
        return lo;
    }

    // list = 1
    public List<OrderDTO> myPurchase2(int id) {
        String sql = " SELECT o.OrderID, a.Fullname, o.TotalPrice, o.OrderDate,o.Address,o.Status \n"
                + " FROM Orders o JOIN Account a ON a.AccountID = o.AccountID WHERE a.AccountID = ? and o.Status=1  ORDER BY o.OrderID DESC";
        List<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO();
                o.setOrderID(rs.getInt(1));
                o.setFullname(rs.getString(2));
                o.setTotalPrice(rs.getDouble(3));
                o.setOrderDate(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setStatus(rs.getInt(6));
                lo.add(o);
            }
        } catch (Exception e) {
        }
        return lo;
    }

    // list = 2 
    public List<OrderDTO> myPurchase3(int id) {
        String sql = " SELECT o.OrderID, a.Fullname, o.TotalPrice, o.OrderDate,o.Address,o.Status \n"
                + " FROM Orders o JOIN Account a ON a.AccountID = o.AccountID WHERE a.AccountID = ? and o.Status=2  ORDER BY o.OrderID DESC";
        List<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO();
                o.setOrderID(rs.getInt(1));
                o.setFullname(rs.getString(2));
                o.setTotalPrice(rs.getDouble(3));
                o.setOrderDate(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setStatus(rs.getInt(6));
                lo.add(o);
            }
        } catch (Exception e) {
        }
        return lo;
    }

    // list = 3 
    public List<OrderDTO> myPurchase4(int id) {
        String sql = " SELECT o.OrderID, a.Fullname, o.TotalPrice, o.OrderDate,o.Address,o.Status \n"
                + " FROM Orders o JOIN Account a ON a.AccountID = o.AccountID WHERE a.AccountID = ? and o.Status=3  ORDER BY o.OrderID DESC";
        List<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO();
                o.setOrderID(rs.getInt(1));
                o.setFullname(rs.getString(2));
                o.setTotalPrice(rs.getDouble(3));
                o.setOrderDate(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setStatus(rs.getInt(6));
                lo.add(o);
            }
        } catch (Exception e) {
        }
        return lo;
    }

    // list = 4
    public List<OrderDTO> myPurchase5(int id) {
        String sql = " SELECT o.OrderID, a.Fullname, o.TotalPrice, o.OrderDate,o.Address,o.Status \n"
                + " FROM Orders o JOIN Account a ON a.AccountID = o.AccountID WHERE a.AccountID = ? and o.Status=4  ORDER BY o.OrderID DESC";
        List<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO();
                o.setOrderID(rs.getInt(1));
                o.setFullname(rs.getString(2));
                o.setTotalPrice(rs.getDouble(3));
                o.setOrderDate(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setStatus(rs.getInt(6));
                lo.add(o);
            }
        } catch (Exception e) {
        }
        return lo;
    }
    // list = 4

    public List<OrderDTO> myPurchaseTracking(String account, String orderid) {
        String sql = " SELECT o.OrderID, a.Fullname, o.TotalPrice, o.OrderDate,o.Address,o.Status \n"
                + " FROM Orders o JOIN Account a ON a.AccountID = o.AccountID WHERE a.AccountID = ? and OrderID =? ORDER BY o.OrderID DESC";
        List<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account);
            ps.setString(2, orderid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO();
                o.setOrderID(rs.getInt(1));
                o.setFullname(rs.getString(2));
                o.setTotalPrice(rs.getDouble(3));
                o.setOrderDate(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setStatus(rs.getInt(6));
                lo.add(o);
            }
        } catch (Exception e) {
        }
        return lo;
    }

     public OrderDTO getPurchaseByID(String orderid_raw) {
        String sql = "select AccountID,TotalPrice,OrderDate,Address,Status,VoucherCode,Phone,Name  from Orders where OrderID = ?";
        try {
            OrderDTO odto = new OrderDTO();
            int orderid= Integer.parseInt(orderid_raw);
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                odto.setAccountID(rs.getInt("AccountID"));
                odto.setAddress(rs.getString("Address"));
                odto.setTotalPrice(rs.getFloat("TotalPrice"));
                odto.setOrderDate(rs.getString("OrderDate"));
                odto.setStatus(rs.getInt("Status"));
                odto.setPhoneorder(rs.getString("Phone"));
                odto.setName1(rs.getString("Name"));
                odto.setVoucherCode(rs.getDouble("VoucherCode"));
            
            }
            return odto;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
     public List<OrderDTO> searchOrder(String txtSearch) {
        String sql = " SELECT o.OrderID, a.Fullname, o.TotalPrice, o.OrderDate,o.Address,o.Status \n"
                + " FROM Orders o JOIN Account a ON a.AccountID = o.AccountID WHERE  a.Fullname like ? \n"
                + "ORDER BY o.OrderID DESC";
        ArrayList<OrderDTO> lo = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO order = new OrderDTO();
                order.setOrderID(rs.getInt(1));
                order.setFullname(rs.getString(2));
                order.setTotalPrice(rs.getDouble(3));
                order.setOrderDate(rs.getString(4));
                order.setAddress(rs.getString(5));
                order.setStatus(rs.getInt(6));
                lo.add(order);
            }
        } catch (Exception e) {
        }
        return lo;
    }
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
       OrderDTO o = dao.getPurchaseByID("29");
        System.out.println(o.getTotalPrice());
    }

}
