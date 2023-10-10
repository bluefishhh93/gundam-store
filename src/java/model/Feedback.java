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
public class Feedback {
    private int feedbackId;
    private int productId;
    private String content;
    private User user;
    private int star;
    private Date createAt;

    public Feedback() {
    }

    public Feedback(int feedbackId, int productId, String content, User user, int star, Date createAt) {
        this.feedbackId = feedbackId;
        this.productId = productId;
        this.content = content;
        this.user = user;
        this.star = star;
        this.createAt = createAt;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
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
    
    
}
