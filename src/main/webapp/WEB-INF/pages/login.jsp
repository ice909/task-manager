<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/15
  Time: 下午5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html data-bs-theme="dark">
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css"/>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url("${pageContext.request.contextPath}/img/login-bg.jpg");
            background-size: cover;

        }
        .login-card {
            padding: 30px;
            border-radius: 10px;
            /*毛玻璃背景*/
            background: rgba(255, 255, 255, 0.3);
            -webkit-backdrop-filter: blur(20px);
            backdrop-filter: blur(20px);
            box-shadow:inset 0 0 6px rgba(255, 255, 255, 0.3);
        }
    </style>
</head>
<body>
<div class="login-card" style="width: 350px;">
        <h2 style="text-align: center;">登录</h2>
        <form:form class="row g-3 needs-validation" action="login" method="post" modelAttribute="loginRequest">
            <div class="col-md-12" style="margin-top: 20px;">
                <label for="username" class="form-label card-text">用户名</label>
                <form:input path="username" type="text" class="form-control" id="username" />
                <form:errors path="username" cssClass="text-danger" />
            </div>
            <div class="col-md-12">
                <label for="password" class="form-label card-text">密码</label>
                <form:password path="password" class="form-control form-" id="password" />
                <form:errors path="password" cssClass="text-danger" />
            </div>
            <div class="col-md-12 text-danger">
                ${error}
            </div>
            <div class="d-grid gap-2" style="margin-top: 50px;">
                <button type="submit" class="btn btn-primary">登录</button>
            </div>
        </form:form>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    (function () {
        'use strict'

        var forms = document.querySelectorAll('.needs-validation')

        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>
