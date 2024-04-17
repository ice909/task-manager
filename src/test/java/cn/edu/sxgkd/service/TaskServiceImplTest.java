package cn.edu.sxgkd.service;

import cn.edu.sxgkd.entity.Task;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TaskServiceImplTest {

    @Test
    public void selectAll() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        ITaskService taskService = applicationContext.getBean("taskService", ITaskService.class);
        System.out.println(taskService.selectAll());
    }

    @Test
    public void selectById() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        ITaskService taskService = applicationContext.getBean("taskService", ITaskService.class);
        System.out.println(taskService.selectById(2));
    }

    @Test
    public void insert() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        ITaskService taskService = applicationContext.getBean("taskService", ITaskService.class);
        taskService.insert(new Task("完成项目提案", "准备并完成项目提案文档的准备和最终化。", "2024-04-30", "IN_PROGRESS", 1, 3));
        taskService.insert(new Task("实现用户认证功能", "使用Spring Security开发用户认证功能。", "2024-05-10", "TODO", 1, 3));
        taskService.insert(new Task("设计数据库架构", "为任务管理系统创建数据库架构。", "2024-05-05", "COMPLETED", 1, 3));
        taskService.insert(new Task("测试删除", "测试删除", "2024-04-30", "IN_PROGRESS", 1, 4));
    }

    @Test
    public void update() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        ITaskService taskService = applicationContext.getBean("taskService", ITaskService.class);
        taskService.update(new Task(2, "完成项目提案", "准备并完成项目提案文档的准备和最终化。", "2024-04-30", "IN_PROGRESS", 1, 4));
    }

    @Test
    public void delete() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        ITaskService taskService = applicationContext.getBean("taskService", ITaskService.class);
        taskService.delete(14);
    }

}