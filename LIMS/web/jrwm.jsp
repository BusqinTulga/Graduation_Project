<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>申请加入</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">

    <script language="Javascript" type="text/javascript">
        setInterval("timer.innerHTML=new Date().toLocaleString()");
        window.onload = function (){
            setInterval("timer.innerHTML=new Date().toLocaleString()",1000);
        }
    </script>

    <style>
        .form p {
            white-space: pre;
            margin-top: 40px;
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
        select {
            height: 100%;
            width: 100%;
            appearance: none;
            -moz-appearance: none;
            -webkit-appearance: none;
            border: none;
            outline: none;
            text-align-last: center;
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
        .td_short_long {
            height: 50px;
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
        #submit {
            border: gainsboro solid 1px;
            display: block;
            width: 100px;
            height: 45px;
            border-radius: 3px;
            margin: 0 auto;
            margin-top: 30px;
        }
        #option_null {
            display: none;
        }
        #class {
            text-align: left;
            padding-left: 5px;
            width: 120px;
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

<div class="form">
    <p>机 器 人 创 新 实 验 室<br>社  员  申  请  表</p>
    <form action="/addUserServlet" method="post">
        <table>
            <tr>
                <th>姓名</th>
                <td class="td_middle"><input class="name" autocomplete="off" type="text" name="name"/></td>
                <th>性别</th>
                <td class="td_short">
                    <select name="gender">
                        <option id="option_null" selected disabled></option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                        <option value="其它">其它</option>
                    </select>
                </td>
                <th>出生年月</th>
                <td class="td_short_plus"><input class="birthday" autocomplete="off" type="text" name="birthday"/></td>
                <th rowspan="4" id="td_picture">生活照</th>
            </tr>
            <tr>
                <th>籍贯</th>
                <td colspan="5" class="td_short_long"><input autocomplete="off" type="text" name="address"/></td>
            </tr>
            <tr>
                <th>学院</th>
                <td class="td_middle" colspan="2"><input autocomplete="off" type="text" name="collage"/></td>
                <th>班级</th>
                <td class="td_short_plus" colspan="2"><input id="class" autocomplete="off" type="text" name="classes" placeholder="如：16蒙班"/></td>
            </tr>
            <tr>
                <th>学号</th>
                <td class="td_middle"><input class="number" autocomplete="off" type="text" name="number"/></td>
                <th>联系方式</th>
                <td id="td_middle_plus" colspan="3">
                    <input id="email" autocomplete="off" type="text" name="email" placeholder="邮箱"/>
                    <br>
                    <input id="tel" autocomplete="off" type="text" name="phone_number" placeholder="手机号"/>
                </td>
            </tr>
            <tr>
                <th>自我简述</th>
                <td colspan="6" class="td_long"><textarea id="aboutme" maxlength="340" name="self_description"></textarea></td>
            </tr>
            <tr><th>入社理由</th>
                <td colspan="6" class="td_long"><textarea id="reason" maxlength="340" name="reason"></textarea></td></tr>
        </table>
        <input id="submit" type="submit" value="提交申请">
    </form>
</div>

<footer>
    <p>
        版权所有 © 内蒙古师范大学机器人创新实验室
    </p>
</footer>
</body>

</html>
