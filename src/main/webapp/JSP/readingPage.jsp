<%@ page language="java" isErrorPage="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>${info.chapter.chapterName}_${info.book.bookName}_阅读页</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
<link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
<script src="<%=basePath%>layui/layui.js"></script>
<link rel="stylesheet" data-ignore="true" href="<%=basePath%>Css/vote_popup.3844d.css" />


<link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body class="theme-0" id="body">
<style>
    a{
      text-decoration: none;
    }
</style>
<script>
    $(document).ready(
        function(){
        if(${info.chapter.chapterContent == null}){
            alertToBuy(${info.chapter.chapterId})
        }
        changeTheme(${sessionScope.color})
    }
    );

    $(document).bind('click',function () {
        $(".menu").hide("normal",null);
        $(".setting").hide("normal",null);
    })

    function finalChapterAlter(){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.open({title:'提示',content:'已经是最后一章了'});
        })
    };

    function checkLogin() {
        if(${not empty sessionScope.reader}){
            return true;
        }else{
            layui.use('layer', function() {
                var layer = layui.layer;
                layer.open({
                    title: '请登录',
                    content: '请先登录，点击跳转',
                    yes: function () {
                        window.open('<%=basePath%>JSP/login_reader.jsp');
                    }
                })
            })
            return false;
        }
    }
    function alertToBuy(chapterId){
        layui.use('layer', function(){
            var layer = layui.layer;
            if(${not empty sessionScope.reader}){
                layer.open({
                    title: '付费章节'
                    , content: '请先购买该章节'
                    ,btn: ['单章购买','批量购买', '取消']
                    ,yes: function(){
                        $.ajax({
                            url:"<%=basePath%>order/calculateSingleChapterPrice.action?chapterId="+chapterId,
                            async:true,
                            success:function(info){
                                layui.use('layer',function(){
                                    var layer = layui.layer;
                                    layer.open({
                                        title:'支付确认'
                                        ,content:'待支付<span style="color: #980c10">'+info+'</span>惊鸿币'
                                        ,btn:['确认支付','取消']
                                        ,yes:function () {
                                            $.ajax({
                                                url:"<%=basePath%>order/ordering.action?chapterId="+chapterId+"&price="+info,
                                                async:true,
                                                success:function(flag){
                                                    if(flag) {
                                                        layui.use('layer',function() {
                                                            var layer = layui.layer;
                                                            layer.msg('购买成功，跳转中')
                                                        })
                                                        window.location.href="<%=basePath%>reader/readChapter.action?chapterId="+chapterId
                                                    }else{
                                                        layui.use('layer',function() {
                                                            var layer = layui.layer;
                                                            layer.open({
                                                                title:'支付失败',
                                                                content:'余额不足，支付失败，请充值！',
                                                                btn:['去充值','不去'],
                                                                yes:function(){
                                                                    window.open("<%=basePath%>recharge/recharge.action")
                                                                },
                                                                btn2:function () {

                                                                }
                                                            })
                                                        })
                                                    }
                                                }
                                            })
                                        },
                                        btn2:function () {
                                            //取消支付
                                        }
                                    })
                                })
                            }
                        })
                    },
                    btn2:function () {
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            var index = layer.open({
                                type: 1,
                                skin: 'layui-layer-rim', //加上边框
                                area: ['520px', '240px'], //宽高
                                content:
                                '<div >' +
                                '   <form>' +
                                '       <c:forEach items="${info.menu}" var="chapter">' +
                                '           <c:if test="${!chapter.chapterStatu && !chapter.bought}">' +
                                '           <div style="width:45%;float:left;font-size:14px;line-height:30px;height:30px;margin-left:10px;margin-top:10px;overflow:hidden">' +
                                '               <input type="checkBox" name="checkedChapter" class="chapters" value="${chapter.chapterId}" style="display:inline-block">${chapter.chapterName}${chapter.bought}</input>' +
                                '           </div>' +
                                '           </c:if>' +
                                '       </c:forEach>' +
                                '   </form>' +
                                '</div>',
                                btn:['结算','全选','取消全选','取消'],
                                yes:function () {
                                    var groupCheckbox=$("input[name='checkedChapter']");
                                    var chapters = new Array();
                                    for(i=0;i<groupCheckbox.length;i++){
                                        if(groupCheckbox[i].checked){
                                            var val =groupCheckbox[i].value;
                                            chapters.push(val);
                                        }
                                    }
                                    $.ajax({
                                        url:"<%=basePath%>order/calculatePrice.action",
                                        data:{"checkedChapter":chapters},
                                        async:false,
                                        type:'post',
                                        success:function(info){
                                            layui.use('layer',function(){
                                                var layer = layui.layer;
                                                layer.open({
                                                    title:'支付确认'
                                                    ,content:'待支付<span style="color: #980c10">'+info+'</span>惊鸿币'
                                                    ,btn:['确认支付','取消']
                                                    ,yes:function () {
                                                        $.ajax({
                                                            url:"<%=basePath%>order/batchOrdering.action",
                                                            async:true,
                                                            success:function(flag){
                                                                if(flag) {
                                                                    layui.use('layer',function() {
                                                                        var layer = layui.layer;
                                                                        layer.msg('购买成功,请刷新页面')
                                                                    })
                                                                    window.location.reload();
                                                                }else{
                                                                    layui.use('layer',function() {
                                                                        var layer = layui.layer;
                                                                        layer.open({
                                                                            title:'支付失败',
                                                                            content:'余额不足，支付失败，请充值！',
                                                                            btn:['去充值','不去'],
                                                                            yes:function(){
                                                                                window.open("<%=basePath%>recharge/recharge.action")
                                                                            },
                                                                            btn2:function () {

                                                                            }
                                                                        })
                                                                    })
                                                                }
                                                            }
                                                        })
                                                    },
                                                    btn2:function () {
                                                        //取消支付
                                                    }
                                                })
                                            })
                                        }
                                    })
                                },
                                btn2:function () {
                                    $("input[name='checkedChapter']").prop("checked","checked");
                                    return false;
                                },
                                btn3:function () {
                                    $("input[name='checkedChapter']").removeAttr("checked");;
                                    return false;
                                },
                                btn4:function () {
                                }
                            });
                        })
                    }
                });
            }else{
                layer.open({
                    title:'请登录',
                    content:'继续阅读请先登录，点击跳转',
                    yes:function () {
                        window.open('<%=basePath%>JSP/login_reader.jsp');
                    }
                })

            }

        });

    };
    
    function rewardWriter() {
        if(checkLogin()){
            layui.use('layer', function(){
            var layer = layui.layer;
            layer.open({
                title: '打赏作者'
                , content: '<input width="300px" step="5" type="number" name="price" class="rewardPrice" required lay-verify="required"  min="1"   placeholder="请选择打赏的惊鸿币数量" autocomplete="off" class="layui-input" width="350px">'
                ,btn: ['确认打赏','取消']
                ,yes:function () {
                    $.ajax({
                        url:"<%=basePath%>reward/reward.action?bookId=${info.book.bookId}&writerId=${info.writer.writerId}"+"&price="+$(".rewardPrice").val(),
                        async:true,
                        success:function(info) {
                            if(info){
                                layui.use('layer', function() {
                                    var layer = layui.layer;
                                    layer.msg('谢谢')
                                })
                            }else{
                                layui.use('layer', function() {
                                    var layer = layui.layer;
                                    layer.open({
                                        title: '打赏失败',
                                        content: '余额不足，打赏失败',
                                        btn: ['去充值', '算了'],
                                        yes: function () {
                                            window.open("<%=basePath%>recharge/recharge.action")
                                        },
                                        btn2: function () {

                                        }
                                    })
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
<div class="share-img">
</div>
<div class="wrap">
    
        <div class="read-header" id="readHeader" data-l1="40">
    <div class="wrap-center cf">
        <div class="left-nav fl">
            <ul>
                <li class="site" data-l2="1">
                    <a class="pin-logo" href="<%=basePath%>Reader/homePageShow.action"
                       target="_blank" data-eid="qd_R01"></a>
                </li>
                <li id="j_nearRead" data-l2="3">
                    <a href="<%=basePath%>lastReading/lastRead.action">
                    <cite>最近阅读</cite>
                    </a>
                </li>
                <li class="quick-nav" data-l2="4">
                    <cite><i class="iconfont">&#xe661;</i>快速导航</cite>
                </li>
            </ul>
        </div>
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
        <div class="read-login fr">
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
                             <span class="badge" id="toReadMsgNum"></span>
                        </a>
                    </c:if>
                    <c:if test="${empty sessionScope.reader}">
                        <a id="pin-login" href="<%=basePath%>JSP/login_reader.jsp" data-eid="qd_R33">登录</a>
                    </c:if>

                </li>
                <li data-l2="6"><a href="<%=basePath%>recharge/recharge.action" target="_blank" data-eid="qd_R35">充值</a></li>
            </ul>
        </div>
    </div>
</div>

</div>
    
<div class="read-main-wrap font-family01" style="font-size:18px" id="j_readMainWrap">
        <div id="j_chapterBox" data-l1="3">
            
<c:if test="${info.chapter.chapterNum==1}">
    <div class="text-wrap" id="j_textWrap" data-cid="394744708">
        <div class="read-container">
            <div class="book-cover-wrap">
                <div class="book-photo">
                    <img src="<%=basePath%>${info.book.bookCover}">
                </div>
                <h1>${info.book.bookName}</h1>
                    <%--作者首页待做--%>
                    <h2><a href="#" target="_blank">${info.writer.writerNeckName}</a>著</h2>

                <div class="info-list cf">
                    <ul>
                        <li><p>${info.book.styleName}</p><span>类型</span></li>
                        <li><em><fmt:formatDate value="${info.chapter.chapterRefreshTime}" pattern="yyyy/MM/dd"></fmt:formatDate></em><span>上架</span></li>
                        <li><p><em>${info.book.wordsNum}</em></p><span>连载（字）</span></li>
                    </ul>
                </div>
                <h3>与<span>${info.book.readerNum}</span>位书友共同开启${info.book.bookName}的${info.book.styleName}之旅</h3>

                    <h5>本书由惊鸿书院进行电子制作与发行</h5>

                <h6>&copy;版权所有 侵权必究</h6>
            </div>
        </div>
    </div>
</c:if>

            
            
<div class="text-wrap" id="chapter-394744708" data-cid="394744708" data-purl="javascript:void(0);"  data-info="0|-1|394767059|0|0" >
    <div class="main-text-wrap" >
        <div class="text-head">
            <h3 class="j_chapterName">${info.chapter.chapterName}</h3>
            <div class="text-info cf">
                <div class="info fl">
                    <a href="#" target="_blank" data-bid="1011054696" data-auid="4365729" data-eid="qd_R102"><em class="iconfont">&#xe60c;</em>${info.book.bookName}</a>
                    
                        <a href="#" target="_blank" data-bid="1011054696" data-auid="4365729" data-eid="qd_R103"><em class="iconfont">&#xe650;</em>${info.writer.writerNeckName}</a>
                    
                    <i><em class="iconfont">&#xe64f;</em><span class="j_chapterWordCut">${info.chapter.chapterWordNum}</span>字</i>
                    <i><em class="iconfont">&#xe653;</em><span class="j_updateTime"><fmt:formatDate value="${info.chapter.chapterRefreshTime}" pattern="yyyy年MM月dd/hh时mm分"></fmt:formatDate></span>更新</i>
                    <i><em class="iconfont">&#xe653;</em><span class="j_clickTimes">点击量：${info.chapter.chapterClickNum}</span></i>
                </div>
            </div>
        </div>
        <div class="read-content j_readContent">
            ${info.chapter.chapterContent}
        </div>
        <script>
            function reportChapter(chaperId) {
                layui.use('layer',function () {
                    var layer = layui.layer;
                    layer.open({
                        title:'举报',
                        content:'    <div class="layui-input-block" style="margin: 0 auto">\n<span>举报原因</span>' +
                        '      <select class="reportType" name="city" lay-verify="required">\n' +
                        '        <option value="0">请选择</option>\n' +
                        '        <option value="1">色情低俗</option>\n' +
                        '        <option value="2">垃圾广告</option>\n' +
                        '        <option value="3">政治敏感</option>\n' +
                        '        <option value="4">其它</option>\n' +
                        '      </select>\n' +
                        '    </div>',
                        yes:function () {
                            if($(".reportType").val()!=0){
                                $.ajax({
                                    url:'<%=basePath%>reader/reportChapter.action?typeId='+$(".reportType").val()+'&chapterId='+chaperId,
                                    async:true
                                    ,success:function(info) {
                                        layui.use('layer', function(){
                                            var layer = layui.layer;
                                            layer.msg(1,{content:'我们将尽快处理，谢谢',offset:['45%','45%']})
                                        })
                                    }
                                })
                            }else{
                                layui.use('layer', function(){
                                    var layer = layui.layer;
                                    layer.msg(1,{content:'请选择一种举报类别',offset:['45%','45%'],anim: 6})
                                })
                            }
                        }
                    })
                })

            }
        </script>
        <div class="admire-wrap">
            <a class="report-btn j_reportBtn" href="javascript:;" onclick="reportChapter(${info.chapter.chapterId})" data-eid="qd_R106"><span class="glyphicon glyphicon-exclamation-sign"></span>举报</a>
            <div class="read-btn-box">
                <a class="admire lang j_admireBtn" onclick="rewardWriter()" href="javascript:" data-showtype="3" data-eid="qd_R105">赞赏<span class="j_admireNum"></span></a>
            </div>
        </div>
        
        
        
    </div>
</div>
        </div>
    <script>
        function firstChapterAlert(){
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.open({title:'提示',content:'已经是第一章了'});
            })
        }

    </script>
        
<div class="chapter-control dib-wrap" data-l1="3">
    <c:if test="${preChapter == null}">
        <a id="j_chapterPrev" href="javascript:" onclick="firstChapterAlert()" >上一章</a>
        <span>|</span>
    </c:if>
    <c:if test="${preChapter != null}">
        <a id="j_chapterPrev" href="<%=basePath%>reader/readChapter.action?chapterId=${preChapter.chapterId}">上一章</a>
        <span>|</span>
    </c:if>

    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${info.book.bookId}" target="_blank" data-eid="qd_R108">目录</a><span>|</span>
    <c:choose>
        <c:when test="${nextChapter == null}">
            <a id="j_chapterNext" href="javascript:" data-eid="qd_R109" onclick="finalChapterAlter()">下一章</a>
        </c:when>
        <c:when test="${nextChapter.chapterContent != null}">
            <a id="j_chapterNext" href="<%=basePath%>reader/readChapter.action?chapterId=${nextChapter.chapterId}" data-eid="qd_R109" >下一章</a>
        </c:when>
        <c:otherwise>
            <a id="j_chapterNext" href="javascript:" data-eid="qd_R109" onclick="alertToBuy(${nextChapter.chapterId})" >下一章(点击购买)</a>
        </c:otherwise>
    </c:choose>

</div>

        <div class="la-ball-pulse j_chapterLoad hidden">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<script>
    function addToShelf(){
        if(checkLogin()){
            $.ajax({
                url:"<%=basePath%>reader/addToShelf.action?bookId=${info.book.bookId}"
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
<div class="float-wrap" id="j_floatWrap" data-l1="2">
    <div class="left-bar-list" id="j_leftBarList">
        <dl>
            <dd id="j_navCatalogBtn" data-eid="qd_R42" class="menuBtn">
                <a href="javascript:"><i><span class="glyphicon glyphicon-th-list"></span><br><span>目录</span></i></a>
                <div class="guide-box">
                    <cite></cite>
                    目录
                </div>
            </dd>
            <dd id="j_navSettingBtn" class="j_navSettingBtn">
                <a href="javascript:"><i><span class="glyphicon glyphicon-cog"></span><br><span>设置</span></i></a>
                <div class="guide-box">
                    <cite></cite>
                    设置
                </div>
            </dd>
            <dd data-eid="qd_R84" onclick="addToShelf()">
                <a class="add-book" href="javascript:" data-bookid="1011054696"><i><span class="glyphicon glyphicon-plus"></span><br><span>书架</span></i></a>
                <div class="guide-box">
                    <cite></cite>
                    加入书架
                </div>
            </dd>
            <dd data-eid="qd_R85">
                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${info.book.bookId}" target="_blank"><i><span class="glyphicon glyphicon-book"></span><br><span>书页</span></i></a>
                <div class="guide-box">
                    <cite></cite>
                    返回书页
                </div>
            </dd>

            <dd data-eid="qd_R85">
                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${info.book.bookId}" target="_blank"><i><span class="glyphicon glyphicon-headphones"></span><br><span>听书</span></i></a>
                <div class="guide-box">
                    <cite></cite>
                    听书
                </div>
            </dd>
            
        </dl>
    </div>

    <div class="right-bar-list" id="j_rightBarList">
        <dl>
            <dd id="navReward" data-showtype="3" data-aid="qd_R87">
                <a href="javascript:" onclick="rewardWriter()"><i><em class="iconfont">
                    <span class="glyphicon glyphicon-yen" aria-hidden="true">
                    </span></em><span>打赏</span></i></a>
                <div class="guide-box">
                    <cite></cite>
                    打赏
                </div>
            </dd>
            <dd id="navTicket" data-showtype="2" data-aid="qd_R88">
                <a href="javascript:"><i><em class="iconfont"><span class="glyphicon glyphicon-stats"></span></em><span>投票</span></i></a>
                <div class="guide-box">
                    <cite></cite>
                    投票
                </div>
            </dd>
            <dd id="j_discussHref" data-eid="qd_R89">
                
                <a href="<%=basePath%>comment/chapterComment.action?chapterId=${info.chapter.chapterId}" target="_blank">
                    <i>
                        <em class="iconfont">
                            <span class="glyphicon glyphicon-comment"></span>
                        </em>
                        <span>评论</span>
                    </i>
                </a>
                <div class="guide-box">
                    <cite></cite>
                    评论
                </div>
            </dd>
            <dd class="go-top" id="j_goTop" title="返回顶部" data-eid="qd_R90">

                <div class="go-top-wrap">
                    <a href="#" class="icon-go-top">
                        <i>
                            <em class="iconfont" data-eid="qd_G72">
                                <span class="glyphicon glyphicon-menu-up"></span>
                            </em>

                            <span>顶部</span>
                        </i>
                    </a>
                </div>

            </dd>
        </dl>
    </div>

</div>
<div id="userLevel" class="hidden"></div>
<div id="authorId" data-authorid="4365729" class="hidden"></div>

<script>
    $(".menuBtn").click(function (e) {
            $(".menu").toggle();
            $(".setting").hide("fast",null);
            e.stopPropagation();
        }
        
    );
    $(".j_navSettingBtn").click(function (e) {

            $(".setting").toggle();
            $(".menu").hide("normal",null);
            e.stopPropagation();
        }

    );

    function changeTheme(num) {
        $("#body").removeClass()
        if (num == 0) {
            $("#body").addClass("theme-0 w800");
        }else if(num == 1){
            $("#body").addClass("theme-1 w800");
        }else if(num == 2){
            $("#body").addClass("theme-2 w800");
        }else if(num == 3){
            $("#body").addClass("theme-3 w800");
        }else if(num == 4){
            $("#body").addClass("theme-4 w800");
        }else if(num == 5){
            $("#body").addClass("theme-5 w800");
        }else if(num == 6){
            $("#body").addClass("theme-6 w800");
        }
        if(${not empty sessionScope.reader}){
            $.ajax({
                url:"<%=basePath%>reader/setReaderDeflaultReadingColor.action?color="+num
                ,async:true
                ,success:function(info){
                    if(info){

                    }else{
                        console.warn('主题信息同步失败')
                    }
                }
            });
        }
    };

</script>
<%--菜单--%>
<div id="j_catalog" class="panel-wrap catalog menu" style="display:none;top: 119px;left: 19.8%;position:fixed ;z-index: 999;width: 30%; height: 40%; overflow-y:scroll;border:1px solid #dddddd;/*background: url('<%=basePath%>Images/basic_bg.edf95.png')*/">
    <div style="padding-left:5%;padding-top: 5%">
        <span style="font-size: 18px;">
            <strong>目录</strong>
        </span>
    </div>
    <div style="float: left">
        <c:forEach items="${info.menu}" var="chapter">
            <div style="width: 40%;float: left;margin-left: 20px;margin-top: 20px;font-size: 15px;">
                <span class="chapter" name="${info.chapter.chapterName}">
                    <a style="text-decoration: none" href="<%=basePath%>reader/readChapter.action?chapterId=${chapter.chapterId}">${chapter.chapterName}</a>
                </span>
            </div>
        </c:forEach>
    </div>
</div>

<%--设置--%>
<div id="j_setting" class="panel-wrap setting" style="display: none;top: 119px;left: 19.8%;position:fixed ;z-index: 999;width: 40%; height: 80%; ">
    <div style="padding-left:5%;padding-top: 5%"><span style="font-size: 18px;"><strong>设置</strong></span></div>
    <div style="line-height: 50px;">
        <span style="padding: 10% 5%">阅读主题</span>
        <span style="padding: 0 2%" id="color0" ><a onclick="changeTheme(0)" href="javascript:"><img src="#" alt="" class="img-circle" style="border:1px solid #ddd;background-color: rgba(250,245,235,.8);width: 30px;height: 30px"></a></span>
        <span style="padding: 0 2%" id="color1"><a onclick="changeTheme(1)" href="javascript:"><img src="#" alt="" class="img-circle" style="border:1px solid #ddd;background-color: rgba(245,234,204,.8);width: 30px;height: 30px"></a></span>
        <span style="padding: 0 2%" id="color2"><a onclick="changeTheme(2)" href="javascript:"><img src="#" alt="" class="img-circle" style="border:1px solid #ddd;background-color: rgba(230,242,230,.8);width: 30px;height: 30px"></a></span>
        <span style="padding: 0 2%" id="color3"><a onclick="changeTheme(3)" href="javascript:"><img src="#" alt="" class="img-circle" style="border:1px solid #ddd;background-color: rgba(228,241,245,.8);width: 30px;height: 30px"></a></span>
        <span style="padding: 0 2%" id="color4"><a onclick="changeTheme(4)" href="javascript:"><img src="#" alt="" class="img-circle" style="border:1px solid #ddd;background-color: rgba(245,228,228,.8);width: 30px;height: 30px"></a></span>
        <span style="padding: 0 2%" id="color5"><a onclick="changeTheme(5)" href="javascript:"><img src="#" alt="" class="img-circle" style="border:1px solid #ddd;background-color: rgba(224,224,224,.8);width: 30px;height: 30px"></a></span>
        <span style="padding: 0 2%" id="color6"><a onclick="changeTheme(6)" href="javascript:"><img src="#" alt="" class="img-circle" style="border:1px solid #ddd;background-color: #444;width: 30px;height: 30px"></a></span>
    </div>
</div>




</body>
</html>
