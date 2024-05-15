/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.OrderDTO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author PC
 */
public class StatisticDAO extends DBcontext {
    
    public Map<LocalDate, Double> getRevenueOf7Days() {
        String sql = "select distinct top 7 OrderDate, sum(TotalPrice) over (order by OrderDate)\n" +
"                from Orders where Orders.[Status] = 3 order by OrderDate desc";
        Map<LocalDate, Double> totalPrices = new LinkedHashMap<>();
        try {
            PreparedStatement st1 = connection.prepareStatement(sql);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                
                Date orderDate = rs.getDate(1);
                Double sumTotal = rs.getDouble(2);
                
                totalPrices.put(orderDate.toLocalDate(), sumTotal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalPrices;
    }
    
    public Map<LocalDate, Double> getRevenueOf30Days() {
        String sql = "select distinct top 30 OrderDate, sum(TotalPrice) over (order by OrderDate) "
                + "from Orders where Orders.[Status] = 3 order by OrderDate desc";
        Map<LocalDate, Double> totalPrices = new LinkedHashMap<>();
        try {
            PreparedStatement st1 = connection.prepareStatement(sql);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                
                Date orderDate = rs.getDate(1);
                Double sumTotal = rs.getDouble(2);
                
                totalPrices.put(orderDate.toLocalDate(), sumTotal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalPrices;
    }
    
    public Map<LocalDate, Double> getRevenueOf12Months() {
        String sql = "select distinct top 365 OrderDate, sum(TotalPrice) over (order by OrderDate) "
                + "from Orders where Orders.[Status] = 3 order by OrderDate desc";
        Map<LocalDate, Double> totalPrices = new LinkedHashMap<>();
        try {
            PreparedStatement st1 = connection.prepareStatement(sql);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                
                Date orderDate = rs.getDate(1);
                Double sumTotal = rs.getDouble(2);
                
                totalPrices.put(orderDate.toLocalDate(), sumTotal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalPrices;
    }
    
    public Map<String, Integer> getTop10BestSellerProducts() {
        String sql = "select top 10 p.Name, sum(quantity) as totalSell "
                + "from OrderDetail as o inner join Product as p on o.ProductID = p.ProductId "
                + "group by p.Name "
                + "order by totalSell desc";
        Map<String, Integer> topProducts = new LinkedHashMap<>();
        try {
            PreparedStatement st1 = connection.prepareStatement(sql);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                
                String productName = rs.getString(1);
                Integer totalSell = rs.getInt(2);
                
                topProducts.put(productName, totalSell);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return topProducts;
    }
    
    public Map<String, Double> getTop10HighestRatingProducts() {
        String sql = "select top 10 p.Name, avg(cast(StarVoted as Float)) as avtStar "
                + "from Feedback as f inner join Product as p on f.ProductID = p.ProductId "
                + "group by p.Name "
                + "order by avtStar desc";
        Map<String, Double> topProducts = new LinkedHashMap<>();
        try {
            PreparedStatement st1 = connection.prepareStatement(sql);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                
                String productName = rs.getString(1);
                Double avgStar = rs.getDouble(2);
                
                topProducts.put(productName, avgStar);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return topProducts;
    }
    
}
