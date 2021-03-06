
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/3
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>订阅收入</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_all.css" type="text/css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_income.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_pop.css" type="text/css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">

    <link rel="stylesheet" type="text/css" href="<%=basePath%>Css/theme_white/css/pagination.css"/>
    <script language="JavaScript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script language="JavaScript"  src="<%=basePath%>Scripts/page/jquery-1.2.3.pack.js"></script>
    <script language="JavaScript" src="<%=basePath%>Scripts/page/jquery.cookie-min.js"></script>
    <script language="JavaScript" src="<%=basePath%>Scripts/page/pagination.js"></script>
    <style>
        a{
            color: #616161;
            text-decoration: none;
        }
    </style>

</head>
<body style="background: #efefef">
<div></div>
<div class="all">
    <div class="head">
        <div class="title">
            <a href="${pageContext.request.contextPath}/JSP/writer_home.jsp"><span class="title1">惊鸿·</span><span class="title2">作家专区</span></a>
        </div>
        <div class="notify">
            <img id="notify" class="img1" src="${pageContext.request.contextPath}/${LoginWriter.writerPortrait}" onclick="over()"><span class="notify1" onclick="over()">个人中心</span>
        </div>
        <div id="float_div" class="float_div" onmouseover="show()" onmouseout="notshow()">
            <div class="arrow"></div>
            <a href="${pageContext.request.contextPath}/JSP/writer_owner.jsp"><span class="float_span">作家资料</span></a>
            <a id="new_button" class="float_span" href="#">更改密码</a>
            <a href="${pageContext.request.contextPath}/Writer/OutLogin.action"><span class="float_span" style="border: none">退出登录</span></a>
        </div>
    </div>
    <div id="changePass" class="popBox">
        <span class="popBoxHandle">修改密码</span>
        <span class="new2">原密码:</span>
        <input id="new3" name="password1" type="password" class="new3"/>
        <span class="new4">新密码:</span>
        <input id="new5" name="password2" type="password" class="new5"/>
        <span class="new6">再次输入:</span>
        <input id="new7" name="password3" type="password" class="new7"/>
        <button id="submit" type="button" class="submit">提交</button>
        <button id="close" type="button" id="cancel" class="submit1">取消</button>
    </div>
    <div class="main">
        <div class="All_label">
            <a href="${pageContext.request.contextPath}/Writer/WriterHome.action"><div class="son_label">
                <span class="label_span">专 区 首 页</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterNovels.action" ><div class="son_label">
                <span class="label_span">作 品 管 理</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterDate.action" ><div class="son_label">
                <span class="label_span">数 据 统 计</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterIncome.action" ><div class="son_label_choosed">
                <span class="label_span_choosed">稿 酬 收 入</span>
            </div></a>
        </div>
        <div class="context">
            <div class="context_title">&nbsp;稿酬收入</div>
            <div class="context_summary">
                <a id="allincome" href="${pageContext.request.contextPath}/Writer/WriterIncome.action"><span class="choosed">总收入</span></a>
                <a id="readincome" href="${pageContext.request.contextPath}/Writer/WriterIncomeRead.action"><span class="choosed">订阅收入</span></a>
                <a id="rewardincome" href="${pageContext.request.contextPath}/Writer/WriterIncomeReward.action"><span class="choosed">打赏收入</span></a>
            </div>

            <div id="allincome1" class="allincome">
                <form method="post" name="findform">
                <span class="find_span">查看方式：</span>
                <select id="findtype" name="findtype" class="findtype">
                    <option id="choosed_data" value="date" selected="selected">按月份</option>
                    <option id="choosed_works" value="works">按作品</option>
                </select>
                <div id="div_findtype1" class="div_findtype1">
                    <select name="findyear" class="findyear">
                        <option value="null">——</option>
                        <option value="2013" >2013</option>
                        <option value="2014" >2014</option>
                        <option value="2015" >2015</option>
                        <option value="2016" >2016</option>
                        <option value="2017" >2017</option>
                        <option value="2018" >2018</option>
                    </select>
                    <select name="findmonth" class="findmonth">
                        <option value="null">——</option>
                        <option value="01" >1</option>
                        <option value="02" >2</option>
                        <option value="03" >3</option>
                        <option value="04" >4</option>
                        <option value="05" >5</option>
                        <option value="06" >6</option>
                        <option value="07" >7</option>
                        <option value="08" >8</option>
                        <option value="09" >9</option>
                        <option value="10" >10</option>
                        <option value="11" >11</option>
                        <option value="12" >12</option>
                    </select>
                    <button id="find1" type="submit" class="find1" name="find1">查看</button>
                </div>
                <div id="div_findtype2" class="div_findtype2">
                    <select name="findnovels" class="findnovels">
                        <option value="0">——</option>
                        <c:forEach var="book" items="${bookList }">
                            <option value="${book.bookId }">${book.bookName}</option>
                        </c:forEach>
                    </select>
                    <button id="find2" class="find2" name="find2" type="submit">查看</button>
                </div>
                </form>

                    <span class="detail_span">收入明细</span>
                    <span class="detail_span4">总收入:${AllIncome/100.00 }</span>
                    <div style="float: left; margin-left: 50px; margin-top: 130px">
                        <table cellpadding="0" cellspacing="0" style="float:left;margin-top: 50px;border: #dddddd 1px solid;">
                            <tr style="background-color: #f9f9f9; color: #6d6f71">
                                <th style="width:100px;height: 50px;line-height: 50px;border: #dddddd 1px solid;">订单号</th>
                                <th style="width:150px;height: 50px;line-height: 50px;border: #dddddd 1px solid;">作品</th>
                                <th style="width:100px;height: 50px;line-height: 50px;border: #dddddd 1px solid;">类型</th>
                                <th style="width:180px;height: 50px;line-height: 50px;border: #dddddd 1px solid;">读者</th>
                                <th style="width:100px;height: 50px;line-height: 50px;border: #dddddd 1px solid;">金额</th>
                                <th style="width:200px;height: 50px;line-height: 50px;border: #dddddd 1px solid;">订单时间</th>
                            </tr>
                            <c:if test="${empty AllOrder}">
                                <tr class="tr1">
                                    <td colspan="5">暂无任何结果</td>
                                </tr>
                            </c:if>
                            <c:if test="${not empty AllOrder}">
                                <c:forEach var="order" items="${AllOrder }">
                                    <tr name="allorder" style="align-text: center;display: none">
                                        <td style="width:98px;height: 40px;line-height: 40px; text-align: center;border: #dddddd 1px solid;">${order.readerOrderId}</td>
                                        <td style="width:148px;height: 40px;line-height: 40px; text-align: center;border: #dddddd 1px solid;">${order.bookName}</td>
                                        <td style="width:98px; height: 40px;line-height: 40px; text-align: center;border: #dddddd 1px solid;">${order.orderTypeName}</td>
                                        <td style="width:178px; height: 40px;line-height: 40px; text-align: center;border: #dddddd 1px solid;">${order.readerNeckName}</td>
                                        <td style="width:98px; height: 40px;line-height: 40px; text-align: center;border: #dddddd 1px solid;">${order.readerOrderPrice}</td>
                                        <td style="width:198px;height: 40px;line-height: 40px;text-align: center;border: #dddddd 1px solid;"><fmt:formatDate value="${order.readerOrderTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    </tr>
                                </c:forEach>
                                <div id="pagetest7" style="position: absolute; top:233px;font-size: 15px"></div>
                            </c:if>
                        </table>
                    </div>
            </div>
        </div>
    </div>
</div>
<!--公共底部 开始-->
<div style="float: left; margin-left: 230px">
    <div class="aboutcompany">
        <p class="link"  style="margin-top: 60px">
            <a href="<%=basePath%>JSP/managerLogin.jsp" target="_blank">网站管理</a>
            <a href="#" target="_blank">联系我们</a>
            <a href="#" target="_blank">商务合作</a>
            <a href="#" target="_blank">关于我们</a>
            <a href="#" target="_blank">法律声明</a>
        </p>
        <p><a href="#" target="_blank">出版物经营许可证</a>京ICP备11008516号<a target="_blank">网络出版服务许可证（总）网出证（京）字第141号</a><a href="#" target="_blank">京ICP证090653号</a><a href="#"  target="_blank" ><img style="margin-right:5px; display:inline; vertical-align:middle; margin-top:-2px" src="<%=basePath%>Picture/web_record.png">京公网安备11010502030452</a></p>
        <p>2018 All Rights Reserved  惊鸿科技股份有限公司 版权所有</p>
    </div>
</div>
<!--公共底部 结束-->

<script type="text/javascript">
    document.getElementById("findtype").onchange = function () {
        var sel = document.getElementById("findtype").value;
        if(sel == "date"){
            document.getElementById("div_findtype1").style.display = "block";
            document.getElementById("div_findtype2").style.display = "none";
        }
        else {
            document.getElementById("div_findtype1").style.display = "none";
            document.getElementById("div_findtype2").style.display = "block";
        }
    }
</script>
<script type="text/javascript">
    document.getElementById("find1").onclick = function () {
            document.findform.action = "${pageContext.request.contextPath}/Writer/WriterReadIncomeDetail1.action";
            document.findform.submit();
    }
    document.getElementById("find2").onclick = function () {
        document.findform.action = "${pageContext.request.contextPath}/Writer/WriterReadIncomeDetail2.action";
        document.findform.submit();
    }
</script>
<script type="text/javascript">

    function show(){
        document.getElementById("float_div").style.display = "block";

    }
    function notshow() {
        document.getElementById("float_div").style.display = "none";

    }
    function over(){
        if(document.getElementById("float_div").style.display == "block")
            document.getElementById("float_div").style.display = "none";
        else
            document.getElementById("float_div").style.display = "block";
    }

</script>
<script type="text/javascript">
    function Upmoney() {
        var value = document.getElementById("money").value;
        if(confirm("你确认要提现吗?")){
            var url = '${pageContext.request.contextPath }/Writer/Upmoney.action';
            $.get(url,"money="+value,function(data){
                document.getElementById("detail_span5").innerText = data/100.00;
                alert("提现成功");
            });
        }
    }
</script>
<script language="javascript">
    $(document).ready(
        function(){
            var date = document.getElementsByName("allorder");
            var datenum = date.length;
            var datelist = [];
            for(var n=0; n<datenum; n++){
                datelist[n] = "<tr name=\"allorder\" style=\"align-text: center\">"+date[n].innerHTML+"</tr>";
            }
            var initData = datelist;

            //普通模式
            $("#pagetest7").pagination({totalRecord:datenum,dataStore:initData,showMode:'normal'});
        }
    )
    //-->
</script>
<script src="../Scripts/PopDrag.js" type="text/javascript"></script>
<script type="text/javascript">
    var p = new PopUp({
        id: "changePass"
    });
    EventUtil.addEvent(window, 'resize', function () {
        p.setPosition();
        p.enableShadow && p.enableShadow.shadow && p.enableShadow.setProperty(p.enableShadow.shadow);
    });

    EventUtil.addEvent(EventUtil._$('new_button'), 'click', function () {
        p.show({
            /*            x:300,
                        y:300*/
        });
    })
    EventUtil.addEvent(window,'load',function() {
        if((isIE6 || isOpera) && p.isScroll != null && p.isScroll == 'enabled') {
            EventUtil.addEvent(window,'scroll', function() {
                setTimeout(function() {
                    p.setPosition();
                },100);
            });
        }
    });
    EventUtil.addEvent(EventUtil._$('submit'),'click', function() {
        //自定义点击取消按钮之后得操作
        var value = ${LoginWriter.writerPassword}
        var value1 = document.getElementById("new3").value;
        if(value != value1){
            alert("原密码错误");
        }else {
            var value2 = document.getElementById("new5").value;
            var value3 = document.getElementById("new7").value;
            if(value2 != value3)
                alert("两次输入新密码不同");
            else {
                if(confirm("确定修改密码？")){
                    var url = '${pageContext.request.contextPath }/Writer/ChangePassword.action';
                    $.get(url,"password="+value2,function(data){
                        if(date == true){
                            alert("更新成功");
                        }else {
                            alert("更新失败");
                        }
                    });
                }
                //隐藏弹出框
                p.hide();
            }
        }
    });
    EventUtil.addEvent(EventUtil._$('close'),'click', function() {
        //自定义点击取消按钮之后得操作
        //隐藏弹出框
        p.hide();
    });
</script>
</body>
</html>