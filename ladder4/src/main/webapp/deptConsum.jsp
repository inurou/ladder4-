<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/30
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>各部门消费统计</title>
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
<br>
<br>

<h1 style="text-align: center;font-size: large">请选择要查看的部门：</h1>
<br>
<br>
<div style="text-align: center">
<td style="text-align: center"><span style="text-align:center;vertical-align:middle;font-size: large">部门</span></td><td><select name="select_dept" id="dept_select">
    <option value="000000000" style="text-align:center;vertical-align:middle;font-size: large">请选择</option>
    <option value="研发部" style="text-align:center;vertical-align:middle;font-size: large">研发部</option>
    <option value="人事部" style="text-align:center;vertical-align:middle;font-size: large">人事部</option>
    <option value="运维部" style="text-align:center;vertical-align:middle;font-size: large">运维部</option>
    <option value="市场部" style="text-align:center;vertical-align:middle;font-size: large">市场部</option>
    <option value="财务部" style="text-align:center;vertical-align:middle;font-size: large">财务部</option>
    <option value="食堂" style="text-align:center;vertical-align:middle;font-size: large">食堂</option>
    <option value="其他" style="text-align:center;vertical-align:middle;font-size: large">其他</option>
</select>
</td>
</div>
<div style="text-align:-webkit-right">
    <form action="export" method="post">
    <input name="" type="submit" class="loginbtn" value="导出报表"  />
    </form>
</div>
<br>
<br>
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
        <%--<th>选择</th>--%>
        <%--<th>是否审核</th>
        <th>操作</th>--%>
            <th>状态</th>
    </tr>
    </thead>
    <tbody id="tbody">

    </tbody>
</table>
</body>
<script>

    $(document).ready(function(){
        $("#dept_select").blur(function() {
            show()
        });
        });
    function show() {
        $.ajax({
            type:"GET",
            url:"checkOrderMessage",
            dataType:"json",
            success:function (data) {
                content = "";
                for(var e in data) {
                    if(data[e].status == 1 ){
                        if(data[e].dept == $("#dept_select").val())
                        {
                            content += "<tr>\n" +
                                "<td>" + data[e].id + "</td>\n" +
                                "<td>" + data[e].orderid + "</td>\n" +
                                "<td>" + data[e].ordername + "</td>\n" +
                                "<td>" + data[e].ordertime + "</td>\n" +
                                "<td>" + data[e].ordermessage + "</td>\n" +
                                "<td>" + data[e].ordermoney + "</td>\n" +
                                "<td><input id='' type='button' style='margin-right: 20px;' value='已消费' />" +
                                "</tr>";
                        }
                    }
                    $("#tbody").html(content);
                }

            },
            error:function (x) {
                alert("错误"+x.status)
            }
        })
    }

    function submitExport() {

    }
</script>
</html>
