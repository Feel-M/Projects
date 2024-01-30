package com.rest.webservices.restfulwebservices.helloWorld;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloWorldController {

    @GetMapping(path = "/hello-world")
    public String HelloWorld(){

        return "Hello world";
    }

    @GetMapping(path = "/hello-world-bean")
    public HelloWorldBean HelloWorldBean(){

        return new HelloWorldBean("Hello world");
    }

    @GetMapping(path = "/hello-world/path-variable/{name}")
    public HelloWorldBean HelloWorldPathVariable(@PathVariable String name){

        return new HelloWorldBean(String.format("hello world, %s",name));
    }

}
