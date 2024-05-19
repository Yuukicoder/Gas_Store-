/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author Admin
 */
public class AdminDTO extends RoleDTO{
    private int adminID;
    private String userName;
    private String password;
    private String lastLogin;
    private int isActive;
    private int roleID;
    private String email;
    private String img;

    public AdminDTO() {
    }

    public AdminDTO(int adminID, String userName, String password, String lastLogin, int isActive, int roleID, String email, String img) {
        this.adminID = adminID;
        this.userName = userName;
        this.password = password;
        this.lastLogin = lastLogin;
        this.isActive = isActive;
        this.roleID = roleID;
        this.email = email;
        this.img = img;
    }

    public int getAdminID() {
        return adminID;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public int getIsActive() {
        return isActive;
    }

    public int getRoleID() {
        return roleID;
    }

    public String getEmail() {
        return email;
    }

    public String getImg() {
        return img;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "AdminDTO{" + "adminID=" + adminID + ", userName=" + userName + ", password=" + password + ", lastLogin=" + lastLogin + ", isActive=" + isActive + ", roleID=" + roleID + ", email=" + email + ", img=" + img + '}';
    }

    
    
}
