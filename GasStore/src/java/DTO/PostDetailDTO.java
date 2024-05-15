/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author 1234
 */
public class PostDetailDTO {
   
    private int imgID;
    private String path;
    private String description ;
    private String context ;

    public PostDetailDTO(int imgID, String path, String description, String context) {
        this.imgID = imgID;
        this.path = path;
        this.description = description;
        this.context = context;
    }

    public PostDetailDTO() {
    }

    public int getImgID() {
        return imgID;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }
    
    

    
}
