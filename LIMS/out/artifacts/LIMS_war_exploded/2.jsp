<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="http://www.softwhy.com/" />
    <title>蚂蚁部落</title>
    <style type="text/css">
        body{
            font-family:Verdana;
            font-size:12px;
            line-height:1.5;
        }
        a{
            color:#000;
            text-decoration:none;
        }
        a:hover{
            color:#F00;
        }
        #menu{
            width:500px;
            height:28px;
            margin:0 auto;
            border-bottom:3px solid #E10001;
        }
        #menu ul{
            list-style:none;
            margin:0px;
            padding:0px;
        }
        #menu ul li{
            float:left;
            margin-left:2px;
        }
        #menu ul li a{
            display:block;
            width:87px;
            height:28px;
            line-height:28px;
            text-align:center;
            font-size:14px;
        }
        #menu ul li a#current{
            font-weight:bold;
            color:#fff;
        }
        #menu ul li ul{
            border:1px solid #ccc;
            display:none;
            position:absolute;
        }
        #menu ul li ul li{
            float:none;
            width:87px;
            background:#eee;
            margin:0;
        }
        #menu ul li ul li a{
            background:none;
        }
        #menu ul li ul li a:hover{
            background:#333;
            color:#fff;
        }
        #menu ul li:hover ul{
            display:block;
        }
        #menu ul li.sfhover ul{
            display:block;
        }
    </style>
    <script type="text/javascript">
        function menuFix(){
            var sfEls=document.getElementById("menu").getElementsByTagName("li");
            for (var index=0;index<sfEls.length;index++){
                sfEls[index].onmouseover=function(){
                    this.className+=(this.className.length > 0 ? " " : "") + "sfhover";
                }
                sfEls[index].onmouseout=function(){
                    this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"),"");
                }
            }
        }
        window.onload = menuFix;
    </script>
</head>
<body>
<div id="menu">
    <ul>
        <li><a id="current" href="#">首页</a></li>
        <li>
            <a href="#">网页版式</a>
            <ul>
                <li><a href="#">自适应宽度</a></li>
                <li><a href="#">固定宽度</a></li>
            </ul>
        </li>
        <li>
            <a href="#">web教程</a>
            <ul>
                <li><a href="#">新手入门</a></li>
                <li><a href="#">softwhy.com</a></li>
                <li><a href="#">常见问题</a></li>
            </ul>
        </li>
        <li><a href="#">web实例</a></li>
        <li><a href="#">常用代码</a></li>
    </ul>
</div>
</body>
</html>