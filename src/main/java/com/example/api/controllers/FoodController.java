package com.example.api.controllers;

import com.example.api.models.*;
import com.example.api.repositories.FoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

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

    @GetMapping("/getFoodById")
    ResponseEntity<ResponeObject> getFoodByID(@RequestParam String foodID){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get food success", foodRepository.findById(foodID))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Get food fail", e.toString())
            );
        }
    }

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

    @PostMapping("/addFood")
    ResponseEntity<ResponeObject> insertFood(@RequestBody Food food){
        food.setFoodID(UUID.randomUUID().toString());
        try {
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Insert Success", foodRepository.save(food))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Insert Fail", e.toString())
            );
        }
    }

    @DeleteMapping("/deleteFood")
    ResponseEntity<ResponeObject> deleteFood(@RequestParam String id){
        try{
            foodRepository.deleteById(id);
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Delete Success", "")
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Delete Fail", e.toString())
            );
        }
    }

    @PutMapping("/updateFood")
    ResponseEntity<ResponeObject> updateUser(@RequestParam String id, @RequestBody Food newFood){
        try {
            Food foundFood = foodRepository.findById(id).map(food->{
                food.setName(newFood.getName());
                food.setCategory(newFood.getCategory());
                food.setDescription(newFood.getDescription());
                food.setImage(newFood.getImage());
                food.setUnitPrice(newFood.getUnitPrice());
                return foodRepository.save(food);
            }).orElseGet(()->{
                newFood.setFoodID(id);
                return foodRepository.save(newFood);
            });
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Update success", foundFood)
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Update fail", e.toString())
            );
        }
    }

    @GetMapping("/getFoodByName")
    ResponseEntity<ResponeObject> getFoodByName(@RequestParam String name){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Query Success", foodRepository.searchFood("%" + name + "%"))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Query Fail", e.toString())
            );
        }
    }
}
