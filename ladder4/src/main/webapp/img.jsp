<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/28
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>今日菜谱</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/json.js"></script>
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
<div>
    <br>
    <br>
    <br>
    <h1 style="font-size: large" align="center" >订餐日期：<input  id = "date" type="date" style="font-size: large" min='${setdate}' value=""/></h1>
    <br>
    <br>
    <div style="text-align: center"><input name="" type="submit" class="loginbtn" value="提交"  onclick = "submit()" /></div>
    <br>
    <br>
</div>
</div>
<div  id="tbody" class="rightinfo">

</div>
<%--<table class="tablelist" >
    <thead>
    <tr>
        &lt;%&ndash;<th><input name="" type="checkbox" value="" checked="checked"/></th>&ndash;%&gt;
        &lt;%&ndash;<th>编号<i class="sort"><img src="images/px.gif" /></i></th>&ndash;%&gt;
        <th>菜名</th>
        &lt;%&ndash;<th>用户</th>
        <th>籍贯</th>&ndash;%&gt;
        <th>金额</th>
            <th>数量</th>
        &lt;%&ndash;<th>是否审核</th>
        <th>操作</th>&ndash;%&gt;

    </tr>
    </thead>
    <tbody id = "tbody2">

    </tbody>
</table>--%>

</div>


</body>


<script>
    window.onload = function () {
        show();
    };
    var num=[];
    function show(){
        $("#tbody").html("");
        $.ajax({
            type:'POST',
            url:"menushow",
            dataType:'json',
            success:function (msg) {
                /*alert(msg)*/
                /*alert(msg.msg)*/
             /*alert(JSON.stringify(msg))*/
                var count = 0;
                var content = "";
                for(var e in msg){
                    num[e] = 0;
                   /* var name = msg[e].name;*/
                        //alert(msg[e].id);
                    content += "<ul class='classlist'>" +
                        "<li>\n" +
                        "            <span><img src="+msg[e].imgsrc+" /></span>\n" +
                        "            <div class=\"lright\">\n" +
                        "                <div class='lright'><h2 style='font-size: 16px' style='margin:10px;'>"+msg[e].name+"</h2>" +
                        "                <p style='font-size: 14px' style='margin:10px;'>原价："+msg[e].preprice+"<br />今日特价："+msg[e].nowprice+"</p>" +
                        "                <input class=\"enter\" value='添加' type='button' onclick='addfuc("+e+")'/>" +
                        "                <input class=\"enter\" value='删除' type='button' onclick='deletefuc("+e+")'/>" +
                        "                <input id="+e+" value=\"0\" style='font-size: medium'/>" +
                        "            </div>\n" +
                        "        </li>";

                }
                $("#tbody").html(content);
            },
            error:function (xml) {
                alert("出现错误：" + xml.status);
            }
        })
    }
    /*addfuc("+msg[e].id+")*/
    function addfuc(e) {
        document.getElementById(e).value = ++num[e];
        $.ajax({
            type:'POST',
            url:"menuAddCount",
            /*dataType:'json',*/
            data:{
                id:e,
                num:num[e],
            },
            success:function(msg) {
            }

        })
    }
    function deletefuc(e) {
        if(num[e] > 0){
            document.getElementById(e).value = --num[e];

            $.ajax({
                type:'POST',
                url:"menuSubCount",
                /*dataType:'json',*/
                data:{
                    id:e,
                    num:num[e],
                },
                success:function(msg) {

                }

            })
        }
    }
    
    function submit() {
        var date = document.getElementById("date").value;
        if(date == ""){
            alert("订餐日期不能为空！");
        }else{
            var flag = confirm("确定提交订单吗？");
            if(flag){
                $.ajax({
                    type:'POST',
                    url:"orderSubmit",
                    /*dataType:'json',*/
                    data:{
                        date:$("#date").val()
                    },
                    success:function(msg) {
                        alert("提交成功！")
                    }

                })
            }else{

            }

        }

    }
</script>
</html>
