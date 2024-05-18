/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Date;

/**
 *
 * @author msi
 */
public class ProductDTO {

    //ProductID	CategoryID	Name	QuantityAvailable		RamCapacity	StorageCapacity	CpuBrand	VgaBrand
    private int productID;
    private String code;
    private String name;
    private String keywords;
    private String shortDescription;
    private String description;
    private int categoryID;
    private int supplierId;
    private boolean isActive;
    private double unitPrice;
    private String image;
    private int stockQuantity;
    private int unitOnOrders;
    private Date createdDate;
    private int createdBy;

    public ProductDTO() {
    }

    public ProductDTO(int productID, String code, String name, String keywords, String shortDescription, String description, int categoryID, int supplierId, boolean isActive, double unitPrice, String image, int stockQuantity, int unitOnOrders, Date createdDate, int createdBy) {
        this.productID = productID;
        this.code = code;
        this.name = name;
        this.keywords = keywords;
        this.shortDescription = shortDescription;
        this.description = description;
        this.categoryID = categoryID;
        this.supplierId = supplierId;
        this.isActive = isActive;
        this.unitPrice = unitPrice;
        this.image = image;
        this.stockQuantity = stockQuantity;
        this.unitOnOrders = unitOnOrders;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
    }

    public int getProductID() {
        return productID;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getKeywords() {
        return keywords;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public String getDescription() {
        return description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public String getImage() {
        return image;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public int getUnitOnOrders() {
        return unitOnOrders;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public void setUnitOnOrders(int unitOnOrders) {
        this.unitOnOrders = unitOnOrders;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productID=" + productID + ", code=" + code + ", name=" + name + ", keywords=" + keywords + ", shortDescription=" + shortDescription + ", description=" + description + ", categoryID=" + categoryID + ", supplierId=" + supplierId + ", isActive=" + isActive + ", unitPrice=" + unitPrice + ", image=" + image + ", stockQuantity=" + stockQuantity + ", unitOnOrders=" + unitOnOrders + ", createdDate=" + createdDate + ", createdBy=" + createdBy + '}';
    }


}
