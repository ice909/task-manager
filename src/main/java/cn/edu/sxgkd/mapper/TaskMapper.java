package cn.edu.sxgkd.mapper;

import cn.edu.sxgkd.entity.Task;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TaskMapper {
    // 获取所有任务
    List<Task> selectAll();

    // 根据Id获取任务
    Task selectById(int id);

    // 新增任务
    int insert(Task task);

    // 获取用户的任务
    List<Task> getTasksByUserId(int userId);

    // 分配任务
    int assignTask(int taskId, int userId);

    // 修改任务信息
    int update(Task task);

    // 删除任务
    int delete(int id);

    // 模糊查询任务
    List<Task> selectByKeyword(String keyword);

    // 模糊查询任务
    List<Task> selectByTitleBlur(String keyword);
}
