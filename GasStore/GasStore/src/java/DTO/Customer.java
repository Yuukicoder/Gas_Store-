/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Date;

/**
 *
 * @author vip2021
 */
public class Customer {
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
    private double totalMoney;
    private String email;
    private boolean isCustomer;
    
    public Customer() {
    }

    public Customer(int customerID, String userName, String password, Date created, Date lastLogin, boolean status, boolean gender, String image, String firstName, String lastName, String address, String phone, double totalMoney, String email, boolean isCustomer) {
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
        this.email = email;
        this.isCustomer = isCustomer;
    }

    public Customer(int customerID) {
        this.customerID = customerID;
    }

    public Customer(int customerID, String userName, String password, String firstName, String lastName, String phone, String email) {
        this.customerID = customerID;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
    }

public Customer(String userName, String password, String email) {
      
        this.userName = userName;
        this.password = password;
        this.email = email;
    }
    

    public Customer(int customerID, String userName, String password, String image, String firstName, String lastName, String phone, String email) {
        this.customerID = customerID;
        this.userName = userName;
        this.password = password;
//        this.status = status;
//        this.gender = gender;
        this.image = image;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
    }
    
    public Customer(String userName, String password, String firstName, String lastName,boolean isCustomer, String phone, String email) {
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.isCustomer = isCustomer;
        this.email = email;
    }

    public Customer(int customerID, String userName, String password, String firstName, String lastName, boolean isCustomer, String phone, String email) {
        this.customerID = customerID;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.isCustomer = isCustomer;
        this.email = email;
    }

    public Customer(int customerID, String userName, String password, String image, String firstName, String lastName, String address, String phone, String email) {
        this.customerID = customerID;
        this.userName = userName;
        this.password = password;
//        this.lastLogin = lastLogin;
        this.image = image;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }
    
    public Customer(int customerID, String userName, String password, Date created, Date lastLogin, boolean status, boolean gender, String image, String firstName, String lastName, String address, String phone, int totalMoney, boolean isCustomer, String email) {
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
        this.isCustomer = isCustomer;
        this.email = email;
    }
    
    
    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
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

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getFirstName() {
        return firstName;
    }
 public String getFullName() {
        return getFirstName() + " " + getLastName();
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isIsCustomer() {
        return isCustomer;
    }

    public void setIsCustomer(boolean isCustomer) {
        this.isCustomer = isCustomer;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", userName=" + userName + ", password=" + password + ", created=" + created + ", lastLogin=" + lastLogin + ", status=" + status + ", gender=" + gender + ", image=" + image + ", firstName=" + firstName + ", lastName=" + lastName + ", address=" + address + ", phone=" + phone + ", totalMoney=" + totalMoney + ", email=" + email + ", isCustomer=" + isCustomer + '}';
    }
    
    

    
}
