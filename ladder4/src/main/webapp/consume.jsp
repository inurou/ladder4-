<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/1
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查看消费信息</title>
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
<table class="tablelist">
    <thead>
    <tr>
        <%--<th><input name="" type="checkbox" value="" checked=""/></th>--%>
        <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>订餐人</th>
        <th>订餐时间</th>
        <th>订餐信息</th>
        <th>消费金额</th>
        <%--<th>选择</th>--%>
        <%--<th>是否审核</th>
        <th>操作</th>--%>
    </tr>
    </thead>
    <tbody id="tbody">

    </tbody>
</table>

</body>
<script>
    window.onload = function () {
            show();
        }
        function show() {
            $.ajax({
                type: "GET",
                url: "checkOrderMessage",
                dataType: "json",
                success: function (data) {
                    content = "";
                    for(var e in data) {
                        if (data[e].status == 1) {
                            content += "<tr>\n" +
                                "<td>" + data[e].id + "</td>\n" +
                                "<td>" + data[e].ordername + "</td>\n" +
                                "<td>" + data[e].ordermessage + "</td>\n" +
                                "<td>" + data[e].ordertime + "</td>\n" +
                                "<td>" + data[e].ordermoney + "</td>\n" +
                                "</tr>";
                        }
                    }

                    $("#tbody").html(content);
                },
                error:function(x){
                    alert("错误：" + x.status)
                }
            })
        }
</script>
</html>
