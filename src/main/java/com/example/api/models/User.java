package com.example.api.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "USER")
public class User {
    @Id
    private String userID;
    private String name;
    private String address;
    private String phone;
//    private String gender;
//    private Date dob;
    private String email;
    private String password;

    public User() {
    }

    public User(String name, String address, String phone, String email, String password) {
        this.userID = UUID.randomUUID().toString();
        this.name = name;
        this.address = address;
        this.phone = phone;
//        this.gender = gender;
//        this.dob = dob;
        this.email = email;
        this.password = password;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
