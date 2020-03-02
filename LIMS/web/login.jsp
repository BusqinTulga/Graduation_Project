<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">

    <script language="Javascript" type="text/javascript">
        setInterval("timer.innerHTML=new Date().toLocaleString()");
        window.onload = function (){
            setInterval("timer.innerHTML=new Date().toLocaleString()",1000);
        }
    </script>

    <style>
        .login {
            border: gainsboro solid 1px;
            width: 300px;
            height: 400px;
            margin: 40px auto;
            padding: 0 40px;
            border-radius: 10px;
            box-shadow: 0px 5px 10px 3px lightgray;
        }
        .login p {
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            margin: 60px 0;
            color: #5e5e5e;
        }
        .kuangkuang {
            width: 286px;
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
    </style>
</head>
<body>

<div class="top">
    <p>${user.name}你好，现在是
        <span id="timer"></span>
        <a href="/logoutServlet">注销</a>
    </p>
</div>

<header>
    <h1>内蒙古师范大学机器人创新实验室</h1>
    <a href="http://www.imnu.edu.cn/"><img src="image/logo.jpg"></a>
</header>

<div class="daohang">
    <ul>
        <a href="index.jsp"><li>首页</li></a>
        <a href="sysjj.jsp"><li>实验室概况</li></a>
        <a href="yjfx.jsp"><li>研究方向</li></a>
        <a href="jsjs.jsp"><li>人员介绍</li></a>
        <a href=""><li>获奖成果</li></a>
        <a href="xgxz.jsp"><li>相关下载</li></a>
        <a href="login.jsp"><li>登录</li></a>
        <a href="jrwm.jsp"><li>加入我们</li></a>
        <a href="lxwm.jsp"><li>联系我们</li></a>
    </ul>
</div>

<div class="login">
    <p>请登录</p>
    <form action="../loginServlet" method="post">
        <input class="kuangkuang" type="text" placeholder="请输入学号" name="name">
        <input class="kuangkuang" type="password" placeholder="请输入密码" name="password">
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