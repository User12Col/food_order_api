package com.example.api.controllers;

import com.example.api.models.Notification;
import com.example.api.models.ResponeObject;
import com.example.api.models.User;
import com.example.api.repositories.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "api/v1/Notifications")
public class NotificationController {
    @Autowired
    private NotificationRepository notificationRepository;

    @GetMapping("/getNotificationByUserID")
    ResponseEntity<ResponeObject> getNotificationByUserID(@RequestParam String userID){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get notification success", notificationRepository.getNotificationByUserID(userID))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Get notification fail", e.toString())
            );
        }
    }

    @PostMapping("/addNotification")
    ResponseEntity<ResponeObject> addNotification(@RequestBody Notification notification){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Add notification success", notificationRepository.save(notification))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Add notification fail", e.toString())
            );
        }
    }
}
