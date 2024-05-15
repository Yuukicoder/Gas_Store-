/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author msi
 */
public class OrderDetail extends ProductDTO {

    //OrderDetailID ProductID OrderID Quantity UnitPrice DateCreated DateModified OrderDetailStatus
    private int orderDetailID;
    private int product_id;
    private int order_id;
    private int quantity;
    private double oprice;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailID, int product_id, int order_id, int quantity, double oprice, int status) {
        this.orderDetailID = orderDetailID;
        this.product_id = product_id;
        this.order_id = order_id;
        this.quantity = quantity;
        this.oprice = oprice;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getOprice() {
        return oprice;
    }

    public void setOprice(double oprice) {
        this.oprice = oprice;
    }

}
