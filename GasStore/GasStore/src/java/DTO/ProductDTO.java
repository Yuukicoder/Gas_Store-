/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;
import java.sql.Date;

/**
 *
 * @author msi
 */
public class ProductDTO {
    
    private int productId;
    private String code;
    private String name;
    private String keywords;
    private String shortDescription;
    private String description;
    private int categoryId;
    private int supplierId;
    private int isActive;
    private double unitPrice;
    private String image;
    private int stockQuantity;
    private int unitOnOrders;
    private Date createdDate;
    private int createdBy;
    private int limit;
   
//    private int productID;
//    private int categoryID;
//    private String name;
//    private String image;
//    private int quantity;
//    private double price;
//    private String ram;
//    private String storage;
//    private String cpu;
//    private String vga;
//    private int Status;
//    private String description;
//    private int sold;

    public ProductDTO() {
    }

    public ProductDTO(int productId, String code, String name, String keywords, String shortDescription, String description, int categoryId, int supplierId, int isActive, double unitPrice, String image, int stockQuantity, int unitOnOrders, Date createdDate, int createdBy) {
        this.productId = productId;
        this.code = code;
        this.name = name;
        this.keywords = keywords;
        this.shortDescription = shortDescription;
        this.description = description;
        this.categoryId = categoryId;
        this.supplierId = supplierId;
        this.isActive = isActive;
        this.unitPrice = unitPrice;
        this.image = image;
        this.stockQuantity = stockQuantity;
        this.unitOnOrders = unitOnOrders;
        this.createdDate = createdDate;
        this.createdBy = createdBy;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

  
   

}
