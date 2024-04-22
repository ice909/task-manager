package cn.edu.sxgkd.controller;

import cn.edu.sxgkd.entity.LoginRequest;
import cn.edu.sxgkd.entity.User;
import cn.edu.sxgkd.exception.OperationException;
import cn.edu.sxgkd.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private IUserService userService;

    // 跳转到登录页面
    @GetMapping("/")
    public String toLogin() {
        return "login";
    }

    // 登录
    @RequestMapping("login")
    public String login(@Valid LoginRequest loginRequest, Errors errors, HttpSession httpSession) {
        // 验证用户名和密码
        if (errors.hasErrors()) {
            throw new OperationException("用户名或者密码为空");
        }
        // 查询用户和密码
        User user = userService.selectByUsernameAndPassword(loginRequest.getUsername(), loginRequest.getPassword());
        if (user != null) {
            List<User> users = userService.selectAll();
            // 保存用户所有信息
            httpSession.setAttribute("user", user);
            httpSession.setAttribute("users", users);
            // 登录成功进行跳转
            return "redirect:/task";
        }
        throw new OperationException("用户名或密码错误");
    }

    // 退出登录
    @RequestMapping("logout")
    public String logout(HttpSession httpSession) {
        // 清除session
        httpSession.invalidate();
        return "redirect:/";
    }

    // 跳转到用户管理页面
    @RequestMapping("user")
    public String user(HttpSession httpSession,Model model) {
        System.out.println(model.getAttribute("user"));
        // 防止直接访问user页面
        if (httpSession.getAttribute("user") == null) {
            return "login";
        }
        // 查询所有用户
        httpSession.setAttribute("users", userService.selectAll());
        return "user";
    }

    // 添加用户
    @RequestMapping("addUser")
    public String addUser(@Valid User u, Errors errors) {
        // 验证用户信息
        if (errors.hasErrors()) {
            throw new OperationException(errors.getAllErrors());
        }
        // 添加用户
        userService.insert(u);
        return "redirect:/user";
    }

    // 修改用户信息
    @RequestMapping("updateUser")
    public String updateUser(@Valid User user, Errors errors) {
        // 验证用户信息
        if (errors.hasErrors()) {
            throw new OperationException(errors.getAllErrors());
        }
        // 修改用户
        userService.update(user);
        return "redirect:/user";
    }

    // 删除用户
    @RequestMapping("deleteUser")
    public String deleteUser(int id) {
        // 删除用户
        userService.delete(id);
        return "redirect:/user";
    }

    // 搜索用户
    @RequestMapping("searchUser")
    public String searchUser(String key, String keyword, Model model) {
        // 搜索用户
        model.addAttribute("users", userService.selectByKeyword(key, keyword));
        return "user";
    }
}
