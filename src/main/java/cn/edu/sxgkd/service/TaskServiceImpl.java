package cn.edu.sxgkd.service;

import cn.edu.sxgkd.entity.Task;
import cn.edu.sxgkd.mapper.TaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("taskService")
@Transactional
public class TaskServiceImpl implements ITaskService {
    @Autowired
    private TaskMapper taskMapper;

    @Override
    public List<Task> selectAll() {
        return taskMapper.selectAll();
    }

    @Override
    public Task selectById(int id) {
        return taskMapper.selectById(id);
    }

    @Override
    public int insert(Task task) {
        return taskMapper.insert(task);
    }

    @Override
    public int update(Task task) {
        return taskMapper.update(task);
    }

    @Override
    public int delete(int id) {
        return taskMapper.delete(id);
    }

    @Override
    public List<Task> selectByKeyword(String key, String keyword) {
        if (key.equals("title")) {
            return taskMapper.selectByTitleBlur(keyword);
        }
        return taskMapper.selectAll();
    }
}
