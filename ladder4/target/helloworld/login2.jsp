<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/21
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎登陆北明食堂菜品查询系统</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="js/jquery.js"></script>
    <script src="js/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            })
        });
    </script>

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;" >



<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>


<div class="logintop">
    <span>欢迎登录北明食堂菜品信息平台</span>
    <ul>
        <li><a href="#">回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>

<div class="loginbody">

    <span class="systemlogo"></span>

    <div class="loginbox">

        <ul>
            <form action="/LoginServlet" method="post">
                <li><input name="name" type="text" class="loginuser" value="admin" /></li>
                <li><input name="password" type="text" class="loginpwd" value="密码" /></li>
                <li><input name="" type="submit" class="loginbtn" value="登录"  /><label><a href="register.jsp">注册</a></label><label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>

            </form>
        </ul>
        <%--onclick="JavaScript:this.value=''"
        onclick="JavaScript:this.value=''"
        onclick="javascript:window.location='main.jsp'"--%>

    </div>

</div>



<div class="loginbm">如有合作意向，敬请加盟我们</div>
</body>
</html>
