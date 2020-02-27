<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>实验室概况</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <script language="Javascript" type="text/javascript">
        setInterval("timer.innerHTML=new Date().toLocaleString()");
        window.onload = function (){
            setInterval("timer.innerHTML=new Date().toLocaleString()",1000);
        }
    </script>

    <style>
        #li_sysjj {
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

<div class="daohang">
    <ul>
        <a href="index.jsp"><li>首页</li></a>
        <a href="sysjj.jsp"><li>实验室概况</li></a>
        <a href=""><li>研究方向</li></a>
        <a href="jsjs.jsp"><li>人员介绍</li></a>
        <a href=""><li>获奖成果</li></a>
        <a href=""><li>相关下载</li></a>
        <a href="login.jsp"><li>登录</li></a>
        <a href="jrwm.jsp"><li>加入我们</li></a>
        <a href="lxwm.jsp"><li>联系我们</li></a>
    </ul>
</div>

<div class="big">
    <div class="picture">
        图片集
    </div>

    <div class="weizhi">
        <p>
            当前位置：<a href="index.jsp">首页</a> > <a href="sysjj.html">实验室概况</a> > 实验室简介
        </p>
    </div>

    <div class="main">
        <div class="list_left">
            <p id="li_head">
                实验室概况
            </p>
            <ul>
                <a href=""><li id="li_sysjj" class="li_item">实验室简介</li></a>
                <a href=""><li class="li_item">发展历程</li></a>
                <a href=""><li class="li_item">组织机构</li></a>
            </ul>
        </div>

        <div class="content_right">
            <h3>实验室简介</h3>
            <span></span>
            <p>
                内蒙古师范大学（Inner Mongolia Normal University）位于内蒙古自治区呼和浩特，是新中国成立后在边疆少数民族地区最早建
                立的综合性师范大学，为自治区重点大学、中西部高校基础能力建设工程、卓越教师培养计划入选高校，是自治区培养基础教育、民
                族教育师资和蒙汉兼通少数民族复合型人才的重要基地。是自治区各类体育专业人才和全国八省区蒙古族体育人才、中国北方民族音
                乐人才 、自治区美术、艺术设计教育人才培养基地，被社会誉为“民族教育的摇篮”。学校前身是内蒙古师范学院，1952年5月5日成
                立于当时的首府乌兰浩特。1953年8月，由张家口师专和绥远师专合并成的内蒙古师范专科学校并入。1982年，学校更名为“内蒙古
                师范大学”，并被确定为自治区重点大学。2000年7月，内蒙古教育学院并入。
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