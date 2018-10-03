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



<div class="rightinfo">





    <%
        ArrayList<Menu> productList = (ArrayList<Menu>) request.getAttribute("productList");
        ArrayList arrayList = new ArrayList();
        arrayList.add("星期一");
        arrayList.add("星期二");
        arrayList.add("星期三");
        arrayList.add("星期四");
        arrayList.add("星期五");
        arrayList.add("星期六");
        arrayList.add("星期日");

        if(productList != null){
            for(int j = 0;j < arrayList.size();j++) {
                out.write("<ul class='classlist' style='width:100%;height:700px;margin-top:10px'>");
                out.write(" <span class=\"click\" style='display:block;'><span><img src=\"images/t01.png\" /></span>"+ arrayList.get(j)+"</span>");
                    for (int i = 0; i <productList.size(); i++) {
                    out.write("<li style='height: 158px;width: 400px;'>");
                    out.write("<span><img src=" + productList.get(i).getImgsrc() + " /></span>");
                    out.write("<div class='lright'><h2 style='font-size: 16px' style='margin:10px;'>" + productList.get(i).getName() + "</h2>");
                    out.write("<p style='font-size: 14px' style='margin:10px;'>原价：" + productList.get(i).getPreprice() + "<br />今日特价：" + productList.get(i).getNowprice() + "</p>");
                    //out.write("<a class='enter' style='margin-top:30px;'>添加</a>");
                    out.write("</div>");
                    out.write("</li>");


                }
                out.write("</ul><br>");


                out.write("<br>");


//                    out.write(">");


            }
        }

    %>

</div>
</body>
</html>
