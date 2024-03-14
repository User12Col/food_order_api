package com.example.api.controllers;

import com.example.api.models.Cart;
import com.example.api.models.ResponeObject;
import com.example.api.repositories.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/v1/Carts")
public class CartController {

    @Autowired
    CartRepository cartRepository;

    //Get cart by userID
    //http://localhost:8082/api/v1/Carts/id
    @GetMapping("/{userID}")
    ResponseEntity<ResponeObject> getCartByUserID(@PathVariable String userID){
        List<Cart> foundCart = cartRepository.findByUserID(userID);
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponeObject("ok", "Query success",foundCart)
        );
    }

    //Add to cart
    @PostMapping("/addToCart")
    ResponseEntity<ResponeObject> addToCart(@RequestBody Cart cart){
        try{
            Optional<Cart> foundCart = cartRepository.findByFoodID(cart.getFood().getFoodID());
            return foundCart.isPresent()?
                    ResponseEntity.status(HttpStatus.OK).body(
                            new ResponeObject("update", "Update quantity success", cartRepository.updateQuantity(cart.getFood().getFoodID(), cart.getUser().getUserID()))
                    ):
                    ResponseEntity.status(HttpStatus.OK).body(
                            new ResponeObject("ok", "Add to cart success", cartRepository.save(cart))
                    );
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponeObject("ok", "No query", "")
        );
    }

    //Decrease quantity by 1
    @PutMapping("/decreaseQuantity")
    ResponseEntity<ResponeObject> decreaseQuantity(@RequestBody Cart cart){
        Optional<Cart> foundCart = cartRepository.findByFoodID(cart.getFood().getFoodID());
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponeObject("update", "Decrease quantity success", cartRepository.decreaseQuantity(cart.getFood().getFoodID(), cart.getUser().getUserID()))
        );
    }
}
