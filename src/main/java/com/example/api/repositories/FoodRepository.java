package com.example.api.repositories;

import com.example.api.models.Category;
import com.example.api.models.Food;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FoodRepository extends JpaRepository<Food, String> {

    @Query(value = "SELECT * FROM FOOD WHERE isDelete = 0 and cateID = ?1", nativeQuery = true)
    List<Food> findByCategory(int cateID);

    @Query(value = "SELECT * FROM FOOD WHERE name LIKE %:name% and isDelete = 0", nativeQuery = true)
    List<Food> searchFood(@Param("name") String name);

    @Query(value = "SELECT * FROM FOOD WHERE isDelete = 0", nativeQuery = true)
    List<Food> getAllFood();

    @Modifying
    @Transactional
    @Query(value = "UPDATE FOOD set isDelete = 1 WHERE foodID = ?1", nativeQuery = true)
    int deleteFood(String foodID);
}
