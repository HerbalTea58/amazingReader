
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${writer.writerNeckName}全部作品_${writer.writerNeckName}作家主页_惊鸿书院</title>
<link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/common.0.80.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/mainHeader.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/index0.28.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/sprite.0.12.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/idnex.0.11.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    
<style>
	.author-header {
    min-height: 200px;
    color: #fff;
    background: #fff url(../Images/writerbak.png) center no-repeat;
        background-size: auto auto;
    background-size: cover;
	}
	.header-avatar-vip.author-darkblue {
    background: #4f10e0;
        background-color: rgb(79, 16, 224);
        background-image: none;
        background-repeat: repeat;
        background-attachment: scroll;
        background-clip: border-box;
        background-origin: padding-box;
        background-position-x: 0%;
        background-position-y: 0%;
        background-size: auto auto;
}
.header-avatar-vip {
    font-size: 12px;
    position: absolute;
    bottom: -8px;
    left: 50%;
    width: 34px;
    margin: 0 0 0 -17px;
    text-align: center;
    border-radius: 2px;
}
.header-avatar {
    text-align: center;
}
.author-header {
    color: #fff;
}
body {
    font-size: 14px;
    line-height: 20px;
    color: #3e3d43;
}
html {
    font-family: Helvetica,'PingFang SC','Source Han Sans CN','WenQuanYi Micro Hei','Microsoft YaHei',sans-serif;
}

</style>
</head>
<body class="author">
		<div class="personal-mheader">
        <div class="mheader-wrapper">
            <ul class="mheader-nav fl">
                <li class="mheader-nav-li mheader-logo">
                    <a href="<%=basePath%>Reader/homePageShow.action" target="_blank" class="mheader-nav-a mheader-logo-a">惊鸿书院<span class="mheader-arrow"></span></a>
                 
                </li>
                <li class="mheader-nav-li">
                    <a href="<%=basePath%>reader/searchBooks.action?keyWord=仙侠" class="mheader-nav-a" target="_blank">仙侠</a>
                </li>
                <li class="mheader-nav-li">
                    <a href="<%=basePath%>reader/searchBooks.action?keyWord=都市异能" class="mheader-nav-a" target="_blank">都市异能</a>
                </li>
                <li class="mheader-nav-li">
                    <a href="<%=basePath%>reader/searchBooks.action?keyWord=奇幻" class="mheader-nav-a" target="_blank">奇幻</a>
                </li>
                <li class="mheader-nav-li">
                    <a href="<%=basePath%>reader/searchBooks.action?keyWord=玄幻" class="mheader-nav-a" target="_blank">玄幻</a>
                </li>
             
                <li class="mheader-nav-li">
                    <a href="<%=basePath%>reader/searchBooks.action?keyWord=历史" class="mheader-nav-a" target="_blank">历史</a>
                </li>
                <li class="mheader-nav-li">
                    <a href="<%=basePath%>reader/searchBooks.action?keyWord=军事" class="mheader-nav-a" target="_blank">军事</a>
                </li>
                <li class="mheader-nav-li mheader-more">
                    <a href="javascript:;" class="mheader-nav-a">更多<span class="mheader-arrow"></span></a>
                    <ul class="mheader-drop">

                        <li>
                            <a href="<%=basePath%>reader/searchBooks.action?keyWord=游戏" target="_blank">游戏</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>reader/searchBooks.action?keyWord=科幻" target="_blank">科幻</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>reader/searchBooks.action?keyWord=竞技" target="_blank">竞技</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>reader/searchBooks.action?keyWord=灵异" target="_blank">灵异</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>reader/searchBooks.action?keyWord=武侠" target="_blank">武侠</a>
                        </li>
                       
                    </ul>
                </li>
            </ul>
            <ul class="mheader-nav fr">

                <li class="mheader-nav-li line"></li>
                
                <li class="mheader-nav-li mheader-login">
                    <a href="<%=basePath%>reader/userinformation.action?readerId=${reader.readerId}" target="_blank" class="mheader-nav-a"><span class="elNickName">${reader.readerNeckName}</span><span class="mheader-arrow"></span></a>
                    <ul class="mheader-drop">
                        <li>
                            <a href="javascript:;">消息<span class="elUnReadCnt"></span></a>
                        </li>
                        <li>
                            <a href="<%=basePath%>recharge/recharge.action" target="_blank" data-guid="854007726165" class="elNewToPay">充值</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>person/personal.action?">个人中心</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>exit.action" id="elLogOut">退出</a>
                        </li>
                    </ul>
                </li>
                <li class="mheader-nav-li">
                    <a href="<%=basePath%>bookshelf/searchbookshelf.action" class="mheader-nav-a mheader-shelf-a"><i class=""
                    ></i>我的书架</a>
                </li>
            </ul>
        </div>
    </div>
        <div class="">
    <div class="author-header" data-l1="2">
        <div class="author-header-wrapper">
            <div class="header-avatar">
                <img class="header-avatar-img"  src="../${writer.writerPortrait}" alt="${writer.writerNeckName}的头像">
                <span class="header-avatar-vip author-darkblue" style="width: 60px;margin-left: -30px;margin-top: 20px">${statu.statuName}</span>
            </div>
            <div class="header-msg">
                
                <h3>${writer.writerNeckName}<a class="header-msg-level icon icon-god-5" href="/author/light/4362096" title="level5" target="_blank">level3</a></h3>
                <div class="header-msg-desc">${writer.writerShortRecommend}</div>
                <div class="header-msg-data">
                    <span class="mr12">作品总数<strong class="header-msg-strong">${bookListlist}</strong></span><span class="ml12 mr12">累计字数<strong class="header-msg-strong">${total}</strong></span><span class="ml12 mr12"></span></div></span>
            </div>
        </div>
    </div>
    <div class="author-content-wrapper" data-l1="2">
      
        <div class="author-content">

            <h2 class="author-title">全部作品(${bookListlist})</h2>
            <ul class="author-work" data-l2="9">
                    <c:forEach items="${bookAndStyleList}" var="bookAndStyleList">
                    <li class="author-item">
                        <div class="author-item-time"><fmt:formatDate value="${bookAndStyleList.book.bookPushDateTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate> </div>
                        <a href="" target="_blank" class='author-item-book' data-eid="qd_M268"><img src="../${bookAndStyleList.book.bookCover}" srcset="//qidian.qpic.cn/qdbimg/349573/44173/300 2x" class='author-item-img' title="${bookAndStyleList.book.bookName}的封面"></a>
                        <div class="author-item-msg">
                            <div class="author-item-title"><a href="//book.qidian.com/info/44173" target="_blank" data-eid="qd_M269" data-bid="44173">${bookAndStyleList.book.bookName}</a></div>
                            <div class="author-item-coll"></div>
                            <div class="author-item-exp"><a href="http://xianxia.qidian.com" target="_blank">${bookAndStyleList.bookStyle.bookStyleName}</a><i class="author-item-line"></i><a href="//vipreader.qidian.com/chapter/44173/65807590" target="_blank">${bookAndStyleList.bookStatus.bookStatusName}</a><i class="author-item-line"></i>${bookAndStyleList.num}</div>
                            <div class="author-item-content" title="${bookAndStyleList.book.bookShortDescribe}">${bookAndStyleList.book.bookShortDescribe}</div>
                            <div class="author-item-update"><a href="" class="blue" target="_blank" title="《${bookAndStyleList.book.bookName}》完本免费看啦！">最近更新&nbsp;《${bookAndStyleList.book.bookName}》完本免费看啦！</a><span>&nbsp;&nbsp;·&nbsp;&nbsp;<fmt:formatDate value="${bookAndStyleList.book.bookPushDateTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></span></div>
                            <div class="author-item-button">
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${bookAndStyleList.book.bookId}" target="_blank" class="ui-button" data-eid="qd_M270" data-bid="44173">书籍详情</a><a href="javascript:;" class="ui-button ui-button-default elAddShelf" data-bid="44173" data-eid="qd_M271" title="加入书架">加入书架</a>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
            </ul>
        </div>
        <div class="go-top dn">
            <div class="go-top-wrap">
                <a href="#" class="icon-go-top bTips" title="返回顶部" ><i class="iconfont icon-backtop"></i></a>
            </div>
        </div>
    </div>
        </div>
            <div class="personal-footer">
                
                <div class="footer-menu">
                    <a href="//www.qidian.com/about/intro" target="_blank">关于惊鸿</a>
                    <a href="//www.qidian.com/about/contact" target="_blank">联系我们</a>
                    <a href="//join.book.qq.com/index.html" target="_blank">加入我们</a>
                    <a href="//www.qidian.com/help/index/2" target="_blank">帮助中心</a>
                    <a href="http://123.206.70.240/online/?cid=0&uid=10&code=0" class="commitAdvice" target="_blank">提交建议</a>

                </div>
                <div class="footer-copyright">
                    <p><a href="#" target="_blank">出版物经营许可证</a>京ICP备11008516号<a target="_blank">网络出版服务许可证（总）网出证（京）字第141号</a><a href="#" target="_blank">京ICP证090653号</a><a href="#"  target="_blank" ><img style="margin-right:5px; display:inline; vertical-align:middle; margin-top:-2px" src="Picture/web_record.png">京公网安备11010502030452</a></p>
                    <p>2018 All Rights Reserved  惊鸿科技股份有限公司 版权所有</p>
                </div>
            </div>
</body>
</html>
