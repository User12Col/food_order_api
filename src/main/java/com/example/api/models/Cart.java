package com.example.api.models;

import jakarta.persistence.*;

@Entity
@Table(name = "CART")
public class Cart {
    @Id
    private String cartID;

    @ManyToOne
    @JoinColumn(name = "foodID")
    private Food food;

    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;

    private int quantity;
    private double totalPrice;

    public Cart() {
    }

    public Cart(String cartID, Food food, User user, int quantity, double totalPrice) {
        this.cartID = cartID;
        this.food = food;
        this.user = user;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCartID() {
        return cartID;
    }

    public void setCartID(String cartID) {
        this.cartID = cartID;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
