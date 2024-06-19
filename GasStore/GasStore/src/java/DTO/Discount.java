/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author dell456
 */
public class Discount {
    private int discountID;
    private String discountCode;
    private String name;
    private int discountAmount;
    private String discountType;     
    private String startDate;
    private String endDate;
    private int quantity;

    public Discount() {
    }

    public Discount(int discountID, String discountCode, String name, int discountAmount, String discountType, String startDate, String endDate, int quantity) {
        this.discountID = discountID;
        this.discountCode = discountCode;
        this.name = name;
        this.discountAmount = discountAmount;
        this.discountType = discountType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.quantity = quantity;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getDiscountType() {
        return discountType;
    }

    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Discount{" + "discountID=" + discountID + ", discountCode=" + discountCode + ", name=" + name + ", discountAmount=" + discountAmount + ", discountType=" + discountType + ", startDate=" + startDate + ", endDate=" + endDate + ", quantity=" + quantity + '}';
    }
    
    
}
