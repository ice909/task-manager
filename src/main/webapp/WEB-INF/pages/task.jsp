<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/15
  Time: 下午9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <label class="col-form-label">任务标题</label>
                </div>
                <div class="col-auto">
                    <input type="text" name="title" class="form-control" placeholder="请输入任务标题">
                </div>
                <div class="col-auto">
                    <label class="col-form-label">任务描述</label>
                </div>
                <div class="col-auto">
                    <input type="text" class="form-control" name="desc" placeholder="请输入描述">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">搜索</button>
                </div>
                <div class="col-auto">
                    <a href="toAddTask" type="button" class="btn btn-primary">创建任务
                    </a>
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
                    <a href="toUpdateTask?id=${task.id}" class="btn btn-primary">编辑</a>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete"
                            data-id="${task.id}">删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--删除对话框--%>
<form action="deleteTask" method="get" class="row g-3">
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

