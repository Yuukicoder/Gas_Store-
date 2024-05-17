/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author LENOVO
 */
public class RoleDTO {
    private int roleID;
    private String code;
    private String name;
    private String description;

    public RoleDTO() {
    }

    public RoleDTO(int roleID, String code, String name, String description) {
        this.roleID = roleID;
        this.code = code;
        this.name = name;
        this.description = description;
    }

    public int getRoleID() {
        return roleID;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "RoleDTO{" + "roleID=" + roleID + ", code=" + code + ", name=" + name + ", description=" + description + '}';
    }
    
    
    
}
