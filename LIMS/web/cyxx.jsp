<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>机器人创新实验室管理系统</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">

    <script language="Javascript" type="text/javascript">
        setInterval("timer.innerHTML=new Date().toLocaleString()");
        window.onload = function (){
            setInterval("timer.innerHTML=new Date().toLocaleString()",1000);
        }
    </script>

    <style>
        #line{
            border-bottom: gainsboro solid 1px;
        }
        .manage_daohang {
            margin: 0 auto;
            width: 150px;
            height: 500px;
            text-align: center;
            background: #0069cc;
            float: left;
        }
        .manage_daohang ul {
            list-style: none;
            display: inline-block;
            color: white;
        }
        .manage_daohang ul a {
            color: white;
            font-family: "微软雅黑";
        }
        .manage_daohang ul li {
            width: 150px;
            height: 40px;
            line-height: 40px;
            float: left;
        }
        .manage_daohang ul li:hover {
            background: orange;
            color: white;
        }
        .cyxx_table table {
            border-collapse: collapse;
            padding: 5px;
        }
        .cyxx_table table th {
            border: black solid 1px;
            width: 80px;
            padding: 5px 0;
        }
        .cyxx_table table td {
            border: black solid 1px;
            text-align: center;
            padding: 5px 0;
        }
    </style>

    <script>
        function warning() {
            var body = document.getElementById("body");
            body.style.background = "red";
        }

        function deleteUser(id) {
            if (confirm("您确定要删除成员吗？")) {
                    location.href = "/deleteUserServlet?id="+id;
            }
        }
    </script>
</head>
<body id="body">
<div class="top">
    <p>${user.name}你好，现在是
        <span id="timer"></span>
        <a href="/logoutServlet">注销</a>
    </p>
</div>

<header>
    <h1>机器人创新实验室后台管理系统</h1>
    <img src="image/logo.jpg">
</header>

<p id="line"></p>

<div class="manage_daohang">
    <ul>
        <a href="admin.jsp"><li>首页</li></a>
        <a href=""><li>实验室信息管理</li></a>
        <a href="/userListServlet"><li>成员信息管理</li></a>
        <a href=""><li>权限管理</li></a>
        <a href=""><li>5</li></a>
        <a href="shsq.jsp"><li>审核申请</li></a>
        <a href=""><li>留言管理</li></a>
    </ul>
</div>

<div class="cyxx_table">
    <table>
        <tr>
            <th>编号</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>籍贯</th>
            <th>班级</th>
            <th>手机号</th>
            <th>邮箱</th>
            <th>权限</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${member}" var="user" varStatus="s">
            <tr>
                <td>${s.count}</td>
                <td>${user.number}</td>
                <td>${user.name}</td>
                <td>${user.gender}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>${user.classes}</td>
                <td>${user.phone_number}</td>
                <td>${user.email}</td>
                <td>${user.authoritiy}级</td>
                <td><a href="javascript:deleteUser(${user.id});">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>