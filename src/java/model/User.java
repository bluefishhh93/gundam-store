/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.OrderDAO;
import java.util.List;

/**
 *
 * @author xuant
 */
public class User {

    private int userID;
    private String password;
    private String name;
    private String phone;
    private String email;
    private boolean isAdmin;
    private List<Notification> notifications;
    public User() {
    }

    public User(int userID, String password, String name, String phone, String email, boolean isAdmin) {
        this.userID = userID;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.isAdmin = isAdmin;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public List<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }
    
    public List<Order> getUncheckOrder(){
        OrderDAO od = new OrderDAO();
        return od.uncheckedOrders(userID);
    }
    
    public int getNumberOfOrder(){
        OrderDAO od = new OrderDAO();
        return od.getNumberOfOrderByID(userID);
    }

}
