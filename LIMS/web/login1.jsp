<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">

    <script>
        //header时钟
        setInterval("timer.innerHTML=new Date().toLocaleString()");
        window.onload = function (){
            setInterval("timer.innerHTML=new Date().toLocaleString()",1000);
        };

        //二级菜单
        window.onload = function menu() {
            var li = document.getElementById("menu").getElementsByTagName("li");
            for (var i = 0; i < li.length; i ++) {
                li[i].onmouseover = function() {
                    this.className += (this.className.length > 0);
                }
            }
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
            margin: 50px 0;
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

<div class="login">
    <p>请登录</p>
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <input class="kuangkuang" type="text" placeholder="请输入学号" name="name">
        <input class="kuangkuang" type="password" placeholder="请输入密码" name="password">
        <div class="message">
            ${login_message}
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