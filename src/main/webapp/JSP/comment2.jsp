
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的书评_个人中心_惊鸿书院</title>
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <link rel="icon" type="image/x-icon" href="../Images/log.png">
<link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css" >
<link rel="stylesheet" data-ignore="true" href="../Css/common.0.80.css">
<link rel="stylesheet" data-ignore="true" href="../Css/idnex.0.11.css">
<link rel="stylesheet" data-ignore="true" href="../Css/index.0.3.css">
<link rel="stylesheet" data-ignore="true" href="../Css/sprite.0.12.css">
<link rel="stylesheet" data-ignore="true" href="../Css/emoji.0.2.css">


    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script>document.domain ='qidian.com';</script>
    <script>var speedTimer = [], speedZero = new Date().getTime();</script>
</head>
<body class="bookcomment">
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
                        
                        <li class="active">
                            <a href="<%= basePath%>readercomment/Readercomments.action" class="sideBar-list-a" data-eid="qd_M15"><i class="t "></i>我的书评</a>
                        </li>
                    </ul>
                    <ul class="sideBar-group">
                        <li class="">
                            <a href="<%=basePath%>score/personalscore.action" class="sideBar-list-a" data-eid="qd_M16"><i class=" "></i>积分等级</a>
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
        <div class="qdp-content" data-l1="3">
            <h2 class="qdp-title">我的书评</h2>
            <div class="review-record qdp-record" data-l2="5">
                <div id="tabView" class="ui-tab-tabs">
                    <a href="javascript:;"class="checked" id="tabTarget3" data-eid="qd_M72">我发表的</a>
                    <a href="javascript:;"  id="tabTarget1" data-eid="qd_M72">我回复的</a>
                    <a href="javascript:;" id="tabTarget2" class="" data-eid="qd_M73" onclick="updateStatus()">回复我的<span class="badge" style="float:right;position: relative;border:none;background-color: red;color: white;height: 1.5em; text-align: center; width:1.5em;line-height: 1.5em;border-radius: 15px;" id="toReadMsgNum"></span></a>
                </div>
                <div class="ui-tab-contents">
                    <div id="tab1" class="ui-tab-content " data-l3="13">
                        <div id="tableTarget1" class="table-x">
                            <div class="table-size">
                                <table class="ui-table">
                                      <tr>
                                        <th scope="col" width="100">回复内容</th>
                                        <th scope="col" width="70">我回复的用户</th>
                                        <th scope="col" width="70">书籍名</th>
                                        <th scope="col" width="50">章节名</th>
                                        <th scope="col" width="90">回复时间</th>
                                      </tr>
                                    <c:forEach items="${commentabminList}" var="commentbain">
                                        <tr>
                                            <td><a href="<%=basePath%>comment/comments.action?tId=${commentbain.commentTid}">${commentbain.commentContent}</a></td>
                                            <td><a href="<%=basePath%>person/Otherpersonal.action?readerId=${commentbain.replyreader.readerId}">${commentbain.replyreader.readerNeckName}</a></td>
                                            <td><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${commentbain.book.bookId}">${commentbain.book.bookName}</a></td>
                                            <td><a href="<%=basePath%>comment/chapterComment.action?chapterId=${commentbain.commentChapter.chapterId}">${commentbain.commentChapter.chapterName}</a></td>
                                            <td>
                                                <fmt:formatDate value="${commentbain.commentPushDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <div class="table-null-x dn">目前暂无发表的书评</div>
                                <div class="ui-loading"><i class="ui-loading-icon"></i></div>
                             </div>
                             <div class="table-page-x elTablePage">
                                 <div class="table-page"></div>
                             </div>
                        </div>
                    </div>
                    <div id="tab2" class="ui-tab-content" data-l3="13">
                        <div id="tableTarget2" class="table-x">
                            <div class="table-size">
                                <table class="ui-table">
                                    <tr>
                                        <th scope="col" width="100">回复内容</th>
                                        <th scope="col" width="40">回复我的用户</th>
                                        <th scope="col" width="60">书籍名</th>
                                        <th scope="col" width="50">章节名</th>
                                        <th scope="col" width="90">回复时间</th>
                                    </tr>
                                    <c:forEach items="${commentabminList1}" var="commentbain">
                                        <tr>
                                            <td id="${commentbain.commentId}" class="td1"><a href="<%=basePath%>comment/comments.action?tId=${commentbain.commentTid}">${commentbain.commentContent}</a></td>
                                            <td><a href="<%=basePath%>person/Otherpersonal.action?readerId=${commentbain.replyreader.readerId}"> ${commentbain.replyreader.readerNeckName}</a></td>
                                            <td><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${commentbain.book.bookId}">${commentbain.book.bookName}</a></td>
                                            <td><a href="<%=basePath%>comment/chapterComment.action?chapterId=${commentbain.commentChapter.chapterId}">${commentbain.commentChapter.chapterName}</a> </td>
                                            <td>
                                                <fmt:formatDate value="${commentbain.commentPushDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <div class="table-null-x dn">目前暂无发表的书评</div>
                                <div class="ui-loading"><i class="ui-loading-icon"></i></div>
                            </div>
                            <div class="table-page-x elTablePage">
                                <div class="table-page"></div>
                            </div>
                        </div>
                    </div>

                    <div id="tab3" class="ui-tab-content checked" data-l3="13">
                        <div id="tableTarget3" class="table-x">
                            <div class="table-size">
                                <table class="ui-table">
                                    <tr>
                                        <th scope="col" width="70">发表内容</th>
                                        <th scope="col" width="50">书籍名</a> </th>
                                        <th scope="col" width="50">章节名</th>
                                        <th scope="col" width="70">发表时间</th>
                                    </tr>
                                    <c:forEach items="${commentabminList2}" var="commentbain">
                                        <tr>
                                            <td > <a href="<%=basePath%>comment/comments.action?tId=${commentbain.commentTid}"> ${commentbain.commentContent}</a></td>
                                            <td><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${commentbain.book.bookId}">${commentbain.book.bookName}</a> </td>
                                            <td><a href="<%=basePath%>comment/chapterComment.action?chapterId=${commentbain.commentChapter.chapterId}">${commentbain.commentChapter.chapterName}</a></td>
                                            <td>
                                                <fmt:formatDate value="${commentbain.commentPushDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <div class="table-null-x dn">目前暂无发表的书评</div>
                                <div class="ui-loading"><i class="ui-loading-icon"></i></div>
                            </div>
                            <div class="table-page-x elTablePage">
                                <div class="table-page"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        </div>
            <div class="personal-footer">
                
                <div class="footer-menu">
                    <a href="" target="_blank">关于惊鸿</a>
                    <a href="" target="_blank">联系我们</a>
                    <a href="" target="_blank">加入我们</a>
                    <a href="" target="_blank">帮助中心</a>
                    <a href="" class="commitAdvice" target="_blank">提交建议</a>
                </div>
                <div class="footer-copyright">
                    <p>Copyright (C) 2002-2018 www.qidian.com All Rights Reserved 版权所有 </p>
                    <p>上海玄霆娱乐信息科技有限公司 上海玄霆娱乐信息科技有限公司 增值电信业务经营许可证沪B2-20080046 沪网文[2017]0081-031 新出网证(沪)字010 沪ICP备08017520号-1</p>
                    <p>请所有作者发布作品时务必遵守国家互联网信息管理办法规定，我们拒绝任何色情小说，一经发现，即作删除！</p>
                    <p>本站所收录作品、社区话题、书库评论及本站所做之广告均属其个人行为，与本站立场无关</p>
                </div>
            </div>
</body>
<script>
    $("#tabTarget3").click(function () {
        $(this).addClass("checked");
        $(this).siblings().removeClass("checked");
        $("div#tab3").addClass("checked");
        $("div#tab3").siblings().removeClass("checked");
    })
    $("#tabTarget2").click(function () {
        $(this).addClass("checked");
        $(this).siblings().removeClass("checked");
        $("div #tab2").addClass("checked");
        $("div #tab2").siblings().removeClass("checked");
    })
    $("#tabTarget1").click(function () {
        $(this).addClass("checked");
        $(this).siblings().removeClass("checked");
        $("div #tab1").addClass("checked");
        $("div #tab1").siblings().removeClass("checked");
    })
   function updateStatus() {
       $(".td1").each(function () {
          var comment=$(this).attr("id")
           $.ajax({
               type:"POST",
               url:"<%=basePath%>comment/updateCommentStatus.action",
               data:"commentIdlist="+comment,
               success:function (data) {

               },
               error:function () {
                   alert("出错了！！！")
               }

           })
       })
   }

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
</html>
