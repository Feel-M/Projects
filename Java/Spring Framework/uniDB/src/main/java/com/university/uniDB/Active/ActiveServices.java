package com.university.uniDB.Active;


import com.university.uniDB.Course.course;
import com.university.uniDB.Student.student;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class ActiveServices {

    @Autowired
    private ActiveRepo ARepo;
    private  active Active;


    @GetMapping("/active")
    public List<active> GetActive() {
        return ARepo.findAll();
    }

    @GetMapping("/active/{id}")
    public Optional<active> FindActive(@PathVariable long id){
        return ARepo.findById(id);

    }
    @PostMapping("/active/create")
    public String   CreateActive(@Valid @RequestBody active active){
        ARepo.save(active);
        return "saved";


    }

    @DeleteMapping("/active/delete/{id})")
    public void DeleteActive(@PathVariable Long id){
        ARepo.deleteById(id);

    }

    @PutMapping("/active/update/{id})")
    public String UpdateActive(@PathVariable Long id,@RequestBody active active){

        active UpdatedActive = ARepo.findById(id).get();
        UpdatedActive.setStudentId(active.getStudentId());
        UpdatedActive.setCourseName(active.getCourseName());

        ARepo.save(UpdatedActive);
        return "Updated";
    }



    }

