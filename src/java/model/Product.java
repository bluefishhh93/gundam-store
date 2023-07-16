/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import java.util.List;

/**
 *
 * @author xuant
 */
public class Product {
    private int ID;
    private String productName;
    private Category category;
    private double price;
    private int unitInStock;
    private String brand;
    private List<String> images;
    private List<String> productDetails;

    public Product() {
    }

    public Product(int ID, String productName, Category category, double price, int unitInStock, String brand) {
        this.ID = ID;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.unitInStock = unitInStock;
        this.brand = brand;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getUnitInStock() {
        return unitInStock;
    }

    public void setUnitInStock(int unitInStock) {
        this.unitInStock = unitInStock;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public List<String> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(List<String> productDetails) {
        this.productDetails = productDetails;
    }
    
    
    
    public int getTotalProductSold(){
        ProductDAO pd = new ProductDAO();
        return pd.getTotalProductSold(ID);
    }
    
    
}
/*
 CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NULL,
	[CategoryID] [int] NULL,
	[Price] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[Brand] [nvarchar](30) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED (ProductID)
 )
*/