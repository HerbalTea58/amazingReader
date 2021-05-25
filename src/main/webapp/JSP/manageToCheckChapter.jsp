<%@ page import="javax.swing.plaf.basic.BasicEditorPaneUI" %>
<%@ page import="com.amazingReader.entity.Writer" %>
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
    <script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
<script>
    function readCheckChapter(bookId,chapterNum) {
        window.open('<%=basePath%>manager/readCheckChapter.action?bookId=' + bookId + '&chapterNum=' + chapterNum)
    }

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
        <c:forEach items="${writerList}" var="writer">
            <c:if test="${writer.toCheckChapterNum != 0}">
                <div style="margin: 10px;padding: 10px;border-bottom: 2px solid #000;overflow: hidden">
                <div class="media" style="width: 100%;">
                    <%--<div class="media-left">
                        <a href="<%=basePath%>write/writeInformation.action?writerId=${writer.writerId}">
                            <img class="media-object" src="<%=basePath%>${writer.writerPortrait}" width="100" height="140" alt="${writer.writerNeckName}">
                        </a>
                    </div>--%>
                    <div class="media-body" style="border-bottom: #ddd">
                        <h3 class="media-heading">${writer.writerNeckName}</h3>
                        ${writer.writerShortRecommend}
                    </div>
                </div>
                <script>
                    function refuse(bookId,chapterNum) {
                        $.ajax({
                            url:'<%=basePath%>manager/refuseChapter.action?bookId='+bookId+'&chapterNum='+chapterNum
                            ,async:true
                            ,success:function(){
                                location.reload();
                            }
                        })
                    }

                    function acceptReUpShelf(bookId,chapterNum){
                        $.ajax({
                            url:'<%=basePath%>manager/alterChapterInShelf.action?bookId='+bookId+'&chapterNum='+chapterNum
                            ,async:true
                            ,success:function(){
                                location.reload();
                            }
                        })
                    }
                    function acceptUpShelf(bookId,chapterNum){
                        $.ajax({
                            url:'<%=basePath%>manager/upShelfToChapters.action?bookId='+bookId+'&chapterNum='+chapterNum
                            ,async:true
                            ,success:function(){
                                location.reload();
                            }
                        })
                    }
                </script>
                <div class="writerBooks" style="width: 100%;border-radius: 1em;border-bottom: none;padding: 10px;">
                    <c:forEach items="${writer.books}" var="book">
                        <c:if test="${fn:length(book.toCheckChapters) > 0}">
                            <div class="col-sm-8 col-md-6" id="reportNum0" style="border-bottom:#dddddd ">
                        <div class="media" style="width: 100%;border-bottom: 1px solid #6a6a6a;">
                            <div class="media-left" style="float: left;width: 28%;box-shadow: #dddddd">
                                <img class="media-object" src="<%=basePath%>${book.bookCover}" width="100" height="140" alt="${book.bookName}">
                            </div>
                            <div <%--class="media-body"--%> style="float:left;width:70%;height: 150px;border-radius: 5px;overflow: auto">
                                <table style="width: 100%;">

                                <c:forEach items="${book.toCheckChapters}" var="toCheckChapter">
                                    <tr style="border-bottom: 1px solid #ddd">
                                        <td><a href="javascript:;" onclick="readCheckChapter(${toCheckChapter.checkChapterBookId},${toCheckChapter.checkChapterNum})" style="width: 100%; text-align: left;border: hidden" class="btn btn-default" role="button">${toCheckChapter.checkChapterName}</a></td>
                                        <td><a href="javascript:;" onclick="refuse(${toCheckChapter.checkChapterBookId},${toCheckChapter.checkChapterNum})" style="border: hidden;width: 100%;" class="btn btn-default" role="button">驳回</a></td>
                                        <c:if test="${toCheckChapter.checkChapterFrom}">
                                            <td><a href="javascript:;" onclick="acceptReUpShelf(${toCheckChapter.checkChapterBookId},${toCheckChapter.checkChapterNum})" style="border: hidden;border-radius: 0;width: 100%;" class="btn btn-primary" role="button">同意更改</a></td>
                                        </c:if>
                                        <c:if test="${!toCheckChapter.checkChapterFrom}">
                                            <td><a href="javascript:;" onclick="acceptUpShelf(${toCheckChapter.checkChapterBookId},${toCheckChapter.checkChapterNum})"  style="border: hidden;border-radius: 0;width: 100%;" class="btn btn-success" role="button">同意上架</a></td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </table>
                            </div>
                        </div>
                        <%--<div class="thumbnail">
                            <img src="<%=basePath%>${book.bookCover}" alt="${book.bookName}" width="50" height="70" alt="${book.bookName}">
                            <div class="caption" style="background-color: #00a5e0;color: white">
                                <h4>被举报作者<span class="badge">历史被举报次数</span>
                                    <span class="badge" style="background-color: #ddd;color: red">
                                    处理状态
                                </span>
                                </h4>

                            </div>
                        </div>--%>
                    </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            </c:if>
        </c:forEach>

    </div>
    <script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>

    <script type="text/javascript">
//        $("#select").submit(
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
                        // alert(list[i].bookStyleId + "jdfosifjoe"+ list[i].bookStyleName);
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

