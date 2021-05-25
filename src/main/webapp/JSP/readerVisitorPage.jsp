<%@ page language="java" isErrorPage="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
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
    <title>${requestReader.readerNeckName}的访客页面-惊鸿书院</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>

<link rel="stylesheet" data-ignore="true" href="<%=basePath%>Css/common.62506.css" />

    <link data-ignore="true" rel="stylesheet" href="<%=basePath%>Css/notposta.64aca.css">
    <link rel="stylesheet" data-ignore="true" href="../Css/global.css"/>

    <link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>layui/layui.js"></script>

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
                        <a href="<%=basePath%>person/personal.action" style="display: inline-block;"><i id="nav-user-name">${sessionScope.reader.readerNeckName}</i></a>
                        <a href="<%=basePath%>exit.action" style="display: inline-block;"><i>退出</i><span ></span></a>
                    </c:if>
                </li>
                <li class="line"></li>
                <li class="book-shelf" id="top-book-shelf">

                    <a href="<%=basePath%>bookshelf/searchbookshelf.action" target="_blank" data-eid="qd_A63">
                       我的书架

                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
    <div class="main">


    <div class="main-wrap cf">
        <div class="main-body fl">
            <div style="text-after-overflow: ellipsis; ">
                <ul class="cf">
                    <li >
                        <div class="page-header">
                            <h1>Reading Books <small>Ta的书单</small></h1>
                        </div>
                    </li>
                    <c:if test="${fn:length(readingRecordBooks) == 0}">
                        <li  >
                            <div style="width: 100%; height: 100px;">
                                <p style="color: #6a6a6a;font-size: 16px;text-align: center;line-height: 90px;">
                                    还没有书架内容，或者读者关闭此项功能
                                </p>
                            </div>
                        </li>
                    </c:if>
                    <c:forEach items="${bookShelf}" var="book" varStatus="status">
                        <li data-rid="${status.index}" style="display: inline-block;margin-bottom: 1em">
                            <div class="book-img" title="${book.bookName}">
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" data-eid="qd_G30" data-bid="1004900395"><img class="lazy" src="<%=basePath%>${book.bookCover}" alt="${book.bookName}"></a>
                            </div>
                            <h4 style="width: inherit;height: 14px;overflow: hidden;margin-top: 0.5em;">
                                <strong>
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}"
                                       target="_blank" title="${book.bookName}"
                                       data-eid="qd_G29" data-bid="1004900395"
                                    style="display:block;width: 77px;text-overflow: ellipsis; font-size: 12px;">
                                            ${book.bookName}
                                    </a>
                                </strong>
                            </h4>
                            <p></p>
                        </li>
                    </c:forEach>
                </ul>
                <br>
            </div>

            <div class="like-more-list" style="text-after-overflow: ellipsis; ">
                <ul class="cf">
                    <li  >
                        <div class="page-header">
                            <h1>Reading Record <small>Ta的读书记录</small></h1>
                        </div>
                    </li>
                    <c:if test="${fn:length(readingRecordBooks) == 0}">
                        <li  >
                            <div style="width: 100%; height: 100px;">
                                <p style="color: #6a6a6a;font-size: 16px;text-align: center;line-height: 90px;">
                                    没有阅读记录，或者读者关闭此项功能
                                </p>
                            </div>
                        </li>
                    </c:if>
                    <c:forEach items="${readingRecordBooks}" var="book" varStatus="status">
                        <li data-rid="${status.index}" style="display: inline-block;margin-bottom: 1em">
                            <div class="book-img" title="${book.bookName}">
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}" target="_blank" data-eid="qd_G30" data-bid="1004900395"><img class="lazy" src="<%=basePath%>${book.bookCover}" alt="${book.bookName}"></a>
                            </div>
                            <h4 style="width: inherit;height: 14px;overflow: hidden;margin-top: 0.5em;">
                                <strong>
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}"
                                       target="_blank" title="${book.bookName}"
                                       data-eid="qd_G29" data-bid="1004900395"
                                       style="display:block;width: 77px;text-overflow: ellipsis; font-size: 12px;">
                                            ${book.bookName}
                                    </a>
                                </strong>
                            </h4>
                            <p></p>
                        </li>
                    </c:forEach>
                </ul>
                <br>
            </div>
            <div class="page-container" data-pagemax="1" data-page="1"></div>
            
        </div>
        <div class="side-wrap fr" style="height: 480px;">
            <div class="forum-info tc mb20" data-l1="1" style="height: 720px;">
                <a href="#" style="margin-top: 10em">
                <img src="<%=basePath%>${requestReader.readerPortrait}" class="img-circle" alt="${book.bookName}" width="140" height="140">
                </a>
                <br>
                <h3 style="margin-top: 2em;">${requestReader.readerNeckName}</h3>



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
