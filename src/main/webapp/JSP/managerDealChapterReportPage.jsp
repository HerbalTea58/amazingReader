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
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script src="<%=basePath%>layui/layui.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
   <%-- <script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
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
       <%-- <ul class="layui-nav layui-layout-left">
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
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>

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

        <%--显示举报信息列表--%>

        <div class="row" style="margin: 10px auto;">
            <div class="col-sm-6 col-md-4" id="reportNum0">
                <div class="thumbnail">
                    <%--<img src="..." alt="...">--%>
                    <div class="caption" style="background-color: #00a5e0;color: white">
                        <h4>被举报作者 <span class="badge">历史被举报次数</span>
                            <span class="badge" style="background-color: #ddd;color: red">
                                处理状态
                            </span>
                        </h4>
                        <p style="word-wrap:break-word; word-break:break-all; overflow: hidden; "><span style="color: white;font-size: 12px">举报章节：</span>被举报章节</p>
                        <p style="word-wrap:break-word; word-break:break-all; overflow: hidden; ">
                            <span style="color: white;font-size: 12px">举报原因：</span>
                            举报原因
                        </p>
                        <p><a href="#" class="btn btn-primary" role="button">下架该章节</a> <a href="#" class="btn btn-default" role="button">驳回举报</a></p>
                    </div>
                </div>
            </div>
            <c:if test="${not empty reportChapters}">
                <c:forEach items="${reportChapters}" var="reportChapter" varStatus="s">
                    <div class="col-sm-6 col-md-4" id="reportNum+${s.index+1}">
                        <div class="thumbnail">
                                <%--<img src="..." alt="...">--%>
                            <div class="caption">
                                <h4>${reportChapter.reportedWriter.writerNeckName}
                                    <span class="badge" style="background-color: #00a5e0;color: white">

                            </span>&nbsp;
                                    <span class="badge" style="background-color: #ddd;color: red">
                                待处理
                            </span>
                                </h4>
                                <p style="word-wrap:break-word; word-break:break-all; overflow: hidden; ">
                                    <span style="color: grey;font-size: 12px">举报章节：</span>
                                    <a href="<%=basePath%>reader/readChapter.action?chapterId=${reportChapter.reportedChapter.chapterId}">
                                            ${reportChapter.reportedChapter.chapterName}
                                    </a>
                                </p>
                                <p style="word-wrap:break-word; word-break:break-all; overflow: hidden; ">
                                    <span style="color: grey;font-size: 12px">举报原因：</span>
                                    <c:choose>
                                        <c:when test="${reportChapter.reportTypeId==1}"><span style="color: yellowgreen">色情低俗</span></c:when>
                                        <c:when test="${reportChapter.reportTypeId==2}"><span style="color: #0D63CD">垃圾广告</span></c:when>
                                        <c:when test="${reportChapter.reportTypeId==3}"><span style="color: red"><strong>政治敏感</strong></span></c:when>
                                        <c:when test="${reportChapter.reportTypeId==4}">其他</c:when>
                                    </c:choose>
                                </p>
                                <p><a href="javascript:;" class="btn btn-primary" onclick="removeChapter(${reportChapter.reportedChapter.chapterId},${reportChapter.reportId})" role="button">下架该章节</a>
                                    <a href="javascript:;" onclick="refuseChapterReport(${reportChapter.reportId})" class="btn btn-default" role="button">驳回举报</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

        </div><%--end of row--%>
        <script>
            function refuseChapterReport(reportId){
                $.ajax({
                    url:'<%=basePath%>manager/refuseReportChapter.action?reportId='+reportId,
                    async:true,
                    success:function(info) {
                       location.reload();}

                })
            }
        </script>
        <script>
            function removeChapter(chapterId,reportId){
                layui.use('layer',function(){
                    var layer = layui.layer;
                    var index = layer.open({
                        offset:("40%","30%"),
                        title:'是否下架',
                        content:'<p style="text-align: center"><strong>要将该章节下架么！</strong></p>',
                        yes : function(){
                            $.ajax({
                                url:'<%=basePath%>manager/downShelfChapter.action?reportId='+reportId+'&chapterId='+chapterId,
                                async:true,
                                success:function(info) {
                                  location.reload();
                                }
                            })
                            layer.close(index);
                        },anim: 4
                    })
                })

            }
        </script>

        <c:if test="${commentReports != null}">
            <c:forEach items="commentReports" var="report">
                <div class="reportInfo" style="width: 450px;">
                    <table class="table table-hover">
                        <tr>
                            <td rowspan="2">${report.reportedComment.commentContent}</td>
                            <td><strong>评论人</strong></td>
                            <td>${report.reportedComment.reader.name}</td>
                            <td>${report.reportedComment.reader.id}</td>
                            <td><a href="<%=basePath%>blockReader.action?readerId="${report.reportedComment.reader.id}>封号</a></td>
                            <td>1</td>
                        </tr>

                        <tr>

                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>

                        </tr>

                    </table>

                </div>
            </c:forEach>
        </c:if>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
        <i class="layui-icon layui-icon-login-wechat"></i>
    </div>
</div>

<script src="file:///G|/src/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>

</body>
</html>
