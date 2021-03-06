<%@ page import="javax.swing.plaf.basic.BasicEditorPaneUI" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--<link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">--%>
    <%--<link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap/js/bootstrap.min.js">--%>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script src="<%=basePath%>layui/layui.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/global.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">

    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/homePageindex.css">


    <script type="text/javascript" src="<%=basePath%>Scripts/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>Scripts/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Scripts/zypc.js"></script>

    <title>惊鸿书院</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>

</head>

<body id="body">
<script type="text/javascript">var USER_IS_LOGIN = 0;</script>
<style>::-ms-clear, ::-ms-reveal{display: none;}
.skin0{

}
 .skin1{
     background-image: url("<%=basePath%>image/skin/skin1.jpg");


 }
.skin2{
    background-image: url("<%=basePath%>image/skin/skin2.jpg");
}
.skin3{
    background-image: url("<%=basePath%>image/skin/skin3.jpg");
}
.skin4{
    background-image: url("<%=basePath%>image/skin/skin4.jpg");
}
</style>
<script>
    skin1(${sessionScope.bgColor});
    function skin1(index) {
        $("#body").removeClass();
        $(".n1_header").attr("background","center");
        $("#body").addClass("skin"+index);

        $.ajax({
            url:'<%=basePath%>Reader/changeSkin.action?index='+index,
            success:function () {

            }

        })
    }
    function changeSkin() {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.tab({
                area: ['600px', '300px'],
                tab: [{
                    title: '清凉一夏',
                    content:
                        '<img style="weight:480px; height:192px;" src="<%=basePath%>image/skin/skin1.jpg"> <p float:right><button onClick="skin1(1)" type="button">换肤</button> <button onClick="skin1(0)" type="button">&nbsp;&nbsp;&nbsp;&nbsp;回到默认</button>'

                }, {
                    title: '各类人物',
                    content: '<img style="weight:480px; height:180px;" src="<%=basePath%>image/skin/skin3.jpg">   <p float:right><button onClick="skin1(3)" type="button">换肤</button> <button onClick="skin1(0)" type="button">&nbsp;&nbsp;&nbsp;&nbsp;回到默认</button></p>'
                }]
                ,anim: 4
            });
        })
    }
    

</script>

<!--公共头部 开始-->
<div class="blankHead zwfl_head" >
    <div class="n1_header" id="n1_header" style="box-shadow: none;">
        <div class="n1_header_wrap">
            <h1>
                <a href="#"><img src="<%=basePath%>Picture/惊鸿Logo透明底.png" style="height: 50px;padding-top: -30px;" alt="logo" title="惊鸿书院"></a>
            </h1>
            <div class="n1_headerR">
                <ul class="n1_nav">
                    <li class="current"><a href="<%=basePath%>Reader/homePageShow.action">首页</a></li>
                    <li><a href="<%=basePath%>manChannel/detailInfo.action">男频</a></li>
                    <li ><a href="<%=basePath%>reader/womanChannel.action">女频</a></li>
                    <li><a href="<%=basePath%>JSP/login_writer.jsp">作者专区</a></li>
                    <li><a href="<%=basePath%>reader/rank/showRanks1.action">排行榜</a><img src="<%=basePath%>Picture/new.png" alt="new"/></li>
                   <%-- <li><a href="#" onclick="changeSkin()">换肤</a><img src="<%=basePath%>Picture/new.png" alt="new"/></li>--%>
                    <li><a href="#">更多</a></li>
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





<!--轮播图 开始-->
<div class="recom">
    <div class="recomWrap">
        <c:forEach var="topBook1" items="${requestScope.bookList0}" varStatus="status">
            <c:choose>
                <c:when test="${status.index==0}">
                    <div class="title" id="recommend_book_current_book">
                        <h2>
                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${topBook1.bookId}" target="_blank" title="${topBook1.bookName}">
                                <i>${topBook1.bookName}</i>
                            </a>
                        </h2>
                        <p>${topBook1.bookShortDescribe}</p>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>

        <div class="book" id="recommend_book_lunbo">
            <div class="book_wrap">
                <ul id="recommend_book_lunbo_ul">
                    <c:forEach var="topBook1" items="${requestScope.bookList0}">
                        <li class="little">
                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${topBook1.bookId}"
                               target="_blank" title="${topBook1.bookName}">
                                <img src="<%=basePath%>${topBook1.bookCover}" title="${topBook1.bookName}" class="lazy"/>
                            </a>
                            <span style="display: none;">${topBook1.bookShortDescribe}</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <s class="btnLeft" data-btn="prev" title="往上翻"></s>
            <s class="btnRight" data-btn="next" title="往下翻"></s>
            <ol></ol>
            <script type="text/javascript">$('.recom').bind('selectstart', function () {return false;});</script>
        </div>
    </div>
</div>
<!--轮播图 结束-->



<!--内容 开始-->
<div class="content">
    <c:if test="${not empty sessionScope.reader}">
    <!--猜你喜欢 开始 -->
    <div class="dif_Area">
        <div class="conBigTitle" style="margin-bottom: 0;" >
            <h2>猜你喜欢</h2>
        </div>
        <div class="show" style="margin-top: 3px;padding-top: 0;">
            <s class="sign"></s>
            <c:forEach items="${requestScope.booList}" var="book">
                <c:choose>
                    <c:when test="${book.readerNum==1}">
                        <div class="showLeft">
                            <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a></h3>
                            <p class="author">作者:${book.writer.writerNeckName}</p>
                            <p class="introduce">${book.bookShortDescribe}</p>
                            <span>
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" title="${book.bookName}">
                                    <img src="<%=basePath%>${book.bookCover}" title="${book.bookName}" alt="${book.bookName}" class="bookCover lazy">
                                </a>
                                <img src="<%=basePath%>Picture/shadow.gif" alt="${book.bookName}" class="shadow">
                            </span>
                        </div>
                        <ul class="showMid">
                    </c:when>

                    <c:when test="${book.readerNum >1 and book.readerNum <5}">
                        <li>
                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" title="${book.bookName}">
                                <img src="<%=basePath%>${book.bookCover}" title="${book.bookName}" alt="${book.bookName}" class="lazy">
                            </a>
                            <p class="bookName">
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                            </p>
                            <p>${book.writer.writerNeckName}</p>
                        </li>
                    </c:when>

                    <c:when test="${book.readerNum >1 and book.readerNum == 5}">
                        <li>
                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" title="${book.bookName}">
                                <img src="<%=basePath%>${book.bookCover}" title="${book.bookName}" alt="${book.bookName}" class="lazy">
                            </a>
                            <p class="bookName">
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                            </p>
                            <p>${book.writer.writerNeckName}</p>
                        </li>
                        </ul>
                        <div class="showRight">
                        <h3><s class="crown"></s><a href="#" target="_blank">更多推荐</a></h3>
                        <ul>
                    </c:when>

                    <c:when test="${book.readerNum==6}">
                        <li class="onshow">
                            <dl class="close">
                                <dt>${book.readerNum-5}</dt>
                                <dd>
                                            <span class="bookName">
                                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                                            </span>
                                    <span class="num"><s></s>${book.clickTimes}</span>
                                </dd>
                            </dl>
                            <dl class="open">
                                <dt>${book.readerNum-5}</dt>
                                <dd>
                                    <div>
                                                <span class="bookPic">
                                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" title="${book.bookName}">
                                                        <img src="<%=basePath%>${book.bookCover}" title="${book.bookName}" alt="${book.bookName}" class="lazy"/>
                                                    </a>
                                                </span>
                                        <div class="bookCon">
                                            <p>
                                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                                            </p>
                                            <span class="num"><s></s>${book.clickTimes}</span>
                                        </div>
                                    </div>
                                </dd>
                            </dl>
                        </li>

                    </c:when>
                    <c:when test="${book.readerNum==16}">
                        </ul>
                        </div>
                    </c:when>
                    <c:when test="${book.readerNum<=15 and book.readerNum>6}">
                        <li class="">
                            <dl class="close">
                                <dt>${book.readerNum-5}</dt>
                                <dd>
                                            <span class="bookName">
                                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                                            </span>
                                    <span class="num"><s></s>${book.clickTimes}</span>
                                </dd>
                            </dl>
                            <dl class="open">
                                <dt>${book.readerNum-5}</dt>
                                <dd>
                                    <div>
                                                <span class="bookPic">
                                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" title="${book.bookName}">
                                                        <img src="<%=basePath%>${book.bookCover}" title="${book.bookName}" alt="${book.bookName}" class="lazy"/>
                                                    </a>
                                                </span>
                                        <div class="bookCon">
                                            <p>
                                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank">${book.bookName}</a>
                                            </p>
                                            <span class="num"><s></s>${book.clickTimes}</span>
                                        </div>
                                    </div>
                                </dd>
                            </dl>
                        </li>


                    </c:when>

                </c:choose>
            </c:forEach>

        </div>
    </div>
    <!--猜你喜欢 结束-->
    </c:if>
    <!--男生频道 开始-->
    <div class="dif_Area">
        <div class="conBigTitle">
            <h2>男生频道</h2>
            <p>
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=玄幻" target="_blank">玄幻</a>|
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=奇幻" target="_blank">奇幻</a>|
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=武侠" target="_blank">武侠</a>|
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=仙侠" target="_blank">仙侠</a>|
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=玄幻" target="_blank">更多</a>
            </p>
        </div>
        <div class="show">
            <s class="sign"></s>

            <div class="showLeft">
                <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.manListLeft.bookId}" title="${requestScope.manListLeft.bookName}" target="_blank">${requestScope.manListLeft.bookName}</a></h3>
                <p class="author">作者: ${requestScope.manListLeft.writer.writerNeckName}</p>
                <p class="introduce">${requestScope.manListLeft.bookShortDescribe}</p>
                <span>
                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.manListLeft.bookId}" target="_blank" title="${requestScope.manListLeft.bookName}">
                        <img src="<%=basePath%>${requestScope.manListLeft.bookCover}" title="${requestScope.manListLeft.bookName}" alt="${requestScope.manListLeft.bookName}" class="bookCover lazy">
                    </a>
                    <img src="<%=basePath%>Picture/shadow.gif" alt="${requestScope.manListLeft.bookName}" class="shadow">
                </span>
            </div>
            <ul class="showMid">
                <c:forEach items="${requestScope.manListMid}" var="man2">
                    <li >
                        <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${man2.bookId}" title="${man2.bookName}" target="_blank">${man2.bookName}</a></h3>
                        <p class="name">
                            <i>${man2.writer.writerNeckName}</i>
                            <!--<span>东方玄幻</span>-->
                        </p>
                        <p class="introduce">${man2.bookShortDescribe}</p>
                    </li>
                </c:forEach>


            </ul>
            <div class="showRight">
                <h3><s class="crown"></s><a href="<%=basePath%>reader/showRanks2.action" target="_blank">热销榜</a></h3>
                <ul>
                <c:forEach var="man3" items="${requestScope.manHotList}">
                    <c:choose>
                        <c:when test="${man3.readerNum==1}">
                            <li class="onShow">
                                <dl class="close">
                                    <dt>${man3.readerNum}</dt>
                                    <dd>
                                <span class="bookName">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${man3.bookId}" title="${man3.bookName}" target="_blank">${man3.bookName}</a>
                                </span>
                                        <span class="num"><s></s>${man3.clickTimes}</span>
                                    </dd>
                                </dl>
                                <dl class="open">
                                    <dt>${man3.readerNum}</dt>
                                    <dd>
                                        <div>
                                    <span class="bookPic">
                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${man3.bookId}" target="_blank" title="${man3.bookName}">
                                            <img src="<%=basePath%>${man3.bookCover}" title="${man3.bookName}" alt="${man3.bookName}" class="lazy"/>
                                        </a>
                                    </span>
                                            <div class="bookCon">
                                                <p>
                                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${man3.bookId}" title="${man3.bookName}" target="_blank">${man3.bookName}</a>
                                                </p>
                                                <span class="num"><s></s>${man3.clickTimes}</span>
                                            </div>
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                        </c:when>
                        <c:when test="${man3.readerNum<=10}">
                            <li>
                                <dl class="close">
                                    <dt>${man3.readerNum}</dt>
                                    <dd>
                                <span class="bookName">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${man3.bookId}" title="${man3.bookName}" target="_blank">${man3.bookName}</a>
                                </span>
                                        <span class="num"><s></s>${man3.clickTimes}</span>
                                    </dd>
                                </dl>
                                <dl class="open">
                                    <dt>${man3.readerNum}</dt>
                                    <dd>
                                        <div>
                                    <span class="bookPic">
                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${man3.bookId}" target="_blank" title="${man3.bookName}">
                                            <img src="<%=basePath%>${man3.bookCover}" title="${man3.bookName}" alt="${man3.bookName}" class="lazy"/>
                                        </a>
                                    </span>
                                            <div class="bookCon">
                                                <p>
                                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${man3.bookId}" title="${man3.bookName}" target="_blank">${man3.bookName}</a>
                                                </p>
                                                <span class="num"><s></s>${man3.clickTimes}</span>
                                            </div>
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!--男生频道 结束-->

    <!--女生频道 开始-->
    <div class="dif_Area">
        <div class="conBigTitle">
            <h2>女生频道</h2>
            <p>
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=现代言情" target="_blank">现代言情</a>|
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=古代言情" target="_blank">古代言情</a>|
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=幻想言情" target="_blank">幻想言情</a>|
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=青春校园" target="_blank">青春校园</a>|
                <a href="<%=basePath%>reader/searchBooks.action?keyWord=现代言情" target="_blank">更多</a>
            </p>
        </div>
        <div class="show">
            <s class="sign"></s>
            <div class="showLeft">
                <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.womanListLeft.bookId}" title="${requestScope.womanListLeft.bookName}" target="_blank">${requestScope.womanListLeft.bookName}</a></h3>
                <p class="author">作者: ${requestScope.womanListLeft.writer.writerNeckName}</p>
                <p class="introduce">${requestScope.womanListLeft.bookShortDescribe}</p>
                <span>
                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.womanListLeft.bookId}" target="_blank" title="${requestScope.womanListLeft.bookName}">
                        <img src="<%=basePath%>${requestScope.womanListLeft.bookCover}" title="${requestScope.womanListLeft.bookName}" alt="${requestScope.womanListLeft.bookName}" class="bookCover lazy">
                    </a>
                    <img src="<%=basePath%>Picture/shadow.gif" alt="${requestScope.womanListLeft.bookName}" class="shadow">
                </span>
            </div>
            <ul class="showMid">
                <c:forEach items="${requestScope.womanListMid}" var="woman2">
                    <li >
                        <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${woman2.bookId}" title="${woman2.bookName}" target="_blank">${woman2.bookName}</a></h3>
                        <p class="name">
                            <i>${woman2.writer.writerNeckName}</i>
                            <!--<span>东方玄幻</span>-->
                        </p>
                        <p class="introduce">${woman2.bookShortDescribe}</p>
                    </li>
                </c:forEach>


            </ul>
            <div class="showRight">
                <h3><s class="crown"></s><a href="<%=basePath%>reader/showRanks7.action" target="_blank">热销榜</a></h3>
                <ul>
                    <c:forEach var="woman3" items="${requestScope.womanHotList}">
                        <c:choose>
                            <c:when test="${woman3.readerNum==1}">
                                <li class="onShow">
                                    <dl class="close">
                                        <dt>${woman3.readerNum}</dt>
                                        <dd>
                                <span class="bookName">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${woman3.bookId}" title="${woman3.bookName}" target="_blank">${woman3.bookName}</a>
                                </span>
                                            <span class="num"><s></s>${woman3.clickTimes}</span>
                                        </dd>
                                    </dl>
                                    <dl class="open">
                                        <dt>${woman3.readerNum}</dt>
                                        <dd>
                                            <div>
                                    <span class="bookPic">
                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${woman3.bookId}" target="_blank" title="${woman3.bookName}">
                                            <img src="<%=basePath%>${woman3.bookCover}" title="${woman3.bookName}" alt="${woman3.bookName}" class="lazy"/>
                                        </a>
                                    </span>
                                                <div class="bookCon">
                                                    <p>
                                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${woman3.bookId}" title="${woman3.bookName}" target="_blank">${woman3.bookName}</a>
                                                    </p>
                                                    <span class="num"><s></s>${woman3.clickTimes}</span>
                                                </div>
                                            </div>
                                        </dd>
                                    </dl>
                                </li>
                            </c:when>
                            <c:when test="${woman3.readerNum<=10}">
                                <li>
                                    <dl class="close">
                                        <dt>${woman3.readerNum}</dt>
                                        <dd>
                                <span class="bookName">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${woman3.bookId}" title="${woman3.bookName}" target="_blank">${woman3.bookName}</a>
                                </span>
                                            <span class="num"><s></s>${woman3.clickTimes}</span>
                                        </dd>
                                    </dl>
                                    <dl class="open">
                                        <dt>${woman3.readerNum}</dt>
                                        <dd>
                                            <div>
                                    <span class="bookPic">
                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${woman3.bookId}" target="_blank" title="${woman3.bookName}">
                                            <img src="<%=basePath%>${woman3.bookCover}" title="${woman3.bookName}" alt="${woman3.bookName}" class="lazy"/>
                                        </a>
                                    </span>
                                                <div class="bookCon">
                                                    <p>
                                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${woman3.bookId}" title="${woman3.bookName}" target="_blank">${woman3.bookName}</a>
                                                    </p>
                                                    <span class="num"><s></s>${woman3.clickTimes}</span>
                                                </div>
                                            </div>
                                        </dd>
                                    </dl>
                                </li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>


        </div>
    </div>
    <!--女生频道 结束-->

</div>
<p/>
<p/>
<p/>
<script type="text/javascript" src="<%=basePath%>Scripts/index.js"></script>
<p/>
<p/>
<p/>
<!--公共底部 开始-->
<div class="v1_foot" style="margin-top: 60px">

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


<!--返回顶部 结束-->
<span class="goTop" id="btn_back_top" style="display: none;"><img src="Picture/go_top.png" alt="返回顶部"></span>
<!--返回顶部 结束-->

<script type="text/javascript">
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?2583df02aa8541db9378beae2ed00ba0";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);

        var bp = document.createElement('script');
        bp.src = '//push.zhanzhang.baidu.com/push.js';
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>

</body>
</html>
