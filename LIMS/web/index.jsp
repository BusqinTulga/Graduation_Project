<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>内蒙古师范大学机器人创新实验室</title>

  <link rel="stylesheet" href="css/bace.css" type="text/css">
  <link rel="stylesheet" href="css/index.css" type="text/css">

  <script language="Javascript" type="text/javascript">
    setInterval("timer.innerHTML=new Date().toLocaleString()");
    window.onload = function (){
      setInterval("timer.innerHTML=new Date().toLocaleString()",1000);
    }
  </script>

  <style>
    .gundong {
      border: black solid 1px;
      height: 400px;
      margin: 15px 0;
      text-align: center;
      line-height: 400px;
    }
    .gundong img {
      width: 100%;
      height: 100%;
    }
    .sidebar {
      background: orange;
      border-top-left-radius: 5px;
      border-bottom-left-radius: 5px;
      color: white;
      width: 20px;
      padding: 5px 4px;
      text-align: center;
      position: fixed;
      display: inline;
      top: 50%;
      right: 0;
    }
    .news {
      border: black solid 1px;
      height: 300px;
      margin: 15px 0;
      text-align: center;
      line-height: 300px;
    }
  </style>

</head>

<body>
<div class="top">
      <p>${user.name}你好，现在是
        <span id="timer"></span>
        <a href="/logoutServlet">注销</a>
        <span class="language">
              <a href="">中文</a> / <a href="">English</a>
          </span>
      </p>
</div>

<header>
  <h1>内蒙古师范大学机器人创新实验室</h1>
  <a href="http://www.imnu.edu.cn/"><img src="image/logo.jpg"></a>
</header>

<div class="daohang">
  <ul>
    <a href="index.jsp"><li>首页</li></a>
    <a href="sysjj.html"><li>实验室概况</li></a>
    <a href=""><li>研究方向</li></a>
    <a href="jsjs.html"><li>人员介绍</li></a>
    <a href=""><li>获奖成果</li></a>
    <a href=""><li>相关下载</li></a>
    <a href="login.jsp"><li>登录</li></a>
    <a href="jrwm.jsp"><li>加入我们</li></a>
    <a href="lxwm.html"><li>联系我们</li></a>
    <a href="admin.jsp"><li>管理系统</li></a>
  </ul>
</div>

<div class="big">
  <div class="gundong">
    <img id="gundong" src="image/test1.PNG">
  </div>

  <div class="news">
    新闻公告区
  </div>
</div>

<footer>
  <p>
    版权所有 © 内蒙古师范大学机器人创新实验室
  </p>
</footer>

<script>
  //轮播图
  var num = 1;
  function fun() {
    var gundong = document.getElementById("gundong");
    gundong.src = "image/test"+num+".PNG";
    num++;
    if (num == 4) {
      num = 1;
    }
  }
  setInterval(fun,1500);

  //是否登录
  function flag() {
    var a = '<%=session.getAttribute("user")%>';
    alert(a);
  }
</script>
</body>
</html>