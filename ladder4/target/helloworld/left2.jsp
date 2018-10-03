<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/14
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="js/jquery.js"></script>

    <script type="text/javascript">
        $(function(){
            //导航切换
            $(".menuson li").click(function(){
                $(".menuson li.active").removeClass("active")
                $(this).addClass("active");
            });

            $('.title').click(function(){
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if($ul.is(':visible')){
                    $(this).next('ul').slideUp();
                }else{
                    $(this).next('ul').slideDown();
                }
            });
        })
    </script>


</head>

<body style="background:#f0f9fd;">
<%--<div class="lefttop" style="font-size: 16px"><span ></span>通讯录</div>--%>

<dl class="leftmenu">

    <dd>
        <%--<div class="title">
            <span><img src="images/leftico01.png" /></span>管理信息
        </div>--%>
        <ul class="menuson">

            <%--<li><cite></cite><a href="index.jsp" target="rightFrame">首页模版</a><i></i></li>
            <li class="active"><cite></cite><a href="right.jsp" target="rightFrame">数据列表</a><i></i></li>
            <li><cite></cite><a href="imgtable.jsp" target="rightFrame">图片数据表</a><i></i></li>
            <li><cite></cite><a href="form.jsp" target="rightFrame">添加编辑</a><i></i></li>
            <li><cite></cite><a href="imglist.jsp" target="rightFrame">图片列表</a><i></i></li>--%>



            <li><cite></cite><a href="tab2" target="rightFrame">员工用餐建议</a><i></i></li>
                <li><cite></cite><a href="menuset" target="rightFrame">今日菜品搭配</a><i></i></li>
                <li><cite></cite><a href="setDate.jsp" target="rightFrame">订餐时间设置</a><i></i></li>
                <li><cite></cite><a href="checkOrderForm.jsp" target="rightFrame">订餐信息查看</a><i></i></li>
                <li><cite></cite><a href="deptConsum.jsp" target="rightFrame">部门消费统计</a><i></i></li>


            <%--<li><cite></cite><a href="tools.jsp" target="rightFrame">常用工具</a><i></i></li>
            <li><cite></cite><a href="filelist.jsp" target="rightFrame">信息管理</a><i></i></li>
            <li><cite></cite><a href="tab.jsp" target="rightFrame">Tab页</a><i></i></li>
            <li><cite></cite><a href="error.jsp" target="rightFrame">404页面</a><i></i></li>
--%>
        </ul>
    </dd>


    <%--<dd>
        <div class="title">
            <span><img src="images/leftico02.png" /></span>其他设置
        </div>
        <ul class="menuson">
            <li><cite></cite><a href="#">编辑内容</a><i></i></li>
            <li><cite></cite><a href="#">发布信息</a><i></i></li>
            <li><cite></cite><a href="#">档案列表显示</a><i></i></li>
        </ul>
    </dd>


    <dd><div class="title"><span><img src="images/leftico03.png" /></span>编辑器</div>
        <ul class="menuson">
            <li><cite></cite><a href="#">自定义</a><i></i></li>
            <li><cite></cite><a href="#">常用资料</a><i></i></li>
            <li><cite></cite><a href="#">信息列表</a><i></i></li>
            <li><cite></cite><a href="#">其他</a><i></i></li>
        </ul>
    </dd>


    <dd><div class="title"><span><img src="images/leftico04.png" /></span>日期管理</div>
        <ul class="menuson">
            <li><cite></cite><a href="#">今日菜单</a><i></i></li>
            <li><cite></cite><a href="#">常用资料</a><i></i></li>
            <li><cite></cite><a href="#">信息列表</a><i></i></li>
            <li><cite></cite><a href="#">其他</a><i></i></li>
        </ul>

    </dd>
--%>
</dl>
</body>
</html>

