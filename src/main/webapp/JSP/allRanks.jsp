<%--
  Created by IntelliJ IDEA.
  User: hxl
  Date: 2018/6/12
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>全部排行</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>

    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/global.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/mwpd.css">
    <script type="text/javascript" src="<%=basePath%>Scripts/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>Scripts/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Scripts/zypc.js"></script>
    <script >

       $("#${param.info}").addClass("selected");
        /*function choose() {
            alert(123);

            $(info).addClass(selected);
        }
      */
    </script>
</head>
<body>
<script type="text/javascript">var USER_IS_LOGIN = 0;</script>
<style>::-ms-clear, ::-ms-reveal{display: none;}</style><!--ie x号-->

<!--公共头部 开始-->
<div class="blankHead zwfl_head" >
    <div class="n1_header" style="box-shadow: none;">
        <div class="n1_header_wrap">
            <h1>
                <a href="#"><img src="<%=basePath%>Picture/惊鸿Logo透明底.png" style="height: 50px;padding-top: -30px;" alt="logo" title="惊鸿书院"></a>
            </h1>
            <div class="n1_headerR">
                <ul class="n1_nav">
                    <li ><a href="<%=basePath%>Reader/homePageShow.action">首页</a></li>
                    <li><a href="<%=basePath%>manChannel/detailInfo.action">男频</a></li>
                    <li class="current"><a href="<%=basePath%>reader/womanChannel.action">女频</a></li>
                    <li><a href="<%=basePath%>JSP/login_writer.jsp">作者专区</a></li>
                    <li><a href="#">排行榜</a><img src="<%=basePath%>Picture/new.png" alt="new"/></li>
                    <%--<li><a href="#">换肤</a><img src="<%=basePath%>Picture/new.png" alt="new"/></li>--%>
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
                    <!-- 将zypc.js完全注释掉了  去除登录按钮的url验证 -->
                    <!-- class="n1_login_beffor" id="unlogin_box" -->
                    <c:if test="${empty sessionScope.reader}">
                        <a href="<%=basePath%>JSP/login_reader.jsp"><span  style="display: block;">登录</span></a>
                    </c:if>
                    <c:if test="${not empty sessionScope.reader}">
                        <a href="<%=basePath%>person/personal.action"><span  style="display: block;float: left;margin-left: 10px;">${sessionScope.reader.readerNeckName}</span></a>
                        <a href="<%=basePath%>exit.action"><span  style="display: inline-block;float: left;margin-left: 10px;">退出</span></a>
                    </c:if>
                    <div class="n1_login_affer" id="login_box" style="display: none;">
                        <!--  <a href="http://www.ireader.com/index.php?ca=User.Index"><i></i><s></s></a> -->
                        <ul>
                            <li><a href="http://www.ireader.com/index.php?ca=User.Index" title="我的图书"><s class="myBook"></s>我的图书</a></li>
                            <li><a href="http://www.ireader.com/index.php?ca=Recharge_Sms.Index" title="充值"><s class="n1_recharge"></s>充值</a></li>
                            <li><a href="http://www.ireader.com/index.php?ca=Passport.Logout" title="退出登录"><s class="quit"></s>退出</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--公共头部 结束-->






<link type="text/css" rel="stylesheet" href="<%=basePath%>Css/rank02.css">

<!--内容部分 开始-->
<div class="content">
    <div class="bigTitle">
        <s></s>
        <h2>全部排行榜</h2>
    </div>
    <div class="rankList">
        <div class="littleTitle">
            <div class="dif_Area">
                <p class="dif_Area_Head"><s class="man"></s>男生</p>
                <p>
                                            <span>
                                                        <a onclick="choose()" id="1" class="<c:if test="${param.info == 1}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks1.action">推荐榜</a>
                         </span>
                    <span>
                            <b>|</b>                            <a onclick="choose()" id="2" class="<c:if test="${param.info == 2}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks2.action">热销榜</a>
                         </span>
                    <span>
                            <b>|</b>                            <a onclick="choose()" id="3" class="<c:if test="${param.info == 3}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks3.action">收藏榜</a>
                         </span>
                    <span>
                            <b>|</b>                            <a onclick="choose()" id="4" class="<c:if test="${param.info == 4}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks4.action">收入榜</a>
                         </span>
                    <span>
                            <b>|</b>                            <a onclick="choose()" id="5" class="<c:if test="${param.info == 5}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks5.action">新书榜</a>
                         </span>
                </p>

            </div>
            <div class="dif_Area">
                <p class="dif_Area_Head"><s class="woman"></s>女生</p>
                <p>
                                            <span>
                                                        <a onclick="choose()" id="6" class="<c:if test="${param.info == 6}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks6.action">推荐榜</a>
                         </span>
                    <span>
                            <b>|</b>                            <a onclick="choose()" id="7" class="<c:if test="${param.info == 7}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks7.action">热销榜</a>
                         </span>
                    <span>
                            <b>|</b>                            <a onclick="choose()" id="8" class="<c:if test="${param.info == 8}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks8.action">收藏榜</a>
                         </span>
                    <span>
                            <b>|</b>                            <a onclick="choose()" id="9" class="<c:if test="${param.info == 9}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks9.action">收入榜</a>
                         </span>
                    <span>
                            <b>|</b>                            <a onclick="choose()" id="10" class="<c:if test="${param.info == 10}">selected</c:if>" href="<%=basePath%>reader/rank/showRanks10.action">新书榜</a>
                         </span>
                </p>

            </div>
        </div>
        <div class="rankListCon">
            <ul id="rank_list_box">
                <li class="fisRow">
                    <p class="firCol">排名</p>
                    <p class="secCol">书名</p>
                    <p class="thiCol">作者</p>
                    <p class="fouCol">分类</p>
                    <p class="fivCol">读过</p>
                </li>
                <c:forEach items="${requestScope.bookList}" var="books" varStatus="status">
                    <c:choose>
                        <c:when test="${status.index<3}">
                            <li>
                                <p class="firCol">${status.index+1}</p>
                                <p class="secCol"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}" target="_blank">${books.bookName}</a></p>
                                <p class="thiCol">${books.writer.writerNeckName}</p>
                                <p class="fouCol">${books.styleName}</p>
                                <p class="fivCol">${books.clickTimes}</p>
                            </li>
                        </c:when>
                        <c:when test="${status.index>=3 and status.index<20}">
                                <li>
                                    <p class="firCol">${status.index+1}</p>
                                    <p class="secCol"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}" target="_blank">${books.bookName}</a></p>
                                    <p class="thiCol">${books.writer.writerNeckName}</p>
                                    <p class="fouCol">${books.styleName}</p>
                                    <p class="fivCol">${books.clickTimes}</p>
                                </li>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </ul>
          <%--  <p class="load" data-stop="0" data-page="1" data-total="5"><img src="Picture/load.gif" alt="">加载更多...</p>--%>
        </div>
    </div>
</div>

<!--内容部分 结束-->


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
<script>

    //加载更多书籍
    $(window).scroll(function (){
        var stop = $('.load').data('stop');
        var disTop = $('.load').offset().top;
        var scrollH = $('body').scrollTop();//滚动距离
        var getMore = disTop-scrollH;
        //console.log(disTop+ '  ' + scrollH + ' ' + window.screen.height);

        if($('.load').data('total')==1){
            $('.load').hide();
        }
        else if(getMore <= document.body.clientHeight-50 && stop == 0 &&$('.load').data('total')!=$('.load').data('page')) {
            stop++;
            $('.load').data('stop',stop);

            var page = $('.load').data('page');
            page++;
            $('.load').data('page', page);
            var total = $('.load').data('total');

            $.get("http://www.ireader.com/index.php?ca=bookrank.ranklistdata&pca=bookrank.ranklist&rankId=14877", {'page': page},
                function (html) {
                    $('#rank_list_box').append(html);
                    $('.load').data('stop',0);
                    if($('.load').data('total')==$('.load').data('page')){
                        $('.load').hide();
                    }
                }
            );

        }
    });
</script>


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
