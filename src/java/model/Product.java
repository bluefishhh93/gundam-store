/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import java.util.ArrayList;
import java.util.Arrays;
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
    private List<Feedback> feedbacks;

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

    public List<Feedback> getFeedbacks() {
        return feedbacks;
    }

    public void setFeedbacks(List<Feedback> feedbacks) {
        this.feedbacks = feedbacks;
    }

    public int getTotalProductSold() {
        ProductDAO pd = new ProductDAO();
        return pd.getTotalProductSold(ID);
    }

//    public List<Double> handleStar(){
//    // Create an array to store the counts of each star rating
//    int[] starCounts = new int[5];
//    // Loop through the feedbacks and increment the corresponding count
//    for(Feedback f : this.feedbacks){
//        int star = f.getStar();
//        if (star >= 1 && star <= 5) {
//            starCounts[star - 1]++;
//        }
//    }
//    // Calculate the ratio of each star rating and add it to the list
//    List<Double> ratioEachStar = new ArrayList<>();
//    double total = feedbacks.size();
//    // Check if total is zero to avoid division by zero error
//    if (total == 0) {
//        // Return a list of zeros for each star rating
//        return Arrays.asList(0.0, 0.0, 0.0, 0.0, 0.0);
//    } else {
//        // Calculate the ratio normally
//        for (int count : starCounts) {
//            ratioEachStar.add(count / total * 100);
//        }
//        return ratioEachStar;
//    }
    public List<Integer> handleStar() {
        // Create an array to store the counts of each star rating
        int[] starCounts = new int[5]; //0 0 0 0 0
        // Loop through the feedbacks and increment the corresponding count
        for (Feedback f : this.feedbacks) {
            int star = f.getStar();
            if (star >= 1 && star <= 5) {
                starCounts[star - 1]++;
            }
        }
        // Convert the array of counts to a list and return it
        List<Integer> numberOfEachStar = new ArrayList<>();
        for (int count : starCounts) {
            numberOfEachStar.add(count);
        }
        return numberOfEachStar;
    }

    public double averageStar() {
        List<Integer> numberOfEachStar = handleStar();
        int sum = 0;
        for (int i = 0; i < numberOfEachStar.size(); i++) {
            sum += numberOfEachStar.get(i) * (i + 1);
        }
        double average = (double) sum / this.feedbacks.size();
        return Math.round(average * 100) / 100.0;

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
