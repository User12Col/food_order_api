package com.example.api.repositories;

import com.example.api.models.Category;
import com.example.api.models.Food;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

    @Modifying
    @Transactional
    @Query(value = "SELECT * FROM CATEGORY WHERE name LIKE %:name%", nativeQuery = true)
    List<Category> findByName(@Param("name") String name);
}
