/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class PaymentDTO {

    private int PaymentID;
    private int OrderID;
    private String PaymentMethod;
    private String PaymentStatus;
    private Date PaymentDate;

    public PaymentDTO() {
    }

    public PaymentDTO(int PaymentID, int OrderID, String PaymentMethod, String PaymentStatus, Date PaymentDate) {
        this.PaymentID = PaymentID;
        this.OrderID = OrderID;
        this.PaymentMethod = PaymentMethod;
        this.PaymentStatus = PaymentStatus;
        this.PaymentDate = PaymentDate;
    }

    public int getPaymentID() {
        return PaymentID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public String getPaymentMethod() {
        return PaymentMethod;
    }

    public String getPaymentStatus() {
        return PaymentStatus;
    }

    public Date getPaymentDate() {
        return PaymentDate;
    }

    public void setPaymentID(int PaymentID) {
        this.PaymentID = PaymentID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public void setPaymentMethod(String PaymentMethod) {
        this.PaymentMethod = PaymentMethod;
    }

    public void setPaymentStatus(String PaymentStatus) {
        this.PaymentStatus = PaymentStatus;
    }

    public void setPaymentDate(Date PaymentDate) {
        this.PaymentDate = PaymentDate;
    }

    @Override
    public String toString() {
        return "PaymentDTO{" + "PaymentID=" + PaymentID + ", OrderID=" + OrderID + ", PaymentMethod=" + PaymentMethod + ", PaymentStatus=" + PaymentStatus + ", PaymentDate=" + PaymentDate + '}';
    }
    
    




}
