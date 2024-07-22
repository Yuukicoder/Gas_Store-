/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author 1234
 */
public class PostDTO {

    private int PostID;
    private int administratorID;
    private String Title;
    private String DateCreated;
    private String DateUpdated;
    private String Postbanner ;
    private String Context;
    private String Description;
    private String PostCate;
    private int updatedBy;
    

    public PostDTO() {
    }

    public PostDTO(int PostID, int administratorID, String Title, String DateCreated, String DateUpdated, String Postbanner, String Context, String Description, String PostCate, int updatedBy) {
        this.PostID = PostID;
        this.administratorID = administratorID;
        this.Title = Title;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.Postbanner = Postbanner;
        this.Context = Context;
        this.Description = Description;
        this.PostCate = PostCate;
        this.updatedBy = updatedBy;
    }

    public PostDTO(int PostID, String Title, String Postbanner, String Context, String Description, String PostCate) {
        this.PostID = PostID;
        this.Title = Title;
        this.Postbanner = Postbanner;
        this.Context = Context;
        this.Description = Description;
        this.PostCate = PostCate;
        System.out.println("PostDTO: " + PostCate);
    }

    public PostDTO(int PostID, String Title, String Postbanner, String Context, String Description) {
        this.PostID = PostID;
        this.Title = Title;
        this.Postbanner = Postbanner;
        this.Context = Context;
        this.Description = Description;
    }

    public PostDTO(int PostID, int administratorID, String Title, String Postbanner, String Context, String Description, String PostCate, int updatedBy) {
        this.PostID = PostID;
        this.administratorID = administratorID;
        this.Title = Title;
        this.Postbanner = Postbanner;
        this.Context = Context;
        this.Description = Description;
        this.PostCate = PostCate;
        this.updatedBy = updatedBy;
    }
    
    

    public int getPostID() {
        return PostID;
    }

    public int getAdministratorID() {
        return administratorID;
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

    public String getPostCate() {
        return PostCate;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setPostID(int PostID) {
        this.PostID = PostID;
    }

    public void setAdministratorID(int administratorID) {
        this.administratorID = administratorID;
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

    public void setPostCate(String PostCate) {
        this.PostCate = PostCate;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }

    @Override
    public String toString() {
        return "PostDTO{" + "PostID=" + PostID + ", administratorID=" + administratorID + ", Title=" + Title + ", DateCreated=" + DateCreated + ", DateUpdated=" + DateUpdated + ", Postbanner=" + Postbanner + ", Context=" + Context + ", Description=" + Description + ", PostCate=" + PostCate + ", updatedBy=" + updatedBy + '}';
    }
    
}