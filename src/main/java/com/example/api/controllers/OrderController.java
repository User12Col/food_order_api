package com.example.api.controllers;

import com.example.api.models.Category;
import com.example.api.models.Order;
import com.example.api.models.ResponeObject;
import com.example.api.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/api/v1/Orders")
public class OrderController {
    @Autowired
    private OrderRepository orderRepository;

    @GetMapping("/getOrderByUserID")
    ResponseEntity<ResponeObject> getOrderByUserID(@RequestParam String userID){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get Order Success", orderRepository.getOrderByUserID(userID))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Get Order Fail", e.toString())
            );
        }
    }

    @GetMapping("/getOrderById")
    ResponseEntity<ResponeObject> getOrderById(@RequestParam String orderID){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get order success", orderRepository.findById(orderID))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Get order fail", e.toString())
            );
        }
    }

    @PostMapping("/addOrder")
    ResponseEntity<ResponeObject> addOrder(@RequestBody Order order){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Add Order Success", orderRepository.save(order))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    new ResponeObject("fail", "Add Order Fail", e.toString())
            );
        }
    }

    @GetMapping("")
    ResponseEntity<ResponeObject> getAllOrder(){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get Order Success", orderRepository.findAll())
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    new ResponeObject("fail", "Get Order Fail", e.toString())
            );
        }
    }

    @PutMapping("/updateStatus")
    ResponseEntity<ResponeObject> updateStatus(@RequestParam String id, @RequestBody Order newOrder){
        try {
            Order foundOrder = orderRepository.findById(id).map(order->{
                order.setUser(newOrder.getUser());
                order.setStatus(newOrder.getStatus());
                order.setDate(newOrder.getDate());
                order.setAddress(newOrder.getAddress());
                order.setTotalPrice(newOrder.getTotalPrice());
                order.setEmployee(newOrder.getEmployee());
                return orderRepository.save(order);
            }).orElseGet(()->{
                newOrder.setOrderID(id);
                return orderRepository.save(newOrder);
            });
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Update success", foundOrder)
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Update fail", e.toString())
            );
        }
    }

    @GetMapping("/getOrderByUserAndStatus")
    ResponseEntity<ResponeObject> getOrderByUserAndStatus(@RequestParam String userID, @RequestParam String status){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get Order Success", orderRepository.getOrderByUserAndStatus(userID, status))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Get Order Fail", e.toString())
            );
        }
    }
}
