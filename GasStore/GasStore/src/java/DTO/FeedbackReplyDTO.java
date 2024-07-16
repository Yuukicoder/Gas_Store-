/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Date;

/**
 *
 * @author phung
 */
public class FeedbackReplyDTO {
    private int id ;
    private String reply;
    private Date date;
    private AdminDTO accountDTO;
    private FeedbackDTO dTO;

    public FeedbackReplyDTO() {
    }

    
    public FeedbackReplyDTO(int id, String reply, Date date, AdminDTO accountDTO, FeedbackDTO dTO) {
        this.id = id;
        this.reply = reply;
        this.date = date;
        this.accountDTO = accountDTO;
        this.dTO = dTO;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public AdminDTO getAccountDTO() {
        return accountDTO;
    }

    public void setAccountDTO(AdminDTO accountDTO) {
        this.accountDTO = accountDTO;
    }

    public FeedbackDTO getdTO() {
        return dTO;
    }

    public void setdTO(FeedbackDTO dTO) {
        this.dTO = dTO;
    }
    
}
