/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author dell456
 */
public class Order {
    private int orderID;
    private int customerID;
    private int trackingNumber;
    private double totalMoney;
    private String orderDate;
    private String shipAddress;
    private int status;
    private int shipVia;
    private String payment;
    private String notes;

    public Order() {
    }

    public Order(int orderID, int customerID, int trackingNumber, double totalMoney, String orderDate, String shipAddress, int status, int shipVia, String payment, String notes) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.trackingNumber = trackingNumber;
        this.totalMoney = totalMoney;
        this.orderDate = orderDate;
        this.shipAddress = shipAddress;
        this.status = status;
        this.shipVia = shipVia;
        this.payment = payment;
        this.notes = notes;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(int trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getShipVia() {
        return shipVia;
    }

    public void setShipVia(int shipVia) {
        this.shipVia = shipVia;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", customerID=" + customerID + ", trackingNumber=" + trackingNumber + ", totalMoney=" + totalMoney + ", orderDate=" + orderDate + ", shipAddress=" + shipAddress + ", status=" + status + ", shipVia=" + shipVia + ", payment=" + payment + ", notes=" + notes + '}';
    }

    
    
}
