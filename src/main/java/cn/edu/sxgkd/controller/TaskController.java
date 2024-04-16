package cn.edu.sxgkd.controller;

import cn.edu.sxgkd.entity.Task;
import cn.edu.sxgkd.entity.User;
import cn.edu.sxgkd.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(value = {"user", "users", "tasks"}, types = {User.class, User.class, Task.class})
public class TaskController {
    @Autowired
    private ITaskService taskService;

    // 跳转到任务管理页面
    @RequestMapping("task")
    public String task(Model model) {
        // 防止直接访问task页面
        if (model.getAttribute("user") == null) {
            return "login";
        }
        System.out.println(model.getAttribute("user"));
        model.addAttribute("user", model.getAttribute("user"));
        // 获取所有任务
        model.addAttribute("tasks", taskService.selectAll());
        System.out.println(model.getAttribute("tasks"));
        return "task";
    }

    // 搜索任务
    @RequestMapping("searchTask")
    public String search(String key, String keyword, Model model) {
        // 防止直接访问search页面
        if (model.getAttribute("user") == null) {
            return "login";
        }
        System.out.println(model.getAttribute("user"));
        // 模糊搜索任务
        model.addAttribute("tasks", taskService.selectByKeyword(key, keyword));
        return "task";
    }

    // 添加任务
    @RequestMapping("addTask")
    public String addTask(Task task, Model model) {
        // 添加任务
        taskService.insert(task);
        // 获取所有任务
        model.addAttribute("tasks", taskService.selectAll());
        return "task";
    }

    // 修改任务
    @RequestMapping("updateTask")
    public String updateTask(Task task, Model model) {
        // 修改任务
        taskService.update(task);
        // 获取所有任务
        model.addAttribute("tasks", taskService.selectAll());
        return "task";
    }

    // 删除任务
    @RequestMapping("deleteTask")
    public String deleteTask(int id, Model model) {
        // 删除任务
        taskService.delete(id);
        // 获取所有任务
        model.addAttribute("tasks", taskService.selectAll());
        return "task";
    }

}
