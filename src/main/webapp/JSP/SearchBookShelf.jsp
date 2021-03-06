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
    <title>我的书架_个人中心_惊鸿书院</title>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>Picture/惊鸿图标.jpg">
    
<link rel="stylesheet" data-ignore="true" href="//qidian.gtimg.com/c/=/qdp/iconfont/symbols.3.56.css,/qdp/css/common.0.80.css,/qdp/css/shelf/index.0.40.css,/qdp/icon/common/sprite.0.12.css,/qdp/font/index.0.11.css" />
<link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/common.0.80.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/index0.40.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/sprite.0.12.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/idnex.0.11.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
<style>
    .act{
        color: #ee4259;

    }
</style>
</head>
<body class="shelf">
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
                            <a href="<%=basePath%>person/personal.action" class="header-nav-a " accesskey="1" data-eid="qd_M01"><i class=" "></i>我的首页</a>
                        </li>
                        <li class="header-nav-li" id="headerNav">
                            <a href="<%=basePath%>bookshelf/searchbookshelf.action" class="header-nav-a active" accesskey="2" data-eid="qd_M02"><i class=""></i>我的书架</a>
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
					<a href="<%=basePath%>lastReading/lastRead.action" class="sideBar-list-a" data-eid="qd_M185">最近阅读</a>
				</li>
               
			</ul>
			
		</div>
    <div class="qdp-content" data-l1="3" >
        <form class="shelf-search qdp-border" action="/bookcase/search">
            <input type="hidden" name="_csrfToken" value="" id="elsearchCsrf" >
            <input type="text" name="kw" class="shelf-search-input" id="elSearchInput" value="${name}" placeholder="输入作品名或作家名">
            <input type="submit" id="shelfSearch" class="clip" data-eid="qd_M192">
            <label for="shelfSearch" class="shelf-search-submit ui-button w_searchlable" data-eid="qd_M192">搜书架</label>
        </form>
        <div class="qdp-border table-x shelf-result shelf-table" data-l2="3">
            <div class="table-msg" id="tableMsg" data-val="飞剑问道">
                <h2 class="shelf-title">书架有<span id="elTotalNum">${bookshelfListsize}</span>条"${name}"结果</h2>
            </div>
            <div class="table-size">
                <table id="shelfTable" class="ui-table">
                      <tr >
                        <th scope="col" width="40">类型</th>
                        <th scope="col" width="100">书名/最近更新章节</th>
                        <th scope="col" width="90">更新时间</th>
                        <th scope="col" width="50">作者</th>
                        <th scope="col" width="100">阅读进度</th>
                      </tr>
                     <c:forEach items="${bookshelfList}" var="bookshelfList">
                         <tr id="checktr">
                             <td style="padding-left: 8px" id="all" title="「${bookshelfList.bookStyle.bookStyleName}」"><a href="<%=basePath%>reader/searchBooks.action?keyWord=${bookshelfList.bookStyle.bookStyleName}">「${bookshelfList.bookStyle.bookStyleName}」</a> </td>
                             <td id="all">
                             <c:if test="${bookshelfList.book.bookDownShelf==false}">
                                 <a  href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${bookshelfList.book.bookId}" title="${bookshelfList.book.bookName}">${bookshelfList.book.bookName}</a>
                             </c:if>
                             <c:if test="${bookshelfList.book.bookDownShelf==true}">
                                 <a  href="javascript:;" title="${bookshelfList.book.bookName}" class="info">${bookshelfList.book.bookName}</a>
                             </c:if>
                             <c:if test="${bookshelfList.book.bookDownShelf==false}">
                                 <a href="<%=basePath%>reader/readChapter.action?chapterId=${bookshelfList.maxchapter.chapterId}" title="${bookshelfList.maxchapter.chapterName}">${bookshelfList.maxchapter.chapterName}</a>
                             </c:if>
                             <c:if test="${bookshelfList.book.bookDownShelf==true}">
                                 <a href="javascript:;" title="${bookshelfList.maxchapter.chapterName}" class="info">${bookshelfList.maxchapter.chapterName}</a>

                             </c:if>
                             </td>
                             <td><fmt:formatDate value="${bookshelfList.maxchapter.chapterRefreshTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
                             <td id="all"><a href="<%=basePath%>write/writeInformation.action?writerId=${bookshelfList.writer.writerId}" title="${bookshelfList.writer.writerNeckName}">${bookshelfList.writer.writerNeckName}</a> </td>
                             <td id="all" title="${bookshelfList.readingChapter.chapterName}">
                                 <span style="background-color: red;color: white">${bookshelfList.downShelfOrNot}</span>
                                 <span style="background-color: #0f9cd5;color: white">${bookshelfList.updateOrNot}</span>
                                 阅读到
                             <c:if test="${bookshelfList.book.bookDownShelf==false}">
                                 <a href="<%=basePath%>reader/readChapter.action?chapterId=${bookshelfList.readingChapter.chapterId}"> ${bookshelfList.readingChapter.chapterName}</a> </td>
                             </c:if>
                             <c:if test="${bookshelfList.book.bookDownShelf==true}">
                                 <a href="javascript:;" class="info"> ${bookshelfList.readingChapter.chapterName}</a> </td>
                             </c:if>
                         </tr>
                     </c:forEach>
                </table>
            </div>
         
        </div>
    </div>
    <script id="tplDialogGroupMove" type="text/ejs-template">
    </script>
    <script id="tplGroupName" type="text/ejs-template">
    <div class="shelf-dialog-name">
        <form action="/ajax/BookShelf/AddGroup" method="post" class="qdp-form">
            <div class="ui-input-x" style="width:400px;">
                <input id="iptNameEdit" maxlength="20" required name="gname">
                <input type="hidden" id="elBids" name="bids">
                <input type="hidden" id="elType" name="type">
                <input type="hidden" name="_csrfToken" value="" id="elCsrfto" >
                <div class="ui-input"></div>
            </div>
            <div class="qdp-form-button">
                <input type="submit" id="groupNameSubmit" class="clip">
            </div>
        </form>
    </div>
    </script>
    <script id="tplEditGroupName" type="text/ejs-template">
    </script>
            <div class="go-top dn">
                <div class="go-top-wrap">
                    <a href="#" class="icon-go-top bTips" title="返回顶部" ><i class="iconfont icon-backtop"></i></a>
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
        <script>
            $(function () {
                $("table#shelfTable tr#checktr td#all a").mouseover(function (e) {
                    $(this).addClass("act");
                    $(this).siblings().removeClass("act");
                    $(this).parent().siblings().children("a").removeClass("act");
                    $(this).parent().parent().siblings().children("#all").children("a").removeClass("act")

                })
            })
            $(".info").each(function () {
                $(this).click(function () {
                    alert("该书籍已下架")
                })
            })
        </script>
</body>
</html>
