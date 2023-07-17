/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author xuant
 */
public class Notification {

    private int notificationID;
    private int userID;
    private String title;
    private String message;
    private Date createAt;
    private int type;

    public Notification() {
    }

    public Notification(int notificationID, int userID, String title, String message, Date createAt, int type) {
        this.notificationID = notificationID;
        this.userID = userID;
        this.title = title;
        this.message = message;
        this.createAt = createAt;
        this.type = type;
    }

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCreateAt() {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        return sd.format(createAt);
    }

    public Date getCreateAtOB() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.createAt = new java.sql.Date(sd.parse(createAt).getTime());
        } catch (ParseException ex) {
            throw new RuntimeException("Invalid DOB");
        }
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
    

}
