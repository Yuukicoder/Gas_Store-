/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;


public class IndividualVoucherDTO {
    private int voucherID ;
    private int OrderID ;
    private String VoucherCode ;

    public IndividualVoucherDTO() {
    }

    public IndividualVoucherDTO(int voucherID, int OrderID, String VoucherCode) {
        this.voucherID = voucherID;
        this.OrderID = OrderID;
        this.VoucherCode = VoucherCode;
    }

    
    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getVoucherCode() {
        return VoucherCode;
    }

    public void setVoucherCode(String VoucherCode) {
        this.VoucherCode = VoucherCode;
    }
    
}
