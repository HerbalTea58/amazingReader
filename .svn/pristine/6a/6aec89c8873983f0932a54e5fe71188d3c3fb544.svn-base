<%@ page language="java" isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="ie-stand">
    <title>页面跑丢了 - 惊鸿书院网</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>

    <link rel="stylesheet" data-ignore="true" href="../Css/icon.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/Drag.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/rset.ddecf.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/book_popuar.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/ejoyec4.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/vote_popuar.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/spirit44.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/qd_popuar.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/font089a4.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/footerfeb73.css"/>
    <link rel="stylesheet" data-ignore="true" href="../Css/global.css"/>
    <link data-ignore="true" rel="stylesheet" href="../Css/moudle.css"/>
    <link data-ignore="true" rel="stylesheet" href="../Css/layout5deof.css"/>
    <link data-ignore="true" rel="stylesheet" href="../Css/bookdetail.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>Css/common1.css"/>

    <link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script src="<%=basePath%>layui/layui.js"></script>

</head>
<body>



<!--公共头部 结束-->
<div id="pin-nav" class="pin-nav-wrap need-search" data-l1="40">
    <div class="box-center cf">
        <div class="nav-list site-nav fl">
            <ul>
                <li class="site"><a class="pin-logo" href="<%=basePath%>Reader/homePageShow.action" data-eid="qd_A43"><span></span></a>
                </li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=玄幻" data-eid="qd_A47">玄幻</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=都市" data-eid="qd_A48">都市</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=仙侠" data-eid="qd_A49">仙侠</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=科幻" data-eid="qd_A50">科幻</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=历史" data-eid="qd_A52">历史</a></li>

            </ul>
        </div>
        <div class="nav-list min-user fr">
            <ul>
                <li id="min-search">
                    <form id="formUrl" action="<%=basePath%>reader/searchBooks.action" method="get" target="_blank">
                        <label id="pin-search" for="topSearchSubmit" data-eid="qd_A62"><em class=""></em>
                        </label>
                        <input id="pin-input" class="pin-input hide" type="text" name="keyWord" placeholder="要搜啥">
                        <input class="submit-input" type="submit" id="topSearchSubmit" data-eid="qd_A62">
                    </form>
                </li>
                <li class="line">

                </li>
                <c:if test="${not empty sessionScope.reader}">
                    <li class="sign-out" data-l2="6">
                        <a id="pin-login" href="<%=basePath%>person/personal.action" data-eid="qd_R33">${sessionScope.reader.readerNeckName}</a>
                    </li>
                    <li class="line"></li>
                    <li class="book-shelf" id="top-book-shelf">
                        <a href="<%=basePath%>bookshelf/searchbookshelf.action" data-eid="qd_A63"><em class=""></em>
                            <i>
                                我的书架
                            </i>
                        </a>
                    </li>
                </c:if>
                <c:if test="${empty sessionScope.reader}">
                    <li class="sign-out" data-l2="6">
                        <a id="pin-login" href="<%=basePath%>JSP/login_reader.jsp" data-eid="qd_R33">登录</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>




<!--内容 开始-->
<div class="content">

    <div class="errorInfo" style="width: 100%; height: 300px;padding-left: 100px;padding-right: 100px; background-color: white;margin-top: 2em;margin-bottom: 2em">
        <div style="float: left; height: inherit; width: 45%">
            <img src="<%=basePath%>Picture/跑丢了.jpg" style="width: 100%;height: 100%">
        </div>
        <div class="jumbotron" style="float: left;background-color: white;margin-left: 3em;width: 45%">
            <h1>ya~</h1>
            <p style="padding-left: 5em">页面跑丢了啦</p>
            <p style="overflow-y: scroll;height: 130px"><span style="font-size: 12px;"><%=exception.getMessage()%><br>  </span> </p>
        </div>
        
        
    </div>

</div>
<!--内容 结束-->



<style>

</style>

<!--公共底部 开始-->
<div class="footer">
    <div class="box-center cf">

        <div class="footer-menu dib-wrap">
            <a href="" target="_blank">惊鸿</a>
            <a href="" target="_blank">联系我们</a>
            <a href="" target="_blank">加入我们</a>
            <a href="" target="_blank">帮助中心</a>
            <a href="#" class="advice" target="_blank">提交建议</a>

        </div>
        <div class="copy-right">
            <p><a href="#" target="_blank">出版物经营许可证</a>京ICP备11008516号<a target="_blank">网络出版服务许可证（总）网出证（京）字第141号</a><a href="#" target="_blank">京ICP证090653号</a><a href="#"  target="_blank" ><img style="margin-right:5px; display:inline; vertical-align:middle; margin-top:-2px" src="<%=basePath%>Picture/web_record.png">京公网安备11010502030452</a></p>
            <p>2018 All Rights Reserved  惊鸿科技股份有限公司 版权所有</p>
        </div>

    </div>
</div>
<!--公共底部 结束-->

<span class="gotop" id="btn_back_top" title="返回顶部"><img src="Picture/gotop.png" data-src="/static/images/common/gotop_hov.png" alt="返回顶部"></span>

</body>
</html>

