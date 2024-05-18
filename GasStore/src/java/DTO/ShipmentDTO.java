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
public class ShipmentDTO {
    private int shipmentID;
    private String companyName;
    private String email;
    private String phone;
    private boolean status;
    private Date createdDate;

    public ShipmentDTO() {
    }

    public ShipmentDTO(int shipmentID, String companyName, String email, String phone, boolean status, Date createdDate) {
        this.shipmentID = shipmentID;
        this.companyName = companyName;
        this.email = email;
        this.phone = phone;
        this.status = status;
        this.createdDate = createdDate;
    }

    public int getShipmentID() {
        return shipmentID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public boolean isStatus() {
        return status;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setShipmentID(int shipmentID) {
        this.shipmentID = shipmentID;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "ShipmentDTO{" + "shipmentID=" + shipmentID + ", companyName=" + companyName + ", email=" + email + ", phone=" + phone + ", status=" + status + ", createdDate=" + createdDate + '}';
    }
    
}
