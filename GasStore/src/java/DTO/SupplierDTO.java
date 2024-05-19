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
public class SupplierDTO {
    private int supplierId;
    private String companyName;
    private boolean status;
    private Date createdDate;
    private String email;
    private String phone;
    private String homePage;

    public SupplierDTO() {
    }

    public SupplierDTO(int supplierId, String companyName, boolean status, Date createdDate, String email, String phone, String homePage) {
        this.supplierId = supplierId;
        this.companyName = companyName;
        this.status = status;
        this.createdDate = createdDate;
        this.email = email;
        this.phone = phone;
        this.homePage = homePage;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public boolean isStatus() {
        return status;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getHomePage() {
        return homePage;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    @Override
    public String toString() {
        return "SupplierDTO{" + "supplierId=" + supplierId + ", companyName=" + companyName + ", status=" + status + ", createdDate=" + createdDate + ", email=" + email + ", phone=" + phone + ", homePage=" + homePage + '}';
    }
    
    
    
}
