package cn.edu.sxgkd.service;

import cn.edu.sxgkd.entity.User;
import javafx.application.Application;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class UserServiceImplTest {

    @Test
    public void insert() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUserService userService = applicationContext.getBean("userService", IUserService.class);
//        userService.insert(new User(1,"admin","admin","admin@task.org","ADMIN"));
//        userService.insert(new User(2,"ice","ice","ice@taskmanager.org","USER"));
        userService.insert(new User(4, "john_doe", "123456", "john.doe@taskmanger.com", "USER"));
        userService.insert(new User(5, "jane_smith", "123456", "jane.smith@taskmanger.com", "USER"));
        userService.insert(new User(6, "alice_wonderland", "123456", "alice.wonderland@taskmanger.com", "USER"));
        userService.insert(new User(7, "bob_marley", "123456", "bob.marley@taskmanger.com", "USER"));
    }

    @Test
    public void selectById() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUserService userService = applicationContext.getBean("userService", IUserService.class);
        System.out.println(userService.selectById(1));
    }

    @Test
    public void update() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUserService userService = applicationContext.getBean("userService", IUserService.class);
        System.out.println(userService.update(new User(1, "admin", "admin", "admin@taskmanager.org", "ADMIN")));
    }

    @Test
    public void selectAll() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUserService userService = applicationContext.getBean("userService", IUserService.class);
        System.out.println(userService.selectAll());
    }

    @Test
    public void delete() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        IUserService userService = applicationContext.getBean("userService", IUserService.class);
        System.out.println(userService.delete(2));
    }

}