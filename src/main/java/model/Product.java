/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import java.util.List;


public class Product {
    private int ID;
    private String productName;



    private Category category;
    private double price;
    private String productDetail;
    private int unitInStock;
    private String brand;
    private List<String> images;



    private String picture;

    public Product() {
    }
    public Product(int ID, String productName, Category category, double price, String productDetail, int unitInStock, List<String> images) {
        this.ID = ID;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.productDetail = productDetail;
        this.unitInStock = unitInStock;
        this.images = images;
    }
    public Product(int ID, String productName, Category category, double price, String productDetail, int unitInStock, String picture) {
        this.ID = ID;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.productDetail = productDetail;
        this.unitInStock = unitInStock;
        this.picture = picture;
    }
    public Product(String productName, Category category, double price, String productDetail, int unitInStock, String picture) {
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.productDetail = productDetail;
        this.unitInStock = unitInStock;
        this.picture = picture;
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
    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getTotalProductSold(){
        ProductDAO pd = new ProductDAO();
        return pd.getTotalProductSold(ID);
    }

    public String getFirstImage(){
        return images.get(0);
    }
    @Override
    public String toString() {
        return getID() + " "
                + getCategory() + " "
                + getProductName() + " "
                + getPrice() + " "
                + getUnitInStock() + " "
                + getProductDetail() + " "
                + getImages();
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