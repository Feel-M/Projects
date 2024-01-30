package com.university.uniDB.Course;

import com.university.uniDB.Student.student;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class CourseServices {

    @Autowired
    private CourseRepo CRepo;
    private course Course;


    @GetMapping("/courses")
    public List<course> GetCourses() {
        return CRepo.findAll();
    }

    @GetMapping("/courses/{id}")
    public Optional<course> FindCourse(@PathVariable long id){
        return CRepo.findById(id);

    }
    @PostMapping("/courses/create")
    public String   CreateCourse(@Valid @RequestBody course course){
        CRepo.save(course);
        return "saved";


    }

    @DeleteMapping("/courses/delete/{id})")
    public void DeleteCourse(@PathVariable Long id){
        CRepo.deleteById(id);

    }

    @PutMapping("/courses/update/{id})")
    public String UpdateCourse(@PathVariable Long id,@RequestBody student student){

        course Updatedcourse = CRepo.findById(id).get();
        Updatedcourse.setId(Course.getId());
      Updatedcourse.setDifficulty(Course.getDifficulty());
        Updatedcourse.setName(Course.getName());
        CRepo.save(Updatedcourse);
        return "Updated";
    }
}
