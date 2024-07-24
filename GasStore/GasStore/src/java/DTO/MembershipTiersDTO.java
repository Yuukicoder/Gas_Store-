/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author Vu Anh
 */
public class MembershipTiersDTO {
    private int TierID;
    private String TierName;
    private int MinPoints;
    private int MaxPoints;
    private double DiscountPercentage;
    private double BonusPointsRate;

    public MembershipTiersDTO() {
    }

    public int getTierID() {
        return TierID;
    }

    public void setTierID(int TierID) {
        this.TierID = TierID;
    }

    public String getTierName() {
        return TierName;
    }

    public void setTierName(String TierName) {
        this.TierName = TierName;
    }

    public int getMinPoints() {
        return MinPoints;
    }

    public void setMinPoints(int MinPoints) {
        this.MinPoints = MinPoints;
    }

    public int getMaxPoints() {
        return MaxPoints;
    }

    public void setMaxPoints(int MaxPoints) {
        this.MaxPoints = MaxPoints;
    }

    public double getDiscountPercentage() {
        return DiscountPercentage;
    }

    public void setDiscountPercentage(double DiscountPercentage) {
        this.DiscountPercentage = DiscountPercentage;
    }

    public double getBonusPointsRate() {
        return BonusPointsRate;
    }

    public void setBonusPointsRate(double BonusPointsRate) {
        this.BonusPointsRate = BonusPointsRate;
    }
    
    
}
