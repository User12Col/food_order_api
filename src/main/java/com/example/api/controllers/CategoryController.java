package com.example.api.controllers;

import com.example.api.models.Category;
import com.example.api.models.Food;
import com.example.api.models.ResponeObject;
import com.example.api.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/api/v1/Categories")
public class CategoryController {
    @Autowired
    CategoryRepository categoryRepository;

    //http://localhost:8082/api/v1/Categories
    @GetMapping("")
    ResponseEntity<ResponeObject> getAllCategory(){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Query success", categoryRepository.getCategory())
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Query fail", e.toString())
            );
        }

    }

    @GetMapping("/getCategoryById")
    ResponseEntity<ResponeObject> getCategoryById(@RequestParam int cateID){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get category success", categoryRepository.findById(cateID))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Get category fail", e.toString())
            );
        }
    }

    @PostMapping("/addCategory")
    ResponseEntity<ResponeObject> insertCategory(@RequestBody Category category){
        category.setIsDelete(0);
        try {
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Insert Success", categoryRepository.save(category))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Insert Fail", e.toString())
            );
        }
    }

    @PutMapping("/deleteCategory")
    ResponseEntity<ResponeObject> deleteCategory(@RequestParam int id){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Delete Success", categoryRepository.deleteCategory(id))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Delete Fail", e.toString())
            );
        }
    }

    @PutMapping("/updateCategory")
    ResponseEntity<ResponeObject> updateCategory(@RequestParam int id, @RequestBody Category newCate){
        try {
            Category foundCate = categoryRepository.findById(id).map(category->{
                category.setName(newCate.getName());
                category.setIsDelete(newCate.getIsDelete());
                return categoryRepository.save(category);
            }).orElseGet(()->{
                newCate.setCateID(id);
                return categoryRepository.save(newCate);
            });
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Update success", foundCate)
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Update fail", e.toString())
            );
        }
    }

    @GetMapping("/getCategoryByName")
    ResponseEntity<ResponeObject> getCateByName(@RequestParam String name){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Query Success", categoryRepository.findByName("%" + name + "%"))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Query Fail", e.toString())
            );
        }
    }
}
