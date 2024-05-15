/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author msi
 */
public class OrderDTO extends AccountDTO {

    private int OrderID;
    private int AccountID;
    private double totalPrice;
    private String OrderDate;
    private String Address;
    private int Status;
    private String name1;
    private Double VoucherCode;
    private String Phoneorder ;

    public OrderDTO() {
    }

    

    public Double getVoucherCode() {
        return VoucherCode;
    }

    public void setVoucherCode(Double VoucherCode) {
        this.VoucherCode = VoucherCode;
    }

    public OrderDTO(int OrderID, int AccountID, double totalPrice, String OrderDate, String Address, int Status, String name1, Double VoucherCode, String Phoneorder) {
        this.OrderID = OrderID;
        this.AccountID = AccountID;
        this.totalPrice = totalPrice;
        this.OrderDate = OrderDate;
        this.Address = Address;
        this.Status = Status;
        this.name1 = name1;
        this.VoucherCode = VoucherCode;
        this.Phoneorder = Phoneorder;
    }

    public String getName1() {
        return name1;
    }

    public void setName1(String name1) {
        this.name1 = name1;
    }

    public String getPhoneorder() {
        return Phoneorder;
    }

    public void setPhoneorder(String Phoneorder) {
        this.Phoneorder = Phoneorder;
    }

   

   

   

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

}
