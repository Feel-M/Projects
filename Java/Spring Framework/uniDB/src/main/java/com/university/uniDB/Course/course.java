package com.university.uniDB.Course;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
@Entity
public class course {
    @Column
    @NotBlank
    private String name;


    @Column
    @Id
    private int ID;


    @Column
    @NotBlank
    private String difficulty;

    public course(String name, int ID, String difficulty) {
        this.name = name;
        this.ID = ID;
        this.difficulty = difficulty;
    }

    public course() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return ID;
    }

    public void setId(int ID) {
        this.ID = ID;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }


    @Override
    public String toString() {
        return "Course{" +
                "name='" + name + '\'' +
                ", id=" + ID +
                ", difficulty='" + difficulty + '\'' +
                '}';
    }
}
