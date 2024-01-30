package com.training.project.dao;

import com.training.project.model.Person;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
@Repository("FakeDao")
public class FakePersonDataAcessService implements PersonDao{

    private static List<Person> DB = new ArrayList<>();

    //inserts person into DataBase
    @Override
    public int insertPerson(UUID id, Person person) {
        DB.add(new Person(id, person.getName()));
        return 1;
    }
}
