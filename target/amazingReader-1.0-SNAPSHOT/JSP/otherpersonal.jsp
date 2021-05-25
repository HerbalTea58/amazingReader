
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页_个人中心_惊鸿书院</title>
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <link rel="icon" type="image/x-icon" href="../Images/log.png">
    
    <link rel="stylesheet" data-ignore="true" href="../Css/index.0.11.css" />
    <style>

        .header-avatar-vip.author-darkblue {
            background: #4f10e0;
            background-color: #0f9cd5;
            background-image: none;
            background-repeat: repeat;
            background-attachment: scroll;
            background-clip: border-box;
            background-origin: padding-box;
            background-position-x: 0%;
            background-position-y: 0%;
            background-size: auto auto;
            color: white;
            width: 70px;
            margin-left: -34px;
            margin-top: 70px;
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
<body class="homepage">
            <div class="personal-header" data-l1="1">
                <div class="header-wrapper">
                    <div class="header-logo">
                        <img src="../Picture/惊鸿图标.jpg" style="height: 40px;margin-top: 13px; margin-left:-55px" alt="logo" title="惊鸿书院">
                    </div>
                    <div class="header-logo">
                        <img src="../Images/personal.png" style="height: 25px;margin-top: 23px; margin-left:0px" alt="logo" title="惊鸿书院个人中心"/>
                    </div>
                    <ul class="header-nav">
                        <li class="header-nav-li">
                        	
                            <a href="<%=basePath%>person/personal.action?readerId=${reader.readerId}" class="header-nav-a active" accesskey="1" data-eid="qd_M01"><i class=""></i>我的首页</a>
                        </li>
                        <li class="header-nav-li" id="headerNav">
                            <a href="<%=basePath%>bookshelf/searchbookshelf.action" class="header-nav-a " accesskey="2" data-eid="qd_M02"><i class=""></i>我的书架</a>
                        </li>

                    </ul>
                    <a href="<%=basePath%>reader/otherReaderInformation.action?readerId=${reader.readerId}" id="headerLog" class="header-log" data-eid="qd_M06">

                        书友${reader.readerNeckName}
                        
                    </a>
                    <div class="header-goHome">
                        <a href="<%=basePath%>Reader/homePageShow.action" target="_blank" accesskey="5" data-eid="qd_M05">惊鸿首页</a>
                    </div>
                </div>
                <ul id="headerDropList" class="header-drop">
                    <li>
                        <a href="<%=basePath%>recharge/recharge.action" target="_blank" data-guid="854007726165" class="elNewToPay" data-eid="qd_M07">充值</a>
                    </li>
                    
                    <li>
                        <a href="<%=basePath%>/exit.action" id="elLoginOut" data-eid="qd_M11">退出</a>
                    </li>
                </ul>
            </div>
                
        <div class="qdp-wrapper">
               <div class="personal-sideBar" data-l1="2">
                    <ul class="sideBar-group">
                        <li class="active">
                        <a href="<%=basePath%>person/personal.action?readerId=${reader.readerId}" class="sideBar-list-a"><i class=""></i>首页</a>
                        </li>
                        </li>
                           <li class="" style="margin-top:50px">
                            <a href="<%=basePath%>reader/readerRecommendTicketsRecord.action" class="sideBar-list-a" data-eid="qd_M15"><i class=" "></i>我的票夹</a>
                        </li>

                        </li>
                        <li class="" style="margin-top:28px">
                            <a href="<%= basePath%>readercomment/Readercomments.action" class="sideBar-list-a" data-eid="qd_M15"><i class=""></i>我的书评</a>
                        </li>
                    </ul>
                    <ul class="sideBar-group">
                        <li class="">
                            <a href="<%=basePath%>score/personalscore.action" class="sideBar-list-a" data-eid="qd_M16"><i class=""></i>积分等级</a>
                        </li>
                    </ul>
                   <ul class="sideBar-group">

                       <li>
                           <a href="<%=basePath%>reader/readerSecurity.action" class="sideBar-list-a" target="_blank" data-eid="qd_M20"><i class=""></i>安全中心</a>
                       </li>
                   </ul>
                   <ul class="sideBar-group">

                       <li>
                           <a href="<%=basePath%>reader/readermoney.action" class="sideBar-list-a" target="_blank" data-eid="qd_M20"><i class=""></i>交易记录</a>
                       </li>
                   </ul>
                   <ul class="sideBar-group">
                       <li>
                           <a href="<%=basePath%>reader/readerRechargeRecord.action" class="sideBar-list-a" target="_blank" data-eid="qd_M20"><i class=""></i>充值记录</a>
                       </li>
                   </ul>
                </div>
    <div class="qdp-content home-content" data-l1="3" >
        <div class="home-user-wrapper qdp-border" data-l2="1" style="background-image:url(../Images/home-index-bg.0.2.png)">
            <div class="home-user-avatar" data-l3="1">
                <a href="<%=basePath%>reader/otherReaderInformation.action?readerId=${reader.readerId}" class="user-avatar-a"><img class="user-avatar-img" src="../${reader.readerPortrait}" alt="${reader.readerNeckName}的头像" data-eid="qd_M24"></a>
                <span class="header-avatar-vip author-darkblue">${statu.statuName}</span>
            </div>
            <div class="home-user" data-l3="1">
                <h3><a href="/setting" data-eid="qd_M25">${reader.readerNeckName}</a><a href="<%=basePath%>score/personalscore.action"  class="home-user-level" data-eid="qd_M26">Lv${readerLevel}</a></h3>
                <div class="home-user-safety">
                      <a href="javascript;;" target="_blank"/><div class="user-progress-wrapper">
                </div>
            </div>
        </div>
        <ul class="qdp-border home-msg-wrapper" data-l2="1">
            <li class="home-msg" data-l3="1" style="width:256px" >
                <div class="home-msg-title"><i class="iconfont icon-price yellow"></i><b>账户余额</b></div>
                <div class="home-msg-data"><a href="javascript:;" data-eid="qd_M30"><b class="home-msg-b">${reader.readerBalance}</b>惊鸿币</a></div>

            </li>
            <li class="home-msg" data-l3="2"  style="width:256px">
                <div class="home-msg-title"><i class="iconfont icon-piaojia green"></i><b>我的票夹</b></div>
                <div class="home-msg-data"><a href="javascript:;" data-eid="qd_M31"><b class="home-msg-b home-msg-num">${reader.readerRecommendTicket}</b>&nbsp;&nbsp;</span>推荐票</a></div>

            </li>
            <li class="home-msg" data-l3="2" style="width:256px">
                <div class="home-msg-title"><i class="iconfont icon-book blue"></i><b>我的书架</b></div>
                <div class="home-msg-data"><a href="javascript:;" data-eid="qd_M32"><b class="home-msg-b">${readerBookRelation}</b>本藏书</a></div>

            </li>
        </ul>
        <form id="addToShelfForm" action="" class="shelf-recmd qdp-border" method="post" data-l2="1">
            <h2 class="shelf-title">猜ta喜欢</h2>
            <ul class="recmd-list ui-loading" id="elRecList" style="height: 197px;" data-l3="4">
            <c:forEach items="${bookList1}" var="book" begin="0" end="5">
                <li class="recmd-list-item">
                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" class="recmd-list-a" data-eid="qd_M42" data-bid="2248950">
                        <div class="recmd-commet">${book.bookShortDescribe}...</div>
                        <img src="../${book.bookCover}" alt="${book.bookCover}" class="recmd-list-img">
                        <div class="recmd-list-title" data-eid="qd_M41" data-bid="2248950">${book.bookName}</div>
                    </a>
                    <div class="recmd-list-data" title="猜ta喜欢">猜ta喜欢</div>
                </li>
            </c:forEach>
            </ul>
        </form>
    </div>
            <div class="go-top dn">
                <div class="go-top-wrap">
                    <a href="#" class="icon-go-top bTips" title="返回顶部" ><i class="iconfont icon-backtop"></i></a>
                </div>
            </div>
        </div>
        </div>
</body>
</html>
