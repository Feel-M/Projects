package com.university.uniDB.Student;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
@Entity
public class student {
    @Column
    @Id

    private int ID;

    @Column
    @NotBlank
    private String name;

    @Column
    @Positive
    @Max(6)
    @Min(1)
    private int grade;

    public student(int ID, String name, int grade) {
        this.ID = ID;
        this.name = name;
        this.grade = grade;
    }

    public student() {

    }

    public int getId() {
        return ID;
    }

    public void setId(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + ID +
                ", name='" + name + '\'' +
                ", grade=" + grade +
                '}';
    }
}
