<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="最好看的原创小说网">
    <meta name="description" content="小说网女生频道是精品原创女生小说网,提供好看的原创言情小说,玄幻小说,武侠小说,穿越小说,都市小说,历史军事小说,校园言情小说,总裁豪门小说,科幻小说,恐怖小说等在线阅读,热门原创小说无广告弹窗在线阅读最新章节就在掌阅小说网。">
    <meta name="copyright" content="本页版权 yc.ireader.com.cn 惊鸿小说阅读网所有 All right reserved "/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>Css/common1.css"/>
	<link type="text/css" rel="stylesheet" href="<%=basePath%>Css/mwpd.css">
    <script type="text/javascript" src="<%=basePath%>Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Scripts/jquery.lazyload1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>Scripts/layer.js"></script>
    <script type="text/javascript" src="<%=basePath%>Scripts/common1.js"></script>
    <script type="text/javascript">var user_id = '0';</script>

    <%--引用首页的样式--%>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/global.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">
    <title>惊鸿女频</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>

</head>
<body class="woman pd">
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
                    <li><a href="<%=basePath%>reader/rank/showRanks1.action">排行榜</a><img src="<%=basePath%>Picture/new.png" alt="new"/></li>
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



<div class="content pdcon" style="margin-top: 20px;">
    <div class="f1 area">
        <div class="f1_L">
            <div class="tjw">
                <ul id="mod_index_lb_nv_pic">
                                    <li>
                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topLeft1.bookId}" title="${requestScope.topLeft1.bookName}" target="_blank" class="book_cov">
                            <img src="<%=basePath%>Picture/grey.gif" data-src="<%=basePath%>${requestScope.topLeft1.bookCover}" class="lazyload_lb_nv" alt="${requestScope.topLeft1.bookName}">
                        </a>
                    </li>
                                    <li>
                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topLeft2.bookId}" title="${requestScope.topLeft2.bookName}" target="_blank" class="book_cov">
                            <img src="<%=basePath%>Picture/grey.gif" data-src="<%=basePath%>${requestScope.topLeft2.bookCover}" class="lazyload_lb_nv" alt="${requestScope.topLeft2.bookName}">
                        </a>
                    </li>
                                    <li>
                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topLeft3.bookId}" title="${requestScope.topLeft3.bookName}" target="_blank" class="book_cov">
                            <img src="<%=basePath%>Picture/grey.gif" data-src="<%=basePath%>${requestScope.topLeft3.bookCover}" class="lazyload_lb_nv" alt="${requestScope.topLeft3.bookName}">
                        </a>
                    </li>
                                    <li>
                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topLeft4.bookId}" title="${requestScope.topLeft4.bookName}" target="_blank" class="book_cov">
                            <img src="<%=basePath%>Picture/grey.gif" data-src="<%=basePath%>${requestScope.topLeft4.bookCover}" class="lazyload_lb_nv" alt="${requestScope.topLeft4.bookName}">
                        </a>
                    </li>
                                    <li>
                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topLeft5.bookId}" title="${requestScope.topLeft5.bookName}" target="_blank" class="book_cov">
                            <img src="<%=basePath%>Picture/grey.gif" data-src="<%=basePath%>${requestScope.topLeft5.bookCover}" class="lazyload_lb_nv" alt="${requestScope.topLeft5.bookName}">
                        </a>
                    </li>
                                </ul>
            </div>
            <ol id="btn_index_lb_nv">
                            <li data-desc="${requestScope.topLeft1.bookShortDescribe}" class="on"><s class="arr"></s><s class="xh">1</s><i>${requestScope.topLeft1.bookName}</i></li>
                            <li data-desc="${requestScope.topLeft2.bookShortDescribe}"><s class="arr"></s><s class="xh">2</s><i>${requestScope.topLeft2.bookName}</i></li>
                            <li data-desc="${requestScope.topLeft3.bookShortDescribe}"><s class="arr"></s><s class="xh">3</s><i>${requestScope.topLeft3.bookName}</i></li>
                            <li data-desc="${requestScope.topLeft4.bookShortDescribe}"><s class="arr"></s><s class="xh">4</s><i>${requestScope.topLeft4.bookName}</i></li>
                            <li data-desc="${requestScope.topLeft5.bookShortDescribe}"><s class="arr"></s><s class="xh">5</s><i>${requestScope.topLeft5.bookName}</i></li>
                        </ol>
            <div class="book_inf" id="mod_index_lb_nv_txt">
                            <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topLeft1.bookId}" title="${requestScope.topLeft1.bookName}" target="_blank" class="zdz">${requestScope.topLeft1.bookName}</a></h3>
                <p class="int">${requestScope.topLeft1.bookShortDescribe}</p>
            </div>
        </div>
        <div class="f1_C">
                        <ul class="sts">
                            <li   class="first">
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topMid1_1.bookId}" title="${requestScope.topMid1_1.bookName}" target="_blank"  class="zdz">${requestScope.topMid1_1.bookName}</a>
                            </li>
                            <c:forEach items="${requestScope.topMid1}" var="book1">
                                <li  >
                                    <a style="font-size: 13px" href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book1.bookId}" title="${book1.bookName}" target="_blank">${book1.bookName}</a>
                                    <p style="color:#9e9e9e;font-size: 13px;">&nbsp;作者：${book1.writer.writerNeckName}</p>
                                  <%--  <p style="width: 130px;height: 35px;color: #7F8994;font-size: 12px;">${book1.bookShortDescribe}</p>--%>

                                </li>
                            </c:forEach>
                        </ul>
                        <ul class="sts">
                            <li   class="first">
                                <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topMid2_1.bookId}" title="${requestScope.topMid2_1.bookName}" target="_blank"  class="zdz">${requestScope.topMid2_1.bookName}</a>
                            </li>
                            <c:forEach items="${requestScope.topMid2}" var="book2">
                                <li  >
                                    <a style="font-size: 13px" href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book2.bookId}" title="${book2.bookName}" target="_blank" >${book2.bookName}</a>
                                    <p style="color:#9e9e9e;font-size: 13px;">&nbsp;作者：${book2.writer.writerNeckName}</p>
                                </li>
                            </c:forEach>
                        </ul>

                        <ul class="sts nobor">
                                            <li   class="first">
                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${requestScope.topMid3_1.bookId}" title="${requestScope.topMid3_1.bookName}" target="_blank"  class="zdz">${requestScope.topMid3_1.bookName}</a>
                            </li>
                            <c:forEach items="${requestScope.topMid3}" var="book3">
                                <li  >
                                    <a style="font-size: 13px" href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book3.bookId}" title="${book3.bookName}" target="_blank" >${book3.bookName}</a>
                                    <p style="color:#9e9e9e;font-size: 13px;">&nbsp;作者：${book3.writer.writerNeckName}</p>
                                </li>
                            </c:forEach>
                        </ul>
        </div>
        <div class="com_R">
            <h2><s></s>推荐榜</h2>
            <div class="list_wrap">
                <ol class="list" id="tj_list">
                    <c:forEach items="${requestScope.topRights}" var="books" >
                        <c:choose>
                            <c:when test="${books.readerNum==0}">
                                <li class="lis_sh  cur">
                                    <em  class="red_bg">${books.readerNum+1}</em>
                                    <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}"  title="${books.bookName}" target="_blank">${books.bookName}</a></h3>
                                    <div class="open">
                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}" target="_blank" class="book_cov">
                                            <img src="<%=basePath%>${books.bookCover}" data-src="<%=basePath%>${books.bookCover}" class="lazyload_book_cover" alt="${books.bookName}">
                                        </a>
                                        <div class="book_inf">
                                            <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}"  title="${books.bookName}" target="_blank">${books.bookName}</a></h3>
                                            <span class="aut">作者：${books.writer.writerNeckName}</span>
                                        </div>
                                    </div>
                                </li>
                            </c:when>
                            <c:when test="${books.readerNum>0 and books.readerNum<3}">
                                <li class="lis_sh">
                                    <em  class="red_bg">${books.readerNum+1}</em>
                                    <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}"  title="${books.bookName}" target="_blank">${books.bookName}</a></h3>
                                    <div class="open">
                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}" target="_blank" class="book_cov">
                                            <img src="<%=basePath%>${books.bookCover}" data-src="<%=basePath%>${books.bookCover}" class="lazyload_book_cover" alt="${books.bookName}">
                                        </a>
                                        <div class="book_inf">
                                            <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}"  title="${books.bookName}" target="_blank">${books.bookName}</a></h3>
                                            <span class="aut">作者：${books.writer.writerNeckName}</span>
                                        </div>
                                    </div>
                                </li>
                            </c:when>
                            <c:when test="${books.readerNum>=3 and books.readerNum<10}">
                                <li class="lis_sh">
                                    <em>${books.readerNum+1}</em>
                                    <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}"  title="${books.bookName}" target="_blank">${books.bookName}</a></h3>
                                    <div class="open">
                                        <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}" target="_blank" class="book_cov">
                                            <img src="<%=basePath%>${books.bookCover}" data-src="<%=basePath%>${books.bookCover}" class="lazyload_book_cover" alt="${books.bookName}">
                                        </a>
                                        <div class="book_inf">
                                            <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${books.bookId}"  title="${books.bookName}" target="_blank">${books.bookName}</a></h3>
                                            <span class="aut">作者：${books.writer.writerNeckName}</span>
                                        </div>
                                    </div>
                                </li>
                            </c:when>
                        </c:choose>

                    </c:forEach>
                    <span class="more"><a href="<%=basePath%>reader/showRanks1.action" target="_blank"><s></s><i>查看更多</i><s></s></a></span>
                </ol>
            </div>
        </div>
    </div>
    <div class="srb area">
        <div class="tit titp" id="style1">
            <s class="qyb"></s>
            <p><span style="margin-bottom: 17px;">免</span><br>
                <span  style="margin-bottom: 17px;">费</span><br>
                <span style="margin-bottom: 17px;">专</span><br>
                <span style="margin-bottom: 17px;">区</span></p>
        </div>
        <ul>
            <c:forEach items="${requestScope.freeBooksOfWoman}" var="freeBoos">

                        <li>
					<span>
						<a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${freeBoos.bookId}" title="${freeBoos.bookName}" target="_blank" class="book_cov">
                            <img src="<%=basePath%>Picture/default.jpg" data-src="<%=basePath%>${freeBoos.bookCover}" class="lazyload_book_cover" alt="${freeBoos.bookName}">
                            <s  class="rb">${freeBoos.readerNum+1}</s>
                        </a>
					</span>
                            <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${freeBoos.bookId}" title="${freeBoos.bookName}" target="_blank">${freeBoos.bookName}</a></h3>
                        </li>

            </c:forEach>
            <c:if test="${requestScope.freeSize<10}">
                <span style="display:inline-block;margin-top:87px; margin-left:85px; width: 260px;height: 32px; font-size: 15px;margin-bottom: 10px;"><a>还有更多免费书籍，敬请期待>></a></span>
            </c:if>

        </ul>
    </div>


    <div class="adv">
        <a href="/book/66749/" title="天命逆凰" target="_blank">
            <img src="Picture/grey.gif" data-src="http://img.yc.ireader.com.cn/ad/20170705/165123_1.jpg" class="lazyload" alt="天命逆凰">
        </a>
    </div>
    <div class="f2 area">
        <div class="f2_L">
            <h2 class="tit titp comtit"><s class="qyb"></s>火热新书</h2>
            <div class="f2_L_con">
                <div class="sw">
                    <c:forEach items="${requestScope.newBookList1}" var="newBooks1">
                        <c:choose>
                            <c:when test="${newBooks1.readerNum==0}">
                                <div class="sw_t">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${newBooks1.bookId}" target="_blank" class="book_cov">
                                        <img src="<%=basePath%>Picture/default.jpg" data-src="<%=basePath%>${newBooks1.bookCover}" class="lazyload_book_cover" alt="${newBooks1.bookName}">
                                    </a>
                                    <div class="book_inf">
                                        <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${newBooks1.bookId}" title="${newBooks1.bookName}"  target="_blank">${newBooks1.bookName}</a></h3>
                                        <p class="aut">作者:${newBooks1.writer.writerNeckName}</p>
                                        <p class="int">${newBooks1.bookShortDescribe}
                                        </p>
                                    </div>
                                </div>
                                <ul class="sts">
                            </c:when>
                            <c:when test="${newBooks1.readerNum>0 and newBooks1.readerNum<4}">
                                <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${newBooks1.bookId}" title="${newBooks1.styleName}" target="_blank">[ ${newBooks1.styleName} ]</a></span><a href="/book/78429/" title="${newBooks1.bookName}" target="_blank">${newBooks1.bookName}</a></li>
                            </c:when>
                            <c:when test="${newBooks1.readerNum==4}">
                                <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${newBooks1.bookId}" title="${newBooks1.styleName}" target="_blank">[ ${newBooks1.styleName} ]</a></span><a href="/book/78429/" title="${newBooks1.bookName}" target="_blank">${newBooks1.bookName}</a></li>
                                </ul>
                            </c:when>
                        </c:choose>
                    </c:forEach>


                </div>
                <div class="sw sw02">
                <c:forEach items="${requestScope.newBookList2}" var="newBooks2">
                    <c:choose>
                        <c:when test="${newBooks2.readerNum==5}">

                        <div class="sw_t">
                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${newBooks2.bookId}" target="_blank" class="book_cov">
                                <img src="<%=basePath%>Picture/default.jpg" data-src="<%=basePath%>${newBooks2.bookCover}" class="lazyload_book_cover" alt="${newBooks2.bookName}">
                            </a>
                            <div class="book_inf">
                            <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${newBooks2.bookId}" title="${newBooks2.bookName}"  target="_blank">${newBooks2.bookName}</a></h3>
                            <p class="aut">作者:${newBooks2.writer.writerNeckName}</p>
                            <p class="int">${newBooks2.bookShortDescribe}
                            </p>
                            </div>
                        </div>
                        <ul class="sts">
                        </c:when>
                          <c:when test="${newBooks2.readerNum>5 and newBooks2.readerNum<9}">
                              <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${newBooks2.bookId}" title="${newBooks2.styleName}" target="_blank">[ ${newBooks2.styleName} ]</a></span><a href="/book/78429/" title="${newBooks2.bookName}" target="_blank">${newBooks2.bookName}</a></li>
                          </c:when>
                          <c:when test="${newBooks2.readerNum==9}">
                              <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${newBooks2.bookId}" title="${newBooks2.styleName}" target="_blank">[ ${newBooks2.styleName} ]</a></span><a href="/book/78429/" title="${newBooks2.bookName}" target="_blank">${newBooks2.bookName}</a></li>
                              </ul>
                          </c:when>
                    </c:choose>
                </c:forEach>
                </div>
            </div>


            <h2 class="tit titp comtit end"><s class="qyb"></s>完本完结</h2>
            <div class="f2_L_con">
                <div class="sw">
                    <c:forEach items="${requestScope.finishedBookList1}" var="finishedBooks1">
                        <c:choose>
                            <c:when test="${finishedBooks1.readerNum==0}">
                                <div class="sw_t">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks1.bookId}" target="_blank" class="book_cov">
                                        <img src="<%=basePath%>Picture/default.jpg" data-src="<%=basePath%>${finishedBooks1.bookCover}" class="lazyload_book_cover" alt="${finishedBooks1.bookName}">
                                    </a>
                                    <div class="book_inf">
                                        <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks1.bookId}" title="${finishedBooks1.bookName}"  target="_blank">${finishedBooks1.bookName}</a></h3>
                                        <p class="aut">作者:${finishedBooks1.writer.writerNeckName}</p>
                                        <p class="int">${finishedBooks1.bookShortDescribe}
                                        </p>
                                    </div>
                                </div>
                                <ul class="sts">
                            </c:when>
                            <c:when test="${finishedBooks1.readerNum>0 and finishedBooks1.readerNum<4}">
                                <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks1.bookId}" title="${finishedBooks1.styleName}" target="_blank">[ ${finishedBooks1.styleName} ]</a></span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks1.bookId}" title="${finishedBooks1.bookName}" target="_blank">${finishedBooks1.bookName}</a></li>
                            </c:when>
                            <c:when test="${finishedBooks1.readerNum==4}">
                                <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks1.bookId}" title="${finishedBooks1.styleName}" target="_blank">[ ${finishedBooks1.styleName} ]</a></span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks1.bookId}" title="${finishedBooks1.bookName}" target="_blank">${finishedBooks1.bookName}</a></li>
                                </ul>
                            </c:when>
                        </c:choose>
                    </c:forEach>


                </div>
                <div class="sw sw02">
                    <c:forEach items="${requestScope.finishedBookList2}" var="finishedBooks2">
                        <c:choose>
                            <c:when test="${finishedBooks2.readerNum==5}">

                                <div class="sw_t">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks2.bookId}" target="_blank" class="book_cov">
                                        <img src="<%=basePath%>Picture/default.jpg" data-src="<%=basePath%>${finishedBooks2.bookCover}" class="lazyload_book_cover" alt="${finishedBooks2.bookName}">
                                    </a>
                                    <div class="book_inf">
                                        <h3><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks2.bookId}" title="${finishedBooks2.bookName}"  target="_blank">${finishedBooks2.bookName}</a></h3>
                                        <p class="aut">作者:${finishedBooks2.writer.writerNeckName}</p>
                                        <p class="int">${finishedBooks2.bookShortDescribe}
                                        </p>
                                    </div>
                                </div>
                                <ul class="sts">
                            </c:when>
                            <c:when test="${finishedBooks2.readerNum>5 and finishedBooks2.readerNum<9}">
                                <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks2.bookId}" title="${finishedBooks2.styleName}" target="_blank">[ ${finishedBooks2.styleName} ]</a></span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks2.bookId}" title="${finishedBooks2.bookName}" target="_blank">${finishedBooks2.bookName}</a></li>
                            </c:when>
                            <c:when test="${finishedBooks2.readerNum==9}">
                                <li><span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks2.bookId}" title="${finishedBooks2.styleName}" target="_blank">[ ${finishedBooks2.styleName} ]</a></span><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${finishedBooks2.bookId}" title="${finishedBooks2.bookName}" target="_blank">${finishedBooks2.bookName}</a></li>
                                </ul>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="com_R">
            <h2><s></s>收藏榜</h2>
            <div class="list_wrap">
                <ol class="list">
                <c:forEach items="${requestScope.collectedBookList}" var="collectedooks">
                    <c:choose>
                        <c:when test="${collectedooks.readerNum==0}">
                            <li   class="lis_sh">
                                <em  class="red_bg">${collectedooks.readerNum+1}</em>
                                <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}"  title="${collectedooks.bookName}" target="_blank">${collectedooks.bookName}</a></h3>
                                <div class="open">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}" target="_blank" class="book_cov">
                                        <img src="<%=basePath%>Picture/default.jpg" data-src="<%=basePath%>${collectedooks.bookCover}" class="lazyload_book_cover" alt="{collectedooks.bookName}">
                                    </a>
                                    <div class="book_inf">
                                        <span class="aut">作者：${collectedooks.writer.writerNeckName}</span>
                                        <span>类别：<a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}" title="${collectedooks.styleName}" target="_blank">${collectedooks.styleName}</a></span>
                                        <p class="int">${collectedooks.bookShortDescribe}</p>
                                    </div>
                                </div>
                            </li>
                        </c:when>
                        <c:when test="${collectedooks.readerNum>0 and collectedooks.readerNum<3}">
                            <li>
                                <em  class="red_bg">${collectedooks.readerNum+1}</em>
                                <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}"  title="${collectedooks.bookName}" target="_blank">${collectedooks.bookName}</a></h3>
                                <div class="open">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}" target="_blank" class="book_cov">
                                        <img src="<%=basePath%>Picture/default.jpg" data-src="<%=basePath%>${collectedooks.bookCover}" class="lazyload_book_cover" alt="{collectedooks.bookName}">
                                    </a>
                                    <div class="book_inf">
                                        <span class="aut">作者：${collectedooks.writer.writerNeckName}</span>
                                        <span>类别：<a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}" title="${collectedooks.styleName}" target="_blank">${collectedooks.styleName}</a></span>
                                        <p class="int">${collectedooks.bookShortDescribe}</p>
                                    </div>
                                </div>
                            </li>
                        </c:when>
                        <c:when test="${collectedooks.readerNum>=3 and collectedooks.readerNum<10}">
                            <li>
                                <em>${collectedooks.readerNum+1}</em>
                                <h3 class="name"><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}"  title="${collectedooks.bookName}" target="_blank">${collectedooks.bookName}</a></h3>
                                <div class="open">
                                    <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}" target="_blank" class="book_cov">
                                        <img src="<%=basePath%>Picture/default.jpg" data-src="<%=basePath%>${collectedooks.bookCover}" class="lazyload_book_cover" alt="{collectedooks.bookName}">
                                    </a>
                                    <div class="book_inf">
                                        <span class="aut">作者：${collectedooks.writer.writerNeckName}</span>
                                        <span>类别：<a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${collectedooks.bookId}" title="${collectedooks.styleName}" target="_blank">${collectedooks.styleName}</a></span>
                                        <p class="int">${collectedooks.bookShortDescribe}</p>
                                    </div>
                                </div>
                            </li>
                        </c:when>
                    </c:choose>

                </c:forEach>
                </ol>
                <span class="more"><a href="<%=basePath%>reader/showRanks1.action" target="_blank"><s></s><i>查看更多</i><s></s></a></span>
            </div>
        </div>
    </div>
    <div class="adv">
        <a href="/book/65637/" title="盛世帝王妃" target="_blank">
            <img src="Picture/grey.gif" data-src="http://img.yc.ireader.com.cn/ad/20170705/165222_52.jpg" class="lazyload" alt="盛世帝王妃">
        </a>
    </div>


    </div>
</div>

<script type="text/javascript" src="../Scripts/index1.js"></script>

<!--内容 结束-->
<!--公共底部 开始-->
<div class="v1_foot" style="margin-top: 60px">

    <div class="aboutcompany">
        <p class="link"  style="margin-top: 60px">

            <a href="#" target="_blank">联系我们</a>
            <a href="#" target="_blank">商务合作</a>
            <a href="#" target="_blank">关于我们</a>
            <a href="#" target="_blank">法律声明</a>
        </p>
        <p>
            <a href="#" target="_blank">出版物经营许可证</a>
            京ICP备11008516号<a target="_blank">
            网络出版服务许可证（总）网出证（京）字第141号</a>
            <a href="#" target="_blank">京ICP证090653号</a><a href="#"  target="_blank" ><img style="margin-right:5px; display:inline; vertical-align:middle; margin-top:-2px" src="<%=basePath%>Picture/web_record.png">京公网安备11010502030452</a></p>
        <p>2018 All Rights Reserved  惊鸿科技股份有限公司 版权所有</p>
    </div>
</div>
<!--公共底部 结束-->

<span class="gotop" id="btn_back_top" title="返回顶部"><img src="<%=basePath%>Picture/gotop.png" data-src="/static/images/common/gotop_hov.png" alt="返回顶部"></span>

<script type="text/javascript">
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?10e53c6d39dab05a49df82fec406c083";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
    (function() {
        var bp = document.createElement('script');
        bp.src = '//push.zhanzhang.baidu.com/push.js';
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
</body>

</html>
