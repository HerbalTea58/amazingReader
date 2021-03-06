<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    
    <meta charset="UTF-8">
    <title>帖子评论-惊鸿书院</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>

<link rel="stylesheet" data-ignore="true" href="<%=basePath%>Css/common.62506.css" />

    <link data-ignore="true" rel="stylesheet" href="<%=basePath%>Css/notposta.64aca.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>layui/layui.js"></script>
    <script>
        $(function () {

           $(".aimg").mouseover(function () {

            $(this).parent().parent().children().eq(1).children().eq(0).children().eq(0).show("fast",null);

           });

            $(".aimg").mouseout(function () {

                $(this).parent().parent().children().eq(1).children().eq(0).children().eq(0).hide("fast",null);

            });


        });
        
        
        
    </script>
    <script>
        function like(commentId,i) {
            checkLogin();
            /*$(this).parent().eq(3).children().eq(0).children().eq(0).removeClass('glyphicon-heart-empty');
            $(this).parent().eq(3).children().eq(0).children().eq(0).addClass('glyphicon-heart');*/
            $.ajax({
                url:'<%=basePath%>comment/like.action?commentId='+commentId,
                async:true,
                success:function(info){
                    if(info){
                        $('#likeSpan'+i).removeClass('glyphicon-heart-empty');
                        $('#likeSpan'+i).addClass('glyphicon-heart');
                        $('#likeSpan'+i).css('color','red')
                        $('#likeNum'+i).html();
                        $('#likeNum'+i).html($('#likeNum'+i).html()*1+1*1);
                    }else{
                        $('#likeSpan'+i).addClass('glyphicon-heart-empty');
                        $('#likeSpan'+i).removeClass('glyphicon-heart');
                        $('#likeSpan'+i).css('color','black')
                        $('#likeNum'+i).html();
                        $('#likeNum'+i).html($('#likeNum'+i).html()*1-1*1);
                    }
                }
            })


        }
    </script>
</head>


<body data-dynamic="false">
<div class="share-img">
    <img src="Picture/share.6aa92.png" width='300' height="300">
</div>

    
<div id="pin-nav" class="pin-nav-wrap need-search" data-l1="40">
    <div class="box-center cf">
        <div class="nav-list site-nav fl">
            <ul>
                <li class="site">
                    <a class="pin-logo" href="<%=basePath%>Reader/homePageShow.action" data-eid="qd_A43"></a>
                </li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=玄幻" target="" data-eid="qd_A47">玄幻</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=都市" target="" data-eid="qd_A48">都市</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=仙侠" target="" data-eid="qd_A49">仙侠</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=科幻" target="" data-eid="qd_A50">科幻</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=游戏" target="" data-eid="qd_A56">游戏</a></li>
                <li><a href="<%=basePath%>reader/searchBooks.action?keyWord=历史" target="" data-eid="qd_A52">历史</a></li>
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
                <li class="sign-out">
                    <c:if test="${empty sessionScope.reader}">
                        <a id="pin-login" href="<%=basePath%>JSP/login_reader.jsp"><i>登录</i></a>
                    </c:if>

                </li>
                <li class="line"></li>
                <li class="sign-in">
                    <c:if test="${not empty sessionScope.reader}">
                        <a href="<%=basePath%>person/personal.action?readerId=${sessionScope.reader.readerId}" style="display: inline-block;"><i id="nav-user-name">${sessionScope.reader.readerNeckName}</i></a>
                        <a href="<%=basePath%>exit.action" style="display: inline-block;"><i>退出</i><span ></span></a>
                    </c:if>
                </li>
                <li class="line"></li>
                <li class="book-shelf" id="top-book-shelf">
                    <a href="<%=basePath%>bookshelf/searchbookshelf.action" target="_blank" data-eid="qd_A63"><em class="iconfont">&#xe60c;</em>
                        <i>我的书架
                    </i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
    <div class="main">
    <div class="bg">
        <div class="main-wrap">
            <p class="breadcrumb">
                <a href="<%=basePath%>comment/comments.action?tId=${post.commentTid}">
                    帖子回复
                </a>
                <span class="glyphicon glyphicon-menu-right" aria-hidden="true">

                </span>详情
            </p>
        </div>
    </div>

    <div class="main-wrap cf">
        <div class="main-body fl">
            
            <div class="post-wrap cf">
                <div class="card-wrap fl" data-g="485530173" data-h="0" data-a="1">
                    <a target="_blank" href="<%=basePath%>visitor/readerHome.action?readerId=${post.reader.readerId}">
                        <img class="head-img" src="<%=basePath%>${post.reader.readerPortrait}" alt="${post.reader.readerNeckName}">
                    </a>

                    
                </div>
                <div class="post">
                <div class="post-hover">
                    <p class="auther">
                        <a target="_blank"
                           href="<%=basePath%>visitor/readerHome.action?readerId=${post.reader.readerId}"
                           style="text-decoration: none;font-size: medium;"
                            class="blue b">
                            ${post.reader.readerNeckName}
                        </a>
                        <span style="color: black;"><strong>[楼主]</strong></span>
                    </p>
                    <h1 class="post-title">
                        <c:if test="${post.commentStatu}">
                            ${post.commentContent}
                        </c:if>
                        <c:if test="${post.commentStatu == false}">
                            <span style="color: grey;"><em>该评论被举报</em></span>
                        </c:if>
                    </h1>
                    <p class="post-body">

                    </p>
                    <div class="post-info dib-wrap cf" data-id="1173751297" data-t="topic">
                        <span class="mr20">
                            <fmt:formatDate value="${post.commentPushDate}" pattern="yyyy/MM/dd"></fmt:formatDate>
                            </span>
                        
                            <a href="javascript:;" onclick="inputBox(${post.reader.readerId},'${post.reader.readerNeckName}')" class="reply-btn info-tab mr20" style="text-decoration: none;margin-left: 20px;margin-left: 20px;">
                            <span>评论</span>
                            </a>
                        
                    </div>
                </div>
                </div>
            </div>
            <script>
                function inputBox(readerId,readerNeckName) {
                    location.href ="#comment-input-box";
                    checkLogin();
                    $('#commentedReaderId').val(readerId);
                    $('#comment').attr('placeholder',"回复"+readerNeckName+":");
                }
            </script>
            <ul class="post-list" style="width: 90%;float: right">
                <c:forEach items="${comments}" var="comment" varStatus="status">
                    <li class="post-wrap cf" >
                        <div class="card-wrap fl" data-g="485530173" data-h="0" data-a="1">
                            <a target="_blank" href="<%=basePath%>visitor/readerHome.action?readerId=${comment.reader.readerId}" class="aimg" style="text-decoration: none">
                                <img class="head-img" src="<%=basePath%>${comment.reader.readerPortrait}" height="30" width="30"
                                     alt="${comment.reader.readerNeckName}">
                            </a>
                        </div>
                        <div class="post">
                            <div class="post-hover" style="position: relative ;width:100%;z-index: 99999">
                                <div class="xian" style="background-color:#fff;border: 2px solid #ddd; border-radius:20px;display: inline-block;position: absolute; top: 2px;left: -20px; display: none " id="xian">
                                    <%--TODO--%>
                                    <div style="float: left; margin: 5px;">
                                        <p>积分：${comment.reader.readerScore}</p>
                                    </div>
                                    <div></div>
                                </div>
                                <p class="auther">
                                    <a target="_blank" href="<%=basePath%>reader/visitorPage.action?requestReaderId=${comment.reader.readerId}" style="text-decoration: none" class="blue b">${comment.reader.readerNeckName}</a>
                                </p>
                                <p class="post-body">
                                        回复
                                    <a href="<%=basePath%>comment/comments.action?tId=${comment.commentTid}" style="display:inline-block;color : blue;text-decoration: none;color: black;" >
                                            @${comment.commentedReader.readerNeckName}
                                    </a>
                                       ： ${comment.commentContent}
                                </p>

                                <div class="post-info dib-wrap cf" data-id="1189900004" data-t="reply">
                                    <span class="mr20">${ status.index + 1}楼</span>
                                    <span class="mr20">
                                        <fmt:formatDate value="${comment.commentPushDate}" pattern="yyyy-MM-dd hh点"></fmt:formatDate></span>
                                    <a href="javascript:;" onclick="like(${comment.commentId},${ status.index})"  class="info-tab like-btn" id="likeBtn" style="text-decoration: none; ">
                                        <i class="iconfont pr6">
                                            <c:if test="${comment.amILiked}">
                                                <span id="likeSpan${ status.index}" style="color: red" class="glyphicon glyphicon-heart" aria-hidden="true"></span>
                                            </c:if>
                                            <c:if test="${!comment.amILiked}">
                                                <span id="likeSpan${ status.index}" style="color: black" class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                                            </c:if>

                                        </i>

                                        <span class="likeNum" id="likeNum${status.index}">${comment.commentLikeNum}</span><span>赞</span>
                                    </a>
                                    <a href="javascript:;" onclick="inputBox(${comment.reader.readerId},'${comment.reader.readerNeckName}')" class="reply-btn info-tab mr20" style="text-decoration: none;margin-left: 20px;margin-left: 20px;">
                                        <span>回复</span>
                                    </a>

                                    <c:if test="${comment.reader.readerId == sessionScope.reader.readerId}">
                                        <a href="javascript:;" onclick="removeComment(${comment.commentId})" class="report-btn info-tab mr20 fr" style="text-decoration: none;margin-left: 20px;margin-right: 20px;">
                                            <span>删除</span>
                                        </a>
                                    </c:if>
                                    <c:if test="${post.reader.readerId != sessionScope.reader.readerId}">
                                        <a href="javascript:;" onclick="reportComment(${comment.commentId})" class="report-btn info-tab mr20 fr" style="text-decoration: none;display: inline-block">
                                            <i class="iconfont pr6">
                                                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="line-height: inherit">举报</span>
                                            </i><span></span>
                                        </a>
                                    </c:if>
                                </div>
                            </div>

                        </div>
                    </li>
                </c:forEach>

            </ul>
            <script>
                function reportComment(commentId){
                    if(checkLogin()){
                        layui.use('layer',function(){
                            var layer = layui.layer;
                            var index = layer.open({
                                offset:("40%","30%"),
                                title:'举报评论',
                                content:'<p style="text-align: center"><strong>为何要举报该条评论？</strong></p>'+'    <div class="layui-input-block" style="margin: 0 auto;text-align: center">\n<span>举报原因</span>' +
                                '      <select class="reportType" name="city" lay-verify="required">\n' +
                                '        <option value="0">请选择</option>\n' +
                                '        <option value="1">色情低俗</option>\n' +
                                '        <option value="2">垃圾广告</option>\n' +
                                '        <option value="3">政治敏感</option>\n' +
                                '        <option value="4">其它</option>\n' +
                                '      </select>\n' +
                                '    </div>',
                                yes : function(){
                                    if($(".reportType").val()!=0) {
                                        $.ajax({
                                            url: '<%=basePath%>comment/reportComment.action?commentId=' + commentId + '&typeId=' + $(".reportType").val(),
                                            async: true,
                                            success: function (info) {
                                                layui.use('layer', function () {
                                                    var layer = layui.layer;
                                                    layer.msg(1, {content: '我们将尽快处理，谢谢', offset: ['45%', '45%']})
                                                })
                                            }
                                        })
                                        layer.close(index);
                                    }else{
                                        layui.use('layer', function(){
                                            var layer = layui.layer;
                                            layer.msg(1,{content:'请选择一种举报类别',offset:['45%','45%'],anim: 6})
                                        })
                                    }
                                },
                                anim: 4 //动画类型
                            })
                        })
                    }
                }
            </script>
            <script>
                function removeComment(commentId){
                    /*alert("没做呢，别点了");*/
                    layui.use('layer',function(){
                        var layer = layui.layer;
                        var index = layer.open({
                            offset:("40%","30%"),
                            title:'是否删除',
                            content:'<p style="text-align: center"><strong>删除评论将不能恢复！</strong></p>',
                            yes : function(){
                                $.ajax({
                                    url:'<%=basePath%>comment/removeComment.action?commentId='+commentId,
                                    async:true,
                                    success:function(info) {
                                        location.reload();
                                    }
                                })
                                layer.close(index);
                            },
                            anim: 4
                        })
                    })

                }
            </script>
            <div name="comment-input-box" id="comment-input-box" class="comment-input-box" style="clear: both">
                <div class="user-info cf bg">
                    <c:choose>

                        <c:when test="${ not empty sessionScope.reader}">
                            <img src="<%=basePath%>${sessionScope.reader.readerPortrait}" class="head-img" alt="${sessionScope.reader.readerNeckName}">
                            <b>${sessionScope.reader.readerNeckName}</b>
                        </c:when>
                        <c:otherwise>
                            <img src="<%=basePath%>image/reader/default_user.0.2.png" class="head-img" alt="请先登录">
                            <b><a href="<%=basePath%>JSP/login_reader.jsp">请先登录</a></b>
                        </c:otherwise>
                    </c:choose>
                </div>
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
                                            layer.msg('加入书架成功')
                                        })
                                    }else{
                                        layui.use('layer',function () {
                                            var layer = layui.layer;
                                            layer.msg('<p><strong>已在书架</strong></p>')
                                        })
                                    }
                                }
                            })
                        }
                    }

                </script>
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
                    function checkLoginAndIsZeroWord(){
                        if(${not empty sessionScope.reader} ) {
                            if ($(".textNum").html() != '0')
                                return true;
                            else{
                                layui.use('layer',function(){
                                    var layer = layui.layer;
                                    var index = layer.open({
                                        offset:("40%","30%"),
                                        title:'不能为空',
                                        content:'<p style="text-align: center"><strong>请输入评论内容</strong></p>',
                                        yes : function(){
                                            layer.close(index);
                                        }
                                    })
                                })
                                return false;
                            }
                        }
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
                <form class="send-commont" action="<%=basePath%>comment/pushComment.action" method="post" onsubmit="return checkLoginAndIsZeroWord()">
                    <input name="tId" value="${post.commentTid}" hidden>
                    <input name="chapterId" value="${post.commentChapterId}" hidden>
                    <input name="bookId" value="${book.bookId}" hidden>
                    <input id="commentedReaderId" name="commentedReaderId" value="${post.commentReaderId}" hidden>
                    <textarea name="content" id="comment" placeholder="发表回复"></textarea>
                    <div class="bar cf">
                        <span class="textNum">0</span>/200

                        <input value="发表" class="cant" type="submit">
                    </div>
                </form>
                <script>
                    $('#comment').keyup(function (){
                        var ctt = $('#comment').val();
                        $('.textNum').html(ctt.length);
                        if($('.textNum').html() > 200){
                            $('.textNum').css('color','red');
                        }else{
                            $('.textNum').css('color','black');
                        }
                    })
                </script>
            </div>
            <div class="page-container" data-pagemax="1" data-page="1"></div>
            
        </div>
        <script>
            function signIn() {
                if(checkLogin()){
                    if (document.cookie.length>0){
                        var c_start=document.cookie.indexOf('signed');
                        if (c_start == -1){
                            $.ajax({
                                url:"<%=basePath%>reader/signIn.action",
                                async:true,
                                success:function(info){
                                    if(info>0){
                                        layui.use('layer',function () {
                                            var layer = layui.layer;
                                            layer.msg(1,{content:'签到成功，获得'+info+'个积分',offset:['35%','35%']})
                                        })
                                    }else{
                                        layui.use('layer',function () {
                                            var layer = layui.layer;
                                            layer.msg(1,{content:'今日已签到',offset:['45%','45%']})
                                        })
                                    }
                                }
                            })
                        }else{
                            layui.use('layer',function () {
                                var layer = layui.layer;
                                layer.msg(1,{content:'今日已签到',offset:['45%','45%']})
                            })
                        }
                    }else{
                        $.ajax({
                            url:"<%=basePath%>reader/signIn.action",
                            async:true,
                            success:function(info){
                                if(info>0){
                                    layui.use('layer',function () {
                                        var layer = layui.layer;
                                        layer.msg(1,{content:'签到成功，获得'+info+'个积分',offset:['35%','35%']})
                                    })
                                }else{
                                    layui.use('layer',function () {
                                        var layer = layui.layer;
                                        layer.msg(1,{content:'今日已签到',offset:['45%','45%']})
                                    })
                                }
                            }
                        })
                    }
                }
            }
        </script>
        <div class="side-wrap fr">
            <div class="forum-info tc mb20" data-l1="1">
                <a target="_blank" href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}">
                <img src="<%=basePath%>${book.bookCover}" class="forum-book" alt="${book.bookName}">
                </a>
                <h3>${book.bookName}</h3>
                
                    <a href="javascript:;" onclick="addToShelf()" class="red-btn forum-collect" data-c="1">
                        <i class="iconfont icon-collect">
                            <span class="glyphicon glyphicon-book"></span>
                        </i>收藏
                    </a>
                
                
                    <a href="javascript:;" onclick="signIn()" class="blue-btn forum-sign" data-s="0" data-eid="qd_G120">签到</a>
                
            </div>
            

        </div>
    </div>
    </div>
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
            <p><span>Copyright &copy; 2002-2018 www.jinghong.com All Rights Reserved</span>版权所有 上海玄霆娱乐信息科技有限公司</p>
            <p>上海玄霆娱乐信息科技有限公司 增值电信业务经营许可证沪B2-20080046 出版经营许可证 新出发沪批字第U3718号 沪网文[2015]0081-031 新出网证（沪）字010 沪ICP备08017520号-1</p>
            <p>请所有作者发布作品时务必遵守国家互联网信息管理办法规定，我们拒绝任何色情小说，一经发现，即作删除！举报电话：010-59357051</p>
            <p>本站所收录的作品、社区话题、用户评论、用户上传内容或图片等均属用户个人行为。如前述内容侵害您的权益，欢迎举报投诉，一经核实，立即删除，本站不承担任何责任</p>
            <p>联系方式 总机 021-61870500 地址：中国（上海）自由贸易试验区碧波路690号6号楼101、201室</p>
        </div>

    </div>
</div>
<!--公共底部 结束-->


</body>
</html>
