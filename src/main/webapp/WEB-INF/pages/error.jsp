<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/17
  Time: 上午10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>异常</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css"/>
</head>
<body>
<h1>异常页面</h1>
<%=request.getAttribute("errorMessage") == null ? "" : "失败原因：" + request.getAttribute("errorMessage")%>
<br />
<a href="javascript:history.go(-1)">返回</a>
</body>
</html>
