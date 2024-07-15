/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author HP
 */
public class SerialNumber {
    private int SerialID, ProductID;
    private String SerialNumber;

    public SerialNumber(int SerialID, int ProductID, String SerialNumber) {
        this.SerialID = SerialID;
        this.ProductID = ProductID;
        this.SerialNumber = SerialNumber;
    }

    public int getSerialID() {
        return SerialID;
    }

    public void setSerialID(int SerialID) {
        this.SerialID = SerialID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getSerialNumber() {
        return SerialNumber;
    }

    public void setSerialNumber(String SerialNumber) {
        this.SerialNumber = SerialNumber;
    }

    @Override
    public String toString() {
        return "SerialNumber{" + "SerialID=" + SerialID + ", ProductID=" + ProductID + ", SerialNumber=" + SerialNumber + '}';
    }
}
