package com.example.api.controllers;

import com.example.api.models.ResponeObject;
import com.example.api.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/v1/Categories")
public class CategoryController {
    @Autowired
    CategoryRepository categoryRepository;

    //http://localhost:8082/api/v1/Categories
    @GetMapping("")
    ResponseEntity<ResponeObject> getAllCategory(){
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponeObject("ok", "Query success", categoryRepository.findAll())
        );
    }
}
