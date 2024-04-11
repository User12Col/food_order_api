package com.example.api.models;

import jakarta.persistence.*;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "ORDERDETAIL")
public class OrderDetail {
    @Id
    private String orderDetailID;

    @ManyToOne
    @JoinColumn(name = "orderID")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "foodID")
    private Food foods;

    private int quantity;

    public OrderDetail(String orderDetailID, Order order, Food foods, int quantity) {
        this.orderDetailID = orderDetailID;
        this.order = order;
        this.foods = foods;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public OrderDetail() {
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Food getFoods() {
        return foods;
    }

    public void setFoods(Food foods) {
        this.foods = foods;
    }
}
