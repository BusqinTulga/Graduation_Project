<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>审核申请</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">
    <link rel="stylesheet" href="css/admin.css" type="text/css">

    <style>
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
        .form form input {
             display: block;
             margin: 0 auto;
         }
        .form form table td,th {
            border: black solid 1px;
            padding: 0 5px;
        }
        .form form table th {
            width: 100px;
            height: 50px;
        }
        .td_center {
            text-align: center;
        }
        #aboutme {
            text-indent: 2em;
            vertical-align: top;
            padding: 5px;
        }
        #reason {
            text-indent: 2em;
            vertical-align: top;
            padding: 5px;
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
        #button {
            border: none;
            text-align: center;
        }
        .form form a {
            display: inline-block;
            width: 100px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            color: #fff;
            margin: 20px 10px;
        }
        #agree {
            background-color: #5cb85c;
            border-color: #4cae4c;
            border-radius: 4px;
        }
        #agree:hover {
            background-color: #449d44;
            border-color: #398439;
        }
        #disagree {
            background-color: #d9534f;
            border-color: #d43f3a;
            border-radius: 4px;
        }
        #disagree:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }
        img {
            width: 30px;
            height: 50px;
            vertical-align: middle;
        }
        #left {
            width: 30px;
            height: 50px;
            margin-right: 50px;
        }
        #right {
            width: 30px;
            height: 50px;
            margin-left: 50px;
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

<div class="form">
    <c:forEach items="${page.list}" var="application" varStatus="s">
            <p>社  员  申  请  表</p>
            <form action="${pageContext.request.contextPath}/applyUserServlet" method="post">
                <table>
                    <tr>
                        <th>姓名</th>
                        <td class="td_middle td_center">${application.name}</td>
                        <th>性别</th>
                        <td class="td_short td_center">${application.gender}</td>
                        <th>出生年月</th>
                        <td class="td_short_plus td_center">${application.birthday}</td>
                        <th rowspan="4" id="td_picture">生活照</th>
                    </tr>
                    <tr>
                        <th>籍贯</th>
                        <td colspan="5" class="td_center">${application.province}${application.city}${application.district}</td>
                    </tr>
                    <tr><th>学院</th>
                        <td class="td_middle td_center" colspan="2">${application.collage}</td>
                        <th>班级</th>
                        <td class="td_short_plus td_center" colspan="2">${application.classes}</td>
                    </tr>
                    <tr>
                        <th>学号</th>
                        <td class="td_middle td_center">${application.number}</td>
                        <th>联系方式</th>
                        <td id="td_middle_plus" colspan="3">
                            邮箱：${application.email}
                            <br>
                            手机号：${application.phone_number}
                        </td>
                    </tr>
                    <tr>
                        <th>自我简述</th>
                        <td colspan="6" class="td_long" id="aboutme">${application.self_description}</td>
                    </tr>
                    <tr>
                        <th>入社理由</th>
                        <td colspan="6" class="td_long" id="reason">${application.reason}</td>
                    </tr>
                    <tr>
                        <td colspan="7" id="button">
                            <a href="${pageContext.request.contextPath}/applyUserByPageServlet?currentPage=${page.currentPage - 1}" id="left">
                                <img src="image/left.jpg" alt="上一页">
                            </a>
                            <a href="javascript:agreedApplication(${application.a_id});" id="agree">通过</a>
                            <a href="javascript:disagreedApplication(${application.a_id});" id="disagree">拒绝</a>
                            <a href="${pageContext.request.contextPath}/applyUserByPageServlet?currentPage=${page.currentPage + 1}" id="right">
                                <img src="image/right.jpg" alt="下一页">
                            </a>
                        </td>
                    </tr>
                </table>
            </form>
        </c:forEach>
</div>
<br>
<br>
<br>

<script>
    //通过
    function agreedApplication(a_id) {
        if (confirm("您确定要通过吗？")) {
            location.href = "/applyAgreedServlet?a_id=" + a_id;
        }
    }

    //拒绝
    function disagreedApplication(a_id) {
        if (confirm("您确定要拒绝吗？")) {
            location.href = "/applyDisagreedServlet?a_id=" + a_id;
        }
    }
</script>
</body>
</html>