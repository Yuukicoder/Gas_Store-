/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author PC
 */
public class StatisticDAO extends DBcontext {

    public Map<LocalDate, Double> getRevenueOf7Days() {
        String sql = "SET DATEFIRST 1\n"
                + "select OrderDate, sum(totalMoney) as TotalMoney\n"
                + "from [Order] \n"
                + "where [Order].[Status] = 3 and datepart(week, orderDate) = datepart(week, getdate())\n"
                + "group by OrderDate\n"
                + "order by OrderDate;";
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
        }
        return totalPrices;
    }

    public Map<LocalDate, Double> getRevenueOf30Days() {
        String sql = "select OrderDate, sum(totalMoney) as TotalMoney\n"
                + "from [Order] \n"
                + "where [Order].[Status] = 3  \n"
                + "	and datepart(year, orderDate) = datepart(year, getdate())\n"
                + "    and datepart(month, orderDate) = datepart(month, getdate())\n"
                + "group by OrderDate\n"
                + "order by OrderDate";
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
        }
        return totalPrices;
    }

    public Map<LocalDate, Double> getRevenueOf12Months() {
        String sql = "select format(orderDate, 'yyyy-MM') AS Month, sum(totalMoney) as TotalMoney\n"
                + "from [Order]\n"
                + "where [Order].[Status] = 3 and datepart(year, orderDate) = datepart(year, getdate())\n"
                + "group by format(orderDate, 'yyyy-MM')\n"
                + "order by Month";
        Map<LocalDate, Double> totalPrices = new LinkedHashMap<>();
        try {
            PreparedStatement st1 = connection.prepareStatement(sql);
            ResultSet rs = st1.executeQuery();
            while (rs.next()) {
                String formattedDate = rs.getString("Month");
                LocalDate orderDate = LocalDate.parse(formattedDate + "-01");

                Double sumTotal = rs.getDouble(2);

                totalPrices.put(orderDate, sumTotal);
            }
        } catch (Exception e) {
        }
        return totalPrices;
    }

    public Map<String, Integer> getTop10BestSellerProducts() {
        String sql = "select top 10 p.Name, sum(quantity) as totalSell \n"
                + "from OrderDetails as o inner join Product as p on o.ProductID = p.ProductId \n"
                + "group by p.Name \n"
                + "order by totalSell";
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
        }
        return topProducts;
    }

    public double getTotalMoney(Double[] arr) {
        double sum = 0;
        for (int i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        return sum;
    }
}
