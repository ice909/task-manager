<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/15
  Time: 下午9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>任务管理后台</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
    <style>
        /** 表格内容垂直居中 **/
        th {
            vertical-align: middle !important;
        }
        td {
            vertical-align: middle !important;
        }
    </style>
</head>

<body style="overflow-y: scroll">
<!-- 顶部导航栏 -->
<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary" aria-label="Thirteenth navbar example">
    <div class="container-fluid">
        <div class="collapse navbar-collapse d-lg-flex" id="navbarsExample11">
            <a class="navbar-brand col-lg-3 me-0" href="#">任务管理系统</a>
            <ul class="navbar-nav col-lg-6 justify-content-lg-center">
                <c:if test="${user.role == 'ADMIN'}">
                    <li class="nav-item">
                        <a class="nav-link" href="user">用户管理</a>
                    </li>
                </c:if>
                <!-- 普通用户管理标签 -->
                <li class="nav-item">
                    <a class="nav-link active" href="javascript:void(0)">任务管理</a>
                </li>
            </ul>
            <div class="d-lg-flex col-lg-3 justify-content-lg-end">
                <div class="dropdown" style="margin-right: 20px;">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-bs-toggle="dropdown" aria-expanded="false">
                        ${user.username}
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="min-width: 92px;">
                        <li style="width: 92px;"><a class="dropdown-item" href="logout">退出登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<div style="padding-top: 60px;padding-left: 10px;padding-right: 10px">
    <div class="card" style="padding: 10px;">
            <form action="searchTask" method="post" class="row g-3">
                <div class="col-auto">
                    <select class="form-select" name="key">
                        <option value="title">任务名称</option>
                    </select>
                </div>
                <div class="col-auto">
                    <input type="text" name="keyword" class="form-control" placeholder="搜索">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">搜索</button>
                </div>
                <div class="col-auto">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add">创建任务
                    </button>
                </div>
            </form>
    </div>
    <%--    渲染users--%>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">任务标题</th>
            <th scope="col">任务描述</th>
            <th scope="col">截至日期</th>
            <th scope="col">任务状态</th>
            <th scope="col">创建者</th>
            <th scope="col">分配给</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${tasks}" var="task">
            <tr>
                <th scope="row">${task.id}</th>
                <td>${task.title}</td>
                <td>${task.description}</td>
                <td>${task.deadline}</td>
                <td>${task.status}</td>
                <td>${task.creatorName}</td>
                <td>${task.assigneeName}</td>
                <td>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#edit"
                            data-id="${task.id}"
                            data-title="${task.title}"
                            data-description="${task.description}"
                            data-deadline="${task.deadline}"
                            data-status="${task.status}"
                            data-creatorid="${task.creatorId}"
                            data-assigneeid="${task.assigneeId}"
                    >编辑
                    </button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete"
                            data-id="${task.id}">删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--添加任务对话框--%>
<form method="post" action="addTask" class="row g-3">
    <div class="modal fade" id="add" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addLabel">创建任务</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label for="inputTitle" class="form-label">任务标题</label>
                        <input type="text" name="title" class="form-control" id="inputTitle" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputDescription" class="form-label">任务描述</label>
                        <textarea name="description" class="form-control" id="inputDescription" required></textarea>
                    </div>

                    <div class="col-md-12">
                        <label for="inputDeadline" class="form-label">任务截至日期</label>
                        <input type="date" name="deadline" class="form-control" id="inputDeadline" required/>
                    </div>
                    <div class="col-md-12">
                        <label for="inputStatus" class="form-label">任务状态</label>
                        <input type="text" name="status" class="form-control" id="inputStatus" value="TODO" required
                               readonly>
                    </div>
                    <div class="col-md-12">
                        <label for="inputCreatorName" class="form-label">创建者</label>
                        <section>
                            <select name="creatorId" class="form-select" id="inputCreatorName">
                                <option value="${user.id}">${user.username}</option>
                            </select>
                        </section>
                    </div>
                    <div class="col-md-12">
                        <label for="inputAssigneeId" class="form-label">分配给</label>
                        <section>
                            <select name="assigneeId" class="form-select" id="inputAssigneeId">
                                <c:forEach items="${users}" var="user">
                                    <option value="${user.id}">${user.username}</option>
                                </c:forEach>
                            </select>
                        </section>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>
</form>

<%--修改任务对话框--%>
<form action="updateTask" method="post" class="row g-3">
    <div class="modal fade" id="edit" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateLabel">编辑任务信息</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <input type="hidden" name="id" class="form-control" id="updateInputId" required/>
                    </div>
                    <div class="col-md-12">
                        <label for="updateInputTitle" class="form-label">任务标题</label>
                        <input type="text" name="title" class="form-control" id="updateInputTitle" required>
                    </div>
                    <div class="col-md-12">
                        <label for="updateInputDescription" class="form-label">任务描述</label>
                        <textarea name="description" class="form-control" id="updateInputDescription"
                                  required></textarea>
                    </div>

                    <div class="col-md-12">
                        <label for="updateInputDeadline" class="form-label">任务截至日期</label>
                        <input type="date" name="deadline" class="form-control" id="updateInputDeadline" required/>
                    </div>
                    <div class="col-md-12">
                        <label for="updateInputStatus" class="form-label">任务状态</label>
                        <input type="text" name="status" class="form-control" id="updateInputStatus" value="TODO"
                               required readonly>
                    </div>
                    <div class="col-md-12">
                        <label for="updateInputCreatorName" class="form-label">创建者</label>
                        <select name="creatorId" class="form-select" id="updateInputCreatorName" disabled>
                            <c:forEach items="${users}" var="user">
                                <option value="${user.id}">${user.username}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label for="updateInputAssigneeId" class="form-label">分配给</label>
                        <select name="assigneeId" class="form-select" id="updateInputAssigneeId">
                            <c:forEach items="${users}" var="user">
                                <option value="${user.id}">${user.username}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>
</form>
<%--删除对话框--%>
<form action="deleteTask" method="post" class="row g-3">
    <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">删除任务</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label class="delete-label"></label>
                    <input type="hidden" name="id" placeholder="" class="form-control" id="deleteIdInput">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">删除</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    $('#edit').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)

        var id = button.data("id")
        var title = button.data("title")
        var description = button.data("description")
        var deadline = button.data("deadline")
        var status = button.data("status")
        var creatorId = button.data("creatorid")
        var assigneeId = button.data("assigneeid")
        console.log("id: " + id)
        console.log("title: " + title)
        console.log("description: " + description)
        console.log("deadline: " + deadline)
        console.log("status: " + status)
        console.log("creatorId: " + creatorId)
        console.log("assigneeId: " + assigneeId)

        var modal = $(this)

        modal.find('#updateInputId').val(id)
        modal.find('#updateInputTitle').val(title)
        modal.find('#updateInputDescription').val(description)
        modal.find('#updateInputDeadline').val(deadline)
        modal.find('#updateInputStatus').val(status)
        modal.find('#updateInputCreatorName').val(creatorId)
        modal.find('#updateInputAssigneeId').val(assigneeId)

        // 提交表单时，移除disabled属性
        $("#updateInputCreatorName").removeAttr("disabled");
    })

    $('#delete').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)

        let id = button.data("id")

        var modal = $(this)

        modal.find('.delete-label').text("是否要删除ID 为：" + id + " 的任务?")
        modal.find('#deleteIdInput').val(id)
    })
</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>

</html>

