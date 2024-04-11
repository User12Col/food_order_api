package com.example.api.repositories;

import com.example.api.models.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, String> {
    @Query(value = "select * from ORDERDETAIL where orderID = ?1", nativeQuery = true)
    List<OrderDetail> getOrderDetailByOrderID(String orderID);

}
