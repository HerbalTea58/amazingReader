<%--
  Created by IntelliJ IDEA.
  User: hxl
  Date: 2018/6/5
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>个性化设置</title>
    <!--必要样式-->
    <link rel="stylesheet" href="<%=basePath%>Css/reader/jquery-labelauty.css" />

    <style type="text/css">
        ul{list-style-type: none;}
        li{display: inline-block;}
        li{margin: 10px 0;}
        input.labelauty + label{font:15px "Microsoft Yahei";}
        body{
            background:url("<%=basePath%>Picture/reader/choose2.jpg") no-repeat;
        }
    </style>

</head>

<body>

<center>
    <h2>请选择您的标签，我们会根据您的选择为您推荐书籍</h2><span ><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;跳过</a></span>

    <h3>您的性别</h3>
    <form action="<%=basePath%>Reader/readerLovesAdd.action" method="post">
    <ul class="dowebok">
        <li><input type="radio" value="男生" id="sex" name="radio" data-labelauty="男生"></li>
        <li><input type="radio" value="女生" name="radio" data-labelauty="女生"></li>
    </ul>

    <hr/>

    <h3>您喜欢的类型标签</h3>
    <ul class="dowebok">
    <c:forEach var="lables" items="${requestScope.labels}">
        <li><input type="checkbox" value="${lables.bookStyleId}" name="checkbox" data-labelauty="${lables.bookStyleName}"></li>
    </c:forEach>
    </ul>
    <p/>
    <p/>
    <ul class="dowebok">
        <li><input type="submit" style="font-size: 22px; align-content: center; color: #0f9cd5;text-decoration: none;" value="选好了,进入我的首页>>>>"/></li>
   <%-- <a href="<%=basePath%>Reader/readerLovesAdd.action" style="font-size: 25px; align-content: center; color: #0f9cd5;text-decoration: none;">选好了,进入我的首页>>>></a>--%>
    </ul>
    </form>

</center>

<script type="text/javascript" src="<%=basePath%>JS/reader/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>JS/reader/jquery-labelauty.js"></script>
<script type="text/javascript">
    $(function(){
        $(':input').labelauty();
    });
</script>

</body>
</html>