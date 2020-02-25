<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>审核申请</title>

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
        .form {

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
        .form form input {
            outline: none;
            border: none;
            text-align: center;
            width: 100%;
            height: 100%;
        }
        .name {

        }
        .school {

        }
        #email {
            width: 277px;
            height: 50%;
        }
        #tel {
            width: 277px;
            height: 50%;
        }
        #aboutme {
            display: block;
            width: 100%;
            height: 150px;
            border: none;
            resize: none;
            outline: none;
            font-size: 16px;
            text-indent: 2em;
            padding: 5px;
        }
        #reason {
            display: block;
            width: 100%;
            height: 150px;
            border: none;
            resize: none;
            outline: none;
            font-size: 16px;
            text-indent: 2em;
            padding: 5px;
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
        <a href="admin.jsp"><li>首页</li></a>
        <a href=""><li>实验室信息管理</li></a>
        <a href="/userListServlet"><li>成员信息管理</li></a>
        <a href=""><li>权限管理</li></a>
        <a href=""><li>5</li></a>
        <a href="shsq.jsp"><li>审核申请</li></a>
        <a href=""><li>留言管理</li></a>
    </ul>
</div>

<div class="form">
    <p>社  员  申  请  表</p>
    <form action="/addUserServlet" method="post">
        <table>
            <tr>
                <th>姓名</th>
                <td class="td_middle"><input class="name" autocomplete="off" type="text" name="name"/></td>
                <th>性别</th>
                <td class="td_short"><input class="sex" autocomplete="off" type="text" name="gender"/></td>
                <th>出生年月</th>
                <td class="td_short_plus"><input class="birthday" autocomplete="off" type="text" name="birthday"/></td>
                <th rowspan="4" id="td_picture">生活照</th>
            </tr>
            <tr>
                <th>籍贯</th>
                <td colspan="5">null省/自治区null市null区/县</td>
            </tr>
            <tr><th>学院</th>
                <td class="td_middle"><input class="school" autocomplete="off" type="text" name="school"/></td>
                <th>年级</th>
                <td class="td_short"><input class="grade" autocomplete="off" type="text" name="grade"/></td>
                <th>专业班级</th>
                <td class="td_short_plus"><input class="class" autocomplete="off" type="text" name="class"/></td>
            </tr>
            <tr>
                <th>学号</th>
                <td class="td_middle"><input class="number" autocomplete="off" type="text" name="number"/></td>
                <th>联系方式</th>
                <td id="td_middle_plus" colspan="3">
                    <input id="email" autocomplete="off" type="text" name="email" placeholder="邮箱"/>
                    <br>
                    <input id="tel" autocomplete="off" type="text" name="tel" placeholder="手机号"/>
                </td>
            </tr>
            <tr>
                <th>自我简述</th>
                <td colspan="6" class="td_long"><textarea id="aboutme" maxlength="340"></textarea></td>
            </tr>
            <tr><th>入社理由</th>
                <td colspan="6" class="td_long"><textarea id="reason" maxlength="340"></textarea></td></tr>
        </table>
    </form>
</div>
<br>
<br>
<br>
</body>
</html>