/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.category;

/**
 *
 * @author nguye
 */
public class CategoryDTO {
    private int CategoryID;
    private String CategoryName;
    private String CategoryImages;
    private int Status;

    public CategoryDTO() {
    }

    public CategoryDTO(int CategoryID, String CategoryName, String CategoryImages, int Status) {
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
        this.CategoryImages = CategoryImages;
        this.Status = Status;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getCategoryImages() {
        return CategoryImages;
    }

    public void setCategoryImages(String CategoryImages) {
        this.CategoryImages = CategoryImages;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
    
    
}
