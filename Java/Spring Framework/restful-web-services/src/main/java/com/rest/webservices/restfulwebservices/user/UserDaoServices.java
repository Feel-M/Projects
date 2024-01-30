package com.rest.webservices.restfulwebservices.user;

import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.function.Predicate;

@Component
public class UserDaoServices {

    private static List<User> users = new ArrayList<>();
    private static int userCount = 0;
    static{

        users.add(new User(++userCount, "Ahmed", LocalDate.now().minusYears(27)));
        users.add(new User(++userCount, "Zeina", LocalDate.now().minusYears(15)));
        users.add(new User(++userCount, "Kareem", LocalDate.now().minusYears(56)));
        users.add(new User(++userCount, "Heba", LocalDate.now().minusYears(34)));
    }

    public static List<User> getUsers() {
        return users;
    }

    public User FindOne(int id){

        Predicate<? super User> predicate = user -> Objects.equals(user.getId(), id);
        return users.stream().filter(predicate).findFirst().get();
    }
    public void DeleteById(int id){

        Predicate<? super User> predicate = user -> Objects.equals(user.getId(), id);
        users.removeIf(predicate);

    }


    public void save(User user){
    user.setId(++userCount);
        users.add(user);

    }
}
