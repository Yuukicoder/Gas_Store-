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
import model.Supplier;

/**
 *
 * @author vip2021
 */
public class SupplierDao extends DBContext {
     PreparedStatement stm;
    ResultSet rs;
    List<Supplier> list;
    List<Administrator> li;

    // Admin DAO
    public List<Supplier> getAll() {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from Supplier";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {

                Supplier em  = new Supplier(rs.getInt("supplierId"),
                        rs.getString("companyName"),rs.getBoolean("status"),
                        rs.getDate("createdDate"),rs.getString("email"),
                        rs.getString("phone"),rs.getString("homePage"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        SupplierDao sus = new SupplierDao();
        List<Supplier> li = sus.getAll();
        for(Supplier l: li){
            System.out.println(l.getCompanyName());
        }
    }
}
