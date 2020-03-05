<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生介绍</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

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
        #li_student {
            color: #0069cc;
            font-weight: bold;
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

<div class="big">
    <div class="picture">
        图片集
    </div>

    <div class="weizhi">
        <p>
            当前位置：<a href="index.jsp">首页</a> > <a href="jsjs.jsp">人员介绍</a> > <a href="xsjs.jsp">学生介绍</a>
        </p>
    </div>

    <div class="main">
        <div class="list_left">
            <p id="li_head">
                人员介绍
            </p>
            <ul>
                <a href="jsjs.jsp"><li class="li_item">教师</li></a>
                <a href="xsjs.jsp"><li id="li_student" class="li_item">学生</li></a>
            </ul>
        </div>

        <div class="content_right">
            <h3>学生介绍</h3>
            <span></span>
            <p>
                这里是学生介绍...
            </p>
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
