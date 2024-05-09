package com.example.api.controllers;

import com.example.api.models.OrderDetail;
import com.example.api.models.ResponeObject;
import com.example.api.repositories.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping(path = "/api/v1/OrderDetails")
public class OrderDetailController {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @GetMapping("/getByOrderID")
    ResponseEntity<ResponeObject> getOrderDetailByOrderID(@RequestParam String orderID){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get Order Detail Success", orderDetailRepository.getOrderDetailByOrderID(orderID))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Get Order Detail Fail", e.toString())
            );
        }
    }

    @PostMapping("/addOrderDetail")
    ResponseEntity<ResponeObject> addOrderDetail(@RequestBody OrderDetail orderDetail){
//        orderDetail.setOrderDetailID(UUID.randomUUID().toString());
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Add Order Detail Success", orderDetailRepository.save(orderDetail))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    new ResponeObject("fail", "Add Order Detail Fail", e.toString())
            );
        }
    }
}
