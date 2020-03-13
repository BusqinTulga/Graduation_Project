<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>审核申请</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">

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
        .form p {
            white-space: pre;
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 28px;
        }
        .form form table {
            border-collapse: collapse;
            margin: 0 auto;
            width: 800px;
        }
        .form form a {
             display: block;
             text-align: center;
         }
        .form form input {
             display: block;
             margin: 0 auto;
         }
        .form form table tr,td,th {
            border: black solid 1px;
        }
        .form form table th {
            width: 100px;
            height: 50px;
        }
        .td_short {
            width: 60px;
            height: 50px;
        }
        .td_short_plus {
            width: 127px;
            height: 50px;
        }
        .td_middle {
            width: 170px;
            height: 50px;
        }
        #td_middle_plus {
            width: 288px;
            height: 50px;
        }
        #td_middle_plus input {
            padding-left: 10px;
            text-align: left;
        }
        .td_long {
            width: 699px;
            height: 150px;
        }
        #td_picture {
            width: 140px;
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
    <h1>机器人创新实验室后台管理系统</h1>
    <img src="image/logo.jpg" alt="内蒙古师范大学logo">
</header>

<p id="line"></p>

<div class="manage_daohang">
    <ul>
        <a href="admin.jsp"><li>首页</li></a>
        <a href=""><li>实验室信息管理</li></a>
        <a href="${pageContext.request.contextPath}/userListServlet"><li>成员信息管理</li></a>
        <a href=""><li>权限管理</li></a>
        <a href=""><li>值日表管理</li></a>
        <a href="${pageContext.request.contextPath}/applyUserServlet"><li>审核申请</li></a>
        <a href=""><li>留言管理</li></a>
    </ul>
</div>

<div class="form">
    <c:forEach items="${application}" var="application" varStatus="s">
        <p>社  员  申  请  表</p>
        <form action="${pageContext.request.contextPath}/applyUserServlet" method="post">
            <table>
                <tr>
                    <th>姓名</th>
                    <td class="td_middle">${application.name}</td>
                    <th>性别</th>
                    <td class="td_short">${application.gender}</td>
                    <th>出生年月</th>
                    <td class="td_short_plus">${application.birthday}</td>
                    <th rowspan="4" id="td_picture">生活照</th>
                </tr>
                <tr>
                    <th>籍贯</th>
                    <td colspan="5">${application.address}</td>
                </tr>
                <tr><th>学院</th>
                    <td class="td_middle" colspan="2">${application.collage}</td>
                    <th>班级</th>
                    <td class="td_short_plus" colspan="2">${application.classes}</td>
                </tr>
                <tr>
                    <th>学号</th>
                    <td class="td_middle">${application.number}</td>
                    <th>联系方式</th>
                    <td id="td_middle_plus" colspan="3">
                        邮箱：${application.email}
                        <br>
                        手机号：${application.phone_number}
                    </td>
                </tr>
                <tr>
                    <th>自我简述</th>
                    <td colspan="6" class="td_long">${application.self_description}</td>
                </tr>
                <tr><th>入社理由</th>
                    <td colspan="6" class="td_long">${application.reason}</td>
                </tr>
            </table>
            <a href="javascript:disagreedApplication(${application.a_id});">拒绝</a>
            <a href="javascript:agreedApplication(${application.a_id});">通过</a>
        </form>
    </c:forEach>
</div>
<br>
<br>
<br>

<script>
    //拒绝
    function disagreedApplication(a_id) {
        if (confirm("您确定要拒绝吗？")) {
            location.href = "/applyDisagreedServlet?a_id=" + a_id;
        }
    }

    //通过
    function agreedApplication(a_id) {
        if (confirm("您确定要通过吗？")) {
            location.href = "/applyAgreedServlet?a_id=" + a_id;
        }
    }
</script>
</body>
</html>