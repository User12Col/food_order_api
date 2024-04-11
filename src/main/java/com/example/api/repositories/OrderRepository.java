package com.example.api.repositories;

import com.example.api.models.Order;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, String> {

    @Query(value = "select * from `ORDER` where userID = ?1", nativeQuery = true)
    List<Order> getOrderByUserID(String userID);

    @Query(value = "select * from `ORDER` where userID = ?1 and status = ?2", nativeQuery = true)
    List<Order> getOrderByUserAndStatus(String userID, String status);
}
