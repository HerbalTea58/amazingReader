<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 18-6-4
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>${book.bookName}_${chapter.chapterName}_评论区</title>
</head>
<link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
<script src="<%=basePath%>layui/layui.js"></script>
<link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<body>
<div class="container">

    <div class="commments" style="width: 70%;float: left">
        <c:forEach items="${posts}" var="post">
            <div class="post" style="margin-top:20px;line-height: 40px; border: 1px solid #000" id="${post.commentId}" >
                <div class="info" style="line-height: 40px;clear: both;background-color: #aaa">
                    <div style="text-align: left;float: left; margin-left: 20px"><img src="<%=basePath%>${post.reader.readerPortrait}" alt="头像" class="img-circle" width="30px" height="40px"></div>
                    <div style="text-align: center;float: left;margin-left: 5px"><a href="#">${post.reader.readerNeckName}</a></div>
                    <div style="text-align: right;float: left;margin-left: 10px"><span style="color: #980c10">${post.reader.readerScore}</span></div>
                </div>
                <p><hr></p>
                <div class="commentContent" style="clear: both; background-color: #fff">
                    <div style="padding-left:10%;">
                        ${post.commentContent}
                    </div>
                    <div class="report"><a href=""></a></div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
