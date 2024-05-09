package com.example.api.repositories;

import com.example.api.models.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NotificationRepository extends JpaRepository<Notification, String> {
    @Query(value = "select * from NOTIFICATION where userID = ?1", nativeQuery = true)
    List<Notification> getNotificationByUserID(String userID);
}
