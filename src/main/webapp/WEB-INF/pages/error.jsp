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
</head>
<body>
<h1>异常页面</h1>
<%=request.getAttribute("errorMessage") == null ? "" : "失败原因：" + request.getAttribute("errorMessage")%>
</body>
</html>
