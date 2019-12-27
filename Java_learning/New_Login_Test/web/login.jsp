<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <script>
        window.onload = function(){
            document.getElementById("img").onclick = function(){
                this.src="/New_Login_Test/checkCodeServlet?time="+new Date().getTime();
            }
        }
    </script>
    <style>
        div{
            color: red;
            font-size: 30px;
        }
    </style>
</head>

<body>
    <form action="/New_Login_Test/newLoginServlet" method="post">
        用户名：<input type="text" name="name"><br>
        密码：<input type="password" name="password"><br>
        验证码：<input type="checkcode" name="checkcode"><br>
        <img id="img" src="/New_Login_Test/checkCodeServlet"><br>
        <input type="submit" value="登录">
    </form>
    <div><%=request.getAttribute("cc_error") == null ? "" : request.getAttribute("cc_error")%></div>
    <div><%=request.getAttribute("login_error") == null ? "" : request.getAttribute("login_error") %></div>
</body>
</html>
