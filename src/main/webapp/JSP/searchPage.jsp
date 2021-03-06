<%@ page language="java" isErrorPage="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="ie-stand">
    <title>书库 - 惊鸿书院网</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>

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


    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script src="<%=basePath%>layui/layui.js"></script>
    <%--<script type="text/javascript" src="<%=basePath%>Scripts/searchPageJs/jquery.lazyload.min3.js"></script>--%>
    <script>
        function searchBooks(){
            window.location.href = "<%=basePath%>reader/searchBooks.action?keyWord="+$('.search-val').val();
        }
    </script>
</head>
<body>



<!--公共头部 结束-->
<div id="pin-nav" class="pin-nav-wrap need-search" data-l1="40">
    <div class="box-center cf">
        <div class="nav-list site-nav fl">
            <ul>
                <li class="site"><a class="pin-logo" href="<%=basePath%>Reader/homePageShow.action" data-eid="qd_A43"><span></span></a>
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
                <li class="line">

                </li>
                <c:if test="${not empty sessionScope.reader}">
                    <li class="sign-out" data-l2="6">
                        <a id="pin-login" href="<%=basePath%>person/personal.action?readerId=${sessionScope.reader.readerId}" data-eid="qd_R33">${sessionScope.reader.readerNeckName}</a>
                    </li>
                    <li class="line"></li>
                    <li class="book-shelf" id="top-book-shelf">
                        <a href="<%=basePath%>bookshelf/searchbookshelf.action" data-eid="qd_A63"><em class=""></em>
                            <i>
                                我的书架
                            </i>
                        </a>
                    </li>
                </c:if>
                <c:if test="${empty sessionScope.reader}">
                    <li class="sign-out" data-l2="6">
                        <a id="pin-login" href="<%=basePath%>JSP/login_reader.jsp" data-eid="qd_R33">登录</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>



<link rel="stylesheet" type="text/css" href="<%=basePath%>Css/books.css"/>
<script>
    function helper(){
        var helper = document.getElementById('helperDiv');
        helper.innerHTML = "";
        document.getElementById("pageNum").value = 1;
        if($(".keyWord").val().trim()==""){
            $('#helperDiv').hide("fast");
            return;
        }else{
            $.ajax({
                url:"<%=basePath%>reader/helper.action?typing="+$('.keyWord').val()
                ,async:true
                ,success:function(info) {
                    if(info.length == 0){
                        $('#helperDiv').hide("fast");
                        return;
                    }
                    $('#helperDiv').show("fast");
                    var helper = document.getElementById('helperDiv');
    //                alert(helper.outerHTML)
                    helper.innerHTML = "";
                    var html = '';
                    var count = 0;

                    for(var one in info){
                         if(count < 20){
                            if(info[one].length<=4)
                                html += ' <p><a style="display:block;text-decoration: none;border-bottom:1px solid #ddd" href="<%=basePath%>reader/searchBooks.action?keyWord='+info[one]+'">'+info[one]+'</a></p>'
                            if(info[one].length>4)
                                html += '<p><a style="display:block;text-decoration: none;border-bottom:1px solid #ddd" href="<%=basePath%>bookDetail/getBookDetail.action?bookId='+info[one]+'">'+info[one]+'</a></p>'
                         }else{
                             return;
                         }
                         count++;
                    }
                    helper.innerHTML = html;
    //                alert(html)
                }
            })
        }
    }

</script>
<!--内容 开始-->
<div class="content">
    <script>
        function checkNull(){
            if($('#keyWord').val().length!=0){
                $('#savedKeyWord').val($('#keyWord').val());
                return true;
            }
            else
                return false;
        }
    </script>

    <!--选择搜索 开始-->
    <div class="find">
        <div class="fi_t" style="width:100%;">
            <div style="width:480px;height:50px;text-align: center;margin:0 auto;">
                <span><s></s></span>
                <form action="<%=basePath%>reader/searchBooks.action" method="post" id="searchForm" onsubmit="return checkNull()">
                    <input type="text" id="keyWord" onkeyup="helper()" class="keyWord" name="keyWord" value="${keyWord}" style="float:left;display:inline-block;border:1px solid #000;background-color: #fff;border-radius: 5px;width: 400px;height: 30px;" placeholder="我要搜.. " maxlength="100" autocomplete="off"/>
                    <input type="submit" value="搜索" style="float:left;display: inline-block;width: 60px;height: 30px;font-size: 14px;border-radius: 5px;background-color: #aa1317;color: #fff"/>
                    <input hidden name="pageNum" id="pageNum" value="1"/>
                    <input type="text" id="savedKeyWord" class="keyWord" value="${keyWord}" hidden/>
                </form>
            </div>
            <div id="helperDiv" style="display:none;width:480px;overflow-y: scroll;position: relative;float: inherit;top: 0; height: 100px; border: 1px solid #ddd;margin:0 auto;">
                <a href="<%=basePath%>reader/searchBooks.action?labelId="></a>
            </div>
        </div>


    </div>
    <!--选择搜索 结束-->
    <!--搜索结果 开始-->
    <div class="result" mod="search_data_list">
        <ul>
            <c:if test="${fn:length(books.list)==0}">
                <div class="alert alert-warning" role="alert" style="text-align: center; height: 50px; background-color: #fff7e7; line-height: 50px "><span style="">哎呀，没有你要找的东西！</span></div>
            </c:if>
            <c:forEach items="${books.list}" var="book" varStatus="statu">
                <li>
                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" class="book_cov" title="${book.bookName}">
                        <img src="<%=basePath%>${book.bookCover}"  class="lazyload_book_cover" alt="${book.bookName}"/>
                    </a>
                    <div class="book_inf">
                        <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" title="${book.bookName}" target="_blank" mod="data_book_name">${book.bookName}</a></h3>
                        <p>
                            <span>作者：<a mod="data_book_author" href="<%=basePath%>write/writeInformation.action?writerId=${book.writer.writerId}" title="${book.writer.writerNeckName}">${book.writer.writerNeckName}</a></span>
                            <span>分类：<a btn="data_search_category"
                                        data-min_category="9"
                                        data-category="2"
                                        data-channel="nv"
                                        href="<%=basePath%>reader/searchBooks.action?keyWord=${book.styleName}"
                                        title="总裁豪门">${book.styleName}</a></span>
                            <span>状态：
                                <c:if test="${book.bookStatuId eq 1}">连载</c:if>
                                 <c:if test="${book.bookStatuId eq 2}">完结</c:if>
                            </span>
                            <span>总字数：<fmt:formatNumber value="${book.wordsNum/10000}" pattern="#0.00"/>万字+</span>
                        </p>
                        <p class="tags">
                            <i>标签：</i>
                            <c:forEach items="${book.labels}" var="label">
                                <i><a btn="search_tag"
                                      href="<%=basePath%>reader/searchBooks.action?keyWord=${label.bookLabelName}"
                                      title="${label.bookLabelName}">${label.bookLabelName}
                                    </a>
                                </i>
                            </c:forEach>
                        </p>
                        <p><b></b><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank"></a></p>
                        <p class="int" mod="data_book_desc">${book.bookShortDescribe}</p>
                    </div>
                    <div class="right" style="line-height:130px;">
                        <span></span>
                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" style="line-height:30px;" class="read_btn btn">立即阅读</a>
                        <a href="javascript:;" onclick="addToShelf(${book.bookId})" class="store_btn btn" btn="book_fav" style="line-height:30px;"  data-act="fav" data-bid="68544">加入书架</a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    <script>
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

    </script>
    <script>
        function addToShelf(bookId){
            if(checkLogin()){
                $.ajax({
                    url:"<%=basePath%>reader/addToShelf.action?bookId="+bookId
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

            <!--页码切换 开始-->


        <!--页码切换 结束-->
    
    </div>

    <style>
        .nav ul{
            margin-left: ;
        }
        .nav ul li{
            margin-top: 2em;
            display: inline-block;
            border: 1px solid #ccc;
            width:50px;
            height: 1.5em;
            padding:0 5px;
        }
    </style>
    <c:if test="${fn:length(books.list)!=0}">
        <nav aria-label="render" class="nav" >
            <ul class="pagination" style="display: inline-block; margin:auto;">
                <c:if test="${!books.isFirstPage}">
                    <li style="border-bottom-left-radius: 3px;border-top-left-radius: 3px;"><a href="javascript:getPage(${books.firstPage})">第一页</a></li>
                </c:if>
                <c:if test="${!books.isFirstPage}">
                    <li ><a href="javascript:getPage(${books.prePage})">上一页</a></li>
                </c:if>

                <li ><a> 共 ${books.total}条</a></li>

                <li >第<span>${books.curPage}</span>页</li>
                <li ><a> 共 ${books.pageNum}页</a></li>
                <c:if test="${books.curPage < books.pageNum}">
                    <li style="display: inline-block"><a href="javascript:getPage(${books.nextPage})">下一页</a></li>
                </c:if>
                <li style="border-bottom-right-radius: 3px;border-top-right-radius: 3px;"><a href="javascript:getPage(${books.lastPage})">末页</a></li>

            </ul>
        </nav>
    </c:if>

    <!--选择结果 结束-->
    <div class="like-more mb30 cf" data-l1="6" style="margin-top:120px">
        <h3 >猜你喜欢</h3>
        <div class="like-more-list">
            <ul class="cf">
                <c:forEach items="${recommendBooks}" var="book" varStatus="status">
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
</div>
<!--内容 结束-->
<script>
    function getPage(curPage) {
        //将隐藏域的值变成curPage
        document.getElementById("pageNum").value = curPage;
        //触发表单的提交事件
        document.getElementById("searchForm").submit();
    }
</script>
<%--<link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
<script src="<%=basePath%>layui/layui.js"></script>
<script>
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 50 //数据总数，从服务端得到
        });
    });
</script>--%>

<style>

</style>

<%--<div>
    <c:if test="${!books.isFirstPage}">
        <a href="javascript:getPage(${books.firstPage})">第一页</a>
    </c:if>

    <c:if test="${!books.isFirstPage}">
        <a href="javascript:getPage(${books.prePage})">上一页</a>
    </c:if>
    <a> 共 ${books.total}条
        当前第<span>${books.curPage}</span>页</a>
    <c:if test="${!books.isLastPage}">
        <a href="javascript:getPage(${books.nextPage})">下一页</a>
    </c:if>
    <c:if test="${!books.isLastPage}">
        <a href="javascript:getPage(${books.lastPage})">末页</a>
    </c:if>
</div>--%>
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

<span class="gotop" id="btn_back_top" title="返回顶部"><img src="Picture/gotop.png" data-src="/static/images/common/gotop_hov.png" alt="返回顶部"></span>



</body>
</html>

