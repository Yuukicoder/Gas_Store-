/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author win
 */
public class ProductImgDAO extends DBcontext {

    public List<ProductImgDTO> getImg() {
        String sql = "SELECT * FROM ProductIMG";
        List<ProductImgDTO> lp = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductImgDTO pimg = new ProductImgDTO();
                pimg.setImgid(rs.getInt(1));
                pimg.setPid(rs.getInt(2));
                pimg.setPath(rs.getString(3));

                lp.add(pimg);
            }
        } catch (Exception e) {
        }
        return lp;
    }

    public List<ProductImgDTO> getPImgByPid(int pid) {
        String sql = "SELECT * FROM ProductIMG WHERE ProductID=?";
        List<ProductImgDTO> pidtos = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductImgDTO pimg = new ProductImgDTO();
                pimg.setImgid(rs.getInt(1));
                pimg.setPid(rs.getInt(2));
                pimg.setPath(rs.getString(3));
                pidtos.add(pimg);
            }
            return pidtos;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int updateProductImage(ProductImgDTO productImgDTO) {
        String sql = "UPDATE [dbo].[ProductImg]\n"
                + "   SET [Path] = ?\n"
                + " WHERE ImgID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, productImgDTO.getPath());
            ps.setInt(2, productImgDTO.getImgid());
            int checkUpdate = ps.executeUpdate();
            return checkUpdate;
        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }
        return 0;
    }

    public int addNewImageProduct(ArrayList<String> list, int newProductID) {

        try {
            int count = 0;
            System.out.println("lisy" + list.size());
            for (int i = 0; i < list.size(); i++) {
                String fileName = list.get(i);
                PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[ProductImg]\n"
                        + "           ([ProductID]\n"
                        + "           ,[Path])\n"
                        + "     VALUES (?,?)");
                ps.setInt(1, newProductID);
                ps.setString(2, fileName);
                count += ps.executeUpdate();
                System.out.println(1);

            }
            return count;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        ProductImgDAO pidao = new ProductImgDAO();
        ArrayList<String> list = new ArrayList<>();
        list.add("hello");
                list.add("hello");

                        list.add("hello");

        int check = pidao.addNewImageProduct(list, 34);
        System.out.println("check + " + check);
    }

 

    public int deleteImage(ArrayList<Integer> listImge) {
        try {
            int count = 0;
            System.out.println(1);
            for (int i = 0; i < listImge.size(); i++) {
                int imgID = listImge.get(i);
                PreparedStatement ps = connection.prepareStatement("delete ProductImg where ImgID = ?");
                ps.setInt(1, imgID);
                count += ps.executeUpdate();
                System.out.println(1);
            }
            return count;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
}
