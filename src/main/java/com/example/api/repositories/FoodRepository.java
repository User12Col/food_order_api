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
    List<Food> findByCategory(Category category);

    @Query(value = "SELECT * FROM FOOD WHERE name LIKE %:name%", nativeQuery = true)
    List<Food> searchFood(@Param("name") String name);
}
