
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
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
                <a href="<%=basePath%>bookshelf/searchbookshelf.action" class="header-nav-a active" accesskey="2" data-eid="qd_M02"><i class=""></i>我的书架</a>
            </li>


        </ul>
        <a href="<%=basePath%>reader/userinformation.action?readerId=${reader.readerId}" id="headerLog" class="header-log" data-eid="qd_M06">

           书友 ${reader.readerNeckName}

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
            <li class="" id="elIndex">
                <a href="<%=basePath%>lastReading/lastRead.action" class="sideBar-list-a" data-eid="qd_M185">最近阅读</a>
            </li>
        </ul>
        <ul class="sideBar-group" >
            <li id="elIndex" class="active">
                <a href="<%=basePath%>bookshelf/searchbookshelf.action" class="sideBar-list-a" title="书架" data-eid="qd_M186">书架</a>
            </li>
        </ul>
    </div>
    <div class="qdp-content" data-l1="3">
        <form id="shelfSearchForm" class="shelf-search qdp-border" action='<%=basePath%>reader/SearchBookshelf.action?name=$(".shelf-search-input").val()' target="_blank">
            <input type="text" name="name" class="shelf-search-input" placeholder="输入作品名或作家名">
            <input type="submit" id="shelfSearch"  class="clip"  data-eid="qd_M192">
            <label for="shelfSearch" class="shelf-search-submit ui-button" data-eid="qd_M192">搜书架</label>
        </form>

        <div class="shelf-content" id="addToShelfForm" data-l2="2">

            <div class="shelf-content" id="addToShelfForm" data-l2="2">
                <div id="tabView" class="ui-tab-tabs">
                    <a href="javascript:" class="checked" id="elEditTab" data-rel="tabTarget1">系统推荐</a>
                </div>
                <label class="recmd-add blue unloading" data-l3="1"><a class="ibookclose" id="closeRecBook" data-eid="qd_M193" href="javascript:"><i class=""></i></a></label>
                <div class="ui-tab-contents shelf-content-wrapper">
                    <div id="tabTarget1" class="ui-tab-content checked">
                        <ul class="recmd-list" id="elRecList1" data-l3="1" style="height: 169px;">
                            <c:forEach items="${bookList2}" var="bookList2" begin="0" end="5">
                                <li class="recmd-list-item">
                                    <input type="checkbox" value="1011767060" checked="">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${bookList2.bookId}" target="_blank" class="recmd-list-a"  data-eid="qd_M194" data-bid="1011767060">
                                        <div class="recmd-commet">${bookList2.bookShortDescribe}</div>
                                        <img src="../${bookList2.bookCover}"  alt="${bookList2.bookName}封面图" class="recmd-list-img">
                                        <div class="recmd-list-title" data-eid="qd_M195" data-bid="1011767060" >${bookList2.bookName}</div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div id="tabTarget2" class="ui-tab-content">
                        <ul class="recmd-list ui-loading" id="elRecList2" data-l3="1" style="height: 169px;">
                        </ul>
                    </div>
                </div>
            </div>
            <div class="qdp-border table-x shelf-default shelf-table" data-l2="3" >
                <div class="table-msg" data-l3="2">
                    <h2 class="shelf-title" id="shelfTitle" data-gid="-100">书架</h2>共<strong class="dark ml5 mr5" id="elMoTotal">${booklistsize}</strong><span id="shelfAmount">本书籍</span>

                </div>
                <div class="table-size" data-l3="2">
                    <table id="shelfTable" class="ui-table table-checkbox" data-count="0" >
                        <tr>
                            <th scope="col"></th>
                            <th scope="col" width="125" style="margin-left: -70px"> 类型 书名  最近更新章节</th>
                            <th scope="col" width="70">更新时间</th>
                            <th scope="col" width="30">作者</th>
                            <th scope="col" width="130">阅读进度</th>
                        </tr>
                        <c:forEach items="${bookList1}" var="booklist" varStatus="status">
                        <tr id="${booklist.book.bookId}" class="checktr" >
                            <td> <img src="../Images/delete.png" style="width: 20px;height: 20px;display: none" class="${booklist.book.bookId}"></td>
                            <td id="all"  style="margin-left: 30px">
                                <a href="<%=basePath%>reader/searchBooks.action?keyWord=${booklist.bookStyle.bookStyleName}" class="" id="check"  title="「${booklist.bookStyle.bookStyleName}」">  「${booklist.bookStyle.bookStyleName}」</a>
                                    <c:if test="${booklist.book.bookDownShelf==true}">
                                        <a href="javascript:;"class="info" id="check2" title="${booklist.book.bookName}">  ${booklist.book.bookName} </a>
                                    </c:if>
                                    <c:if test="${booklist.book.bookDownShelf==false}">
                                         <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${booklist.book.bookId}" class="" id="check2" title="${booklist.book.bookName}">  ${booklist.book.bookName}  </a>
                                    </c:if>
                                   <c:if test="${booklist.book.bookDownShelf==false}">
                                         <a href="<%=basePath%>reader/readChapter.action?chapterId=${booklist.maxchapter.chapterId}" class="" id="check3" title="${booklist.maxchapter.chapterName}">  ${booklist.maxchapter.chapterName}</a>
                                   </c:if>
                                   <c:if test="${booklist.book.bookDownShelf==true}">
                                       <a href="javascript:;" class="info" id="check3" title="${booklist.maxchapter.chapterName}">  ${booklist.maxchapter.chapterName}</a>
                                   </c:if>
                            </td>
                            <td title="<fmt:formatDate value="${booklist.maxchapter.chapterRefreshTime}" pattern="yyyy-MM-dd hh:mm:ss"/>}"><fmt:formatDate value="${booklist.maxchapter.chapterRefreshTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
                            <td id="all"><a href="<%=basePath%>write/writeInformation.action?writerId=${booklist.writer.writerId}" title="${booklist.writer.writerNeckName}">${booklist.writer.writerNeckName}</a></td>
                            <td id="all" title="${booklist.readingChapter.chapterName}">
                                <span style="background-color: red;color: white">${booklist.downShelfOrNot}</span>
                                <span style="background-color: #0f9cd5;color: white">${booklist.updateOrNot}</span>
                                阅读到
                                <c:if test="${booklist.book.bookDownShelf==false}">
                                      <a href="<%=basePath%>reader/readChapter.action?chapterId=${booklist.readingChapter.chapterId}">
                                    第${booklist.readingChapter.chapterNum}章 ${booklist.readingChapter.chapterName}</a>
                                </c:if>
                                <c:if test="${booklist.book.bookDownShelf==true}">
                                      <a href="javascript:;" class="info">
                                    第${booklist.readingChapter.chapterNum}章 ${booklist.readingChapter.chapterName}</a>
                                </c:if>


                            </td>
                        </tr>
                        </c:forEach>
                    </table>
            </div>
        </div>
        </div>
    <div class="go-top dn">
        <div class="go-top-wrap">
            <a href="#" class="icon-go-top bTips" title="返回顶部" ><i class="iconfont icon-backtop"></i></a>
        </div>
    </div>
</div>
</div>
</body>
<script>
    $(function () {
        $("table#shelfTable tr.checktr td#all a").mouseover(function (e) {
            $(this).addClass("act");
            $(this).siblings().removeClass("act");
            $(this).parent().siblings().children("a").removeClass("act");
            $(this).parent().parent().siblings().children("#all").children("a").removeClass("act")

        })
    })
    $(".checktr").each(function () {
        $(this).click(function () {
            var aa=$(this).attr("id");
            if($("."+aa).css("display")=="none") {
                $("." + aa).css("display", "block");
            }else {
                $("."+aa).css("display","none");
            }
        var aa=$(this).attr("id");
        $("."+aa).click(function () {
            $.ajax({
                type:"POST",
                url:"<%=basePath%>reader/removeBookShelfBook.action",
                data:"bookId="+aa,
                success:function (data) {
                    if(data){
                        alert("已将该书从书架删除！！！")
                         $("#"+aa).css("display","none");
                    }else{
                        alert("删除书架失败！！！")
                    }
                },
               error:function () {
                  alert("哎呀！出错了")
              }
        })
            })
        })
        })
    $(".info").each(function () {
        $(this).click(function () {
            alert("该书籍已下架")
        })
    })

</script>
</html>
