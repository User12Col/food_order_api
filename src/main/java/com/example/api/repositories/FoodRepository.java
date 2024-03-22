package com.example.api.repositories;

import com.example.api.models.Category;
import com.example.api.models.Food;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FoodRepository extends JpaRepository<Food, String> {
    List<Food> findByCategory(Category category);
}
