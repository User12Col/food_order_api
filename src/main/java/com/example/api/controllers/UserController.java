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
import java.util.UUID;

@RestController
@RequestMapping(path = "/api/v1/Users")
public class UserController {
    @Autowired
    private UserRepository userRepository;

    //Get all user
    //http://26.46.221.97:8082/api/v1/Users
    @GetMapping("")
    ResponseEntity<ResponeObject> getAllUsers(){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Query users success",userRepository.getAllUser())
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Query users fail", e.toString())
            );
        }
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
                ResponseEntity.status(HttpStatus.OK).body(
                        new ResponeObject("fail", "Login fail", "No data")
                );
    }

    //Sign up
    //http://localhost:8082/api/v1/Users/signup
    @PostMapping("/signup")
    ResponseEntity<ResponeObject> signUpUser(@RequestBody User user){
        user.setIsDelete(0);
        user.setUserID(UUID.randomUUID().toString());
        try{
            List<User> userList = userRepository.findByEmail(user.getEmail());
            if(userList.size() > 0){
                return ResponseEntity.status(HttpStatus.OK).body(
                        new ResponeObject("fail", "User has same email", "")
                );
            }
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Add user success", userRepository.save(user))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Add user fail", e.toString())
            );
        }
    }

    //Update user information
    @PutMapping("/updateUser")
    ResponseEntity<ResponeObject> updateUser(@RequestParam String id, @RequestBody User newUser){
        try{
            User foundUser = userRepository.findById(id).map(user->{
                user.setAddress(newUser.getAddress());
                user.setEmail(newUser.getEmail());
                user.setName(newUser.getName());
                user.setPhone(newUser.getPhone());
                user.setPassword(newUser.getPassword());
                user.setRole(newUser.getRole());
                user.setIsDelete(newUser.getIsDelete());
                return userRepository.save(user);
            }).orElseGet(()->{
                newUser.setUserID(id);
                return userRepository.save(newUser);
            });
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Update success", foundUser)
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Update fail", e.toString())
            );
        }
    }

    @PutMapping("/deleteUser")
    ResponseEntity<ResponeObject> deleteUser(@RequestParam String id){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Delete Success", userRepository.deleteUser(id))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Delete Fail", e.toString())
            );
        }
    }

    @GetMapping("/getUserByName")
    ResponseEntity<ResponeObject> getUserByName(@RequestParam String name){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Query Success", userRepository.findByName("%" + name + "%"))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Query Fail", e.toString())
            );
        }
    }

    @GetMapping("/getUserById")
    ResponseEntity<ResponeObject> getUserById(@RequestParam String userID){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Get user success", userRepository.findById(userID))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Get user fail", e.toString())
            );
        }
    }

    @GetMapping("/loginAdmin")
    ResponseEntity<ResponeObject> loginAdmin(@RequestParam String email, @RequestParam String password){
        try{
            return userRepository.loginAdmin(email, password).isPresent() ?
                ResponseEntity.status(HttpStatus.OK).body(
                        new ResponeObject("ok", "Login success", userRepository.loginAdmin(email, password))
                ) :
                ResponseEntity.status(HttpStatus.OK).body(
                        new ResponeObject("fail", "Login fail", userRepository.loginAdmin(email, password))
                );
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Error", e.toString())
            );
        }
    }

}
