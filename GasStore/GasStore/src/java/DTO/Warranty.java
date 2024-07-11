/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author dell456
 */
public class Warranty {

    private int WarrantyID, SerialID, supplierID, customerID, Process_By;
    private LocalDateTime WarrantyStartDate, WarrantyEndDate;
    private String WarrantyTerms, ProofImg, BarCode, Notes, Status, SerialNumbers;

    private Date CreateDate, ReciverDate, expectedDate, DoneDate;

    public Warranty(int SerialID, int customerID, String ProofImg, String Notes, Date CreateDate, String Status) {
        this.SerialID = SerialID;
        this.customerID = customerID;
        this.ProofImg = ProofImg;
        this.Notes = Notes;
        this.CreateDate = CreateDate;
        this.Status = Status;
    }

    public Warranty(int SerialID, int customerID, String ProofImg, String Notes, Date CreateDate) {
        this.SerialID = SerialID;
        this.customerID = customerID;
        this.ProofImg = ProofImg;
        this.Notes = Notes;
        this.CreateDate = CreateDate;
    }

    public Warranty(int SerialID, int customerID, String ProofImg,
            String Notes, Date CreateDate, String Status, Date expectedDate, int Process_By) {
        this.SerialID = SerialID;
        this.customerID = customerID;
        this.ProofImg = ProofImg;
        this.Notes = Notes;
        this.CreateDate = CreateDate;
        this.Status = Status;
        this.expectedDate = expectedDate;
        this.Process_By = Process_By;
    }

    public Warranty(int WarrantyID, int SerialID, int customerID, int Process_By,
            String ProofImg, String Notes, String Status,
            Date CreateDate, Date ReciverDate, Date DoneDate, Date expectedDate, String SerialNumbers) {
        this.WarrantyID = WarrantyID;
        this.SerialID = SerialID;
        this.customerID = customerID;
        this.Process_By = Process_By;
        this.ProofImg = ProofImg;
        this.Notes = Notes;
        this.Status = Status;
        this.CreateDate = CreateDate;
        this.ReciverDate = ReciverDate;
        this.DoneDate = DoneDate;
        this.expectedDate = expectedDate;
        this.SerialNumbers = SerialNumbers;
    }

    public Warranty(int WarrantyID, int SerialID, int customerID, int Process_By,
            String ProofImg, String Notes, String Status,
            Date CreateDate, Date ReciverDate, Date DoneDate, Date expectedDate) {
        this.WarrantyID = WarrantyID;
        this.SerialID = SerialID;
        this.customerID = customerID;
        this.Process_By = Process_By;
        this.ProofImg = ProofImg;
        this.Notes = Notes;
        this.Status = Status;
        this.CreateDate = CreateDate;
        this.ReciverDate = ReciverDate;
        this.DoneDate = DoneDate;
        this.expectedDate = expectedDate;
    }

    public Warranty() {
    }

    public Warranty(int SerialID, int customerID, String WarrantyTerms, String ProofImg, String Notes) {
        this.customerID = customerID;
        this.WarrantyTerms = WarrantyTerms;
        this.ProofImg = ProofImg;
        this.Notes = Notes;
    }

    public Warranty(int WarrantyID, int SerialID, int supplierID, int customerID, LocalDateTime WarrantyStartDate, LocalDateTime WarrantyEndDate, String WarrantyTerms, String ProofImg, String BarCode, String Notes) {
        this.WarrantyID = WarrantyID;
        this.SerialID = SerialID;
        this.supplierID = supplierID;
        this.customerID = customerID;
        this.WarrantyStartDate = WarrantyStartDate;
        this.WarrantyEndDate = WarrantyEndDate;
        this.WarrantyTerms = WarrantyTerms;
        this.ProofImg = ProofImg;
        this.BarCode = BarCode;
        this.Notes = Notes;
    }

    public Date getExpectedDate() {
        return expectedDate;
    }

    public void setExpectedDate(Date expectedDate) {
        this.expectedDate = expectedDate;
    }

    public int getProcess_By() {
        return Process_By;
    }

    public void setProcess_By(int Process_By) {
        this.Process_By = Process_By;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public Date getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(Date CreateDate) {
        this.CreateDate = CreateDate;
    }

    public Date getReciverDate() {
        return ReciverDate;
    }

    public void setReciverDate(Date ReciverDate) {
        this.ReciverDate = ReciverDate;
    }

    public Date getDoneDate() {
        return DoneDate;
    }

    public void setDoneDate(Date DoneDate) {
        this.DoneDate = DoneDate;
    }

    public int getWarrantyID() {
        return WarrantyID;
    }

    public void setWarrantyID(int WarrantyID) {
        this.WarrantyID = WarrantyID;
    }

    public int getSerialID() {
        return SerialID;
    }

    public void setSerialID(int SerialID) {
        this.SerialID = SerialID;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public LocalDateTime getWarrantyStartDate() {
        return WarrantyStartDate;
    }

    public void setWarrantyStartDate(LocalDateTime WarrantyStartDate) {
        this.WarrantyStartDate = WarrantyStartDate;
    }

    public LocalDateTime getWarrantyEndDate() {
        return WarrantyEndDate;
    }

    public void setWarrantyEndDate(LocalDateTime WarrantyEndDate) {
        this.WarrantyEndDate = WarrantyEndDate;
    }

    public String getWarrantyTerms() {
        return WarrantyTerms;
    }

    public void setWarrantyTerms(String WarrantyTerms) {
        this.WarrantyTerms = WarrantyTerms;
    }

    public String getProofImg() {
        return ProofImg;
    }

    public void setProofImg(String ProofImg) {
        this.ProofImg = ProofImg;
    }

    public String getBarCode() {
        return BarCode;
    }

    public void setBarCode(String BarCode) {
        this.BarCode = BarCode;
    }

    public String getNotes() {
        return Notes;
    }

    public void setNotes(String Notes) {
        this.Notes = Notes;
    }

    public String getSerialNumbers() {
        return SerialNumbers;
    }

    public void setSerialNumbers(String SerialNumbers) {
        this.SerialNumbers = SerialNumbers;
    }
    
    

    @Override
    public String toString() {
        return "Warranty{" + "WarrantyID=" + WarrantyID + ", SerialID=" + SerialID + ", supplierID=" + supplierID + ", customerID=" + customerID + ", WarrantyStartDate=" + WarrantyStartDate + ", WarrantyEndDate=" + WarrantyEndDate + ", WarrantyTerms=" + WarrantyTerms + ", ProofImg=" + ProofImg + ", BarCode=" + BarCode + ", Notes=" + Notes + '}';
    }
}
