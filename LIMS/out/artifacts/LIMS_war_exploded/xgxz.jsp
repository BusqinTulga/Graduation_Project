<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>相关下载</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <style>
        #li_ {
            color: #0069cc;
            font-weight: bold;
        }
        .content_right ul {
            list-style: none;
        }
        .content_right ul li {
            border: none;
            border-bottom: #eeeeee solid 1px;
        }
        .content_right ul li:hover {
            background: #f5f5f5;
        }
        .content_right ul li a {
            display: block;
            width: 835px;
            color: #555555;
            padding: 5px;
            padding-top: 10px;
            padding-left: 15px;
        }
    </style>
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
        <li><a href="lxwm.jsp">联系我们</a></li>
    </ul>
</div>

<div class="big">
    <div class="picture">
        图片集
    </div>

    <div class="weizhi">
        <p>
            当前位置：<a href="index.jsp">首页</a> > <a href="xgxz.jsp">相关下载</a> > <a href="xgxz.jsp">1</a>
        </p>
    </div>

    <div class="main">
        <div class="list_left">
            <p id="li_head">
                相关下载
            </p>
            <ul>
                <a href="xgxz.jsp"><li id="li_" class="li_item">1</li></a>
                <a href=""><li class="li_item">2</li></a>
            </ul>
        </div>

        <div class="content_right">
            <h3>1</h3>
            <ul>
                <li><a href="#">内容1</a></li>
                <li><a href="#">内容2</a></li>
                <li><a href="#">内容3</a></li>
                <li><a href="#">内容4</a></li>
                <li><a href="#">内容5</a></li>
            </ul>
        </div>
    </div>
</div>

<footer>
    <p>
        版权所有 © 内蒙古师范大学机器人创新实验室
    </p>
</footer>
</body>
</html>
