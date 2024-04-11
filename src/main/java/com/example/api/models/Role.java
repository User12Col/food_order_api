package com.example.api.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ROLE")
public class Role {
    @Id
    private int roleID;
    private String name;

    public Role() {
    }

    public Role(int roleID, String name) {
        this.roleID = roleID;
        this.name = name;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
