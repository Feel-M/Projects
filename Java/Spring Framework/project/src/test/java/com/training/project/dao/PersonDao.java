package com.training.project.dao;

import com.training.project.model.Person;

import java.util.UUID;

public interface PersonDao {
    //adds person with given id
    int insertPerson(UUID id, Person person);


    //add person with no given id
    default int insertPerson(Person person ){
        UUID id = UUID.randomUUID();
        return insertPerson(id, person);

    }



}
