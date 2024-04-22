<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/17
  Time: 上午10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>异常</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%--异常页面--%>
<div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="col-12 text-center">
            <h1 class="display-1">出错啦！</h1>
            <h2><%=request.getAttribute("errorMessage") == null ? "" : "失败原因：" + request.getAttribute("errorMessage")%></h2>
            <a href="javascript:history.go(-1)" class="btn btn-primary">返回</a>
        </div>
    </div>
</div>
</body>
</html>
