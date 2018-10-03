<%@ page import="com.coderx.entity.Menu" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.coderx.entity.Suggestion" %>
<%@ page import="com.coderx.entity.Menuset" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/15
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="js/select-ui.min.js"></script>
    <script type="text/javascript" src="editor/kindeditor.js"></script>

    <script type="text/javascript">
        KE.show({
            id : 'content7',
            cssPath : './index.css'
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select1").uedSelect({
                width : 345
            });
            $(".select2").uedSelect({
                width : 167
            });
            $(".select3").uedSelect({
                width : 100
            });
        });
    </script>
</head>

<body>

<%--<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">系统设置</a></li>
    </ul>
</div>--%>

<div class="formbody">


    <div id="usual1" class="usual">

        <div class="itab">
            <ul>
                <li><a href="#tab1" class="selected">菜品选择</a></li>
                <%--<li><a href="#tab2">自定义</a></li>--%>
            </ul>
        </div>

        <div id="tab1" class="tabson">
            <%--<%new SimpleDateFormat("yyyy-MM-dd").format(new Date());%>--%>
            <div class="formtext">您好，为了员工的生活质量，建议您全选</div>



            <ul class="forminfo">
                <%--<li><label>招聘企业<b>*</b></label><input name="" type="text" class="dfinput" value="请填写单位名称"  style="width:518px;"/></li>

                <li><label>职位名称<b>*</b></label>


                    <div class="vocation">
                        <select class="select1">
                            <option>UI设计师</option>
                            <option>交互设计师</option>
                            <option>前端设计师</option>
                            <option>网页设计师</option>
                            <option>Flash动画</option>
                            <option>视觉设计师</option>
                            <option>插画设计师</option>
                            <option>美工</option>
                            <option>其他</option>
                        </select>
                    </div>

                </li>

                <li><label>薪资待遇<b>*</b></label>

                    <div class="vocation">
                        <select class="select1">
                            <option>3000-5000</option>
                            <option>5000-8000</option>
                            <option>8000-10000</option>
                            <option>10000-15000</option>
                        </select>
                    </div>



                </li>
                <li><label>工作地点<b>*</b></label>

                    <div class="usercity">

                        <div class="cityleft">
                            <select class="select2">
                                <option>江苏</option>
                                <option>湖南</option>
                                <option>广东</option>
                                <option>北京</option>
                                <option>湖北</option>
                            </select>
                        </div>

                        <div class="cityright">
                            <select class="select2">
                                <option>南京</option>
                                <option>无锡</option>
                                <option>盐城</option>
                                <option>徐州</option>
                                <option>连云港</option>
                            </select>
                        </div>

                    </div>



                </li>--%>

                <%--<form action="/SuggestServlet" method="post">
                    <li><label>建议内容<b>*</b></label>


                        <textarea id="content7" name="content" style="width:700px;height:250px;visibility:hidden;"></textarea>

                    </li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="马上发布"/></li>
                </form>
            </ul>--%>

        </div>


        <%--<div id="tab2" class="tabson">


            <ul class="seachform">

                <li><label>综合查询</label><input name="" type="text" class="scinput" /></li>
                <li><label>指派</label>
                    <div class="vocation">
                        <select class="select3">
                            <option>全部</option>
                            <option>其他</option>
                        </select>
                    </div>
                </li>

                <li><label>重点客户</label>
                    <div class="vocation">
                        <select class="select3">
                            <option>全部</option>
                            <option>其他</option>
                        </select>
                    </div>
                </li>

                <li><label>客户状态</label>
                    <div class="vocation">
                        <select class="select3">
                            <option>全部</option>
                            <option>其他</option>
                        </select>
                    </div>
                </li>

                <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>

            </ul>
--%>

        <table class="tablelist">
            <thead>
            <tr>
                <th><input name="" type="checkbox" value="" checked=""/></th>
                <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
                <th>菜名</th>
                <th>原价</th>
                <th>现价</th>
                <th>图片</th>
                <%--<th>选择</th>--%>
                <%--<th>是否审核</th>
                <th>操作</th>--%>
            </tr>
            </thead>
            <tbody>

            <%
                ArrayList<Menuset> arrayList = (ArrayList<Menuset>) request.getAttribute("productSetList");
                if(arrayList!=null) {
                    out.write("<form action=\"updateset\" method=\"post\">");
                    for (int i = 0; i < arrayList.size(); i++) {
                        out.write(" <tr>");
                        out.write("<td><input name=\"menuId\" type=\"checkbox\" value='"+arrayList.get(i).getId()+"' /></td>");
                        out.write("<td>" + arrayList.get(i).getId() + "</td>");
                        out.write("<td>" + arrayList.get(i).getName() + "</td>");
                        out.write("<td>" + arrayList.get(i).getPreprice() + "</td>");
                        out.write("<td>" + arrayList.get(i).getNowprice() + "</td>");
                        out.write("<td>" + arrayList.get(i).getImgsrc() + "</td>");
                        out.write("</tr>");

                    }

                    out.write("<li><input name=\"\" type=\"submit\" class=\"loginbtn\" value=\"选择提交\"  />");
                    out.write("</form>");
                }
            %>
            <%--<tr>
                <td><input name="menuId" type="checkbox" value="" /></td>
                <td>20130908</td>
                <td>王金平幕僚：马英九声明字字见血 人活着没意思</td>
                <td>admin</td>
                <td>江苏南京</td>
                <td>2013-09-09 15:05</td>
                <td>已审核</td>
                <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
            </tr>

            <tr>
                <td><input name="" type="checkbox" value="" /></td>
                <td>20130907</td>
                <td>温州19名小学生中毒流鼻血续：周边部分企业关停</td>
                <td></td>
                <td>山东济南</td>
                <td>2013-09-08 14:02</td>
                <td>未审核</td>
                <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
            </tr>

            <tr>
                <td><input name="" type="checkbox" value="" /></td>
                <td>20130906</td>
                <td>社科院:电子商务促进了农村经济结构和社会转型</td>
                <td>user</td>
                <td>江苏无锡</td>
                <td>2013-09-07 13:16</td>
                <td>未审核</td>
                <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
            </tr>

            <tr>
                <td><input name="" type="checkbox" value="" /></td>
                <td>20130905</td>
                <td>江西&quot;局长违规建豪宅&quot;：局长检讨</td>
                <td>admin</td>
                <td>北京市</td>
                <td>2013-09-06 10:36</td>
                <td>已审核</td>
                <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
            </tr>

            <tr>
                <td><input name="" type="checkbox" value="" /></td>
                <td>20130907</td>
                <td>温州19名小学生中毒流鼻血续：周边部分企业关停</td>
                <td></td>
                <td>山东济南</td>
                <td>2013-09-08 14:02</td>
                <td>未审核</td>
                <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
            </tr>--%>

            </tbody>
        </table>




    </div>

</div>

<script type="text/javascript">
    $("#usual1 ul").idTabs();
</script>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>

<script>
    if('${menuset }' != ''){
        if('${menuset }' == 0){
            alert('提交成功!');
            //location.href("menuset");
        }else if('${menuset }' == 1){
            alert('提交失败！');
        }
    }
</script>




</div>

</body>
</html>


