package com.example.api.repositories;

import com.example.api.models.Note;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface NoteRepository extends JpaRepository<Note, String> {

    @Modifying
    @Transactional
    @Query(value = "update NOTE set content = ?1, date = ?2, title = ?3 where id = ?4", nativeQuery = true)
    int updateNote(String content, String date, String title, String id);
}
