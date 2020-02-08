<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>成员信息</title>

    <link rel="stylesheet" href="css/normal.css" type="text/css">

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
    </style>
</head>
<body>
<div class="top">
    <p>欢迎访问，现在是
        <span id="timer"></span>
    </p>
</div>

<header>
    <h1>机器人创新实验室后台管理系统</h1>
    <img src="image/logo.jpg">
</header>

<p id="line"></p>

<div class="manage_daohang">
    <ul>
        <a href="manage.html"><li>首页</li></a>
        <a href=""><li>实验室信息管理</li></a>
        <a href="/UserListServlet"><li>成员信息管理</li></a>
        <a href=""><li>4</li></a>
        <a href=""><li>5</li></a>
        <a href=""><li>申请审核</li></a>
        <a href=""><li>留言管理</li></a>
    </ul>
</div>

</body>
</html>