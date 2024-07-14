/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Orders {

    private int orderId;
    private Customer customer;
    private int trackingNumber;
    private double totalMoney;
    private Date orderDate;
    private String shipAddress;
    private int status;
    private int shipVia;
    private int payment;
    private String notes;

    private List<OrderDetail> orderDetails;

    public Orders() {
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
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

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Orders(int orderId, Customer customer, int trackingNumber, double totalMoney, Date orderDate, String shipAddress, int status, int shipVia, int payment, String notes, List<OrderDetail> orderDetails) {
        this.orderId = orderId;
        this.customer = customer;
        this.trackingNumber = trackingNumber;
        this.totalMoney = totalMoney;
        this.orderDate = orderDate;
        this.shipAddress = shipAddress;
        this.status = status;
        this.shipVia = shipVia;
        this.payment = payment;
        this.notes = notes;
        this.orderDetails = orderDetails;
    }

    @Override
    public String toString() {
        return "Orders{" + "customer=" + customer + ", trackingNumber=" + trackingNumber + ", totalMoney=" + totalMoney + ", orderDate=" + orderDate + ", shipAddress=" + shipAddress + ", status=" + status + ", shipVia=" + shipVia + ", payment=" + payment + ", notes=" + notes + ", orderDetails=" + orderDetails + '}';
    }

}
