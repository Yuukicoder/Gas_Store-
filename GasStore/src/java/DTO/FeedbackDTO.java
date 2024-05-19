/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author tungl
 */
public class FeedbackDTO {

    private int feedBackID;
    private int productID;
    private int orderID;
    private String tilte;
    private String context;
    private Date date;
    private int start;
    private boolean status;
    private AccountDTO accountDTO;
    private FeedbackReplyDTO feedbackReplyDTO;
    private ProductDTO productDTO;
    private int count;

    public ProductDTO getProductDTO() {
        return productDTO;
    }

    public void setProductDTO(ProductDTO productDTO) {
        this.productDTO = productDTO;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

   

    
    public AccountDTO getAccountDTO() {
        return accountDTO;
    }

    public void setAccountDTO(AccountDTO accountDTO) {
        this.accountDTO = accountDTO;
    }

    public FeedbackReplyDTO getFeedbackReplyDTO() {
        return feedbackReplyDTO;
    }

    public void setFeedbackReplyDTO(FeedbackReplyDTO feedbackReplyDTO) {
        this.feedbackReplyDTO = feedbackReplyDTO;
    }

    public int getFeedBackID() {
        return feedBackID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setFeedBackID(int feedBackID) {
        this.feedBackID = feedBackID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getTilte() {
        return tilte;
    }

    public void setTilte(String tilte) {
        this.tilte = tilte;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    @Override
    public String toString() {
        return "FeedbackDTO{" + "feedBackID=" + feedBackID + ", productID=" + productID + ", orderID=" + orderID + ", tilte=" + tilte + ", context=" + context + ", date=" + date + ", start=" + start + ", status=" + status + ", accountDTO=" + accountDTO + ", feedbackReplyDTO=" + feedbackReplyDTO + ", productDTO=" + productDTO + ", count=" + count + '}';
    }
    
}
