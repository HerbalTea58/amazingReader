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
    <script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
<%--                        <dd><a href="<%=basePath%>manager/getAllReportComment.action">全部评论举报</a></dd>
                        <dd><a href="<%=basePath%>manager/getAllReportChapter.action">全部章节举报</a></dd>--%>
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
                        <h4>被举报用户 <span class="badge">历史被举报次数</span>
                            <span class="badge" style="background-color: #ddd;color: red">
                                处理状态
                            </span>
                        </h4>
                        <p style="word-wrap:break-word; word-break:break-all; overflow: hidden; "><span style="color: white;font-size: 12px">被举报评论：</span>被举报评论内容</p>
                        <p style="word-wrap:break-word; word-break:break-all; overflow: hidden; ">
                            <span style="color: white;font-size: 12px">举报原因：</span>
                            举报原因
                        </p>
                        <p><a href="#" class="btn btn-primary" role="button">删除评论</a> <a href="#" class="btn btn-default" role="button">驳回举报</a></p>
                    </div>
                </div>
            </div>
            <c:if test="${not empty reportComments}">
                <c:forEach items="${reportComments}" var="reportComment" varStatus="s">
                    <div class="col-sm-6 col-md-4" id="reportNum+${s.index+1}">
                        <div class="thumbnail">
                                <%--<img src="..." alt="...">--%>
                            <div class="caption">
                                <h4>${reportComment.reportReader.readerNeckName}
                                    <span class="badge" style="background-color: #00a5e0;color: white">
                                            ${reportComment.reportReader.reportedTimes}
                                    </span>&nbsp;
                                    <span class="badge" style="background-color: #ddd;color: red">
                                待处理
                            </span>
                                </h4>
                                <p style="word-wrap:break-word; word-break:break-all; overflow: hidden; ">
                                    <span style="color: grey;font-size: 12px">评论内容：</span>
                                        ${reportComment.reportedComment.commentContent}
                                </p>
                                <p style="word-wrap:break-word; word-break:break-all; overflow: hidden; ">
                                    <span style="color: grey;font-size: 12px">举报原因：</span>
                                    <c:choose>
                                        <c:when test="${reportComment.reportTypeId==1}"><span style="color: yellowgreen">色情低俗</span></c:when>
                                        <c:when test="${reportComment.reportTypeId==2}"><span style="color: #0D63CD">垃圾广告</span></c:when>
                                        <c:when test="${reportComment.reportTypeId==3}"><span style="color: red"><strong>政治敏感</strong></span></c:when>
                                        <c:when test="${reportComment.reportTypeId==4}">其他</c:when>
                                    </c:choose>
                                </p>
                                <p><a href="javascript:;" class="btn btn-primary" onclick="removeComment(${reportComment.reportedComment.commentId},${reportComment.reportId})" role="button">删除评论</a>
                                    <a href="javascript:;" onclick="refuseCommentReport(${reportComment.reportId})" class="btn btn-default" role="button">驳回举报</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

        </div><%--end of row--%>
        <script>
            function refuseCommentReport(reportId){
                $.ajax({
                    url:'<%=basePath%>manager/refuseReportComment.action?reportId='+reportId,
                    async:true,
                    success:function(info) {
                        location.reload();
                    }
                })
            }
        </script>
        <script>
            function removeComment(commentId,reportId){
                layui.use('layer',function(){
                    var layer = layui.layer;
                    var index = layer.open({
                        offset:("40%","30%"),
                        title:'是否删除',
                        content:'<p style="text-align: center"><strong>删除评论将不能恢复！</strong></p>',
                        yes : function(){
                            $.ajax({
                                url:'<%=basePath%>manager/deleteComment.action?reportId='+reportId+'&commentId='+commentId,
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
<script>
    $("#chapter_report_to_deal").click(function() {
        $.ajax({
            url: "<%=basePath%>manager/getAllReportedChapter.action", async: true,
            success: function (info) {
                $("#layui-body").html("")
                for(var i in info){
                    var div = " <div class = 'reportedChapter' style='width: 450px;float: left; margin-left: 30px;margin-top: 10px;' > " +
                        "<form action='' method='post'>           <div class='reportedWriterInfo'>" +
                        "                 <div class='layui-row  btn btn-default' style='width: 100%'> " +
                        "                       <div class='layui-col-md2'>"+
                                                    +"作者："+info[i]["reportedWriter"]["writerNeckName"]+
                                                    "</div>" +
                        " <div class='layui-col-md4' style='overflow: hidden'>"+
                        "章节："+info[i]["reportedChapter"]["chapterName"]+
                        "(id:"+info[i]["reportedChapter"]["chapterId"]+")" +
                        "                 </div>" +
                        "                 <div class='layui-col-md4'>" +
                        "                   <span style='color: #0a789b'>"+info[i]["reportStatuName"]+"</span>" +
                        "                 </div> " +
                        "                 </div>" +
                            "       <div class='layui-row btn btn-default' style='width: 100%'>" +
                                        "<div class='layui-col-md12'>" +
                                            info[i]["reportedChapter"]["chapterName"]+
                                        "</div>" +
                                     "</div>"+
                        "             <div class='layui-row'>" +
                        "                    <div class='layui-col-md12 reportedChapterContent' style=' height :300px;overflow: scroll;'>"+
                        info[i]["reportedChapter"]["chapterContent"]+"" +
                        "                    </div>" +
                        "             </div>" +
                                       "<div class='layui-row'>" +
                                        "     <div class='layui-col-md12 btn btn-default'>"+
                                                    "举报理由："+info[i]["reportReason"]
                                        +" </div>"+
                    "                   </div>"+
                                        "<div class='layui-row'>" +
                                        "     <div class='layui-col-md12 btn btn-default'>"+
                                        "<input type='text' name='solution' style='width: 100%; border: none'/>"
                                        +" </div>"+
                    "                   </div>"+
                        "           </div> " +
                        "       </div>";
                    $("#layui-body").append(div)
                }
            }
        });
    });

    $(document).ready(function(){
        $(".reportedChapterContent").toggle(function(){
            $(this).animate({height: 'toggle', opacity: 'toggle'}, "slow");
        },function(){
            $(this).animate({height: 'toggle', opacity: 'toggle'});
        });
    });
</script>


</body>
</html>
