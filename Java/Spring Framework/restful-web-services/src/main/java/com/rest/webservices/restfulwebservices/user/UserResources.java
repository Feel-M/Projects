package com.rest.webservices.restfulwebservices.user;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserResources {
private UserDaoServices service;

    public UserResources(UserDaoServices service) {
        this.service = service;
    }
    @GetMapping("/users")
    public List<User> AllUsers(){
        return service.getUsers();

    }

    @GetMapping("/user/{id}")
    public User FindUser(@PathVariable int id){
        return service.FindOne(id);

    }
    @DeleteMapping("/user/{id}")
    public void DeleteUser(@PathVariable int id){
       service.DeleteById(id);

    }
    @PostMapping("/users")
    public void CreateUser(@Valid @RequestBody User user){
    service.save(user);

    }
}
