/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class CustomerDTO {
    private int customerID;
    private String userName;
    private String password;
    private Date created;
    private Date lastLogin;
    private boolean status;
    private boolean gender;
    private String image;
    private String firstName;
    private String lastName;
    private String address;
    private String phone;
    private int totalMoney;
    private int roleID;
    private String email;

    public CustomerDTO() {
    }
    
    public CustomerDTO(int customerID, String userName, String password, Date created, Date lastLogin, boolean status, boolean gender, String image, String firstName, String lastName, String address, String phone, int totalMoney, int roleID, String email) {
        this.customerID = customerID;
        this.userName = userName;
        this.password = password;
        this.created = created;
        this.lastLogin = lastLogin;
        this.status = status;
        this.gender = gender;
        this.image = image;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phone = phone;
        this.totalMoney = totalMoney;
        this.roleID = roleID;
        this.email = email;
    }

    public int getCustomerID() {
        return customerID;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public Date getCreated() {
        return created;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public boolean isStatus() {
        return status;
    }

    public boolean isGender() {
        return gender;
    }

    public String getImage() {
        return image;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public int getRoleID() {
        return roleID;
    }

    public String getEmail() {
        return email;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "CustomerDTO{" + "customerID=" + customerID + ", userName=" + userName + ", password=" + password + ", created=" + created + ", lastLogin=" + lastLogin + ", status=" + status + ", gender=" + gender + ", image=" + image + ", firstName=" + firstName + ", lastName=" + lastName + ", address=" + address + ", phone=" + phone + ", totalMoney=" + totalMoney + ", roleID=" + roleID + ", email=" + email + '}';
    }
    
    
    
    
}
