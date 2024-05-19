/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author LENOVO
 */
public class SerialNumber {
    private int SerialID;
    private int ProductID;
    private String SerialNumber;

    public SerialNumber() {
    }

    public SerialNumber(int SerialID, int ProductID, String SerialNumber) {
        this.SerialID = SerialID;
        this.ProductID = ProductID;
        this.SerialNumber = SerialNumber;
    }

    public int getSerialID() {
        return SerialID;
    }

    public int getProductID() {
        return ProductID;
    }

    public String getSerialNumber() {
        return SerialNumber;
    }

    public void setSerialID(int SerialID) {
        this.SerialID = SerialID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public void setSerialNumber(String SerialNumber) {
        this.SerialNumber = SerialNumber;
    }

    @Override
    public String toString() {
        return "SerialNumber{" + "SerialID=" + SerialID + ", ProductID=" + ProductID + ", SerialNumber=" + SerialNumber + '}';
    }
    
    
    
}
