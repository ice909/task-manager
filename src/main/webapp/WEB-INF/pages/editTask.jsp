<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/22
  Time: 下午8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加任务</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary" aria-label="Thirteenth navbar">
    <div class="container-fluid">
        <div class="collapse navbar-collapse d-lg-flex">
            <a class="navbar-brand col-lg-3 me-0" href="#">编辑任务</a>
        </div>
    </div>
</nav>
<div class="container" style="padding-top: 60px;">
    <div class="card">
        <div class="card-body">
            <form:form method="post" action="updateTask" modelAttribute="task" class="row g-2">
                <div class="col-md-12">
                    <form:input type="hidden" class="form-control" id="updateInputId" path="id"/>
                </div>
                <div class="col-md-12">
                    <label for="inputTitle" class="col-sm-2 col-form-label">任务标题</label>
                    <form:input type="text" path="title" class="form-control" id="inputTitle"/>
                    <form:errors path="title" cssClass="text-danger"/>
                </div>
                <div class="col-md-12">
                    <label for="inputDescription" class="form-label">任务描述</label>
                    <form:textarea class="form-control" id="inputDescription" path="description"/>
                    <form:errors path="description" cssClass="text-danger"/>
                </div>

                <div class="col-md-12">
                    <label for="inputDeadline" class="form-label">任务截至日期</label>
                    <form:input type="date" class="form-control" id="inputDeadline" path="deadline"/>
                    <form:errors path="deadline" cssClass="text-danger"/>
                </div>
                <div class="col-md-12">
                    <label for="inputStatus" class="form-label">任务状态</label>
                        <%-- TODO IN_PROGRESS COMPLETED--%>
                    <form:select class="form-select" id="inputStatus" path="status">
                        <form:option value="TODO">TODO</form:option>
                        <form:option value="IN_PROGRESS">IN_PROGRESS</form:option>
                        <form:option value="COMPLETED">COMPLETED</form:option>
                    </form:select>
                </div>
                <div class="col-md-12">
                    <label for="inputCreatorName" class="form-label">创建者</label>
                    <form:select class="form-select" id="inputCreatorName" path="creatorId">
                        <c:forEach items="${users}" var="user">
                            <form:option value="${user.id}">${user.username}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="col-md-12">
                    <label for="inputAssigneeId" class="form-label">分配给</label>
                    <form:select path="assigneeId" class="form-select" id="inputAssigneeId">
                        <c:forEach items="${users}" var="user">
                            <form:option value="${user.id}">${user.username}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <%--添加和返回按钮--%>
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">修改</button>
                    <a href="javascript:history.go(-1)" class="btn btn-secondary">返回</a>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
