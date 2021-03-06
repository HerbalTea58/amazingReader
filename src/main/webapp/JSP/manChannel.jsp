<%@ page language="java" isErrorPage="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="ie-stand">
    <title>男生频道 - 惊鸿书院网</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>manChannelNeed/common.css">

    <script src="<%=basePath%>manChannelNeed/push.js"></script><script src="<%=basePath%>manChannelNeed/hm.js"></script><script type="text/javascript" src="<%=basePath%>manChannelNeed/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>manChannelNeed/jquery_002.js"></script>
    <script type="text/javascript" src="<%=basePath%>manChannelNeed/layer.js"></script><link rel="stylesheet" href="<%=basePath%>manChannelNeed/layer.css" id="layui_layer_skinlayercss" style="">
    <script type="text/javascript" src="<%=basePath%>manChannelNeed/common.js"></script>

    <script type="text/javascript">var user_id = '132215';</script>
</head>
<body class="men pd">
<!--公共头部 开始-->
<div class="blankHead zwfl_head" >
    <div class="n1_header" id="n1_header" style="box-shadow: none;">
        <div class="n1_header_wrap">
            <h1>
                <a href="#"><img src="<%=basePath%>Picture/惊鸿Logo透明底.png" style="height: 50px;padding-top: -30px;" alt="logo" title="惊鸿书院"></a>
            </h1>
            <div class="n1_headerR">
                <ul class="n1_nav">
                    <li ><a href="<%=basePath%>Reader/homePageShow.action">首页</a></li>
                    <li class="current"><a href="<%=basePath%>manChannel/detailInfo.action">男频</a></li>
                    <li ><a href="<%=basePath%>reader/womanChannel.action">女频</a></li>
                    <li><a href="<%=basePath%>JSP/login_writer.jsp">作者专区</a></li>
                    <li><a href="<%=basePath%>reader/rank/showRanks1.action">排行榜</a><img src="<%=basePath%>Picture/new.png" alt="new"/></li>
                    <li><a href="<%--TODO--%>">更多</a></li>
                </ul>
                <div class="n1_search">
                    <form method="get" action="<%=basePath%>reader/searchBooks.action" onsubmit="return true;" id="search_form" name="search_form">
                        <input type="text" name="keyWord" value="" placeholder="书名/作者名/类型" autocomplete="off"/>
                        <!-- class="big_search"-->
                        <span><s id="btn_submit_search_form"></s></span>
                    </form>
                    <ul class="list" id="search_suggestion_box"></ul>
                </div>
                <div class="n1_login" style="line-height: 67px">
                    <script>
                        if(${not empty sessionScope.reader}){
                            $.ajax({
                                url:"<%=basePath%>msg/toReadCommentNum.action"
                                , async: true
                                , success:function (num) {
                                    if(num>0)
                                        $('#toReadMsgNum').html('<strong>'+num+'</strong>')
                                    else{
                                        $('#toReadMsgNum').hide();
                                    }
                                }
                            })
                        }
                    </script>
                    <!-- 将zypc.js完全注释掉了  去除登录按钮的url验证 -->
                    <!-- class="n1_login_beffor" id="unlogin_box" -->
                    <c:if test="${empty sessionScope.reader}">
                        <a href="<%=basePath%>JSP/login_reader.jsp"><span  style="display: block;">登录</span></a>
                    </c:if>
                    <c:if test="${not empty sessionScope.reader}">
                        <a href="<%=basePath%>person/personal.action?readerId=${sessionScope.reader.readerId}">
                            <span  style="display: block;float: left;margin-left: 10px;">
                                ${sessionScope.reader.readerNeckName}
                                <span class="badge" style="float:right;position: relative;border:none;background-color: red;color: white;height: 1.5em; text-align: center; width:1.5em;line-height: 1.5em;border-radius: 15px;" id="toReadMsgNum"></span>
                            </span>

                        </a>
                        <a href="<%=basePath%>exit.action"><span  style="display: inline-block;float: left;margin-left: 10px;">退出</span></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<!--公共头部 结束-->

<style>
    .tjw{
        background-color: #ddd;
    }
    .tjw ul li img{
        margin-left: 28%;
        width: 40%;
        height: 100%;
    }

</style>
<link type="text/css" rel="stylesheet" href="<%=basePath%>manChannelNeed/mwpd.css">

<div class="content pdcon">
    <div class="f3 area" style="margin-top: 2em">
        <div class="f3_L">
            <h2 class="tit titp comtit"><s class="qyb"></s>男频推荐</h2>
            <div class="f3_L_L" mod="index_lunbo">
                <div class="tjw">
                    <ul mod="pic" style="position: relative; width: 972px; left: -486px;">
                        <c:forEach items="${fakeBooks}" var="book" varStatus="statu" begin="5" end="10"><%--界值待定--%>
                            <li><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank" class="book_cov">
                                <img src="<%=basePath%>${book.bookCover}"  class="lazyload_lb" alt="${book.bookName}" style="display: inline;">
                            </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <ol class="dot" mod="btn" hidden style="overflow: hidden; width: 124px;"><li class=""></li><li class="on"></li></ol>
                <ul class="sts">
                    <c:forEach items="${fakeBooks}" var="book" varStatus="statu" begin="0" end="7"><%--界值待定--%>
                        <c:if test="${(statu.index+1)%2 != 0}">
                            <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.styleName}" target="_blank">[ ${book.styleName} ]</a></span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName} " target="_blank">${book.bookName} </a></li>
                        </c:if>
                        <c:if test="${(statu.index+1)%2 == 0}">
                            <li class="fr"><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.styleName}" target="_blank">[ ${book.styleName} ]</a></span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <ul class="f3_f5_C">
                <c:forEach items="${fakeBooks}" var="book" varStatus="statu" begin="8" end="11">
                    <li>
                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank" class="book_cov">
                            <img src="<%=basePath%>${book.bookCover}"  class="lazyload_book_cover" alt="${book.bookName}">
                        </a>
                        <div class="book_inf">
                            <h3><a href="<%=basePath%>book/77549/" title="${book.bookName}" target="_blank">${book.bookName}</a></h3>
                            <p class="aut">作者：${book.writer.writerNeckName}</p>
                            <p class="int">${book.bookShortDescribe}</p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="f3_R com_R">
            <h2><s></s>点击榜</h2>
            <div class="list_wrap">
                <ol class="list">
                    <c:forEach items="${fakeBooks}" var="book" varStatus="statu" begin="12" end="21">
                        <c:if test="${statu.index+1-12 == 1}">
                            <li class="lis_sh  cur">
                                <em class="red_bg">1</em>
                                <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a></h3>
                                <div class="open">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" class="book_cov">
                                        <img src="<%=basePath%>${book.bookCover}" class="lazyload_book_cover" alt="${book.bookName}">
                                    </a>
                                    <div class="book_inf">
                                        <span class="aut">作者：${book.writer.writerNeckName}</span>
                                        <span>类别：<a href="<%=basePath%>reader/searchBooks.action?keyWord=${book.styleName}" title="${book.styleName}" target="_blank">${book.bookName}</a></span>
                                        <p class="int">${book.bookShortDescribe}</p>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${statu.index+1-12 == 2 || statu.index+1-12 == 3}">
                            <li class="">
                                <em class="red_bg">${statu.index-12+1}</em>
                                <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a></h3>
                                <div class="open">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" class="book_cov">
                                        <img src="<%=basePath%>${book.bookCover}" class="lazyload_book_cover" alt="${book.bookName}">
                                    </a>
                                    <div class="book_inf">
                                        <span class="aut">作者：${book.writer.writerNeckName}</span>
                                        <span>类别：<a href="<%=basePath%>reader/searchBooks.action?keyWord=${book.styleName}" title="${book.styleName}" target="_blank">${book.bookName}</a></span>
                                        <p class="int">${book.bookShortDescribe}</p>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${statu.index+1-12 >3}">
                        <li class="">
                            <em>${statu.index+1-12}</em>
                            <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a></h3>
                            <div class="open">
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" class="book_cov">
                                    <img src="<%=basePath%>${book.bookCover}" class="lazyload_book_cover" alt="${book.bookName}">
                                </a>
                                <div class="book_inf">
                                    <span class="aut">作者：${book.writer.writerNeckName}</span>
                                    <span>类别：<a href="<%=basePath%>reader/searchBooks.action?keyWord=${book.styleName}" title="${book.styleName}" target="_blank">${book.bookName}</a></span>
                                    <p class="int">${book.bookShortDescribe}</p>
                                </div>
                            </div>
                        </li>
                        </c:if>
                    </c:forEach>
                </ol>
            </div>
        </div>
    </div>
    <div class="f1 area">
        <div class="f1_R" style="padding-left: 60px;">
                    <ul class="sts" style="float: left;">
                            <li class="first">
                                <a title="绝世武魂" class="zdz">绝世武魂</a>
                            </li>
                            <c:forEach items="${stlyeBook}" var="book" begin="0" end="3">
                            <li>
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                                <p style="height: 40px; overflow-y: hidden;width:85%">${book.bookShortDescribe}</p>
                            </li>
                            </c:forEach>
                    </ul>
                    <ul class="sts" style="float: left;">
                            <li class="first">
                                <a title="逆天至尊"class="zdz">逆天至尊</a>
                            </li>
                            <c:forEach items="${stlyeBook}" var="book" begin="4" end="7">
                                <li>
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                                    <p style="height: 40px; overflow-y: hidden;width:85%">${book.bookShortDescribe}</p>
                                </li>
                            </c:forEach>
                    </ul>
                    <ul class="sts nobor" style="float: left;">
                            <li class="first">
                                <a title="重生之妖孽人生" class="zdz">重生之妖孽人生</a>
                            </li>
                            <c:forEach items="${stlyeBook}" var="book" begin="8" end="11">
                                <li>
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                                    <p style="height: 40px; overflow-y: hidden;width:85%">${book.bookShortDescribe}</p>
                                </li>
                            </c:forEach>
                    </ul>
                    <ul class="sts nobor" style="float: left;">
                        <li class="first">
                            <a title="仙侠奇缘"class="zdz">仙侠奇缘</a>
                        </li>
                        <%--这边放六本--%>
                        <c:forEach items="${stlyeBook}" var="book" begin="12" end="15">
                            <li>
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                                <p style="height: 40px; overflow-y: hidden;width:85%">${book.bookShortDescribe}</p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
    </div>
    <div class="f2 srb area">
        <div class="tit titp">
            <s class="qyb"></s>
            <p>惊<br><br>鸿<br><br>收<br><br>入<br><br>榜</p>
        </div>
        <ul>
            <c:forEach items="${incomeBooks}" var="book">
            <li>
					<span>
						<a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank" class="book_cov">
                            <img src="<%=basePath%>${book.bookCover}"  class="lazyload_book_cover" alt="${book.bookName}" style="display: inline;">
                            <s class="lb">1</s>
                        </a>
					</span>
                <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a></h3>
            </li>
            </c:forEach>
        </ul>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>manChannelNeed/index.js"></script>

<!--内容 结束-->
<link type="text/css" rel="stylesheet" href="<%=basePath%>Css/global.css">
<link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">
<!--公共底部 开始-->
<div class="v1_foot" style="margin-top: 60px">

    <div class="aboutcompany">
        <p class="link"  style="margin-top: 60px">

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

<span class="gotop" id="btn_back_top" title="返回顶部" style="left: 1244.5px; display: none;"><img src="<%=basePath%>manChannelNeed/gotop.png" data-src="/static/images/common/gotop_hov.png" alt="返回顶部"></span>





</body></html>