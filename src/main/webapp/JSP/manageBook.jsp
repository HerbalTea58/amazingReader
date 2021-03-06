<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 18-6-1
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>

   <%-- <script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script src="<%=basePath%>layui/layui.js"></script>
    <title>惊鸿书院后台</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>


</head>
<body class="layui-layout-body">
<script>

    $(function(){

        $("#test1").click(function(){
            $("#woman").toggleClass("layui-nav-itemed");
        })
    })
    $(function(){

        $("#test2").click(function(){
            $("#man").toggleClass("layui-nav-itemed");
        })
    })


</script>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="color: white;"><strong>惊鸿书院后台管理</strong></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <%--<ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>manager/bookManage.action">书籍管理</a></li>
            <li class="layui-nav-item"><a href="<%=basePath%>writerManage/countWriterIncome.action">作者管理</a></li>
            <li class="layui-nav-item"><a href="<%=basePath%>JSP/managerPlatform.jsp">平台收益管理</a></li>

        </ul>--%>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="<%=basePath%>${sessionScope.manager.managerPortrait}" class="layui-nav-img">
                    ${ sessionScope.manager.managerNeckname}
                </a>


            </li>
            <c:if test="${ empty sessionScope.manager}">
                <li class="layui-nav-item"><a href="<%=basePath%>JSP/managerLogin.jsp">登录</a></li>
            </c:if>
            <li class="layui-nav-item"><a href="<%=basePath%>managerExit.action">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">举报处理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath%>manager/getToDealReportChapter.action" id="chapter_report_to_deal">待处理章节举报</a></dd>
                        <dd><a href="<%=basePath%>manager/getToDealReportComment.action" id="comment_report_to_deal">待处理评论举报</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>writerManage/countWriterIncome.action">作者管理</a>
                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/bookManage.action">书籍管理</a>

                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/bookDownShelf.action">下架管理</a>

                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>JSP/managerPlatform.jsp">平台收益管理</a>

                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/toCheckChaptersManage.action">章节审核</a>
                </li>


            </ul>
        </div>
    </div>

    <div class="layui-body" id="layui-body">
        <!-- 内容主体区域 -->


        <div class="row" style="margin: 10px auto;">
                <!--内容 开始-->
                <div class="content">

                    <!--选择搜索 开始-->
                    <div style="margin-left: 150px;">
                  <%--  <form action="<%=basePath%>manager/getBooksByStyleId.action" method="post" id="select">--%>
                        <input type="hidden" name="styleId" value="1" id="styleId"/>
                        <span class="span2" style="font-size: 16px; "><strong>频道:</strong></span>
                        <c:if test="${not empty manChannel}">
                            <input id="radio1" class="radio1" type="radio"  name="sex" value="male" checked="checked"/><label class="label1">男频</label>
                        </c:if>
                        <c:if test="${empty manChannel}">
                            <input id="radio1" class="radio1" type="radio"  name="sex" value="male"/><label class="label1">男频</label>
                        </c:if>
                      <c:if test="${not empty womanChannel}">
                          <input id="radio2" class="radio2" type="radio"  name="sex" value="female" checked="checked"/><label class="label2">女频</label>

                      </c:if>
                      <c:if test="${empty womanChannel}">
                          <input id="radio2" class="radio2" type="radio"  name="sex" value="female" /><label class="label2">女频</label>
                      </c:if>

                    <span style="font-size: 15px; font-family: 'Microsoft Yahei', arial, sans-serif; margin-left: 20px;" class="span3"><strong>作品类型:</strong></span>

                    <select id="select11" class="select11" style="width: 90px; border-radius: 7px; box-shadow:0 0 5px #ddd;height: 28px;"
                            <c:if test="${empty manChannel}">hidden</c:if>
                            <c:if test="${not empty manChannel}"></c:if>
                    >
                            <option value="请选择">请选择</option>
                        <c:forEach var="male" items="${MaleList}">
                            <c:choose>
                                <c:when test="${bookFirstStyle.bookStyleId == male.bookStyleId}">
                                    <option id="chose1" value="${male.bookStyleId}" selected>${male.bookStyleName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option id="chose1" value="${male.bookStyleId}">${male.bookStyleName}</option>
                                </c:otherwise>
                            </c:choose>


                        </c:forEach>
                    </select>

                      <select id="select12"  style="width: 90px; border-radius: 7px; box-shadow:0 0 5px #ddd;height: 28px;" class="select12" <c:if test="${empty womanChannel}">hidden</c:if>
                      <c:if test="${not empty womanChannel}"></c:if>>
                          <option value="请选择">请选择</option>
                        <c:forEach var="female" items="${FemaleList}">
                            <c:choose>
                                <c:when test="${bookFirstStyle.bookStyleId == female.bookStyleId}">
                                    <option id="chose2" value="${female.bookStyleId}" selected>${female.bookStyleName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option id="chose2" value="${female.bookStyleId}">${female.bookStyleName}</option>
                                </c:otherwise>
                            </c:choose>


                        </c:forEach>
                    </select>
                    <select style="width: 90px; border-radius: 7px; box-shadow:0 0 5px #ddd;height: 28px;" id="select2" class="select2" name="bookstyle">
                        <option value="请选择">请选择</option>
                        <c:if test="${not empty style}">
                          <option value="${style.bookStyleId}" selected>${style.bookStyleName}</option>
                        </c:if>


                    </select>
                    <div class="btn-group" role="group" aria-label="...">
                        <input type="submit" class="btn btn-default" onclick="sub()" value="查询" id="select" style="width: 60px;height: 30px;"></input>
                    </div>

                   <%-- </form>--%>
                    </div>
                    <!--选择搜索 结束-->
                    <!--搜索结果 开始-->
                    <div class="result" mod="search_data_list">
                        <ul>
                            <c:if test="${empty bookList}">
                                <div class="alert alert-warning" role="alert" style="text-align: center; height: 50px; background-color: #fff7e7; line-height: 50px "><span style="">哎呀，没有你要找的东西！</span></div>
                            </c:if>
                            <c:if test="${ not empty bookList}">

                                <c:forEach items="${bookList}" var="book" varStatus="s">
                                    <div class="media" style="margin: 20px 20px;border-bottom: 1px solid #ddd">

                                        <div class="media-left media-top">
                                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book.bookId}">
                                                <img class="media-object" src="<%=basePath%>${book.bookCover}" width="100" height="140" alt="${book.bookName}">
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading">${book.bookName}
                                                <span class="badge" style="background-color: greenyellow;color: black   ">浏览量： ${book.clickTimes}</span>

                                                <c:if test="${book.bookDownShelf}">
                                                    <span class="badge" style="background-color: #ddd;color: red">状态:下架</span>
                                                </c:if>

                                                <c:if test="${!book.bookDownShelf}">
                                                    <span class="badge" style="background-color: #3498db;color: white">状态:在架</span>
                                                </c:if>
                                            </h4>
                                            <p style="word-wrap:break-word; word-break:break-all; overflow: hidden">
                                                <span style="color: white;font-size: 12px">简介：</span>
                                                    ${book.bookShortDescribe}
                                            </p>
                                            <p>
                                                <c:if test="${book.bookDownShelf}">
                                                    <a href="javascript:;" class="btn btn-primary" onclick="reUpToShelfBook(${book.bookId})" role="button">
                                                        上架
                                                    </a>
                                                </c:if>
                                                <c:if test="${!book.bookDownShelf}">
                                                    <a href="javascript:;" onclick="downShelfBook(${book.bookId})" class="btn btn-default" role="button">
                                                        下架
                                                    </a>
                                                </c:if>
                                            </p>
                                        </div>

                                    </div>
                                </c:forEach>
                            </c:if>

                        </ul>
                        <ul>
                            <c:if test="${not empty books}">
                                <c:forEach items="${books}" var="book1" varStatus="s">
                                    <div class="media" style="margin: 20px 20px;border-bottom: 1px solid #ddd">
                                        <div class="media-left media-top">
                                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book1.bookId}">
                                                <img class="media-object" src="<%=basePath%>${book1.bookCover}" width="100" height="140" alt="${book1.bookName}">
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading">${book1.bookName}
                                                <span class="badge" style="background-color: greenyellow;color: black   ">浏览量： ${book1.clickTimes}</span>

                                                <c:if test="${book1.bookDownShelf}">
                                                    <span class="badge" style="background-color: #ddd;color: red">状态:下架</span>
                                                </c:if>

                                                <c:if test="${!book1.bookDownShelf}">
                                                    <span class="badge" style="background-color: #3498db;color: white">状态:在架</span>
                                                </c:if>
                                            </h4>
                                            <p style="word-wrap:break-word; word-break:break-all; overflow: hidden">
                                                <span style="color: white;font-size: 12px">简介：</span>
                                                    ${book1.bookShortDescribe}
                                            </p>
                                            <p>
                                                <c:if test="${book1.bookDownShelf}">
                                                    <a href="javascript:;" class="btn btn-primary" onclick="reUpToShelfBook(${book1.bookId})" role="button">
                                                        上架
                                                    </a>
                                                </c:if>
                                                <c:if test="${!book1.bookDownShelf}">
                                                    <a href="javascript:;" onclick="downShelfBook(${book1.bookId})" class="btn btn-default" role="button">
                                                        下架
                                                    </a>
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

                        </ul>
                        <ul>

                            <c:if test="${not empty downShelfBooks}">
                                <c:if test="${downShelfBooks.size()==0}">
                                    <div class="alert alert-warning" role="alert" style="text-align: center; height: 50px; background-color: #fff7e7; line-height: 50px "><span style="">全部书籍已上架，没有可下架的书籍！</span></div>
                                </c:if>
                                <c:forEach items="${downShelfBooks}" var="book1" varStatus="s">
                                    <div class="media" style="margin: 20px 20px;border-bottom: 1px solid #ddd">
                                        <div class="media-left media-top">
                                            <a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${book1.bookId}">
                                                <img class="media-object" src="<%=basePath%>${book1.bookCover}" width="100" height="140" alt="${book1.bookName}">
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading">${book1.bookName}
                                                <span class="badge" style="background-color: greenyellow;color: black   ">浏览量： ${book1.clickTimes}</span>
                                                <c:if test="${book1.bookDownShelf}">
                                                    <span class="badge" style="background-color: #ddd;color: red">状态:下架</span>
                                                </c:if>

                                                <c:if test="${!book1.bookDownShelf}">
                                                    <span class="badge" style="background-color: #3498db;color: white">状态:在架</span>
                                                </c:if>
                                            </h4>
                                            <p style="word-wrap:break-word; word-break:break-all; overflow: hidden">
                                                <span style="color: white;font-size: 12px">简介：</span>
                                                    ${book1.bookShortDescribe}
                                            </p>
                                            <p>
                                                <c:if test="${book1.bookDownShelf}">
                                                    <a href="javascript:;" class="btn btn-primary" onclick="reUpToShelfBook(${book1.bookId})" role="button">
                                                        上架
                                                    </a>
                                                </c:if>
                                                <c:if test="${!book1.bookDownShelf}">
                                                    <a href="javascript:;" onclick="downShelfBook(${book1.bookId})" class="btn btn-default" role="button">
                                                        下架
                                                    </a>
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

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

                    </div>

                </div>
        </div><%--end of row--%>

    </div>
    <script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>
    <script>
        function downShelfBook(bookId){
            layui.use('layer',function(){
                var layer = layui.layer;
                var index = layer.open({
                    offset:("40%","30%"),
                    title:'是否下架',
                    content:'<p style="text-align: center"><strong>要将该书籍下架么！</strong></p>',
                    yes : function(){
                        $.ajax({
                            url:'<%=basePath%>manager/downShelfBook.action?bookId='+bookId,
                            async:true,
                            success:function(info) {
                                location.reload();
                                //window.refresh();
                            }
                        })
                        layer.close(index);
                    },anim: 6
                })
            })

        }
    </script>
    <script>
        function reUpToShelfBook(bookId){
            layui.use('layer',function(){
                var layer = layui.layer;
                var index = layer.open({
                    offset:("40%","30%"),
                    title:'是否满足上架条件',
                    content:'<p style="text-align: center"><strong>满足上架条件么？</strong></p>',
                    btn:['可以上架','不满足'],
                    yes : function(){
                        $.ajax({
                            url:'<%=basePath%>manager/reUpToShelfBook.action?bookId='+bookId,
                            async:true,
                            success:function(info) {
                                location.reload();
                            }
                        })
                        layer.close(index);
                    },anim:1
                })
            })
        }
    </script>
    <script type="text/javascript">
//        $("#select").submit(

            function sub() {
                if (/*$("#select12").val() =="请选择" || $("#select11").val()=="请选择" || */$("#select2").val()==null ||$("#select2").val()=="" ){
                    alert("格式错误")
                }else{
                    window.location.href = "<%=basePath%>manager/getBooksByStyleId.action?styleId="+$("#select2").val().trim();

                }


                /*alert($("#select2").val().trim())*/
            }
//        )
        document.getElementById("notify").onmouseover = function () {
            document.getElementById("float_div").style.display = "block";
        }
        document.getElementById("notify").onmouseout = function () {
            document.getElementById("float_div").style.display = "none";
        }
    </script>
    <script type="text/javascript">
        document.getElementById("radio1").onclick = function () {
            document.getElementById("select11").style.display = "inline-block";
            document.getElementById("select12").style.display = "none";
        }
        document.getElementById("radio2").onclick = function () {
            document.getElementById("select11").style.display = "none";
            document.getElementById("select12").style.display = "inline-block";
        }
    </script>
    <script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>
    <script type="text/javascript">
        document.getElementById("select11").onchange = function () {
            var sel = document.getElementById("select11").value;
            var select2 = document.getElementById("select2");
            var length = select2.options.length;
            for(var j=length; j>0 ; j--){
                select2.options.remove(j);
            }
            $.ajax({
                type: "POST",
                url: '${pageContext.request.contextPath}/manager/selectStyle.action',
                data: {
                    "styleId":sel
                },
                DataType: "json",
                success: function (list) {
                    var select = document.getElementById("select2");
                    for(var i=0; i<=list.length; i++){
                        select.options.add(new Option(list[i].bookStyleName, list[i].bookStyleId));
                    }
                },
                error:function(){
                    alert("失败");
                }
            });
        }
    </script>
    <script type="text/javascript">
        document.getElementById("select12").onchange = function () {
            var sel = document.getElementById("select12").value;
            var select2 = document.getElementById("select2");
            var length = select2.options.length;
            for(var j=length; j>0 ; j--){
                select2.options.remove(j);
            }
            $.ajax({
                type: "POST",
                url: '${pageContext.request.contextPath}/manager/selectStyle.action',
                data: {
                    "styleId":sel
                },
                DataType: "json",
                success: function (list) {
                    var select = document.getElementById("select2");
                    for(var i=0; i<=list.length; i++){
                        //alert(list[i].bookStyleId + "jdfosifjoe"+ list[i].bookStyleName);
                        select.options.add(new Option(list[i].bookStyleName, list[i].bookStyleId));
                    }
                },
                error:function(){
                    alert("失败");
                }
            });
        }
    </script>
    <script type="text/javascript">
        var t=0;

        var h = 0;
        var y = 0;

        function show(){
            document.getElementById("float_div").style.display = "inline-block";
            out2();
        }
        function notshow() {
            document.getElementById("float_div").style.display = "none";
            out2();
        }
        function over(){
            document.getElementById("float_div").style.display = "inline-block";
        }
        function out2() {
            if(y){
                clearTimeout(y);
                y=0;
            }
        }

        function out(){
            if(h)
            {
                clearTimeout(h);
                h=0;
            }
            if(t==1){
                document.getElementById("float_div").style.display = "none";
            }
        }

    </script>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
        <i class="layui-icon layui-icon-login-wechat"></i>
    </div>
</div>

</body>
</html>

