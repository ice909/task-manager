<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/22
  Time: 下午3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>404</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- 404页面 -->
<div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="col-12 text-center">
            <h1 class="display-1">404</h1>
            <h2>页面找不到</h2>
            <p>您正在查找的页面可能已被删除，其名称已更改或暂时不可用。</p>
            <a href="javascript:history.go(-1)" class="btn btn-primary">返回</a>
        </div>
    </div>
</div>
</body>
</html>
