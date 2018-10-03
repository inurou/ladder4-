<%@ page import="java.util.ArrayList" %>
<%@ page import="com.coderx.entity.Suggestion" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/14
  Time: 19:37
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
                <li><a href="#tab1" class="selected">查询建议</a></li>
                <%--<li><a href="#tab2">自定义</a></li>--%>
            </ul>
        </div>

        <div id="tab1" class="tabson">

            <div class="formtext">Hi，欢迎查询用户用餐建议！</div>

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
                <th><input name="" type="checkbox" value="" checked="checked"/></th>
                <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
                <th>内容</th>
                <%--<th>用户</th>
                <th>籍贯</th>--%>
                <th>发布时间</th>
                <%--<th>是否审核</th>
                <th>操作</th>--%>
            </tr>
            </thead>
            <tbody id = "tbody">
            <%
                ArrayList<Suggestion> arrayList = (ArrayList<Suggestion>) request.getAttribute("suggestionList");
                //System.out.println(arrayList);
                if(arrayList!=null) {
                    for (int i = 0; i < arrayList.size(); i++) {
                        out.write(" <tr>");
                        out.write("<td><input name=\"\" type=\"checkbox\" value=\"\" /></td>");
                        out.write("<td>" + arrayList.get(i).getId() + "</td>");
                        out.write("<td>" + arrayList.get(i).getSuggestion() + "</td>");
                        out.write("<td>" + arrayList.get(i).getDate() + "</td>");
                        //out.write("<td><a href=\"delete\" class=\"tablelink\" id=\"delete\" name = \"delete\" vaule="+arrayList.get(i).getId()+"> 删除</a></td>");
                        out.write("</tr>");
                    }
                }
            %>
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

<%--<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.js"></script>
<script>
    window.onload = function () {
        show();
    };
    function show() {
        $("#tbody").html("");
        $.ajax({
            type:'POST',
            url:"delete",
            dataType:'json',
            success:function (msg) {
                var content = "";
                for(var e in msg[1]){
                    content += "<tr>\n" +
                            "<td><input name=\\\"\\\" type=\\\"checkbox\\\" value=\\\"\\\" /></td>\n" +
                            "<td>" + msg[1].getId() + "</td>\n" +
                            "<td>" + msg[1].getId() + "</td>\n" +
                            "<td>" + msg[1].getId() + "</td>\n" +
                            "<td><input type=\"button\" value=\"删除\" onclick=\"deleteSug("+((msg.info)[1][e]).id+")\"/></td>\n" +
                            "</tr>"
                }
                $("#tbody").html(content)

            }
        })
    }
    function deleteSug(id) {

        $.ajax({
            type:'post',
            url:"/suggestion/deleteById",
            dataType:'json',
            data:{id:id},
            success:function (msg) {
                alert(msg.msg)
            }
        });
        show()
    }
</script>--%>


</div>

</body>
</html>


