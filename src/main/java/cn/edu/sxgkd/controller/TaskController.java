package cn.edu.sxgkd.controller;

import cn.edu.sxgkd.entity.Task;
import cn.edu.sxgkd.entity.User;
import cn.edu.sxgkd.exception.OperationException;
import cn.edu.sxgkd.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class TaskController {
    @Autowired
    private ITaskService taskService;

    // 跳转到任务管理页面
    @RequestMapping("task")
    public String task(HttpSession httpSession, Model model ) {
        User user = (User) httpSession.getAttribute("user");
        List<User> users = (List<User>) httpSession.getAttribute("users");
        // 防止直接访问task页面
        if (user == null) {
            return "login";
        }
        model.addAttribute("user", user);
        model.addAttribute("users", users);
        model.addAttribute("task", new Task());
        model.addAttribute("tasks", taskService.selectAll());
        System.out.println(model.getAttribute("tasks"));
        return "task";
    }

    // 模糊搜索任务
    @PostMapping("searchTask")
    public String search(String title, String desc, Model model) {
        System.out.println(title + desc);
        model.addAttribute("task", new Task());
        model.addAttribute("tasks", taskService.selectByTitleAndDesc(title, desc));
        return "task";
    }

    // 去添加任务页面
    @GetMapping("toAddTask")
    public String toAddTask(HttpSession session,Model model) {
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("users", session.getAttribute("users"));
        System.out.println(session.getAttribute("users"));
        model.addAttribute("task", new Task());
        return "addTask";
    }

    // 添加任务
    @PostMapping("addTask")
    public String addTask(@Valid Task task,Errors errors,Model model,HttpSession session) {
        if (errors.hasErrors()) {
            // 数据校验没有通过
            // 回到页面，将错误信息显示
            // 1. 将错误信息放到model中
            model.addAttribute("errors", errors.getAllErrors());
            // 2. 将task对象放到model中
            model.addAttribute("task", task);
            // 3. 返回添加任务页面
            return "addTask";
        }
        // 添加任务
        taskService.insert(task);
        return "redirect:/task";
    }
    
    @GetMapping("toUpdateTask")
    public String toUpdateTask(int id, Model model,HttpSession session) {
        // 根据id查询任务
        Task task = taskService.selectById(id);
        model.addAttribute("task", task);
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("users", session.getAttribute("users"));
        return "editTask";
    }

    // 修改任务
    @PostMapping("updateTask")
    public String updateTask(@Valid Task task, Errors errors,Model model) {
        if (errors.hasErrors()) {
            // 数据校验没有通过
            // 回到页面将错误信息显示
            model.addAttribute("errors", errors.getAllErrors());
            model.addAttribute("task", task);
            return "editTask";
        }
        // 修改任务
        taskService.update(task);
        return "redirect:/task";
    }

    // 删除任务
    @GetMapping("deleteTask")
    public String deleteTask(int id) {
        // 删除任务
        taskService.delete(id);
        return "redirect:/task";
    }

}
