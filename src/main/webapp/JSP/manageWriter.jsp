<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 18-6-1
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script src="<%=basePath%>layui/layui.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <title>惊鸿书院后台</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
</head>

<body class="layui-layout-body">
<script>
    $(function(){

        $("#test1").click(function(){
            $("#woman").toggleClass("layui-nav-itemed");
        })
    })
    $(function(){

        $("#test2").click(function(){
            $("#man").toggleClass("layui-nav-itemed");
        })
    })
</script>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="color: white;"><a href="<%=basePath%>JSP/managerPage.jsp"><strong>惊鸿书院后台管理</strong></a></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
      <%--  <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>manager/bookManage.action">书籍管理</a></li>
            <li class="layui-nav-item"><a href="<%=basePath%>writerManage/countWriterIncome.action">作者管理</a></li>
            <li class="layui-nav-item"><a href="<%=basePath%>JSP/managerPlatform.jsp">平台收益管理</a></li>

        </ul>--%>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="<%=basePath%>${sessionScope.manager.managerPortrait}" class="layui-nav-img">
                    ${ sessionScope.manager.managerNeckname}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>

            </li>
            <c:if test="${ empty sessionScope.manager}">
                <li class="layui-nav-item"><a href="<%=basePath%>JSP/managerLogin.jsp">登录</a></li>
            </c:if>
            <li class="layui-nav-item"><a href="<%=basePath%>managerExit.action">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">举报处理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath%>manager/getToDealReportChapter.action" id="chapter_report_to_deal">待处理章节举报</a></dd>
                        <dd><a href="<%=basePath%>manager/getToDealReportComment.action" id="comment_report_to_deal">待处理评论举报</a></dd>
<%--                        <dd><a href="<%=basePath%>manager/getAllReportComment.action">全部评论举报</a></dd>
                        <dd><a href="<%=basePath%>manager/getAllReportChapter.action">全部章节举报</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>writerManage/countWriterIncome.action">作者管理</a>
                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/bookManage.action">书籍管理</a>

                </li>

                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/bookDownShelf.action">下架管理</a>

                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>JSP/managerPlatform.jsp">平台收益管理</a>

                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/toCheckChaptersManage.action">章节审核</a>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body" id="layui-body">
        <!-- 内容主体区域 -->

        <%--显示举报信息列表--%>
       <%-- <div class="media">
            <div class="media-left media-top">
                <a href="#">
                    <img class="media-object" src="<%=basePath%>Picture/bookCover.jpg" width="64" height="84" alt="...">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">${book.bookName}
                    <span class="badge" style="background-color: grey;color: white">
                        ${book.clickTimes}
                    </span>&nbsp;
                    <span class="badge" style="background-color: #ddd;color: red">
                                <c:if test="${!book.bookDownShelf}">在架</c:if>
                                <c:if test="${book.bookDownShelf}">下架</c:if>
                            </span>
                </h4>
                <p style="word-wrap:break-word; word-break:break-all; overflow: hidden;min-height: 180px;">
                    <span style="color: white;font-size: 12px">简介：</span>
                    ${book.bookShortDescribe}
                </p>
            </div>
        </div>--%>

            <c:forEach items="${writerInfoList}" var="writerInfo" varStatus="s">
                <div class="panel panel-default col-md-3" style="font-size: 12px; margin: 10px 0;">
                    <!-- Default panel contents -->
                    <%--<div class="panel-heading">Panel heading</div>--%>
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left media-top">
                                <img class="media-object" src="<%=basePath%>${writerInfo.writerPortrait}" width="50" height="70" alt="${writerInfo.writerNeckName}">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading" style="border-bottom: 1px solid #ddd;display: inline-block">
                                        <strong>${writerInfo.writerNeckName}${writerInfo.writerId}</strong>

                                </h4>
                                <p style="word-wrap:break-word; word-break:break-all; overflow: hidden;height: 1.5em;">
                                    <%--收入见长--%>
                                    <c:if test="${writerInfo.curMonthIncome > writerInfo.preMonthIncome}">
                                        <span class="badge" style="background-color: green;color: whitesmoke ;font-size: 10px">
                                            收入见长
                                        </span>
                                    </c:if>
                                    <c:if test="${writerInfo.curMonthIncome < writerInfo.preMonthIncome}">
                                        <span class="badge" style="background-color: red;color: whitesmoke ;font-size: 10px">
                                            收入下跌
                                        </span>
                                    </c:if>
                                        <c:if test="${writerInfo.curMonthIncome == writerInfo.preMonthIncome}">
                                        <span class="badge" style="background-color: grey;color: whitesmoke ;font-size: 10px">
                                            收入持平
                                        </span>
                                    </c:if>
                                </p>
                                <p style="word-wrap:break-word; word-break:break-all; overflow: hidden;height: 50px;border-bottom: 1px solid #ddd">
                                    <span style="color: grey;font-size: 12px">简介：</span>
                                        ${writerInfo.writerShortRecommend}
                                </p>
                                <p style="word-wrap:break-word; word-break:break-all; overflow: hidden;height: 1.5em;">
                                    <span style="color: grey;font-size: 12px">联系方式：</span>
                                        ${writerInfo.writerTel}
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Table -->
                    <table class="table table-hover" style="font-size: 12px" >
                        <thead style="height: 1em">
                            <th>统计类别</th>
                            <th>金额</th>
                        </thead>
                        <tr>
                            <td>当月收入</td>
                            <td>￥${writerInfo.curMonthIncome}</td>
                        </tr>
                        <tr>
                            <td>上月收入</td>
                            <td>￥${writerInfo.preMonthIncome}</td>
                        </tr>
                        <tr>
                            <td>总订阅收入</td>
                            <td>￥${writerInfo.totalSubscribeIncome}</td>
                        </tr>
                    </table>
                </div>
            </c:forEach>





    </div>
    <script>
        function downShelfBook(bookId){
            layui.use('layer',function(){
                var layer = layui.layer;
                var index = layer.open({
                    offset:("40%","30%"),
                    title:'是否下架',
                    content:'<p style="text-align: center"><strong>要将该书籍下架么！</strong></p>',
                    yes : function(){
                        $.ajax({
                            url:'<%=basePath%>manager/downShelfBook.action?bookId='+bookId,
                            async:true,
                            success:function(info) {
                                location.reload();
                            }
                        })
                        layer.close(index);
                    },anim: 6
                })
            })

        }
    </script>
    <script>
        function reUpToShelfBook(bookId){
            layui.use('layer',function(){
                var layer = layui.layer;
                var index = layer.open({
                    offset:("40%","30%"),
                    title:'是否满足上架条件',
                    content:'<p style="text-align: center"><strong>满足上架条件么？</strong></p>',
                    btn:['可以上架','不满足'],
                    yes : function(){
                        $.ajax({
                            url:'<%=basePath%>manager/reUpToShelfBook.action?bookId='+bookId,
                            async:true,
                            success:function(info) {
                                location.reload();
                            }
                        })
                        layer.close(index);
                    },anim:1
                })
            })
        }
    </script>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
        <i class="layui-icon layui-icon-login-wechat"></i>
    </div>
</div>

</body>
</html>
