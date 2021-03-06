<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/19
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>个人详情</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_all.css" type="text/css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_owner.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_pop.css" type="text/css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">

    <script src="../Scripts/PopDrag.js" type="text/javascript"></script>
    <style>
        a{
            color: #616161;
            text-decoration: none;
        }
    </style>
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
            <a href="${pageContext.request.contextPath}/Writer/WriterNovels.action" ><div class="son_label">
                <span class="label_span">作 品 管 理</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterDate.action" ><div class="son_label">
                <span class="label_span">数 据 统 计</span>
            </div></a>
            <a href="${pageContext.request.contextPath}/Writer/WriterIncome.action" ><div class="son_label">
                <span class="label_span">稿 酬 收 入</span>
            </div></a>
        </div>
        <div class="context">
            <div class="context_title">&nbsp;个人资料</div>
            <form action="${pageContext.request.contextPath}/Writer/WriterInfoDetail.action" method="post" onsubmit="return check()" enctype="multipart/form-data">
                <span class="cover">头像:</span>
                <img class="cover1" src="${pageContext.request.contextPath}/${LoginWriter.writerPortrait}"/>
                <input id="imgUp" class="imgUp" name="imgFileUp" type="file" style="display: none"/>

                <span class="writerName">笔名:</span>
                <span id="writerName1" name="writerName1" class="writerName1">${LoginWriter.writerNeckName}</span>
                <input id="writerName2" name="writerName2" class="writerName1" type="text" value="${LoginWriter.writerNeckName}" style="display: none"/>
                <span id="writerName3" name="writerName3" class="writerName2" style="display: none"></span>

                <span class="writerId">作家ID:</span>
                <span class="writerId1">${LoginWriter.writerId}</span>

                <span class="sex">性别:</span>
                <span id="sex1" name="sex1" class="sex1">
                    <c:if test="${LoginWriter.writerSex  == false}">
                        女
                    </c:if>
                    <c:if test="${LoginWriter.writerSex  == true}">
                        男
                    </c:if>
                </span>
                <input id="sex11" name="sex" class="sex11" type="radio" value="male" style="display: none" ><label id="sex111" class="sex111"  style="display: none">男</label>
                <input id="sex12" name="sex" class="sex12" type="radio" value="femal" style="display: none" ><label id="sex121" class="sex121"  style="display: none">女</label>

                <span class="trueName">真实姓名:</span>
                <span id="trueName1" name="trueName1" class="trueName1">${LoginWriter.writerRealName}</span>
                <input id="trueName2" name="trueName2" class="trueName1" value="${LoginWriter.writerRealName}" style="display: none"/>

                <span class="phones">手机号码:</span>
                <span id="phone1" name="phone1" class="phones1">${LoginWriter.writerTel}</span>
                <input id="phone2" name="phone2" class="phones1" value="${LoginWriter.writerTel}" style="display: none"/>
                <span id="phone3" name="phone3" class="phones2" style="display: none"></span>

                <span class="address1">地址:</span>
                <span id="add1" name="add1" class="address11">${LoginWriter.writerAddress}</span>
                <input id="add2" name="add2" class="address11" value="${LoginWriter.writerAddress}" style="display: none"/>

                <span class="account1">绑定账户:</span>
                <span id="account1" name="account1" class="account11">${(LoginWriter.writerAccount).substring(0,4)}*****${(LoginWriter.writerAccount).substring((LoginWriter.writerAccount).length()-4,(LoginWriter.writerAccount).length())}</span>
                <input id="account2" name="account2" class="account11" value="${LoginWriter.writerAccount}" style="display: none"/>
                <span id="account3" name="account3" class="account2" style="display: none"></span>

                <span class="shortRe">个人简介:</span>
                <textarea id="shortRe1" name="shortRe1" class="shortRe1" disabled style="background-color: #ffffff;border: none">${LoginWriter.writerShortRecommend}</textarea>
                <textarea id="shortRe2" name="shortRe2" class="shortRe1" style="display: none">${LoginWriter.writerShortRecommend}</textarea>

                <button id="change" type="button" class="change">修改信息</button>
                <button id="sure" type="submit" class="change1" style="display:none;">确定</button>
                <button id="cancel" type="button" class="change2" style="display:none;">取消</button>
            </form>
        </div>
    </div>
</div>
<!--公共底部 开始-->
<div style="float: left; margin-left: 230px">
    <div class="aboutcompany">
        <p class="link"  style="margin-top: 60px">
            <a href="<%=basePath%>JSP/managerLogin.jsp" target="_blank">网站管理</a>
            <a href="#" target="_blank">联系我们</a>
            <a href="#" target="_blank">商务合作</a>
            <a href="#" target="_blank">关于我们</a>
            <a href="#" target="_blank">法律声明</a>
        </p>
        <p><a href="#" target="_blank">出版物经营许可证</a>京ICP备11008516号<a target="_blank">网络出版服务许可证（总）网出证（京）字第141号</a><a href="#" target="_blank">京ICP证090653号</a><a href="#"  target="_blank" ><img style="margin-right:5px; display:inline; vertical-align:middle; margin-top:-2px" src="<%=basePath%>Picture/web_record.png">京公网安备11010502030452</a></p>
        <p>2018 All Rights Reserved  惊鸿科技股份有限公司 版权所有</p>
    </div>
</div>
<!--公共底部 结束-->
<script type="text/javascript">
    document.getElementById("change").onclick = function () {
        if((document.getElementById("sex1").innerText) == '女'){
            document.getElementById("sex12").checked = true;
        }
        if((document.getElementById("sex1").innerText) == '男'){
            document.getElementById("sex11").checked = true;
        }

        document.getElementById("writerName1").style.display = "none";
        document.getElementById("sex1").style.display = "none";
        document.getElementById("trueName1").style.display = "none";
        document.getElementById("phone1").style.display = "none";
        document.getElementById("add1").style.display = "none";
        document.getElementById("account1").style.display = "none";
        document.getElementById("shortRe1").style.display = "none";
        document.getElementById("change").style.display = "none";

        document.getElementById("writerName2").style.display = "block";
        document.getElementById("writerName3").style.display = "block";
        document.getElementById("sex11").style.display = "block";
        document.getElementById("sex12").style.display = "block";
        document.getElementById("sex111").style.display = "block";
        document.getElementById("sex121").style.display = "block";
        document.getElementById("trueName2").style.display = "block";
        document.getElementById("phone2").style.display = "block";
        document.getElementById("phone3").style.display = "block";
        document.getElementById("add2").style.display = "block";
        document.getElementById("account2").style.display = "block";
        document.getElementById("account3").style.display = "block";
        document.getElementById("shortRe2").style.display = "block";
        document.getElementById("imgUp").style.display = "block";

        document.getElementById("cancel").style.display = "block";
        document.getElementById("sure").style.display = "block";

        if((document.getElementById("sex1").innerText) == '男'){

        }
        if((document.getElementById("sex1").innerText) == '女'){

            $('#sex12').prop("checked",true)
        }
    }

    document.getElementById("cancel").onclick = function () {
        document.getElementById("writerName1").style.display = "block";
        document.getElementById("sex1").style.display = "block";
        document.getElementById("trueName1").style.display = "block";
        document.getElementById("phone1").style.display = "block";
        document.getElementById("add1").style.display = "block";
        document.getElementById("account1").style.display = "block";
        document.getElementById("shortRe1").style.display = "block";
        document.getElementById("change").style.display = "block";

        document.getElementById("writerName2").style.display = "none";
        document.getElementById("writerName3").style.display = "none";
        document.getElementById("sex11").style.display = "none";
        document.getElementById("sex12").style.display = "none";
        document.getElementById("sex111").style.display = "none";
        document.getElementById("sex121").style.display = "none";
        document.getElementById("trueName2").style.display = "none";
        document.getElementById("phone2").style.display = "none";
        document.getElementById("phone3").style.display = "none";
        document.getElementById("add2").style.display = "none";
        document.getElementById("account2").style.display = "none";
        document.getElementById("account3").style.display = "none";
        document.getElementById("shortRe2").style.display = "none";
        document.getElementById("imgUp").style.display = "none";

        document.getElementById("cancel").style.display = "none";
        document.getElementById("sure").style.display = "none";
    }

</script>
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
<script>
    document.getElementById("phone2").onblur = function (){
        if((document.getElementById("phone2").value) == ""){
            document.getElementById("phone3").innerHTML = "联系方式不能为空";
            document.getElementById("phone3").style.color = "red";
        }
        if((document.getElementById("phone2").value) != ""){
            document.getElementById("phone3").innerHTML = "ok";
            document.getElementById("phone3").style.color = "lightgreen";
        }
    }
    document.getElementById("account2").onblur = function (){
        if((document.getElementById("account2").value) == ""){
            document.getElementById("account3").innerHTML = "绑定账户不能为空";
            document.getElementById("account3").style.color = "red";
        }
        if((document.getElementById("account2").value) != ""){
            document.getElementById("account3").innerHTML = "ok";
            document.getElementById("account3").style.color = "lightgreen";
        }
    }
    document.getElementById("writerName2").onblur = function () {
        var value = document.getElementById("writerName2").value;
        if(value == ""){
            document.getElementById("writerName3").innerHTML = "笔名不能为空";
            document.getElementById("writerName3").style.color = "red";
        }else {
            var url = '${pageContext.request.contextPath }/Writer/checkWriterName.action';
            $.get(url,"value="+value,function(data){
                if(data == '1'){
                    document.getElementById("writerName3").innerHTML = "该笔名已经被占用，请尝试其他笔名";
                    document.getElementById("writerName3").style.color = "red";
                }
                if(data == '2'){
                    document.getElementById("writerName3").innerHTML = "ok";
                    document.getElementById("writerName3").style.color = "lightgreen";
                }
            });
        }
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
                },100);
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
    function check() {
        var value1 = document.getElementById("phone3").style.color;
        var value2 = document.getElementById("account3").style.color;
        var value3 = document.getElementById("writerName3").style.color;

        if((value1 == "red") || (value2 == "red") || (value3 == "red")){
            return false;
        }else
            return true;
    }
</script>
</body>
</html>