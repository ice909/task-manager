package cn.edu.sxgkd.service;

import cn.edu.sxgkd.entity.Task;

import java.util.List;

public interface ITaskService {
    List<Task> selectAll();

    Task selectById(int id);

    int insert(Task task);

    List<Task> getTasksByUserId(int userId);

    int assignTask(int taskId, int userId);

    int update(Task task);

    int delete(int id);

    List<Task> selectByKeyword(String key, String keyword);
}
