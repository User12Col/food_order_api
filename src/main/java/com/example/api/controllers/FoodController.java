package com.example.api.controllers;

import com.example.api.models.Category;
import com.example.api.models.ResponeObject;
import com.example.api.repositories.FoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/api/v1/Foods")
public class FoodController {
    @Autowired
    FoodRepository foodRepository;

    //Get all foods
    //http://localhost:8082/api/v1/Foods
    @GetMapping("")
    ResponseEntity<ResponeObject> getAllFood(){
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponeObject("ok", "Query foods success", foodRepository.findAll())
        );
    }

    //TODO:Get food by category
    @PostMapping("/category")
    ResponseEntity<ResponeObject> getFoodByCategoryID(@RequestBody Category category){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get food success", foodRepository.findByCategory(category))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                    new ResponeObject("fail", "Get food fail", e.toString())
            );
        }
    }

}
