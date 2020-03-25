<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>机器人创新实验室管理系统</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">
    <link rel="stylesheet" href="css/admin.css" type="text/css">

    <style>
        .message_table table {
            border-collapse: collapse;
            width: 500px;
            margin-left: 50px;
        }

        .message_table table th {
            background: lightblue;
            border: lightblue solid 1px;
            padding: 5px 0;
        }
        .message_table table tr:hover {
            background: #f7f7f7;
        }
        .message_table table td {
            border: gainsboro solid 1px;
            padding: 5px 10px;
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
                <a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
                &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/logoutServlet">注销</a>
            </c:when>
        </c:choose>
    </p>
</div>

<header>
    <h1>机器人创新实验室后台管理系统</h1>
    <img src="image/logo.jpg" alt="内蒙古师范大学logo">
</header>

<div class="admin_menu">
    <ul>
        <li><a href="${pageContext.request.contextPath}/getViewTimesServlet">首页</a></li>
        <li><a href="">实验室信息管理</a></li>
        <li><a href="${pageContext.request.contextPath}/userListServlet">成员信息管理</a></li>
        <li><a href="">权限管理</a></li>
        <li><a href="">值日表管理</a></li>
        <li><a href="${pageContext.request.contextPath}/applyUserByPageServlet">审核申请</a></li>
        <li><a href="${pageContext.request.contextPath}/findMessageServlet">查看留言</a></li>
    </ul>
</div>

<div class="message_table">
    <table>
        <tr>
            <th>留言列表</th>
        </tr>
        <c:forEach items="${message}" var="message">
            <tr>
                <td>${message.message}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>