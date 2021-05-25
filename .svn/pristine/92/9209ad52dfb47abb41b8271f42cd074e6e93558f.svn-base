<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/19
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>书籍设置</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_all.css" type="text/css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_addchapter.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_addchapter_setting.css" type="text/css">
    <script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/wangEditor.js"></script>

    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/PopDrag.js" type="text/javascript"></script>
</head>
<body style="background: #efefef">
<div></div>
<div class="all">
    <div class="head">
        <div class="title">
            <a href="${pageContext.request.contextPath}/JSP/writer_home.jsp"><span class="title1">惊鸿·</span><span class="title2">作家专区</span></a>
        </div>
        <div class="notify">
            <img id="notify" class="img1" src="${pageContext.request.contextPath}/${LoginWriter.writerPortrait}" onclick="over()"><span class="notify1" onclick="over()">个人中心</span>
        </div>
        <div id="float_div" class="float_div" onmouseover="show()" onmouseout="notshow()">
            <div class="arrow"></div>
            <a href="${pageContext.request.contextPath}/JSP/writer_owner.jsp"><span class="float_span">作家资料</span></a>
            <a id="new_button" class="float_span" href="#">更改密码</a>
            <a href="${pageContext.request.contextPath}/Writer/OutLogin.action"><span class="float_span" style="border: none">退出登录</span></a>
        </div>
    </div>
    <div id="changePass" class="popBox">
        <span class="popBoxHandle">修改密码</span>
        <span class="new2">原密码:</span>
        <input id="new3" name="password1" type="password" class="new3"/>
        <span class="new4">新密码:</span>
        <input id="new5" name="password2" type="password" class="new5"/>
        <span class="new6">再次输入:</span>
        <input id="new7" name="password3" type="password" class="new7"/>
        <button id="submit" type="button" class="submit">提交</button>
        <button id="close" type="button" class="submit1">取消</button>
    </div>
    <div class="main">
        <div class="All_label">
            <a href="${pageContext.request.contextPath}/Writer/WriterHome.action"><div class="son_label">
                <span class="label_span">专 区 首 页</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterNovels.action" ><div class="son_label_choosed">
                <span class="label_span_choosed">作 品 管 理</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterDate.action" ><div class="son_label">
                <span class="label_span">数 据 统 计</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterIncome.action" ><div class="son_label">
                <span class="label_span">稿 酬 收 入</span>
            </div></a>
        </div>
        <div class="context">
            <div class="context_title">&nbsp;作品管理
                <div class="context_title1">&nbsp;${book.bookName}</div>
            </div>

            <div id="context_summary" class="context_summary">
                <a id="setting" href="${pageContext.request.contextPath}/Writer/GetDraftSetting.action?id=${book.bookId}"><span class="choosed">作品设置</span></a>
                <a id="draft" href="${pageContext.request.contextPath}/Writer/WriterChapterDraft.action?id=${book.bookId}" ><span class="choosed">草稿箱</span></a>
                <a id="beout" href="${pageContext.request.contextPath}/Writer/WriterChapterBeout.action?id=${book.bookId}"><span class="choosed">已发布章节</span></a>
                <a id="delete" href="${pageContext.request.contextPath}/Writer/WriterChapterDelete.action?id=${book.bookId}"><span class="choosed">回收箱</span></a>
            </div>
            <%--<c:if test="<%= c != choosed%>">
                <script !src="">alert("不为空")</script>
            </c:if>
            <c:if test="<%= c == choosed%>">
                <script>alert("为空")</script>
            </c:if>--%>


            <div id="setting1" class="setting1">
                <form action="${pageContext.request.contextPath}/Writer/BookImgSetting.action?id=${book.bookId}" method="post" enctype="multipart/form-data">
                    <img class="bookImg" src="${pageContext.request.contextPath}/${book.bookCover}"/>
                    <input class="upimg1" name="imgFileUp" type="file" />
                    <button class="upimg" type="submit">上传新封面</button>
                </form>
                 <form action="${pageContext.request.contextPath}/Writer/BookSettingChange.action?id=${book.bookId}" onsubmit="return check()" method="post">
                    <span class="bookName">作品名称:</span>
                    <span id="bookName1" class="bookName1" style="border: none">${book.bookName}</span>
                    <input id="bookName2" name="bookName" class="bookName1" type="text" style="display: none;font-size: 15px" value="${book.bookName}"/>
                     <span id="bookName3" class="bookName2" style="display: none"></span>

                    <span class="bookType">作品类型:</span>
                    <span id="bookType1" class="bookType1" style="border: none">${bookStyle2.bookStyleName}-${bookStyle1.bookStyleName}</span>
                     <select id="select11" class="bookType2" style="display: none;font-size: 15px">
                         <option value="${bookStyle2.bookStyleId}">${bookStyle2.bookStyleName}</option>
                         <c:forEach var="list" items="${StyleList}">
                             <option value="${list.bookStyleId}">${list.bookStyleName}</option>
                         </c:forEach>
                     </select>
                     <select id="select12" name="style"  class="bookType22" style="display: none;font-size: 15px">
                         <option value="${bookStyle1.bookStyleId}">${bookStyle1.bookStyleName}</option>
                     </select>

                    <span class="bookId">书号:</span>
                    <span id="bookId" class="bookId1" style="border: none">${book.bookId}</span>

                    <span class="bookRe">推荐票数:</span>
                    <span id="bookRe1" class="bookRe1" style="border: none">${book.bookRecommendTicket}</span>

                     <span class="bookCo">收藏数:</span>
                     <span id="bookCo1" class="bookCo1" style="border: none">${book.bookCollectedNum}</span>

                    <span class="bookNum">字数:</span>
                    <span class="bookNum1" style="border: none">${num}</span>

                    <span class="bookStatu">作品状态:</span>
                    <span class="bookStatu1" style="border: none">
                        <c:if test="${book.bookStatuId == 1}">
                            连载中
                        </c:if>
                        <c:if test="${book.bookStatuId == 2}">
                            已完结
                        </c:if>
                    </span>

                    <span class="bookDc">作品介绍:</span>
                    <textarea id="bookDc1" class="bookDc1" type="text"  style="border: none;background-color: #ffffff" disabled>${book.bookShortDescribe}</textarea>
                    <textarea id="bookDc2" name="bookDc" class="bookDc1" type="text" style="display: none">${book.bookShortDescribe}</textarea>

                    <button id="update" class="update" type="button">修改作品设置</button>
                    <button id="sure" class="sure" type="submit">确定</button>
                     <button id="cancel" class="cancel" type="button">取消</button>
                </form>


            </div>

        </div>
    </div>

</div>

<script type="text/javascript">

    function show(){
        document.getElementById("float_div").style.display = "block";

    }
    function notshow() {
        document.getElementById("float_div").style.display = "none";

    }
    function over(){
        if(document.getElementById("float_div").style.display == "block")
            document.getElementById("float_div").style.display = "none";
        else
            document.getElementById("float_div").style.display = "block";
    }

</script>
<script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>
<script type="text/javascript">
    document.getElementById("select11").onchange = function () {
        var sel = document.getElementById("select11").value;
        var select2 = document.getElementById("select12");
        var length = select2.options.length;
        for(var j=length; j>0 ; j--){
            select2.options.remove(j);
        }
        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/Writer/selectStyle.action',
            data: {
                "styleId":sel
            },
            DataType: "json",
            success: function (list) {
                var select = document.getElementById("select12");
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
    document.getElementById("update").onclick = function () {
        document.getElementById("bookName1").style.display = "none";
        document.getElementById("bookType1").style.display = "none";
        document.getElementById("bookDc1").style.display = "none";
        document.getElementById("update").style.display = "none";


        document.getElementById("bookName2").style.display = "block";
        document.getElementById("bookName3").style.display = "block";
        document.getElementById("select11").style.display = "block";
        document.getElementById("select12").style.display = "block";
        document.getElementById("bookDc2").style.display = "block";
        document.getElementById("sure").style.display = "block";
        document.getElementById("cancel").style.display = "block";
    }
    document.getElementById("cancel").onclick = function () {
        document.getElementById("bookName1").style.display = "block";
        document.getElementById("bookType1").style.display = "block";
        document.getElementById("bookDc1").style.display = "block";
        document.getElementById("update").style.display = "block";


        document.getElementById("bookName2").style.display = "none";
        document.getElementById("bookName3").style.display = "none";
        document.getElementById("select11").style.display = "none";
        document.getElementById("select12").style.display = "none";
        document.getElementById("bookDc2").style.display = "none";
        document.getElementById("sure").style.display = "none";
        document.getElementById("cancel").style.display = "none";
    }
</script>

<script type="text/javascript">
    var p = new PopUp({
        id: "changePass"
    });
    EventUtil.addEvent(window, 'resize', function () {
        p.setPosition();
        p.enableShadow && p.enableShadow.shadow && p.enableShadow.setProperty(p.enableShadow.shadow);
    });

    EventUtil.addEvent(EventUtil._$('new_button'), 'click', function () {
        p.show({
            /*            x:300,
                        y:300*/
        });
    })
    EventUtil.addEvent(window,'load',function() {
        if((isIE6 || isOpera) && p.isScroll != null && p.isScroll == 'enabled') {
            EventUtil.addEvent(window,'scroll', function() {
                setTimeout(function() {
                    p.setPosition();
                },1000);
            });
        }
    });
    EventUtil.addEvent(EventUtil._$('submit'),'click', function() {
        //自定义点击取消按钮之后得操作
        var value = ${LoginWriter.writerPassword}
        var value1 = document.getElementById("new3").value;
        if(value != value1){
            alert("原密码错误");
        }else {
            var value2 = document.getElementById("new5").value;
            var value3 = document.getElementById("new7").value;
            if(value2 != value3)
                alert("两次输入新密码不同");
            else {
                if(confirm("确定修改密码？")){
                    var url = '${pageContext.request.contextPath }/Writer/ChangePassword.action';
                    $.get(url,"password="+value2,function(data){
                        if(date == true){
                            alert("更新成功");
                        }else {
                            alert("更新失败");
                        }
                    });
                }
                //隐藏弹出框
                p.hide();
            }
        }
    });
    EventUtil.addEvent(EventUtil._$('close'),'click', function() {
        //自定义点击取消按钮之后得操作
        //隐藏弹出框
        p.hide();
    });
</script>

<script type="text/javascript">
    document.getElementById("bookName2").onblur = function () {
        var value1 = document.getElementById("bookName2").value;
        var value = document.getElementById("bookName2").value+"-"+document.getElementById("bookId").innerText;
        if(value1 == ""){
            document.getElementById("bookName3").innerHTML = "笔名不能为空";
            document.getElementById("bookName3").style.color = "red";
        }else {
            var url = '${pageContext.request.contextPath }/Writer/checkBookName.action';
            $.get(url,"value="+value,function(data){
                if(data == '1'){
                    document.getElementById("bookName3").innerHTML = "该书名已经被占用，请尝试其他名称";
                    document.getElementById("bookName3").style.color = "red";
                }
                if(data == '2'){
                    document.getElementById("bookName3").innerHTML = "ok";
                    document.getElementById("bookName3").style.color = "lightgreen";
                }
            });
        }
    }
    
    function check() {
        var value1 = document.getElementById("bookName3").style.color;
        if((value1 == "red")){
            return false;
        }else
            return true;
    }
</script>
</body>
</html>
