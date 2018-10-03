<%@ page import="java.util.List" %>
<%@ page import="com.coderx.entity.Menu" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/12
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>今日菜谱</title>
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

<%--
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">模块设计</a></li>
        <li><a href="#">图片</a></li>
    </ul>
</div>
--%>

<div class="rightinfo">

    <%--<div class="tools">

        <ul class="toolbar">
            <li class="click"><span><img src="images/t01.png" /></span>添加</li>
            <li class="click"><span><img src="images/t02.png" /></span>修改</li>
            <li><span><img src="images/t03.png" /></span>删除</li>
            <li><span><img src="images/t04.png" /></span>统计</li>
        </ul>


        <ul class="toolbar1">
            <li><span><img src="images/t05.png" /></span>设置</li>
        </ul>

    </div>--%>



        <%
            ArrayList<Menu> productList = (ArrayList<Menu>) request.getAttribute("productList");

            if(productList != null){
                for(int i = 0;i < productList.size();i++){
                    out.write("<ul class='classlist'>");
                    out.write("<li>");
                    out.write("<span><img src="+ productList.get(i).getImgsrc()+" /></span>");
                    out.write("<div class='lright'><h2 style='font-size: 16px' style='margin:10px;'>"+productList.get(i).getName()+"</h2>");
                    out.write("<p style='font-size: 14px' style='margin:10px;'>原价："+productList.get(i).getPreprice()+"<br />今日特价："+productList.get(i).getNowprice()+"</p>");
                    //out.write("<a class='enter' style='margin-top:30px;'>添加</a>");
                    out.write("</div>");
                    out.write("</li>");
                }
            }

        %>

       <%-- <li>
            <span><img src="images/001.jpg" /></span>
            <div class="lright">
                <h2>模拟电子技术</h2>
                <p>课程数：共35章<br />已完成：7章<br />学习中：6章</p>
                <a class="enter">添加</a>
                <a class="enter">删除</a>
            </div>
        </li>--%>

        <%--<li><span><img src="images/001.jpg" /></span><div class="lright"><h2 style="font-size: 16px" style="margin:10px;">鱼香肉丝</h2><p style="font-size: 14px" style="margin:10px;">原价：16<br />今日特价：14</p>
                <a class="enter" style="margin-top:30px;">添加</a>
            </div>
        </li>

        <li>
            <span><img src="images/001.jpg" /></span>
            <div class="lright">
                <h2>模拟电子技术</h2>
                <p>课程数：共35章<br />已完成：7章<br />学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="images/001.jpg" /></span>
            <div class="lright">
                <h2>模拟电子技术</h2>
                <p>课程数：共35章<br />已完成：7章<br />学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="images/001.jpg" /></span>
            <div class="lright">
                <h2>模拟电子技术</h2>
                <p>课程数：共35章<br />已完成：7章<br />学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="images/001.jpg" /></span>
            <div class="lright">
                <h2>模拟电子技术</h2>
                <p>课程数：共35章<br />已完成：7章<br />学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="images/001.jpg" /></span>
            <div class="lright">
                <h2>模拟电子技术</h2>
                <p>课程数：共35章<br />已完成：7章<br />学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="images/001.jpg" /></span>
            <div class="lright">
                <h2>模拟电子技术</h2>
                <p>课程数：共35章<br />已完成：7章<br />学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

        <li>
            <span><img src="images/001.jpg" /></span>
            <div class="lright">
                <h2>模拟电子技术</h2>
                <p>课程数：共35章<br />已完成：7章<br />学习中：6章</p>
                <a class="enter">进入课程</a>
            </div>
        </li>

    </ul>--%>

    <%--<div class="clear"></div>

    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">1</a></li>
            <li class="paginItem current"><a href="javascript:;">2</a></li>
            <li class="paginItem"><a href="javascript:;">3</a></li>
            <li class="paginItem"><a href="javascript:;">4</a></li>
            <li class="paginItem"><a href="javascript:;">5</a></li>
            <li class="paginItem more"><a href="javascript:;">...</a></li>
            <li class="paginItem"><a href="javascript:;">10</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>


    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>

        <div class="tipinfo">
            <span><img src="images/ticon.png" /></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>

        <div class="tipbtn">
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
        </div>

    </div>--%>


</div>
</body>
</html>
