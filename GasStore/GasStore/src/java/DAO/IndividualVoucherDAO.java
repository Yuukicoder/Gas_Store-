/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;

/**
 *
 * @author phung
 */
public class IndividualVoucherDAO extends DBcontext {

    public void addIndividualVoucher(String voucherid, int orderid, String voucherCode) {
        String sql = "INSERT INTO [dbo].[IndividualVoucher]\n"
                + "           ([VoucherID],[OrderID],[VoucherCode])VALUES(?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, voucherid);
            ps.setInt(2, orderid);
            ps.setString(3, voucherCode);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("IndividualVoucherDAO - addIndividualVoucher: " + e.getMessage());
        }
    }

}
