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
    @Query(value = "SELECT * FROM CATEGORY WHERE name LIKE %:name% and isDelete = 0", nativeQuery = true)
    List<Category> findByName(@Param("name") String name);

    @Query(value = "SELECT * FROM CATEGORY WHERE isDelete = 0", nativeQuery = true)
    List<Category> getCategory();

    @Modifying
    @Transactional
    @Query(value = "UPDATE CATEGORY set isDelete = 1 WHERE cateID=?1", nativeQuery = true)
    int deleteCategory(int cateID);
}
