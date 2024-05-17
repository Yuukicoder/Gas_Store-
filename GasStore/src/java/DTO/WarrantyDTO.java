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
public class WarrantyDTO {
    private int WarrantyID;
    private int SerialID;
    private Date WarrantyStartDate;
    private Date WarrantyEndDate;
    private String WarrantyTerms;
    private int supplierID;
    private int customerID;
    private String BarCode;
    private String ProofImg;
    private int Notes;

    public WarrantyDTO() {
    }

    public WarrantyDTO(int WarrantyID, int SerialID, Date WarrantyStartDate, Date WarrantyEndDate, String WarrantyTerms, int supplierID, int customerID, String BarCode, String ProofImg, int Notes) {
        this.WarrantyID = WarrantyID;
        this.SerialID = SerialID;
        this.WarrantyStartDate = WarrantyStartDate;
        this.WarrantyEndDate = WarrantyEndDate;
        this.WarrantyTerms = WarrantyTerms;
        this.supplierID = supplierID;
        this.customerID = customerID;
        this.BarCode = BarCode;
        this.ProofImg = ProofImg;
        this.Notes = Notes;
    }

    public int getWarrantyID() {
        return WarrantyID;
    }

    public int getSerialID() {
        return SerialID;
    }

    public Date getWarrantyStartDate() {
        return WarrantyStartDate;
    }

    public Date getWarrantyEndDate() {
        return WarrantyEndDate;
    }

    public String getWarrantyTerms() {
        return WarrantyTerms;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public String getBarCode() {
        return BarCode;
    }

    public String getProofImg() {
        return ProofImg;
    }

    public int getNotes() {
        return Notes;
    }

    public void setWarrantyID(int WarrantyID) {
        this.WarrantyID = WarrantyID;
    }

    public void setSerialID(int SerialID) {
        this.SerialID = SerialID;
    }

    public void setWarrantyStartDate(Date WarrantyStartDate) {
        this.WarrantyStartDate = WarrantyStartDate;
    }

    public void setWarrantyEndDate(Date WarrantyEndDate) {
        this.WarrantyEndDate = WarrantyEndDate;
    }

    public void setWarrantyTerms(String WarrantyTerms) {
        this.WarrantyTerms = WarrantyTerms;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setBarCode(String BarCode) {
        this.BarCode = BarCode;
    }

    public void setProofImg(String ProofImg) {
        this.ProofImg = ProofImg;
    }

    public void setNotes(int Notes) {
        this.Notes = Notes;
    }

    @Override
    public String toString() {
        return "WarrantyDTO{" + "WarrantyID=" + WarrantyID + ", SerialID=" + SerialID + ", WarrantyStartDate=" + WarrantyStartDate + ", WarrantyEndDate=" + WarrantyEndDate + ", WarrantyTerms=" + WarrantyTerms + ", supplierID=" + supplierID + ", customerID=" + customerID + ", BarCode=" + BarCode + ", ProofImg=" + ProofImg + ", Notes=" + Notes + '}';
    }
    

}
