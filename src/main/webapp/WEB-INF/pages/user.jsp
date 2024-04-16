<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/15
  Time: 下午10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>任务管理后台</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html,
        body {
            height: 100%;
            overflow: hidden;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
</head>

<body>
<!-- 顶部导航栏 -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">任务管理系统</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"> <!-- 如果是管理员登录，高亮用户管理标签 -->
                    <a class="nav-link active" href="javascript:void(0)">用户管理</a>
                </li>
                <li class="nav-item"> <!-- 普通用户管理标签 -->
                    <a class="nav-link" href="task">任务管理</a>
                </li>
            </ul>
        </div>
        <div class="btn-group">
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
</nav>
<div style="padding-top: 60px;padding-left: 10px;padding-right: 10px">
    <form action="searchUser" method="post" class="row g-3">
        <div class="col-auto">
            <select class="form-select" name="key">
                <option value="username">用户名</option>
            </select>
        </div>
        <div class="col-auto">
            <input type="text" name="keyword" class="form-control" placeholder="搜索">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary mb-3">搜索</button>
        </div>
        <div class="col-auto">
            <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#add">添加用户
            </button>
        </div>
    </form>
    <%--    渲染users--%>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">用户名</th>
            <th scope="col">密码</th>
            <th scope="col">邮件</th>
            <th scope="col">角色</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#edit"
                            data-id="${user.id}"
                            data-username="${user.username}"
                            data-password="${user.password}"
                            data-email="${user.email}"
                            data-role="${user.role}"
                    >编辑
                    </button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete"
                            data-id="${user.id}">删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<form method="post" action="addUser" class="row g-3">
    <div class="modal fade" id="add" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addLabel">添加用户</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label for="inputUsername" class="form-label">用户名</label>
                        <input type="text" name="username" class="form-control" id="inputUsername" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputPassword" class="form-label">密码</label>
                        <input type="password" name="password" class="form-control" id="inputPassword" required>
                    </div>

                    <div class="col-md-12">
                        <label for="inputEmail" class="form-label">邮箱</label>
                        <input type="email" name="email" class="form-control" id="inputEmail" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputRole" class="form-label">角色</label>
                        <select name="role" class="form-select" id="inputRole">
                            <option value="USER">普通用户</option>
                            <option value="ADMIN">管理员</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">添加</button>
                </div>
            </div>
        </div>
    </div>

</form>

<%--修改对话框--%>

<form action="updateUser" method="post" class="row g-3">
    <div class="modal fade" id="edit" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateLabel">修改用户信息</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label for="updateInputID" class="form-label">ID</label>
                        <input type="text" name="id" class="form-control" id="updateInputID" readonly required>
                    </div>
                    <div class="col-md-12" style="margin-top: 5px;">
                        <label for="inputUsername" class="form-label">用户名</label>
                        <input type="text" name="username" class="form-control" id="updateInputUsername" required>
                    </div>
                    <div class="col-md-12" style="margin-top: 5px;">
                        <label for="inputPassword" class="form-label">密码</label>
                        <input type="password" name="password" class="form-control" id="updateInputPassword" required>
                    </div>

                    <div class="col-md-12" style="margin-top: 5px;">
                        <label for="inputEmail" class="form-label">邮箱</label>
                        <input type="email" name="email" class="form-control" id="updateInputEmail" required>
                    </div>
                    <div class="col-md-12" style="margin-top: 5px;">
                        <label for="inputRole" class="form-label">角色</label>
                        <select name="role" class="form-select" id="updateInputRole">
                            <option value="USER">普通用户</option>
                            <option value="ADMIN">管理员</option>
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
<form action="deleteUser" method="post" class="row g-3">
    <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">删除用户</h5>
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
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $('#edit').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)

        var id = button.data("id")
        var username = button.data("username")
        var password = button.data("password")
        var email = button.data("email")
        var role = button.data("role")

        var modal = $(this)

        modal.find('#updateInputID').val(id);
        modal.find('#updateInputUsername').val(username);
        modal.find('#updateInputPassword').val(password);
        modal.find('#updateInputEmail').val(email);
        modal.find('#updateInputRole').val(role);

    })

    $('#delete').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)

        let id = button.data("id")

        var modal = $(this)

        modal.find('.delete-label').text("是否要删除ID 为：" + id + " 的用户?")
        modal.find('#deleteIdInput').val(id)
    })
</script>
</body>

</html>