package cn.edu.sxgkd.service;

import cn.edu.sxgkd.entity.User;

import java.util.List;

public interface IUserService {
    // 新增用户
    int insert(User user);

    // 根据Id获取用户
    User selectById(int id);

    // 修改用户信息
    int update(User user);

    // 获取所有用户
    List<User> selectAll();

    // 删除用户
    int delete(int id);

    // 模糊查询用户
    List<User> selectByKeyword(String key, String keyword);

    // 根据用户名和密码查询用户
    User selectByUsernameAndPassword(String username, String password);

    // 根据用户名查询用户
    List<User> selectByUsernameBlur(String username);
}
