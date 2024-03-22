package com.example.api.controllers;

import com.example.api.models.Note;
import com.example.api.models.ResponeObject;
import com.example.api.repositories.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping(path = "api/v1/Notes")
public class NoteController {
    @Autowired
    NoteRepository noteRepository;

    //Get all note
    @GetMapping(path = "")
    ResponseEntity<ResponeObject> getNotes(){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Query success", noteRepository.findAll())
            );
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Query Fail", e.toString())
            );
        }

    }

    //Add note
    @PostMapping(path = "/insertNote")
    ResponseEntity<ResponeObject> insertNote(@RequestBody Note note){
        try {
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Insert Success", noteRepository.save(note))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Insert Fail", e.toString())
            );
        }
    }

    //Update note
    @PutMapping(path = "/update")
    ResponseEntity<ResponeObject> updateNote(@RequestBody Note note){
        try{
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Update Success", noteRepository.updateNote(note.getContent(), note.getDate(), note.getTitle(), note.getId()))
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Update Fail", e.toString())
            );
        }
    }

    //Delete note
    @DeleteMapping(path = "/delete")
    ResponseEntity<ResponeObject> deleteNote(@RequestParam String id){
        try{
            noteRepository.deleteById(id);
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("ok", "Delete Success", "")
            );
        } catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(
                    new ResponeObject("fail", "Delete Fail", e.toString())
            );
        }
    }
}
