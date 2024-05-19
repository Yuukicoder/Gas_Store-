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
public class DiscountUsageDTO {

    private int UsageID;
    private int DiscountID;
    private Date UseDate;
    private int OrderID;

    public DiscountUsageDTO() {
    }

    public DiscountUsageDTO(int UsageID, int DiscountID, Date UseDate, int OrderID) {
        this.UsageID = UsageID;
        this.DiscountID = DiscountID;
        this.UseDate = UseDate;
        this.OrderID = OrderID;
    }

    public int getUsageID() {
        return UsageID;
    }

    public int getDiscountID() {
        return DiscountID;
    }

    public Date getUseDate() {
        return UseDate;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setUsageID(int UsageID) {
        this.UsageID = UsageID;
    }

    public void setDiscountID(int DiscountID) {
        this.DiscountID = DiscountID;
    }

    public void setUseDate(Date UseDate) {
        this.UseDate = UseDate;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    @Override
    public String toString() {
        return "DiscountUsageDTO{" + "UsageID=" + UsageID + ", DiscountID=" + DiscountID + ", UseDate=" + UseDate + ", OrderID=" + OrderID + '}';
    }
    

}
