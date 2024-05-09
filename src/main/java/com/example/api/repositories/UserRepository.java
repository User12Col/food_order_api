package com.example.api.repositories;

import com.example.api.models.Food;
import com.example.api.models.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, String> {

    @Query(value = "SELECT * FROM USER WHERE email = ?1 and password = ?2 and roleID = 2 and isDelete = 0", nativeQuery = true)
    Optional<User> findByEmailAndPassword(String email, String password);

    @Query(value = "SELECT * FROM USER WHERE email = ?1 and isDelete = 0", nativeQuery = true)
    List<User> findByEmail(String email);

    @Modifying
    @Transactional
    @Query(value = "SELECT * FROM USER WHERE name LIKE %:name% and isDelete = 0", nativeQuery = true)
    List<User> findByName(@Param("name") String name);

    @Query(value = "SELECT * FROM USER WHERE isDelete = 0", nativeQuery = true)
    List<User> getAllUser();

    @Modifying
    @Transactional
    @Query(value = "UPDATE USER set isDelete = 1 WHERE userID = ?1", nativeQuery = true)
    int deleteUser(String userID);

    @Query(value = "SELECT * FROM USER WHERE email = ?1 and password = ?2 and roleID != 2 and isDelete = 0", nativeQuery = true)
    Optional<User> loginAdmin(String email, String password);

}
