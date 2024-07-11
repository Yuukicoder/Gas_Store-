/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author Vu Anh
 */
public class NotificationReceiverDTO {
    private int notiReceiverId;
    private int notiID;
    private int receiverType;
    private int receiverID;

    public NotificationReceiverDTO() {
    }

    public int getNotiReceiverId() {
        return notiReceiverId;
    }

    public void setNotiReceiverId(int notiReceiverId) {
        this.notiReceiverId = notiReceiverId;
    }

    public int getNotiID() {
        return notiID;
    }

    public void setNotiID(int notiID) {
        this.notiID = notiID;
    }

    public int getReceiverType() {
        return receiverType;
    }

    public void setReceiverType(int receiverType) {
        this.receiverType = receiverType;
    }

    public int getReceiverID() {
        return receiverID;
    }

    public void setReceiverID(int receiverID) {
        this.receiverID = receiverID;
    }
}
