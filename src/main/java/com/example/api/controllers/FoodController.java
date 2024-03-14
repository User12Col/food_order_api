package com.example.api.controllers;

import com.example.api.models.ResponeObject;
import com.example.api.repositories.FoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
