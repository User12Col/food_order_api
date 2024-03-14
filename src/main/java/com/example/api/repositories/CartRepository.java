package com.example.api.repositories;

import com.example.api.models.Cart;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface CartRepository extends JpaRepository<Cart, String> {
    @Query(value = "select * from CART where userID = ?1", nativeQuery = true)
    List<Cart> findByUserID(String userID);

    @Query(value = "select * from CART where foodID = ?1", nativeQuery = true)
    Optional<Cart> findByFoodID(String foodID);

    @Modifying
    @Transactional
    @Query(value = "update CART set quantity = quantity + 1 where foodID = ?1 and userID = ?2", nativeQuery = true)
    int updateQuantity(String foodID, String userID);

    @Modifying
    @Transactional
    @Query(value = "update CART set quantity = quantity - 1 where foodID = ?1 and userID = ?2", nativeQuery = true)
    int decreaseQuantity(String foodID, String userID);
}
