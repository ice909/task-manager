<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/4/15
  Time: 下午5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css"/>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f7f9fb;
        }
        .card {
            border-color: transparent;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        }
    </style>
</head>
<body>
<div class="card fat" style="width: 350px;">
    <div class="card-body">
        <h2 style="text-align: center;">登录</h2>
        <form class="row g-3 needs-validation" action="login" method="post" novalidate>
            <div class="col-md-12" style="margin-top: 20px;">
                <label for="username" class="form-label">用户名</label>
                <input type="text" class="form-control" id="username" name="username" required>
                <div class="invalid-feedback">
                    必须填写用户名
                </div>
            </div>
            <div class="col-md-12 has-validation">
                <label for="password" class="form-label">密码</label>
                <input type="password" class="form-control" id="password" name="password" required>
                <div class="invalid-feedback">
                    必须填写密码
                </div>
            </div>
            <span style="color: red;">${requestScope.msg}</span>
            <div class="d-grid gap-2" style="margin-top: 50px;">
                <button type="submit" class="btn btn-primary">登录</button>
            </div>
        </form>
    </div>
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
