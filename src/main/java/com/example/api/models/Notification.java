package com.example.api.models;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
@Table(name = "NOTIFICATION")
public class Notification {

    @Id
    private String notiID;
    private String date;
    private String content;
    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;

    public Notification() {
    }

    public Notification(String date, String content, User user) {
        this.notiID = UUID.randomUUID().toString();
        this.date = date;
        this.content = content;
        this.user = user;
    }

    public String getNotiID() {
        return notiID;
    }

    public void setNotiID(String notiID) {
        this.notiID = notiID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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
}
