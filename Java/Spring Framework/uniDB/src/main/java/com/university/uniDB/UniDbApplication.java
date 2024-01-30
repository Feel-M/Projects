package com.university.uniDB;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.io.IOException;
@EnableScheduling
@SpringBootApplication
public class UniDbApplication {

	public static void main(String[] args) throws IOException {

		SpringApplication.run(UniDbApplication.class, args);

	}

}
