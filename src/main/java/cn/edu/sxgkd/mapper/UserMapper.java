package cn.edu.sxgkd.mapper;

import cn.edu.sxgkd.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface UserMapper {
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

    // 根据用户名和密码查询用户
    User selectByUsernameAndPassword(Map map);

    // 根据用户名查询用户
    List<User> selectByUsernameBlur(String username);
}
