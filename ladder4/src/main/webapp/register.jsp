<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/14
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>
    <title>北明食堂管理系统注册信息</title>
    <style>
        div{
            background:#009FCC;
            font-size:24px;
            padding:5px;
            color:white;
        }
        form{
            background: #F8F8FF ;
            border:#357FC4 solid 1px;
            color:#575454;
            width:400px;
            margin:20px auto;
            font-size:15px;
        }
        table{
            margin:10px auto;
        }
        a{
            text-decoration:none;
        }
        input[type="button"]{
            background:#228B22;
            color:white;
            font-size:15px;
            font-weight:bold;
            width:120px;
            height:40px;
        }
        td:first-child{
            text-align:right;
            padding:0 5px;
        }
        td:only-child{
            text-align:center;
            font-size:12px;
        }
        /*span:before{
            content:"* ";
            color:red;
        }*/
        input[type="text"]:read-only{
            border:#888484 solid 2px;
            background:#888484;
            font-weight:bold;
        }
        input[type="text"]:hover{
            background:#EFD9AC;
        }
    </style>
</head>
<body>

    <div>注册信息</div>
    <form action="/register" method="post" onsubmit = "return validateForm()">
    <table>
        <tr><td><span>用户名</span></td><td><input type="text" name="user_name" id="user_name"/><span id="remind"></span></td></tr>
        <tr><td><span>email</span></td><td><input type="text" name="user_email" id="user_email"/><span id="emaile_msg"></span></td></tr>
        <tr><td><span>密码</span></td><td><input type="password" name="user_password" id="user_password"/></td></tr>
        <tr><td><span>性别</span></td><td><select name="select_sex" id="sex_select">
            <option value="0000000000">请选择</option>
            <option value="男">男</option>
            <option value="女">女</option>
            </select>
        </td></tr>

        <tr><td><span>部门</span></td><td><select name="select_dept" id="dept_select">
            <option value="000000000">请选择</option>
            <option value="研发部">研发部</option>
            <option value="人事部">人事部</option>
            <option value="运维部">运维部</option>
            <option value="市场部">市场部</option>
            <option value="财务部">财务部</option>
            <option value="食堂">食堂</option>
            <option value="其他">其他</option>
        </select>
        </td></tr>

        <tr><td>手机号码</td><td><input type="text" name="user_phone" id="user_phone"/><span id="phonenum_msg"></span></td></tr>
        <tr><td colspan="2"><input type="submit" name="submitall" value="立即注册" id="submit"/></td></tr>
    </table>

    </form>
</body>
<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.js"></script>
<script>
    //对应后台返回的提示
    if('${status }' != ''){
        if('${status }' == 0){
            alert('注册成功!');
            location.href = '/login';
        }else if('${status }' == 1){
            alert('注册失败！');
        }else if('${status }' == 2){
            alert('注册失败！该信息已存在');
        }
    }

    $(document).ready(function(){
        $("#user_email").blur(function(){
            var account = document.getElementById("user_email").value;
            var regex_email = /^\w+@\w+(\.[a-zA-Z]{2,3}){1,3}$/
            if (!regex_email.test(account)){
                document.getElementById("emaile_msg").innerHTML = "<span style='font-size:12px; color:red;'>邮箱地址不合法！</span>";
                document.getElementById("emaile_msg").className = "error_msg"
                return false;
            }else{
                document.getElementById("emaile_msg").innerHTML = "<span style='font-size:12px; color:green;'>√</span>";
                document.getElementById("emaile_msg").className = "right_msg"
            }
            return true;
        });
    });

    $(document).ready(function(){
        $("#user_phone").blur(function(){
            var tel = document.getElementById("user_phone").value;
            var regex_tel = /^1[345789]\d{9}$/
            if (!regex_tel.test(tel)){
                document.getElementById("phonenum_msg").innerHTML = "<span style='font-size:12px; color:red;'>手机号码不合法!</span>";
                document.getElementById("phonenum_msg").className = "error_msg";
                return false;
            }else{
                document.getElementById("phonenum_msg").innerHTML = "<span style='font-size:12px; color:green;'>√</span>";
                document.getElementById("phonenum_msg").className = "right_msg";
            }
            return true;
        });
    });


    $(document).ready(function(){
        $("#user_name").blur(function(){
            $.ajax({
                type:"POST",
                url:"/operate",
                /*dataType:"json",*/
                data:{
                    username:$("#user_name").val()
                },
                success:function(data){
                    if(data == "yes"){
                        $("#remind").html("<span style='font-size:12px; color:red;'>用户名已存在</span>");
                        document.getElementById("user_name").className = "error_msg";
                    }
                    if(data == "no"){
                        $("#remind").html("<span style='font-size:12px; color:green;'>√</span>");
                    }
                },
                error:function(jqXHR){
                    //console.log(jqXHR.responseText);
                    alert("发生错误：" + jqXHR.status);

                }
            });
        });
    });


    function validateForm(){
        var username = document.getElementById("user_name").value;
        var email = document.getElementById("user_email").value;
        var password = document.getElementById("user_password").value;
        var sex = document.getElementById("sex_select").value;
        var dept = document.getElementById("dept_select").value;
        var phonenum = document.getElementById("user_phone").value;

        var error_msgs = document.getElementsByClassName("error_msg");
        if(username == "" || email == "" || password == "" || sex =="0000000000" || dept == "000000000" || phonenum == ""){
            alert("请将信息填写完整！");
            location.reload();
            return false;
        }
        if(error_msgs.length > 0){
            alert("请确保信息正确！");
            location.reload();
            return false;
        }
        return true;

    }
</script>


</html>
