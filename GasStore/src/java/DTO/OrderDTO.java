/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Date;

//done
public class OrderDTO extends AccountDTO {

    private int orderID;
    private int customerID;
    private int trackingNumber;
    private double totalMoney;
    private Date orderDate;
    private Date shippedDate;
    private Date requiredDate;
    private String shipAddress;
    private int status;
    private int process;
    private int shipVia;
    private String payment;
    private String notes;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, int customerID, int trackingNumber, double totalMoney, Date orderDate, Date shippedDate, Date requiredDate, String shipAddress, int status, int process, int shipVia, String payment, String notes) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.trackingNumber = trackingNumber;
        this.totalMoney = totalMoney;
        this.orderDate = orderDate;
        this.shippedDate = shippedDate;
        this.requiredDate = requiredDate;
        this.shipAddress = shipAddress;
        this.status = status;
        this.process = process;
        this.shipVia = shipVia;
        this.payment = payment;
        this.notes = notes;
    }

    public int getOrderID() {
        return orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public int getTrackingNumber() {
        return trackingNumber;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public Date getShippedDate() {
        return shippedDate;
    }

    public Date getRequiredDate() {
        return requiredDate;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public int getStatus() {
        return status;
    }

    public int getProcess() {
        return process;
    }

    public int getShipVia() {
        return shipVia;
    }

    public String getPayment() {
        return payment;
    }

    public String getNotes() {
        return notes;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setTrackingNumber(int trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public void setShippedDate(Date shippedDate) {
        this.shippedDate = shippedDate;
    }

    public void setRequiredDate(Date requiredDate) {
        this.requiredDate = requiredDate;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setProcess(int process) {
        this.process = process;
    }

    public void setShipVia(int shipVia) {
        this.shipVia = shipVia;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

  

}
