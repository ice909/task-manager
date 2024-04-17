package cn.edu.sxgkd.service;

import cn.edu.sxgkd.entity.Task;

import java.util.List;

public interface ITaskService {
    List<Task> selectAll();

    Task selectById(int id);

    int insert(Task task);

    int update(Task task);

    int delete(int id);

    List<Task> selectByKeyword(String key, String keyword);
}
