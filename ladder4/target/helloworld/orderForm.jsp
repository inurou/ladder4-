<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/29
  Time: 19:12
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
<table class="tablelist">
    <thead>
    <tr>
        <%--<th><input name="" type="checkbox" value="" checked=""/></th>--%>
        <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>订单号</th>
        <th>订餐人</th>
        <th>订餐时间</th>
        <th>订餐信息</th>
            <th>消费金额</th>
            <th>操作</th>
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
            type:"GET",
            url:"orderMessage",
            dataType:"json",
            success:function (data) {
                content = "";
                var d2 = formatDate(new Date()); //当天日期
                for(var e in data) {
                    var d1 = data[e].ordertime;  //订单日期
                    if (data[e].status == 0 && d1 >= d2) {

                        content += "<tr>\n" +
                            "<td>" + data[e].id + "</td>\n" +
                            "<td>" + data[e].orderid + "</td>\n" +
                            "<td>" + data[e].ordername + "</td>\n" +
                            "<td>" + data[e].ordertime + "</td>\n" +
                            "<td>" + data[e].ordermessage + "</td>\n" +
                            "<td>" + data[e].ordermoney + "</td>\n" +
                            "<td><input type=\"button\" style='color:#056dae;' value=\"取消\" onclick='delOrderMessage(" + data[e].id + ")'/></td>\n" +
                            "</tr>";
                    }else if(data[e].status == 1){
                        content += "<tr>\n" +
                            "<td>" + data[e].id + "</td>\n" +
                            "<td>" + data[e].orderid + "</td>\n" +
                            "<td>" + data[e].ordername + "</td>\n" +
                            "<td>" + data[e].ordertime + "</td>\n" +
                            "<td>" + data[e].ordermessage + "</td>\n" +
                            "<td>" + data[e].ordermoney + "</td>\n" +
                            "<td><input type=\"button\" style='margin-right: 20px;' value=\"已消费\" /><input type=\\\"button\\\" style='color:#056dae;margin-right: 20px;' value='删除' onclick='delOrderMessage(" + data[e].id + ")'/></td>\n" +
                            "</tr>";
                    }else if(d1 < d2){
                        content += "<tr>\n" +
                            "<td>" + data[e].id + "</td>\n" +
                            "<td>" + data[e].orderid + "</td>\n" +
                            "<td>" + data[e].ordername + "</td>\n" +
                            "<td>" + data[e].ordertime + "</td>\n" +
                            "<td>" + data[e].ordermessage + "</td>\n" +
                            "<td>" + data[e].ordermoney + "</td>\n" +
                            "<td><input type=\"button\"  value=\"已过期\" style='margin-right: 20px;' /><input type='button' style='color:#056dae;margin-right: 20px;' value='删除' onclick='delOrderMessage(" + data[e].id + ")'/></td>\n" +
                            "</tr>";
                    }
                }
                $("#tbody").html(content);
            },
            error:function (x) {
                alert("错误"+x.status)
            }
        })
    }
    var formatDate = function (date) {    var y = date.getFullYear();    var m = date.getMonth() + 1;    m = m < 10 ? '0' + m : m;    var d = date.getDate();    d = d < 10 ? ('0' + d) : d;    return y + '-' + m + '-' + d;};

    function delOrderMessage(id) {
        var flag = confirm("确定要取消订单吗？");
        if(flag) {
            $.ajax({
                type: 'POST',
                url: "deleteOrderMessage",
                /*dataType:'json',*/
                data: {
                    id: id
                },
                success: function (msg) {
                    alert("取消成功！");
                    show();
                }

            })
        }else{

        }
    }
</script>
</html>
