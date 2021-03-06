<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/3
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>作品管理</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_all.css" type="text/css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_noves.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_pop.css" type="text/css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">

    <script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>

    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/PopDrag.js" type="text/javascript"></script>
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
    <div id="changePass" class="popBox" style="z-index: 1000001">
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
            <a href="${pageContext.request.contextPath}/Writer/WriterNovels.action" ><div class="son_label_choosed">
                <span class="label_span_choosed">作 品 管 理</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterDate.action" ><div class="son_label">
                <span class="label_span">数 据 统 计</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterIncome.action" ><div class="son_label">
                <span class="label_span">稿 酬 收 入</span>
            </div></a>
        </div>
        <div class="context">
            <div class="context_title">&nbsp;作品管理</div>
            <div class="context_summary">
                <span class="summary_span">当前作品总数为${NovelList.size()}本</span>
                <a  class="newBook" href="${pageContext.request.contextPath}/Writer/WriterAddNovels.action">＋创建书籍</a>
            </div>

            <c:if test="${empty NovelList}">
                <div novel="novel_null">
                    <img src="${pageContext.request.contextPath }/Images/writer_null.png" class="null_img"/>
                    <span class="null_span">你没有发表任何作品</span>
                    <a class="null_book" href="${pageContext.request.contextPath}/Writer/WriterAddNovels.action">创建书籍</a>
                </div>
            </c:if>
            <c:if test="${not empty NovelList}">
                <table cellpadding="0" cellspacing="0" style="text-align: center;">
                    <tr style="height: 30px; background-color: #f9f9f9; font-family: 新宋体; font-size: 15px; color: #C9C5C5">
                        <th  style="width:150px;height: 30px;line-height: 30px;border: #dddddd 1px solid;border-left: none; border-right: none">书名</th>
                        <th  style="width:150px;height: 30px;line-height: 30px;border: #dddddd 1px solid;border-left: none; border-right: none">封面</th>
                        <th  style="width:120px;height: 30px;line-height: 30px;border: #dddddd 1px solid;border-left: none; border-right: none">类型</th>
                        <th  style="width:120px;height: 30px;line-height: 30px;border: #dddddd 1px solid;border-left: none; border-right: none">状态</th>
                        <th  style="width:120px;height: 30px;line-height: 30px;border: #dddddd 1px solid;border-left: none; border-right: none">活动状态</th>
                        <th  style="width:220px;height: 30px;line-height: 30px;border: #dddddd 1px solid;border-left: none; border-right: none">最后更新时间</th>
                        <th  style="width:170px;height: 30px;line-height: 30px;border: #dddddd 1px solid;border-left: none; border-right: none">操作</th>
                    </tr>
                </table>
                <div style="height: 830px; overflow:auto;">
                <table cellpadding="0" cellspacing="0" style="text-align: center;">
                    <c:forEach var="novel" items="${NovelList }">
                        <tr id="tr${novel.bookId}" style="background-color: #f6fbff">
                            <td style="width:150px;height: 30px;line-height: 30px; text-align: center;border: #dddddd 1px solid;border-left: none; border-right: none">${novel.bookName}</td>
                            <td style="width:150px;height: 110px;line-height: 30px; text-align: center;border: #dddddd 1px solid;border-left: none; border-right: none"><img src="${pageContext.request.contextPath}/${novel.bookCover}" width="70px" height="100px"/></td>
                            <td style="width:120px;height: 30px;line-height: 30px; text-align: center;border: #dddddd 1px solid;border-left: none; border-right: none">${novel.bookStyleName}</td>
                            <td style="width:120px;height: 30px;line-height: 30px; text-align: center;border: #dddddd 1px solid;border-left: none; border-right: none">
                                    <c:if test="${novel.bookStatuId == 1}">
                                        连载中
                                    </c:if>
                                <c:if test="${novel.bookStatuId == 2}">
                                    已完结
                                </c:if>
                            </td>
                            <td style="width:120px;height: 30px;line-height: 30px; text-align: center;border: #dddddd 1px solid;border-left: none; border-right: none">
                                <c:if test="${novel.bookActivityStatu == true}">
                                    限免
                                </c:if>
                                <c:if test="${novel.bookActivityStatu == false}">
                                    无活动
                                </c:if>
                            </td>
                            <td style="width:220px;height: 30px;line-height: 30px; text-align: center;border: #dddddd 1px solid;border-left: none; border-right: none"><fmt:formatDate value="${novel.bookPushDateTime}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                            <td style="width:170px;height: 30px;line-height: 30px; text-align: center;border: #dddddd 1px solid;border-left: none; border-right: none"><a href="${pageContext.request.contextPath}/Writer/WriterChapterDraft.action?id=${novel.bookId}"><img src="../Images/writer_chapterButton.png"></a></td>
                        </tr>
                    </c:forEach>
                </table>
                </div>
            </c:if>

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
<script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>
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