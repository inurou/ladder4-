<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/29
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查看订单信息</title>
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
            url:"checkOrderMessage",
            dataType:"json",
            success:function (data) {
                content = "";

                var d2 = formatDate(new Date()); //当天日期
                for(var e in data) {
                    var d1 =data[e].ordertime;  //订单日期
                    if (data[e].status == 0 & d1 >= d2) {
                        content += "<tr>\n" +
                            "<td>" + data[e].id + "</td>\n" +
                            "<td>" + data[e].orderid + "</td>\n" +
                            "<td>" + data[e].ordername + "</td>\n" +
                            "<td>" + data[e].ordertime + "</td>\n" +
                            "<td>" + data[e].ordermessage + "</td>\n" +
                            "<td>" + data[e].ordermoney + "</td>\n" +
                            "<td><input id=" + data[e].id + " type='button' style='color:#056dae;margin-right: 20px;' value='取消' onclick='delOrderMessage(" + data[e].id + ")'/><input id=" + data[e].id + " type='button' style='color:#056dae;' value='确定'  class='buttn' onclick='okOrderMessage(" + data[e].id + ")'/></td>\n" +
                            "</tr>";
                    }else if(data[e].status == 1){
                        content += "<tr>\n" +
                            "<td>" + data[e].id + "</td>\n" +
                            "<td>" + data[e].orderid + "</td>\n" +
                            "<td>" + data[e].ordername + "</td>\n" +
                            "<td>" + data[e].ordertime + "</td>\n" +
                            "<td>" + data[e].ordermessage + "</td>\n" +
                            "<td>" + data[e].ordermoney + "</td>\n" +
                            "<td><input id='' type='button' style='margin-right: 20px;' value='已消费' /><input id=\" + data[e].id + \" type='button' style='color:#056dae;margin-right: 20px;' value='删除' onclick='delOrderMessage(" + data[e].id + ")'/>" +
                            "</tr>";
                    }
                    $("#tbody").html(content);
                }

            },
            error:function (x) {
                alert("错误"+x.status)
            }
        })
    }
    var formatDate = function (date) {    var y = date.getFullYear();    var m = date.getMonth() + 1;    m = m < 10 ? '0' + m : m;    var d = date.getDate();    d = d < 10 ? ('0' + d) : d;    return y + '-' + m + '-' + d;};


    function delOrderMessage(id) {
        var flag = confirm("确定要取消订单吗？");
        if (flag) {
            $.ajax({
                type: 'POST',
                url: "deleteOrderMessage",
                /*dataType:'json',*/
                data: {
                    id: id
                },
                success: function (msg) {
                    alert("操作成功！");
                    show();
                }

            })
        } else {

        }
    }
        function okOrderMessage(id) {
            var flag = confirm("若点击确定，则代表用户已消费。仍要确定吗？");
            if(flag) {
                $.ajax({
                    type: 'POST',
                    url: "okOrderMessage",
                    dataType:'json',
                    data: {
                        id: id
                    },
                    success: function (msg) {
                        alert("操作成功！")

                    },
                    error:function (x) {
                        alert("出现错误："+x.status)
                    }

                })
            }else{

            }
    }
</script>
</html>
