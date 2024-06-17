/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author vip2021
 */
public class Orders {
    private int orderID;
    private int customerID;
    private int trackingNumber;
    private int totalMoney;
    private Date orderDate;
    private Date shipperDate;
    private Date requiredDate;
    private String shipAddress;
    private int status;
    private int process;
    private String payment;
    private String notes;

    public Orders(int orderID, int customerID, int trackingNumber, int totalMoney, Date orderDate, Date shipperDate, Date requiredDate, String shipAddress, int status, int process, String payment, String notes) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.trackingNumber = trackingNumber;
        this.totalMoney = totalMoney;
        this.orderDate = orderDate;
        this.shipperDate = shipperDate;
        this.requiredDate = requiredDate;
        this.shipAddress = shipAddress;
        this.status = status;
        this.process = process;
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

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getShipperDate() {
        return shipperDate;
    }

    public void setShipperDate(Date shipperDate) {
        this.shipperDate = shipperDate;
    }

    public Date getRequiredDate() {
        return requiredDate;
    }

    public void setRequiredDate(Date requiredDate) {
        this.requiredDate = requiredDate;
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

    public int getProcess() {
        return process;
    }

    public void setProcess(int process) {
        this.process = process;
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
    
    
}
