/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author xuant
 */
public class Order {

    private int orderID;
    private int userID;
    private Date orderDate;
    private Date shippedDate;
    private double totalMoney;
    private String shipAddress;
    
    public Order() {
    }

    public Order(int orderID, Date orderDate, double totalMoney, String shipAddress) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.totalMoney = totalMoney;
        this.shipAddress = shipAddress;
    }

    
    public Order(int orderID, int userID, Date orderDate, Date shippedDate, double totalMoney) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.shippedDate = shippedDate;
        this.totalMoney = totalMoney;
    }

    public Order(int orderID, int userID, Date orderDate, Date shippedDate, double totalMoney, String shipAddress) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.shippedDate = shippedDate;
        this.totalMoney = totalMoney;
        this.shipAddress = shipAddress;
    }
    
    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getOrderDate() {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        return sd.format(orderDate);
    }

    public Date getOrderDateOB() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.orderDate = new java.sql.Date(sd.parse(orderDate).getTime());
        } catch (ParseException ex) {
            throw new RuntimeException("Invalid DOB");
        }
    }

    public String getShippedDate() {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        return sd.format(shippedDate);
    }

    public Date getShippedDateOB() {
        return shippedDate;
    }

    public void setShippedDate(String shippedDate) {
         SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.shippedDate = new java.sql.Date(sd.parse(shippedDate).getTime());
        } catch (ParseException ex) {
            throw new RuntimeException("Invalid DOB");
        }
    }

    public double getTotalMoney() {
        return totalMoney;
    }
    
    
    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    
}
