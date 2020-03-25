<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>内蒙古师范大学机器人创新实验室</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">

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
  <a href="http://www.imnu.edu.cn/"><img id="#logo" src="image/logo.jpg" alt="内蒙古师范大学logo"></a>
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

<div class="big">
  <div class="gundong">
    <img id="gundong" src="image/test1.PNG" alt="滚动图片">
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
    if (num === 4) {
      num = 1;
    }
  }
  setInterval(fun,1000);
</script>
</body>
</html>