/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author vip2021
 */
public class Administrator {
     private int administratorID;
    private String userName;
    private String password;
    private Date lastLogin;
    private boolean isActive;
    private int roleID;
    private String email;
    private String img;
    private String name;
    private String discription;

    public Administrator(int administratorID, String userName, String password, int roleID, String email, String img, String name,boolean isActive) {
        this.administratorID = administratorID;
        this.userName = userName;
        this.password = password;
        this.roleID = roleID;
        this.email = email;
        this.img = img;
        this.name = name;
        this.isActive = isActive;
    }

    public Administrator(int administratorID, String userName, String password, int roleID, String email, String img,boolean isActive) {
        this.administratorID = administratorID;
        this.userName = userName;
        this.password = password;
        this.roleID = roleID;
        this.email = email;
        this.img = img;
        this.isActive = isActive;
    }

   
    
    public Administrator(int administratorID, String userName, String password, Date lastLogin, boolean isActive, int roleID, String email, String img) {
        this.administratorID = administratorID;
        this.userName = userName;
        this.password = password;
        this.lastLogin = lastLogin;
        this.isActive = isActive;
        this.roleID = roleID;
        this.email = email;
        this.img = img;
    }

    public Administrator(int administratorID, String userName, String password, boolean isActive, int roleID, String email) {
        this.administratorID = administratorID;
        this.userName = userName;
        this.password = password;
        this.isActive = isActive;
        this.roleID = roleID;
        this.email = email;
    }

   

    public Administrator(int administratorID, String userName, String password, int roleID, String email, String img) {
        this.administratorID = administratorID;
        this.userName = userName;
        this.password = password;
        this.roleID = roleID;
        this.email = email;
        this.img = img;
    }

   
  

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }
    

    public int getAdministratorID() {
        return administratorID;
    }

    public void setAdministratorID(int administratorID) {
        this.administratorID = administratorID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}
