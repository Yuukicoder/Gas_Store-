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
import model.Role;

/**
 *
 * @author vip2021
 */
public class RoleDao extends DBContext{
     PreparedStatement stm;
    ResultSet rs;
    List<Role> list;
   
    // Admin DAO
    public List<Role> getAll() {

        list = new ArrayList<>();
        try {
            String strSelect = "Select * from Role";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {

                Role em = new Role(rs.getInt("roleID"),rs.getString("code"),rs.getString("name"),rs.getString("description"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        RoleDao r = new RoleDao();
        List<Role> li = r.getAll();
        for(Role l: li){
            System.out.println(l.getName());
        }
    }

}
