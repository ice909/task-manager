package cn.edu.sxgkd.entity;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class Task {
    private int id;
    @NotBlank(message = "标题不能为空")
    private String title;
    @NotBlank(message = "描述不能为空")
    private String description;
    @NotBlank(message = "截止时间不能为空")
    private String deadline;
    @Pattern(regexp = "TODO|IN_PROGRESS|COMPLETED", message = "状态只能是TODO, IN_PROGRESS, 或 COMPLETED")
    private String status;
    @NotNull(message = "创建者不能为空")
    private int creatorId;
    @NotNull(message = "执行者不能为空")
    private int assigneeId;
    private String creatorName;
    private String assigneeName;
    private String createdAt;
    private String updatedAt;

    public Task() {
    }

    public Task(int id,String title,  String description, String deadline, String status, int creatorId, int assigneeId) {
        this.title = title;
        this.id = id;
        this.description = description;
        this.deadline = deadline;
        this.status = status;
        this.creatorId = creatorId;
        this.assigneeId = assigneeId;
    }

    public Task(String title, String description, String deadline, String status, int creatorId, int assigneeId) {
        this.title = title;
        this.description = description;
        this.deadline = deadline;
        this.status = status;
        this.creatorId = creatorId;
        this.assigneeId = assigneeId;
    }

    public Task(String title, String description, String deadline, String status, int creatorId) {
        this.title = title;
        this.description = description;
        this.deadline = deadline;
        this.status = status;
        this.creatorId = creatorId;
    }

    public Task(int id, String title, String description, String deadline, String status, int creatorId, int assigneeId, String createdAt, String updatedAt) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.deadline = deadline;
        this.status = status;
        this.creatorId = creatorId;
        this.assigneeId = assigneeId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Task(int id, String title, String description, String deadline, String status, int creatorId, int assigneeId, String creatorName, String assigneeName, String createdAt, String updatedAt) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.deadline = deadline;
        this.status = status;
        this.creatorId = creatorId;
        this.assigneeId = assigneeId;
        this.creatorName = creatorName;
        this.assigneeName = assigneeName;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    public int getAssigneeId() {
        return assigneeId;
    }

    public void setAssigneeId(int assigneeId) {
        this.assigneeId = assigneeId;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public String getAssigneeName() {
        return assigneeName;
    }

    public void setAssigneeName(String assigneeName) {
        this.assigneeName = assigneeName;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", deadline='" + deadline + '\'' +
                ", status='" + status + '\'' +
                ", creatorId=" + creatorId +
                ", assigneeId=" + assigneeId +
                ", creatorName='" + creatorName + '\'' +
                ", assigneeName='" + assigneeName + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                '}';
    }
}
