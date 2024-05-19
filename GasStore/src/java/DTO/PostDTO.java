/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Date;

/**
 *
 * @author 1234
 */
public class PostDTO {

    private int PostID;
    private int adminID;
    private String Title;
    private String DateCreated;
    private String DateUpdated ;
    private String Postbanner;
    private String Context;
    private String Description;
    private int PostCategoryID;
    private int updatedBy;

    public PostDTO() {
    }

    public PostDTO(int PostID, int adminID, String Title, String DateCreated, String DateUpdated, String Postbanner, String Context, String Description, int PostCategoryID, int updatedBy) {
        this.PostID = PostID;
        this.adminID = adminID;
        this.Title = Title;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.Postbanner = Postbanner;
        this.Context = Context;
        this.Description = Description;
        this.PostCategoryID = PostCategoryID;
        this.updatedBy = updatedBy;
    }

    public int getPostID() {
        return PostID;
    }

    public int getAdminID() {
        return adminID;
    }

    public String getTitle() {
        return Title;
    }

    public String getDateCreated() {
        return DateCreated;
    }

    public String getDateUpdated() {
        return DateUpdated;
    }

    public String getPostbanner() {
        return Postbanner;
    }

    public String getContext() {
        return Context;
    }

    public String getDescription() {
        return Description;
    }

    public int getPostCategoryID() {
        return PostCategoryID;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setPostID(int PostID) {
        this.PostID = PostID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public void setDateCreated(String DateCreated) {
        this.DateCreated = DateCreated;
    }

    public void setDateUpdated(String DateUpdated) {
        this.DateUpdated = DateUpdated;
    }

    public void setPostbanner(String Postbanner) {
        this.Postbanner = Postbanner;
    }

    public void setContext(String Context) {
        this.Context = Context;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setPostCategoryID(int PostCategoryID) {
        this.PostCategoryID = PostCategoryID;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }

    @Override
    public String toString() {
        return "PostDTO{" + "PostID=" + PostID + ", adminID=" + adminID + ", Title=" + Title + ", DateCreated=" + DateCreated + ", DateUpdated=" + DateUpdated + ", Postbanner=" + Postbanner + ", Context=" + Context + ", Description=" + Description + ", PostCategoryID=" + PostCategoryID + ", updatedBy=" + updatedBy + '}';
    }
    
  
 
    
}
