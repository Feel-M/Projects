package com.university.uniDB.Student;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class StudentServices {


    private StudentRepo SRepo;
    private student Student;

    public StudentServices(StudentRepo SRepo) {
        this.SRepo = SRepo;

    }

    @GetMapping("/students")
    public List<student> GetStudents() {
        return SRepo.findAll();
    }

    @GetMapping("/student/{id}")
    public Optional<student> FindStudent(@PathVariable long id){
        return SRepo.findById(id);

    }
    @PostMapping("/student/create")
    public String   CreateStudent(@Valid @RequestBody student student){
        SRepo.save(student);
        return "saved";


    }

    @DeleteMapping("/students/delete/{id})")
    public void DeleteStudent(@PathVariable Long id){
        SRepo.deleteById(id);

    }

    @PutMapping("/students/update/{id})")
    public String UpdateStudent(@PathVariable Long id,@RequestBody student student){

    student UpdatedStudent = SRepo.findById(id).get();
    UpdatedStudent.setId(student.getId());
    UpdatedStudent.setGrade(student.getGrade());
    UpdatedStudent.setName(student.getName());
    SRepo.save(UpdatedStudent);
    return "Updated";
    }
}