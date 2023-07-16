package model;

import java.sql.Date;
import java.util.ArrayList;

public class Order {
    private int id;
    private int userId;
    private String name;
    private String phone;
    private String address;
    private Date orderDate;
    private ArrayList<Product> products;
    private double total;
    private String status;

    public Order() {
    }
    public Order(int userId, String name, String phone, String address, Date orderDate, ArrayList<Product> products, String status) {
        this.userId = userId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.products = products;
//        this.total = total;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }
    public double getTotal() {
        for (Product product : products) {
            total += product.getPrice();
        }
        return total;
    }

//    public void setTotal(double total) {
//        this.total = total;
//    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
