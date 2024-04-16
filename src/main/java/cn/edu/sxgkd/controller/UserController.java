package cn.edu.sxgkd.controller;

import cn.edu.sxgkd.entity.User;
import cn.edu.sxgkd.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import java.util.Objects;

@Controller
@SessionAttributes(value = {"user", "users"}, types = {User.class, User.class})
public class UserController {
    @Autowired
    private IUserService userService;

    // 跳转到登录页面
    @RequestMapping("/")
    public String toLogin(String msg) {
        return "login";
    }

    // 登录
    @RequestMapping("login")
    public String login(String username, String password, Model model) {
        // 查询用户和密码
        User user = userService.selectByUsernameAndPassword(username, password);
        if (user != null) {
            // 保存用户所有信息
            model.addAttribute("user", user);
            model.addAttribute("users", userService.selectAll());
            // 登录成功进行跳转
            return "redirect:/task";
        }
        // 用户名或密码错误
        model.addAttribute("msg", "用户名或密码错误");
        return "login";
    }

    // 退出登录
    @RequestMapping("logout")
    public String logout(SessionStatus sessionStatus, Model model) {
        model.addAttribute("user", null);
        sessionStatus.setComplete();
        return "login";
    }

    // 跳转到用户管理页面
    @RequestMapping("user")
    public String user(Model model) {
        System.out.println(model.getAttribute("user"));
        // 防止直接访问user页面
        if (model.getAttribute("user") == null) {
            return "login";
        }
        // 防止普通用户访问
        if (Objects.equals(Objects.requireNonNull((User) model.getAttribute("user")).getRole(), "USER")) {
            return "task";
        }
        // 查询所有用户
        model.addAttribute("users", userService.selectAll());
        return "user";
    }

    // 添加用户
    @RequestMapping("addUser")
    public String addUser(User user, Model model) {
        // 添加用户
        userService.insert(user);
        // 查询所有用户
        model.addAttribute("users", userService.selectAll());
        return "user";
    }

    // 修改用户信息
    @RequestMapping("updateUser")
    public String updateUser(User user, Model model) {
        // 修改用户
        userService.update(user);
        // 查询所有用户
        model.addAttribute("users", userService.selectAll());
        return "user";
    }

    // 删除用户
    @RequestMapping("deleteUser")
    public String deleteUser(int id, Model model) {
        // 删除用户
        userService.delete(id);
        // 查询所有用户
        model.addAttribute("users", userService.selectAll());
        return "user";
    }

    // 搜索用户
    @RequestMapping("searchUser")
    public String searchUser(String key, String keyword, Model model) {
        // 搜索用户
        model.addAttribute("users", userService.selectByKeyword(key, keyword));
        return "user";
    }
}
