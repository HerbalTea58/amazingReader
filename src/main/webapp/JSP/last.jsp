


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的书架_个人中心_惊鸿书院</title>
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <link rel="icon" type="image/x-icon" href="../Images/log.png">

	<link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css"/>
	<link rel="stylesheet" data-ignore="true" href="../Css/common.0.80.css"/>
	<link rel="stylesheet" data-ignore="true" href="../Css/sprite.0.12.css"/>
	<link rel="stylesheet" data-ignore="true" href="../Css/idnex.0.11.css"/>
	<link rel="stylesheet" data-ignore="true" href="../Css/index0.40.css"/>

    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <style>
        .act{
          color: #ee4259;
        ;
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
                            <a href="<%=basePath%>person/personal.action" class="header-nav-a " accesskey="1" data-eid="qd_M01"><i class=""></i>我的首页</a>
                        </li>
                        <li class="header-nav-li" id="headerNav">
                            <a href="<%=basePath%>bookshelf/searchbookshelf.actio" class="header-nav-a active" accesskey="2" data-eid="qd_M02"><i class=""></i>我的书架</a>
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
				<li class="active">
					<a href="<%=basePath%>lastReading/lastRead.action" class="sideBar-list-a" data-eid="qd_M185">最近阅读</a>
				</li>
			</ul>
			<ul class="sideBar-group" id="tabView">
				<li id="elIndex" class="">
					<a href="<%=basePath%>bookshelf/searchbookshelf.action" class="sideBar-list-a" title="书架" data-eid="qd_M186">书架</a>
					
				</li>
				
			</ul>
			
		</div>
    <div class="qdp-content" data-l1="3" >
        

        
        <div class="qdp-border table-x shelf-table shelf-recent" data-l3="3">
            <div class="table-msg">
                <h2 class="shelf-title">最近阅读</h2>最多显示最近阅读的<strong class="dark ml5 mr5">100</strong>本书
            </div>
            <div class="table-size">
                <table id="shelfTable" class="ui-table">
                      <tr>
                        <th scope="col" width="200">书名/最近更新章节</th>
                        <th scope="col" width="30">作者</th>
                        <th scope="col" width="80">更新时间</th>
                        <th scope="col" width="120">阅读进度</th>
                      </tr>
                    <c:forEach items="${books}" var="book">
                        <tr id="checktr">
                            <td id="all">
                                <a href="<%=basePath%>reader/searchBooks.action?keyWord=${book.bookStyle.bookStyleName}" title="「${book.bookStyle.bookStyleName}」">  「${book.bookStyle.bookStyleName}」</a>
                                <c:if test="${book.book.bookDownShelf==true}">
                                    <a href="javascript:;"title=" ${book.book.bookName} " class="info">  ${book.book.bookName}  </a>
                                </c:if>
                                <c:if test="${book.book.bookDownShelf==false}">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.book.bookId}" title=" ${book.book.bookName} ">  ${book.book.bookName}  </a>
                                </c:if>
                                <c:if test="${book.book.bookDownShelf==false}">
                                    <a href="<%=basePath%>reader/readChapter.action?chapterId=${book.maxchapter.chapterId}" title="${book.maxchapter.chapterName}">  ${book.maxchapter.chapterName}</a>
                                </c:if>
                                <c:if test="${book.book.bookDownShelf==true}">
                                    <a href="javascript:;" title="${book.maxchapter.chapterName}" class="info">  ${book.maxchapter.chapterName}</a>
                                </c:if>
                            </td>
                            <td id="all">
                                <a href="<%=basePath%>write/writeInformation.action?writerId=${book.writer.writerId}" title="${book.writer.writerNeckName}"> ${book.writer.writerNeckName}</a>
                            </td>
                            <td title="<fmt:formatDate value="${book.maxchapter.chapterRefreshTime}" pattern="yyyy-MM-dd hh:mm:ss"/>"><fmt:formatDate value="${book.maxchapter.chapterRefreshTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
                            <td id="all" title="${book.readingChapter.chapterName}">
                                <span style="background-color: red;color: white">${book.downShelfOrNot}</span>
                                <span style="background-color: #0f9cd5;color: white">${book.updateOrNot}</span>
                                阅读到第
                             <c:if test="${book.book.bookDownShelf==false}">
                                <a href="<%=basePath%>reader/readChapter.action?chapterId=${book.readingChapter.chapterId}">${book.readingChapter.chapterNum}章 ${book.readingChapter.chapterName}</a></td>
                             </c:if>
                            <c:if test="${book.book.bookDownShelf==true}">
                                <a href="javascript:;" class="info">${book.readingChapter.chapterNum}章 ${book.readingChapter.chapterName}</a></td>

                            </c:if>

                        </tr>
                    </c:forEach>
                </table>
                <div class="ui-loading"><i class="ui-loading-icon"></i></div>
            </div>

        </div>
        <div>

        </div>

    </div>
            <div class="go-top dn">
                <div class="go-top-wrap">
                    <a href="#" class="icon-go-top bTips" title="返回顶部" ><i class="iconfont icon-backtop"></i></a>
                </div>
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
