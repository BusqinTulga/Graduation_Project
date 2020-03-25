<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">

    <script src="js/jquery-3.4.1.min.js"></script>

    <style>
        .login {
            border: gainsboro solid 1px;
            width: 300px;
            height: 410px;
            margin: 50px auto;
            padding: 0 50px;
            border-radius: 10px;
            box-shadow: 0 5px 10px 3px lightgray;
        }
        .login p {
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            margin: 50px 0;
            color: #5e5e5e;
        }
        .kuangkuang {
            width: 288px;
            height: 30px;
            margin-bottom: 20px;
        }
        .login form input {
            padding-left: 10px;
            border-radius: 5px;
            outline: none;
            border: gainsboro solid 1px;
        }
        #submit {
            width: 100%;
            height: 45px;
            margin-top: 20px;
            border-radius: 3px;
        }
        .message {
            visibility:hidden;
            width: 278px;
            height: 22px;
            background: #f2dede;
            color: #a94442;
            border: #ebccd1 solid 1px;
            border-radius: 4px;
            padding: 10px;
            font-size: 14px;
        }
    </style>

    <script>
        window.onload = function() {
            if("${requestScope.login_message}" === "") {
                $(".message").css("visibility","hidden");
            }
            else {
                $(".message").css("visibility","unset");
            }
        };
    </script>
</head>

<body>
<div class="top">
    <p>
        <c:choose>
            <c:when test="${user == null}">
                <!-- 未登录 -->
                欢迎访问！
            </c:when>
            <c:when test="${user.getAuthoritiy() == 1}">
                <!-- 已登录 管理员 -->
                尊贵的${user.name}您好！您的上次登录时间是：<fmt:formatDate value="${user.last_time_login}" pattern="yyyy-MM-dd HH:mm:ss"/>
                &nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/admin.jsp">管理系统</a>
                &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/logoutServlet">注销</a>
            </c:when>
            <c:otherwise>
                <!-- 已登录 普通用户 -->
                ${user.name}你好！你的上次登录时间是：<fmt:formatDate value="${user.last_time_login}" pattern="yyyy-MM-dd HH:mm:ss"/>
                &nbsp;
                <a href="${pageContext.request.contextPath}/logoutServlet">注销</a>
            </c:otherwise>
        </c:choose>
        <span class="language">
              <a href="">中文</a> / <a href="">English</a>
        </span>
    </p>
</div>

<header>
    <h1>内蒙古师范大学机器人创新实验室</h1>
    <a href="http://www.imnu.edu.cn/"><img src="image/logo.jpg" alt="内蒙古师范大学logo"></a>
</header>

<div class="menu">
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li>
            <a href="sysjj.jsp">实验室概况</a>
            <ul>
                <li><a href="sysjj.jsp">实验室简介</a></li>
                <li><a href="fzlc.jsp">发展历程</a></li>
                <li><a href="zzjg.jsp">组织机构</a></li>
            </ul>
        </li>
        <li>
            <a href="yjfx.jsp">研究方向</a>
            <ul>
                <li><a href="yjfx.jsp">1</a></li>
                <li><a href="">2</a></li>
            </ul>
        </li>
        <li>
            <a href="jsjs.jsp">人员介绍</a>
            <ul>
                <li><a href="jsjs.jsp">教师</a></li>
                <li><a href="xsjs.jsp">学生</a></li>
            </ul>
        </li>
        <li>
            <a href="hjcg.jsp">获奖成果</a>
            <ul>
                <li><a href="">1</a></li>
                <li><a href="">2</a></li>
            </ul>
        </li>
        <li>
            <a href="xgxz.jsp">相关下载</a>
            <ul>
                <li><a href="">1</a></li>
                <li><a href="">2</a></li>
            </ul>
        </li>
        <li><a href="login.jsp">登录</a></li>
        <li><a href="jrwm.jsp">加入我们</a></li>
        <li>
            <a href="lxwm.jsp">联系我们</a>
            <ul>
                <li><a href="nmly.jsp">匿名留言</a></li>
            </ul>
        </li>
    </ul>
</div>

<div class="login">
    <p>请登录</p>
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <input class="kuangkuang" type="text" placeholder="请输入学号" name="name">
        <input class="kuangkuang" type="password" placeholder="请输入密码" name="password">
        <div class="message" onclick="$('.message').css('visibility','hidden')">
            ${requestScope.login_message}
        </div>
        <input id="submit" type="submit" value="登录">
    </form>
</div>

<footer>
    <p>
        版权所有 © 内蒙古师范大学机器人创新实验室
    </p>
</footer>
</body>
</html>