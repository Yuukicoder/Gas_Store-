/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author msi
 */
public class Voucher {

    private int vourcherID;
    private String name;
    private String voucherCode;
    private String start;
    private String end;
    private int discount;
    private int quantity;

    public Voucher() {
    }

    public Voucher(int vourcherID, String name, String voucherCode, String start, String end, int discount, int quantity) {
        this.vourcherID = vourcherID;
        this.name = name;
        this.voucherCode = voucherCode;
        this.start = start;
        this.end = end;
        this.discount = discount;
        this.quantity = quantity;
    }

    public Voucher(String voucherCode, String start, String end, int discount, int quantity) {

        this.voucherCode = voucherCode;
        this.start = start;
        this.end = end;
        this.discount = discount;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getVourcherID() {
        return vourcherID;
    }

    public void setVourcherID(int vourcherID) {
        this.vourcherID = vourcherID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Voucher{" + "vourcherID=" + vourcherID + ", name=" + name + ", voucherCode=" + voucherCode + ", start=" + start + ", end=" + end + ", discount=" + discount + ", quantity=" + quantity + '}';
    }

}
