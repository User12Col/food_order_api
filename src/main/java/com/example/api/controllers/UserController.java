package com.example.api.controllers;

import com.example.api.models.ResponeObject;
import com.example.api.models.User;
import com.example.api.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/v1/Users")
public class UserController {
    @Autowired
    private UserRepository userRepository;

    //Get all user
    //http://localhost:8082/api/v1/Users
    @GetMapping("")
    ResponseEntity<ResponeObject> getAllUsers(){
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponeObject("ok", "Query users success",userRepository.findAll())
        );
    }

    //Login
    //http://localhost:8082/api/v1/Users/login?email=loc&password=123
    @GetMapping("/login")
    ResponseEntity<ResponeObject> loginUser(@RequestParam String email, @RequestParam String password){
        Optional<User> currUser = userRepository.findByEmailAndPassword(email, password);
        return currUser.isPresent() ?
                ResponseEntity.status(HttpStatus.OK).body(
                        new ResponeObject("ok", "Login success", currUser)
                ):
                ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                        new ResponeObject("fail", "Login fail", "")
                );
    }

    //Sign up
    //http://localhost:8082/api/v1/Users/signup
    @PostMapping("/signup")
    ResponseEntity<ResponeObject> signUpUser(@RequestBody User user){
        List<User> userList = userRepository.findByEmail(user.getEmail());
        if(userList.size() > 0){
            return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(
                    new ResponeObject("fail", "User has same email", "")
            );
        }
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponeObject("ok", "Add user success", userRepository.save(user))
        );
    }

    //Update user information
    @PutMapping("/{id}")
    ResponseEntity<ResponeObject> updateUser(@PathVariable String id, @RequestBody User newUser){
        User foundUser = userRepository.findById(id).map(user->{
            user.setAddress(newUser.getAddress());
            user.setEmail(newUser.getEmail());
            user.setName(newUser.getName());
            user.setPhone(newUser.getPhone());
            user.setPassword(newUser.getPassword());
            return userRepository.save(user);
        }).orElseGet(()->{
            newUser.setUserID(id);
            return userRepository.save(newUser);
        });
        return ResponseEntity.status(HttpStatus.OK).body(
                new ResponeObject("ok", "Update success", foundUser)
        );
    }

}
