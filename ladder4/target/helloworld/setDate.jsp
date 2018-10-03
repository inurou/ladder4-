<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/28
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>订餐日期</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script language="javascript">
        $(function(){
            //导航切换
            $(".imglist li").click(function(){
                $(".imglist li.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        })
    </script>
</head>
<body>
<h1 style="font-size: large" align="center">设置可订餐日期：<input  id = "date" type="date" style="font-size: large" min="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" value=""/></h1>
</br>

</br>
<div style="text-align: center"><input name="" type="submit" class="loginbtn" value="选择提交"  onclick = "submitdate()" /></div>

</body>
<script>
    function submitdate(){
        var a = document.getElementById("date").value;
        $.ajax({
            type:'POST',
            url:"setdate",
            /*dataType:'json',*/
            data:{date:a},
            success:function (msg) {
                if(msg == "ok"){
                    alert("设置成功！");
                }
            },
            error:function (x) {
                alert("出现错误：" + x.status);
            }
        });


    }
</script>
</html>
