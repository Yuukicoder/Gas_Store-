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
public class DiscountDTO {

    private int DiscountID;
    private String DiscountCode;
    private String Description;
    private int DiscountAmount;
    private String DiscountType;
    private int MinimumPurchase;
    private Date StartDate;
    private Date EndDate;
    private boolean IsActive;

    public DiscountDTO() {
    }

    public DiscountDTO(int DiscountID, String DiscountCode, String Description, int DiscountAmount, String DiscountType, int MinimumPurchase, Date StartDate, Date EndDate, boolean IsActive) {
        this.DiscountID = DiscountID;
        this.DiscountCode = DiscountCode;
        this.Description = Description;
        this.DiscountAmount = DiscountAmount;
        this.DiscountType = DiscountType;
        this.MinimumPurchase = MinimumPurchase;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
        this.IsActive = IsActive;
    }

    public int getDiscountID() {
        return DiscountID;
    }

    public String getDiscountCode() {
        return DiscountCode;
    }

    public String getDescription() {
        return Description;
    }

    public int getDiscountAmount() {
        return DiscountAmount;
    }

    public String getDiscountType() {
        return DiscountType;
    }

    public int getMinimumPurchase() {
        return MinimumPurchase;
    }

    public Date getStartDate() {
        return StartDate;
    }

    public Date getEndDate() {
        return EndDate;
    }

    public boolean isIsActive() {
        return IsActive;
    }

    public void setDiscountID(int DiscountID) {
        this.DiscountID = DiscountID;
    }

    public void setDiscountCode(String DiscountCode) {
        this.DiscountCode = DiscountCode;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setDiscountAmount(int DiscountAmount) {
        this.DiscountAmount = DiscountAmount;
    }

    public void setDiscountType(String DiscountType) {
        this.DiscountType = DiscountType;
    }

    public void setMinimumPurchase(int MinimumPurchase) {
        this.MinimumPurchase = MinimumPurchase;
    }

    public void setStartDate(Date StartDate) {
        this.StartDate = StartDate;
    }

    public void setEndDate(Date EndDate) {
        this.EndDate = EndDate;
    }

    public void setIsActive(boolean IsActive) {
        this.IsActive = IsActive;
    }

    @Override
    public String toString() {
        return "DiscountDTO{" + "DiscountID=" + DiscountID + ", DiscountCode=" + DiscountCode + ", Description=" + Description + ", DiscountAmount=" + DiscountAmount + ", DiscountType=" + DiscountType + ", MinimumPurchase=" + MinimumPurchase + ", StartDate=" + StartDate + ", EndDate=" + EndDate + ", IsActive=" + IsActive + '}';
    }
    

}
