package com.university.uniDB;

import com.university.uniDB.Student.StudentRepo;
import com.university.uniDB.Student.student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Properties;
@Component
public class Job {
@Autowired
    private StudentRepo SRepo;
    @Value("${spring.mail.host}")
    private String smtpHost;
    @Value("${spring.mail.port}")
    private String smtpPort;
    @Value("${spring.mail.username}")
    private String smtpUsername;
    @Value("${spring.mail.password}")
    private String smtpPassword;



    public List<student> GetStudents() {
        return SRepo.findAll();
    }
    // @Scheduled(cron = "0 21 * * * SUN-THU")
    public JavaMailSender emailSender() throws IOException {

        createFile();
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(smtpHost);
        mailSender.setPort(Integer.parseInt(smtpPort));

        mailSender.setUsername(smtpUsername);
        mailSender.setPassword(smtpPassword);

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");


        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(smtpUsername);
        message.setTo("elfeell.m@gmail.com");
        message.setSubject("test");
        message.setText(String.valueOf(GetStudents()));
        FileSystemResource fileSystem = new FileSystemResource("Students.txt");
        message.setText(String.valueOf(fileSystem));

        mailSender.send(message);


        return mailSender;
    };


    public void createFile()
            throws IOException, IOException {
       List <student> str = GetStudents();
       BufferedWriter writer = new BufferedWriter(new FileWriter("Students.txt"));
       while (!str.isEmpty()) {
           writer.write(String.valueOf(str));
           writer.newLine();
           writer.close();
       }

    }




    private JavaMailSender emailSender;





  /**
public void sendMessage(
           ) throws IOException {
        emailSender();
createFile();
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("restbitsunknown@gmail.com");
        message.setTo("elfeell.m@gmail.com");
        message.setSubject("test");
        message.setText(String.valueOf(GetStudents()));
        FileSystemResource fileSystem = new FileSystemResource("Students.txt");
        message.setText(String.valueOf(fileSystem));



    }
*/



}
