/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author msi
 */
public class CategoryDTO {

    private int CategoryID;
    private String name;
    private String DateCreated;
    private String DateModified;
    private int Status;

    public CategoryDTO() {
    }

    public CategoryDTO(int CategoryID, String name, String DateCreated, String DateModified, int Status) {
        this.CategoryID = CategoryID;
        this.name = name;
        this.DateCreated = DateCreated;
        this.DateModified = DateModified;
        this.Status = Status;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateCreated() {
        return DateCreated;
    }

    public void setDateCreated(String DateCreated) {
        this.DateCreated = DateCreated;
    }

    public String getDateModified() {
        return DateModified;
    }

    public void setDateModified(String DateModified) {
        this.DateModified = DateModified;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

}
