package cn.edu.sxgkd.service;

import cn.edu.sxgkd.entity.User;
import cn.edu.sxgkd.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public int insert(User user) {
        return userMapper.insert(user);
    }

    @Override
    public User selectById(int id) {
        return userMapper.selectById(id);
    }

    @Override
    public int update(User user) {
        return userMapper.update(user);
    }
    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public int delete(int id) {
        return userMapper.delete(id);
    }

    @Override
    public List<User> selectByKeyword(String key, String keyword) {
        if (key.equals("username")) {
            return selectByUsernameBlur(keyword);
        }
        // 否则返回所有用户
        return selectAll();
    }
    @Override
    public User selectByUsernameAndPassword(String username, String password) {
        Map<String, String> map = new HashMap<>();
        map.put("username", username);
        map.put("password", password);
        return userMapper.selectByUsernameAndPassword(map);
    }

    @Override
    public List<User> selectByUsernameBlur(String username) {
        return userMapper.selectByUsernameBlur(username);
    }
}
