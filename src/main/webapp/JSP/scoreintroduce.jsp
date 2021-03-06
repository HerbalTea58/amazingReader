
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>帮助中心_惊鸿书院</title>
    <meta name="description" content="惊鸿帮助中心">
    <meta name="keywords" content="帮助中心,惊鸿帮助中心">
    <meta name="robots" content="all">
    <meta name="googlebot" content="all">
    <meta name="baiduspider" content="all">
    <meta name="updatetime" content="">
    <meta name="renderer" content="webkit" />

    <script>
        var speedTimer = [],
            speedZero = new Date().getTime();
    </script>
    
<script>
    //遇到cookie tf=1的话留在本站，否则跳转移动站
    if (getCookie('tf') != 1) {
        //判断是以下设备后跳转到m站
        if (navigator.userAgent.match(/(iPhone|iPod|Android)/i)) {
            location.href = "//m.qidian.com"
        }
    }else {
        // M站设置了一年，这里fixed
        setCookie('tf', 1, 'qidian.com', '/', 0);
    }
    // start 防劫持
    //设置cookie
    function setCookie(name, value, domain, path, expires) {
        if(expires){
            expires = new Date(+new Date() + expires);
        }
        var tempcookie = name + '=' + escape(value) +
                ((expires) ? '; expires=' + expires.toGMTString() : '') +
                ((path) ? '; path=' + path : '') +
                ((domain) ? '; domain=' + domain : '');
        //Ensure the cookie's size is under the limitation
        if(tempcookie.length < 4096) {
            document.cookie = tempcookie;
        }
    }
    //获取cookie
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return (arr[2]);
        else
            return null;
    }
    //创建并发送请求
    function createSender(url){
        var img = new Image();
        img.onload = img.onerror = function(){
            img = null;
        };
        img.src = url;
    };
</script>

<link data-ignore="true" rel="shortcut icon" type="image/x-icon" href="//qidian.gtimg.com/qd/favicon/qd_icon.c443c.ico">
<link data-ignore="true" rel="Bookmark" type="image/x-icon" href="//qidian.gtimg.com/qd/favicon/qd_icon.c443c.ico">
    <link rel="icon" type="image/x-icon" href="../Images/log.png">
<link rel="stylesheet" data-ignore="true" href="../Css/ddecf.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/d41d8.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/popup7e.css">
<link rel="stylesheet" data-ignore="true" href="../Css/moudle37.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/channel.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/help.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/feb73.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
</head>
<body data-dynamic="true">
<div class="header-logo">
    <img src="../Picture/惊鸿图标.jpg" style="height: 40px;margin-top: 13px; margin-left:-55px" alt="logo" title="惊鸿书院">
</div>
<div class="header-logo">
    <img src="../Images/personal.png" style="height: 25px;margin-top: 23px; margin-left:0px" alt="logo" title="惊鸿书院个人中心"/>
</div>
<div class="wrap">
<div id="pin-nav" class="pin-nav-wrap need-search" data-l1="40">
    <div class="box-center cf">
        <div class="nav-list site-nav fl">
        </div>
        <div class="nav-list min-user fr">
            <ul>
                <li class="sign-in hidden">
                    <a href="" target="_blank" data-eid="qd_A65"><i id="nav-user-name"></i><span></span></a>
                    <div class="dropdown">
                        <a href="message.jsp" target="_blank" data-eid="qd_A66">消息(<i id="top-msg">0</i>)</a>
                        <a href="<%=basePath%>recharge/recharge.actio" target="_blank" data-eid="qd_A67">充值</a>
                        <a href="<%=basePath%>person/personal.action" target="_blank" data-eid="qd_A68">个人中心</a>
                        <a id="exit" href="javascript:" data-eid="qd_A70">退出</a>
                    </div>
                </li>
                <li class="line"></li>
            </ul>
        </div>
    </div>
</div>
    <div class="help-head">
        <div class="box-center help cf">
            <h2 class="lang">惊鸿帮助中心</h2>
            <div class="nav">
                <span class="active lang">用户指南</span><i>|</i><span><a class="lang" href="<%=basePath%>person/personal.action?readerId=${reader.readerId}">个人中心</a></span>
            </div>
        </div>
    </div>
    <div class="box-center help cf">
        <div class="lc">
            <div class="item reader">
                <ul>
                    <li><a class="" href="<%=basePath%>/reader/readerCommendTickets.action">推荐票</a></li>
                </ul>
    </div>
        </div>
        <div class="rc">
            <h1>积分值</h1>
            <div class="content">
                <ol>
<li><strong>&nbsp;积分值的定义<br /></strong>积分值是指用户通过在起点中文网的一些用户行为累计获取的积分凭证，越活跃的用户积分值越高。用户在使用起点部分功能（如投推荐票、发表书评等）需累积到一定经验值后方可使用。当用户的经验值累计到不同等级要求后，也可获得相应的升级奖励，如等级越高每天获赠的推荐票就越多。用户可登陆&ldquo;个人中心&rdquo;-&gt; &ldquo;经验值等级&rdquo;进入查看经验值。<img src="../Images/recharge1.png" alt="" width="700" height="290" /></li>
                    <li><strong>用户的升级奖励有内容</strong>
<p>推荐票奖励：当用户等级达到3级、13级和23级时，将获取1张额外推荐票。</p>
<table style="width: 557.5px;">
<tbody>
<tr style="height: 17px;">
<td style="width: 302.219px; height: 17px;">登录奖励</td>
<td style="width: 218.219px; height: 17px;">积分+5</td>
</tr>
<tr style="height: 17px;">
</tr>
<tr style="height: 17px;">
<td style="width: 302.219px; height: 17px;">书评区发帖</td>
<td style="width: 218.219px; height: 17px;">积分+10</td>
</tr>
<tr style="height: 17px;">
<td style="width: 302.219px; height: 17px;">投3张推荐票</td>
<td style="width: 218.219px; height: 17px;">积分+10</td>
</tr>
<tr style="height: 17px;">
<td style="width: 302.219px; height: 17px;">打赏1次</td>
<td style="width: 218.219px; height: 17px;">积分+10</td>
</tr>
<tr style="height: 17px;">
<td style="width: 302.219px; height: 17px;">登录奖励（VIP专属）</td>
<td style="width: 218.219px; height: 17px;">积分+10</td>
</tr>
<tr style="height: 17px;">
<td style="width: 302.219px; height: 17px;">打赏2次（VIP专属）</td>
<td style="width: 218.219px; height: 17px;">积分+20</td>
</tr>
</tbody>
</table>
</li>
<table style="width: 327.5px;">
</table>
<li>
<strong>积分等级对应表</strong>
<p>达到一定的积分。等级会提高，获得的优惠力度也会随之增加</p>
<table style="width: 557.5px;">
    <tr>
        <td>积分值（这个值以下的为一个等级)</td>
        <td>对应的等级</td>
    </tr>
    <c:forEach items="${scoreLevelInformationList}" var="scoreInformation">
        <tr>
            <td>${scoreInformation.scoreNum}</td>
            <td>${scoreInformation.scoreLevel}</td>
        </tr>
    </c:forEach>
</table>
<table style="width: 327.5px;">
</table>
</tbody>
</li>
</ol>
<p>&nbsp;</p>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
