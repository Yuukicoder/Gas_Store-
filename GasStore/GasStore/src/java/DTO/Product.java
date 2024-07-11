/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author dell456
 */
public class Product {
    private int productID;
    private String code;
    private String name;
    private String keywords;
    private String shortDescription;
    private String description;
    private int categoryID;
    private int supplierID;
    private boolean isActive;
    private float unitPrice;
    private String image;
    private int stockQuantity;
    private int unitOnOrders;
    private String createdDate;
    private int createdBy;
    private int limit;

    public Product() {
    }
    
    public Product(int productID, String code, String name, String keywords, String shortDescription, String description, int categoryID, int supplierID, boolean isActive, float unitPrice, String image, int stockQuantity, int unitOnOrders, String createdDate, int createdBy) {
        this.productID = productID;
        this.code = code;
        this.name = name;
        this.keywords = keywords;
        this.shortDescription = shortDescription;
        this.description = description;
        this.categoryID = categoryID;
        this.supplierID = supplierID;
        this.isActive = isActive;
        this.unitPrice = unitPrice;
        this.image = image;
        this.stockQuantity = stockQuantity;
        this.unitOnOrders = unitOnOrders;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getUnitOnOrders() {
        return unitOnOrders;
    }

    public void setUnitOnOrders(int unitOnOrders) {
        this.unitOnOrders = unitOnOrders;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }
    
    public String getFormattedPrice() {
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        return numberFormat.format(this.unitPrice);
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", code=" + code + ", name=" + name + ", keywords=" + keywords + ", shortDescription=" + shortDescription + ", description=" + description + ", categoryID=" + categoryID + ", supplierID=" + supplierID + ", isActive=" + isActive + ", unitPrice=" + unitPrice + ", image=" + image + ", stockQuantity=" + stockQuantity + ", unitOnOrders=" + unitOnOrders + ", createdDate=" + createdDate + ", createdBy=" + createdBy + '}';
    }
    
    
}
