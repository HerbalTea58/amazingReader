


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
    <title>经验值_个人中心_惊鸿书院</title>
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <link rel="icon" type="image/x-icon" href="../Images/log.png">
    
<link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css" />
<link rel="stylesheet" data-ignore="true" href="../Css/common.0.80.css" />
<link rel="stylesheet" data-ignore="true" href="../Css/index.0.21.css" />
<link rel="stylesheet" data-ignore="true" href="../Css/idnex.0.11.css" />
<link rel="stylesheet" data-ignore="true" href="../Css/sprite.0.12.css" />
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script>var speedTimer = [], speedZero = new Date().getTime();</script>
</head>
<body class="level">
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
                            <a href="<%=basePath%>person/personal.action" class="header-nav-a active" accesskey="1" data-eid="qd_M01"><i class=""></i>我的首页</a>
                        </li>
                        <li class="header-nav-li" id="headerNav">
                            <a href="<%=basePath%>bookshelf/searchbookshelf.action" class="header-nav-a " accesskey="2" data-eid="qd_M02"><i class=""></i>我的书架</a>
                        </li>

                       
                    </ul>
                    <a href="<%=basePath%>reader/userinformation.action?readerId=${reader.readerId}" id="headerLog" class="header-log" data-eid="qd_M06">

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
                        <li class="">
                        <a href="<%=basePath%>person/personal.action" class="sideBar-list-a"><i class=""></i>首页</a>
                        </li>
                       
                        <li class="">
                            <a href="<%=basePath%>reader/readerRecommendTicketsRecord.action" class="sideBar-list-a" data-eid="qd_M13"><i class="  "></i>我的票夹</a>
                        </li>
                       
                        <li class="">
                            <a href="<%= basePath%>readercomment/Readercomments.action" class="sideBar-list-a" data-eid="qd_M15"><i class=""></i>我的书评</a>
                        </li>
                    </ul>
                    <ul class="sideBar-group">
                        <li class="active">
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
    <div class="qdp-content" data-l1="3" >
        <h2 class="qdp-title">积分等级</h2>
        <div class="qdp-border exp-level-bg" data-l2="6" style="padding-top:5px">
        	
            <h3 class="exp-level-logo">积分等级</h3>
            <div class="exp-level exp-level-border" data-l3="17" style="margin:10px 98px">
            	<div>
                	<img src="../Images/star.png" style="margin:-20px -90px "/>
                </div>
                <div class="exp-level-title" style="margin:-40px 30px ">当前等级&nbsp;&nbsp;Lv${scorelevel}</div>
                <div style="margin:35px 30px">
                    <span class="mr12">当前<strong class="dark mlr4">${score}</strong>积分值</span><span class="ml12">升到下一级还需 <strong class="dark mlr4"> ${scoreLevelInformationnext.scoreNum-score}</strong>积分</span>
                </div>
            </div>
            <div class="exp-level" data-l3="17" style="margin-top:-10px" >
                <div class="exp-level-title" style="margin:6px 10px" >当前特权</div>
                <div><span class="mr12" style="margin:-100px 10px">暂无</span><a href="<%=basePath%>score/scoreintroduce.action" class="blue ml12" target="_blank">了解积分等级特权»</a></div>
            </div>
        </div>
    <script id="tplDialogTask" type="text/ejs-template">
    
    </script>

    <script id="tplGetTool" type="text/ejs-template">
    
    </script>
            <div class="go-top dn">
                <div class="go-top-wrap">
                    <a href="#" class="icon-go-top bTips" title="返回顶部" ><i class="iconfont icon-backtop"></i></a>
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
                    <!-- <a href="//wwwploy.qidian.com/help/about_link.aspx" target="_blank">合作伙伴</a> -->
                    <!-- <a href="//bbs.qidian.com" target="_blank">起点论坛</a> -->
                    <!-- <a href="//webgame.qidian.com/jiazhang.html" target="_blank">家长监护工程</a> -->
                </div>
            </div>
            </div>

</body>
</html>
