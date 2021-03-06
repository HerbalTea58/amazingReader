
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
    <title>《${book.bookName}》_${writer.writerNeckName}著_${book.styleName}_惊鸿书院网</title>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>Picture/惊鸿图标.jpg">
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


    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script src="<%=basePath%>layui/layui.js"></script>
</head>
<body>
<div class="share-img">

</div>
<script>
    function showReaderMenu(){
        $(".Readerdropdown").toggle("act");
    };
</script>
<%--<script>
    $.ready(
        $.ajax({
            
        })
    )
</script>--%>
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
<div class="wrap" style="background-color: #ffffff">
    <div id="pin-nav" class="pin-nav-wrap need-search" data-l1="40">
        <div class="box-center cf">
            <div class="nav-list site-nav fl">
                <ul>
                    <li class="site"><a class="" href="<%=basePath%>Reader/homePageShow.action" data-eid="qd_A43"></a>
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
                    <li class="line"></li>
                    <li class="sign-out" data-l2="6">
                        <c:if test="${not empty sessionScope.reader}">
                            <a id="pin-login" href="<%=basePath%>person/personal.action?readerId=${sessionScope.reader.readerId}" data-eid="qd_R33">
                                    ${sessionScope.reader.readerNeckName}

                            </a>
                            <span class="badge" style="background-color: white;color: #3498db; text-align: center; width:1em;height: 1em;line-height:1em;border-radius: 15px;" id="toReadMsgNum"></span>
                        </c:if>
                        <c:if test="${empty sessionScope.reader}">
                            <a id="pin-login" href="<%=basePath%>JSP/login_reader.jsp" data-eid="qd_R33">登录</a>
                        </c:if>

                    </li>

                    <li class="sign-in hidden" id="signin" style="width: 180px;text-align: center">
                        <a href="<%=basePath%>reader/userinformation.action?readerId=${reader.readerId}" data-eid="qd_A65"><i id="nav-user-name">${reader.readerNeckName}</i><span></span></a>
                    </li>
                    <li class="line"></li>
                    <li class="book-shelf" id="top-book-shelf">
                        <a href="<%=basePath%>bookshelf/searchbookshelf.action"  data-eid="qd_A63"><em class=""></em>
                            <i>
                            我的书架
                            </i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
<script>
    function toShelf(){
        if(${not empty sessionScope.reader}){
            Window.href = '<%=basePath%>person/personal.action?readerId=${sessionScope.reader.readerId}'
        }else{
            checkLogin()
        }
    }
</script>
    <div id="j-topHeadBox" class="top-bg-op-box hidden" data-cookie="0" style="background-image:url('//qidian.qpic.cn/qidian_common/349573/c613c5cd398749ccc18c4dbde831b3fb/0')" data-l1="1">
        <a class="jumpWrap" href="" target="_blank" data-eid="qd_G100" data-qd_dd_p1="1">
            <span class="op-tag"></span>
        </a>
    </div>
    <div class="top-bg-box " id="j-topBgBox" style="background-image: url(../Images/back.jpg)">

    </div>

    <div style="height: 80px;"></div>
<div class="border-shadow ">
    <span></span>
    <span></span>
</div>

    <div class="book-detail-wrap center990">
        <div class="book-information cf" data-l1="2">

    
    <div class="book-img">
        <a class="J-getJumpUrl" id="bookImg" href="2" data-eid="qd_G09" data-bid="1011817068" data-firstchapterjumpurl="<%=basePath%>reader/readChapter.action?chapterId=${firstChapterId}"><img src="<%=basePath%>${book.bookCover}"/>
"></a>
    </div>
    <script>
        function recomment() {
            if(checkLogin()){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.open({
                        offset: ['30%', '40%'],
                        title:'投推荐票',
                        anim: 4,
                        content:'<input class="recommentTieckts" type="number" style="height: 30px;" min="1" placeholder="选择要投的票数">',
                        btn:['确认','取消'],
                        yes:function () {
                            $.ajax({
                                url:'<%=basePath%>reader/recommentTieckts.action?bookId=${book.bookId}&num='+$(".recommentTieckts").val(),
                                async:true,
                                success:function (flag) {
                                    if(flag){
                                        layui.use('layer', function(){
                                            var layer = layui.layer;
                                            var index = layer.msg(1,{content:'感谢您的推荐',offset:['45%','45%']});
                                            layer.style(index, {
                                                width: '200px',
                                                height:'25px'
                                            });
                                        })
                                    }else{
                                        layui.use('layer', function(){
                                            var layer = layui.layer;
                                            var index = layer.msg(1,{content:'票数不足，抱歉',offset:['45%','45%']});
                                            layer.style(index, {
                                                width: '200px',
                                                height:'25px'
                                            });
                                        })
                                    }
                                }
                            })
                        }
                    });
                })
            }

        }

    </script>
    <script>
        function addToShelf(){
            if(checkLogin()){
                $.ajax({
                    url:"<%=basePath%>reader/addToShelf.action?bookId=${book.bookId}"
                    ,async:true
                    ,success:function(info){
                        if(info){
                            layui.use('layer',function () {
                                var layer = layui.layer;
                                var index = layer.msg(1,{content:'加入成功',offset:['45%','45%']});
                                layer.style(index, {
                                    width: '200px',
                                    height:'25px'
                                });
                            })
                        }else{
                            layui.use('layer',function () {
                                var layer = layui.layer;
                                var index = layer.msg(1,{content:'<strong>已在书架</strong>',offset:['40%','40%']});
                                layer.style(index, {
                                    width: '200px',
                                    height:'30px'
                                });
                            })
                        }
                    }
                })
            }

        }

    </script>

    <div class="book-info ">
        <h1>
            
            <em>${book.bookName}</em>
            <span><a class="writer" href="<%=basePath%>write/writeInformation.action?writerId=${writer.writerId}" target="_blank" data-eid="qd_G08">${writer.writerNeckName}</a> 著</span>
            
        </h1>
        <p class="tag"><span class="blue">
            <c:if test="${book.bookStatuId eq 1}">连载</c:if>
            <c:if test="${book.bookStatuId eq 2}">完结</c:if>

        </span>

            <span class="blue">
                <c:if test="${book.bookActivityStatu}">免费</c:if>
                <c:if test="${!book.bookActivityStatu}">付费</c:if>
            </span>
            
            <a href="<%=basePath%>reader/searchBooks.action?keyWord=${book.styleName}" class="red" target="_blank" data-eid="qd_G10">${book.styleName}</a>
            
        </p>
        
        <p class="intro">${book.bookShortDescribe}</p>
        <p>
            <em>

            <span class="JwoSyImk"><fmt:formatNumber value="${book.wordsNum/10000}" pattern="#0.00"/></span>
        </em><cite>万字</cite>
            <i>|</i>
            <em>
                <span class="JwoSyImk"><fmt:formatNumber value="${book.clickTimes/10000}" pattern="#0.00"/></span>
            </em><cite>万总点击

            </cite><i>|</i><em>
            <span class="JwoSyImk"><fmt:formatNumber value="${book.bookRecommendTicket/10000}" pattern="#0.00"/></span></em>
            <cite>万总推荐</cite></p>
        
        <p>
            <c:if test="${empty readingChapter}">
                <a class="red-btn J-getJumpUrl " style="text-decoration: none" href="<%=basePath%>reader/readChapter.action?chapterId=${firstChapterId}" id="readBtn" data-eid="qd_G03" data-bid="1011817068">免费试读</a>
            </c:if>
            <c:if test="${not empty readingChapter}">
                <a class="red-btn J-getJumpUrl " style="text-decoration: none" href="<%=basePath%>reader/readChapter.action?chapterId=${readingChapter.chapterId}" id="readBtn" data-eid="qd_G03" data-bid="1011817068" data-firstchapterjumpurl="//read.qidian.com/chapter/GVTb_Xs_43QPfAGvZBg6QQ2/i2EvUJ_HeQ9p4rPq4Fd4KQ2">
                    继续阅读<%-- ${fn:substring(readingChapter.chapterName,0,6)}--%>
                </a>
            </c:if>

            <a class="blue-btn add-book" id="addBookBtn" href="javascript:" style="text-decoration: none" data-eid="qd_G05" onclick="addToShelf()" data-bookId="1011817068" data-bid="1011817068">
                加入书架
            </a>
            
            <a class="blue-btn" id="topRewardBtn" style="text-decoration: none"  href="javascript:" data-showtype="2" data-eid="qd_G07" onclick="recomment()">
                投推荐票
            </a>
            
        </p>
        
    </div>
    

    <div class="take-wrap">
        
    </div>
    

</div>
        <script>
            function showInfo() {
                    $(".catalog-content-wrap").addClass("hidden");
                    $(".book-content-wrap cf").removeClass("hidden");
                    $(".j_catalog_block").removeClass("act");
                    $(".bookInfo").addClass("act");

            }
            function showMenu(){
                    $(".catalog-content-wrap").removeClass("hidden");
                    $(".book-content-wrap cf").addClass("hidden");
                    $(".bookInfo").removeClass("act");
                    $(".j_catalog_block").addClass("act");
            }

        </script>
        <div class="content-nav-wrap cf" data-l1="3">
            <div class="nav-wrap fl">
                <ul>
                    <li class="bookInfo act">
                        <a class="langInfo" id="j-bookInfoPage" onclick="showInfo()" href="javascript:"
                           data-eid="qd_G15">作品信息</a>
                    </li>
                    <li class="j_catalog_block">
                        <a class="langMenu" onclick="showMenu()" href="javascript:"
                           id="j_catalogPage" data-eid="qd_G16">目录
                            <i><span id="J-catalogCount">(${fn:length(menu)}章)</span></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="catalog-content-wrap hidden" id="j-catalogWrap" data-l1="14">
            <div class="go-top">
                <div class="go-top-wrap">
                    <a href="#" class="icon-go-top">
                        <em class="iconfont" data-eid="qd_G72">
                            <span class="glyphicon glyphicon-menu-up" style="padding-top: 13px;" aria-hidden="true"></span>
                        </em>
                    </a>
                </div>
            </div>
            
            <div class="volume-wrap">
                
                <div class="volume">
                    <div class="cover"></div>
                    <h3>
                        
                        正文卷<i>&#183;</i>共${fn:length(menu)}章
                        <span class=free>
                            <c:if test="${book.bookActivityStatu}">免费</c:if>
                            <c:if test="${!book.bookActivityStatu}">付费</c:if>
                        </span>
                        <em class="count">本书共<cite>${book.wordsNum}</cite>字</em></h3>
                    <ul class="cf">
                        <c:forEach items="${menu}" var="chapter">
                        <li data-rid="${chapter.chapterId}">
                            <a href="<%=basePath%>reader/readChapter.action?chapterId=${chapter.chapterId}"
                               target="_blank"
                               title="首发时间：<fmt:formatDate value="${chapter.chapterRefreshTime}" pattern="yyyy年MM月dd日 hh:mm:ss"></fmt:formatDate> 章节字数：${chapter.chapterWordNum}">
                                ${chapter.chapterName}
                                <c:if test="${!chapter.chapterStatu}"><span style="color: palevioletred"><strong>(付费)</strong></span></c:if>
                            </a>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                
            </div>
            
        </div>
        <script>
            function checkLogin(){
                if(${not empty sessionScope.reader})
                    return true;
                else{
                    layui.use('layer',function(){
                        var layer = layui.layer;
                        var index = layer.open({
                            offset:("40%","30%"),
                            title:'请先登录',
                            content:'<p style="text-align: center"><strong>点击跳转</strong></p>',
                            yes : function(){
                                window.open('<%=basePath%>JSP/login_reader.jsp');
                                layer.close(index);
                            }
                        })
                    })
                    return false;
                }
            }
        </script>
        <script>
            function rewardWriter() {
                if(checkLogin()){
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.open({
                            offset: ['30%', '40%'],
                            title: '打赏作者',
                            anim: 4
                            , content: '<input width="300px" step="5" type="number" name="price" class="rewardPrice" required lay-verify="required"  min="1"   placeholder="请选择打赏的惊鸿币数量" autocomplete="off" class="layui-input" width="350px">'
                            ,btn: ['确认打赏','取消']
                            ,yes:function () {
                                $.ajax({
                                    url:"<%=basePath%>reward/reward.action?bookId=${book.bookId}&writerId=${writer.writerId}"+"&price="+$(".rewardPrice").val(),
                                    async:true,
                                    success:function(info) {
                                        if(info){
                                            layui.use('layer', function() {
                                                var layer = layui.layer;
                                                var index = layer.msg(1,{content:'谢谢',offset:['45%','45%']})
                                                layer.style(index, {
                                                    width: '50px',
                                                    height:'20px',
                                                    offset:['45%','35%']
                                                });
                                                location.reload();
                                            })
                                            window.href('<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}')
                                        }else{
                                            layui.use('layer', function() {
                                                var layer = layui.layer;
                                                layer.open({
                                                    title: '打赏失败',
                                                    content: '余额不足，打赏失败',
                                                    btn: ['去充值', '算了'],
                                                    yes: function () {
                                                        window.open("<%=basePath%>rechargePage.jsp")
                                                    },
                                                    btn2: function () {

                                                    }

                                                });
                                                layer.style(index, {
                                                    width: '200px',
                                                    height:'25px',
                                                    offset:['45%','45%']
                                                });
                                            })
                                        }

                                    }
                                })
                            }

                        })
                    })
                }
            }

        </script>
        <div class="book-content-wrap cf">
            
            <div class="left-wrap fl">
                <div class="book-info-detail">
                    <cite class="icon-pin"></cite>
                    <div class="book-intro">
                        <p>
                            　　${book.bookShortDescribe}
                        </p>
                    </div>
                    <div class="book-state" data-l1="4">
                        <ul>
                            <li>
                                <b>标签</b>
                                <div class="detail">
                                    <p class="tag-wrap" data-l1="4">
                                        <c:forEach items="${book.labels}" var="label">
                                            <a class="tags" href="<%=basePath%>reader/searchBooks.action?keyWord=${label.bookLabelName}" target="_blank" data-eid="qd_G70">${label.bookLabelName}</a>
                                        </c:forEach>
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="fans-zone" data-l1="5">
                    <h3 class="lang">粉丝互动</h3>
                    <div class="fans-interact cf">
                        <dl>
                            <dd>
                                    <h4 class="lang"><span class="act">推荐票</span></h4>
                                <div class="action-wrap" id="ticket-wrap">
                                    
                                    <div class="ticket rec-ticket ">

                                        <p>总票数</p>

                                        <p class="num"><i id="recCount">${book.bookRecommendTicket}</i></p>
                                        <p></p>
                                        <p></p>

                                        <a class="red-radius-btn" id="recBtn" href="javascript:" data-showtype="2"  onclick="recomment()" data-eid="qd_G23"><em class=""></em>投推荐票</a>
                                    </div>
                                </div>
                            </dd>
                            <dd class="line"></dd>
                            <dd>
                                <h4 class="lang"><span class="act">打赏</span></h4>
                                <div class="action-wrap">
                                    <div class="ticket">
                                        <p>打赏次数</p>
                                        <p class="num"><i class="rewardNum" id="rewardNum">${rewardTimes}</i></p>

                                        <p></p>

                                        <a class="red-radius-btn" id="rewardBtn" href="javascript:" onclick="rewardWriter() " data-showtype="3" data-eid="qd_G24"><em class=""></em>打赏作者</a>
                                       
                                    </div>
                                </div>
                            </dd>
                            <dd class="line"></dd>
                            <dd style="overflow: hidden;">
                                <h4 class="lang"><span>我的粉丝等级</span></h4>
                                <c:choose>
                                    <c:when test="${empty sessionScope.reader}">
                                        <div class="fans-rank login-out mb20 cf" id="noLogin" data-login="0">
                                            <div class="user-photo fl">
                                                <p></p>
                                                <a href="#">
                                                    <img src="../Images/face.jpg" class="circle">
                                                </a>
                                            </div>
                                            <p></p><p></p><p></p>
                                            <div class="fans-info" style="display: block;text-align: center">
                                                <p style="text-align: center"><a class="blue" id="login-btn" href="<%=basePath%>JSP/login_reader.jsp" data-eid="qd_G28">登录</a>查看粉丝等级</p>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${not empty sessionScope.reader}">
                                        <div class="fans-rank login-in mb20 cf " id="loginIn" data-login="1">
                                            <div class="user-photo fl">
                                                <a href="<%=basePath%>person/personal.action?readerId=${sessionScope.reader.readerId}" id="myUserIcon"  target="_blank">
                                                    <img src="<%=basePath%>${reader.readerPortrait}">
                                                    <span class="user-level" id="userLevel"></span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="fans-info" id="haveLv">
                                            <p><span>您当前的等级</span>：${readerLevel}</p>
                                            <p><span>距离下一等级还有<span style="color: #980c10;">${withUpperLevel}</span>分</span></p>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </dd>
                        </dl>
                    </div>
                </div>

                
                <div class="like-more mb30 cf" data-l1="6" style="margin-top:120px">
                    <h3 class="lang">喜欢这本书的人还喜欢</h3>
                    <div class="like-more-list">
                        <ul class="cf">
                            <c:forEach items="${recommendBooks.list}" var="book" varStatus="status">
                                <li data-rid="${status.index}">
                                    <div class="book-img" title="${book.bookName}">
                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" data-eid="qd_G30" data-bid="1004900395"><img class="lazy" src="<%=basePath%>${book.bookCover}" alt="${book.bookName}"></a>
                                    </div>
                                    <h4><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" title="${book.bookName}" data-eid="qd_G29" data-bid="1004900395">${book.bookName}</a></h4>
                                    <p></p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                
                <div class="user-commentWrap" data-l1="8">
                    <div class="user-comment-wrap book-friend">
                        <div class="comment-head cf">
                        </div>
                      <div class="userCommentWrap"  id="userCommentWrap" data-l1="7">
                          <div class="la-ball-pulse">
                              <span></span>
                              <span></span>
                              <span></span>
                          </div>
                          
                          <div class="my-comment-wrap" id="myCommentWrap">
                          </div>
                          
                      </div>

                    </div>
                </div>
            
            </div>
            <div class="right-wrap fr">
                
                    <div class="author-state mb10">
                        <div class="author-info">
                            <div class="info-wrap nobt" data-l1="9">
                                <div class="author-photo" id="authorId" data-authorid="2967437">
                                    <a href="<%=basePath%>write/writeInformation.action?writerId=${writer.writerId}" target="_blank" data-eid="qd_G38">
                                        <img src="<%=basePath%>${writer.writerPortrait}">
                                    </a>
                                    
                                            <span class="lv">作者</span>
                                    
                                </div>

                                
                            </div>
                            <div class="info-wrap" data-l1="9">
                                <ul class="work-state cf">
                                    <li  style="width: 40%;">
                                        <span class="book"></span>
                                        <p>作品总数
                                        </p>
                                        <em>${writer.bookNum}</em>
                                    </li>
                                    <li style="width: 40%;">
                                        <span class="word"></span>
                                        <p>累计字数</p>
                                        <em>${book.wordsNum}</em>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="book-list-wrap mb10" data-l1="13">
                   <div class="strongrec-list">
                       <h3 class="wrap-title lang">本周强推<i>&#183;</i>都市</h3>
                       <div class="book-list">
                           <ul>
                               <c:forEach items="${forcePushBooks.list}" var="book" varStatus="status">
                                   <li data-rid="${status.index}">
                                       <a class="channel" href="<%=basePath%>reader/searchBooks.action?keyWord=${book.styleName}" target="_blank" data-eid="qd_G52"><em>
                                           「</em>${book.styleName}<em>」</em></a>
                                       <strong>
                                           <a class="name" href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" data-eid="qd_G51" data-bid="1011932150"
                                                     title="${book.bookName}">${book.bookName}
                                   </a></strong>
                                   </li>
                               </c:forEach>
                           </ul>
                       </div>
                   </div>
</div>
       
            </div>
        </div>
        
    </div>
    <div class="footer">
    <div class="box-center cf">
   
        <div class="footer-menu dib-wrap">
            <a href="" target="_blank">惊鸿</a>
            <a href="" target="_blank">联系我们</a>
            <a href="" target="_blank">加入我们</a>
            <a href="" target="_blank">帮助中心</a>
            <a href="#" class="advice" target="_blank">提交建议</a>
            <!--<a href="http://bbs.qidian.com" target="_blank">起点论坛</a>-->

        </div>
        <div class="copy-right">
            <p><span>Copyright &copy; 2002-2018 www.qidian.com All Rights Reserved</span>版权所有 上海玄霆娱乐信息科技有限公司</p>
            <p>上海玄霆娱乐信息科技有限公司 增值电信业务经营许可证沪B2-20080046 出版经营许可证 新出发沪批字第U3718号 沪网文[2015]0081-031 新出网证（沪）字010 沪ICP备08017520号-1</p>
            <p>请所有作者发布作品时务必遵守国家互联网信息管理办法规定，我们拒绝任何色情小说，一经发现，即作删除！举报电话：010-59357051</p>
            <p>本站所收录的作品、社区话题、用户评论、用户上传内容或图片等均属用户个人行为。如前述内容侵害您的权益，欢迎举报投诉，一经核实，立即删除，本站不承担任何责任</p>
            <p>联系方式 总机 021-61870500 地址：中国（上海）自由贸易试验区碧波路690号6号楼101、201室</p>
        </div>
        
    </div>
</div>

</div>

</body>
</html>
