/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author dell456
 */
public class Supplier {
    private int supplierID;
    private String companyName;
    private boolean status;
    private String createdDate;
    private String email;
    private String phone;
    private String homePage;

    public Supplier() {
    }

    public Supplier(int supplierID, String companyName, boolean status, String createdDate, String email, String phone, String homePage) {
        this.supplierID = supplierID;
        this.companyName = companyName;
        this.status = status;
        this.createdDate = createdDate;
        this.email = email;
        this.phone = phone;
        this.homePage = homePage;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHomePage() {
        return homePage;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    @Override
    public String toString() {
        return "Supplier{" + "supplierID=" + supplierID + ", companyName=" + companyName + ", status=" + status + ", createdDate=" + createdDate + ", email=" + email + ", phone=" + phone + ", homePage=" + homePage + '}';
    }
    
    
    
}
