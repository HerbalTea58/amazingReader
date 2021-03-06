<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/12
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>创建新书</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_all.css" type="text/css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_addBook.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_pop.css" type="text/css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">

    <script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>

    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
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
        <button id="submit1" type="button" class="submit">提交</button>
        <button id="close" type="button" id="cancel" class="submit1">取消</button>
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
                <div class="context_title1">&nbsp;作品创建</div>
            </div>
            <div id="step1" class="step" style="font-size: 18px">
                <img src="../Images/writer_nove_1.png" width="1028px"/>
                <span class="span2">目标读者</span>
                <input id="radio1" class="radio1" type="radio"  name="sex" value="male" /><label class="label1">男生</label>
                <span class="radioLabel1">以男性视角或男性受众为主的作品，玄幻/奇幻/历史/都市/灵异/仙侠/游戏/二次元/武侠/军事等所有男生题材</span>
                <input id="radio2" class="radio2" type="radio"  name="sex" value="female"/><label class="label2">女生</label>
                <span class="radioLabel2">以女性视角或女性受众为主的作品，古言/现言/玄幻/青春/悬疑/科幻/仙侠/游戏/N次元等所有女生题材</span>
                <button class="stepbutton1" id="stepbutton1">下一步</button>
            </div>
            <div id="step2" class="step" style="display: none">
                <form action="${pageContext.request.contextPath}/Writer/WriterAddNewNovel.action" onsubmit="return check()" method="post">
                    <img src="../Images/writer_nove_2.png" width="1028px"/>
                    <span class="span1">作品名称</span>
                    <input id="bookName2" class="input1" name="name" type="text" value=""/>
                    <span id="bookName3" class="bookName2"></span>
                    <span class="bookLabel">15字内，请勿添加书名号等特殊符号</span>

                    <span class="span3">作品类型</span>
                    <select id="select11" class="select11">
                        <option value="-">— —</option>
                        <c:forEach var="male" items="${MaleList}">
                            <option value="${male.bookStyleId}">${male.bookStyleName}</option>
                        </c:forEach>
                    </select>
                    <select id="select12"  class="select12">
                        <option value="-">— —</option>
                        <c:forEach var="female" items="${FemaleList}">
                            <option value="${female.bookStyleId}">${female.bookStyleName}</option>
                        </c:forEach>
                    </select>
                    <select id="select2" class="select2" name="bookstyle">
                        <option value="-">— —</option>
                    </select>
                    <span id="select111" class="select111"></span>

                    <span class="span4">作品标签</span>
                    <div id="labels" class="input_label1" type="text"></div>
                    <input id="inputlabel" class="input_label2">
                    <button id="addlable" type="button" class="addlabel">添加标签</button>
                    <input name="labels" id="getLabels" type="hidden"/>
                    <span class="spanlabel">标签最多可创建5个</span>

                    <span class="span5">推荐语</span>
                    <input type="text" class="input5" name="recommend"/>
                    <span class="span6">作品简介</span>
                    <textarea name="introduction" type="text" class="input6"></textarea>
                    <button type="submit" id="submit" class="submit2">创建新书</button>
                    <span class="intrLabel">20～300字</span>
                </form>
            </div>
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
    document.getElementById("stepbutton1").onclick = function () {
        document.getElementById("step1").style.display = "none";
        document.getElementById("step2").style.display = "block";
        document.getElementById("step3").style.display = "none";
    }
    document.getElementById("submit").onclick = function () {
        document.getElementById("step1").style.display = "none";
        document.getElementById("step2").style.display = "none";
        document.getElementById("step3").style.display = "block";
    }
</script>
<script type="text/javascript">
    var i=1;
    document.getElementById("addlable").onclick = function () {
        if (i > 5) {
            alert("标签数量超过5个");
        } else {
            var sel = document.getElementById("inputlabel").value;
            var labels = document.getElementById("labels");
            var label = document.createElement("span");
            label.className = "label";
            label.innerText = sel;

            var remove = document.createElement("button");
            remove.className = "remove";
            remove.innerText = "X";
            remove.type = "button";
            remove.id = "remove_label" + i;
            remove.addEventListener("click", remove_label, false);
            i = i + 1;
            label.appendChild(remove);

            labels.appendChild(label);

            var labellist = document.getElementsByClassName("label");
            var value1;
            for(var j=0; j<labellist.length; j++){
                if(j==0){
                    value1=labellist[0].innerText;
                }else {
                    value1 = value1 + labellist[j].innerText;
                }
            }
            document.getElementById("getLabels").value = value1;
        }
        document.getElementById("inputlabel").value = "";
    }
    function remove_label() {
        var label = this.parentNode;
        label.remove();
        i--;
        var labellist = document.getElementsByClassName("label");
        var value1;
        for(var j=0; j<labellist.length; j++){
            if(j==0){
                value1=labellist[0].innerText;
            }else {
                value1 = value1 + labellist[j].innerText;
            }
        }
        document.getElementById("getLabels").value = value1;
    }

</script>
<script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>
<script type="text/javascript">
    document.getElementById("select11").onchange = function () {
        var sel = document.getElementById("select11").value;
        if(sel != "-"){
            var select2 = document.getElementById("select2");
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

    }
</script>
<script type="text/javascript">
    document.getElementById("select12").onchange = function () {
        var sel = document.getElementById("select12").value;
        if(sel != "-"){
            var select2 = document.getElementById("select2");
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
                    var select = document.getElementById("select2");
                    for(var i=0; i<=list.length; i++){
                        alert(list[i].bookStyleId + "jdfosifjoe"+ list[i].bookStyleName);
                        select.options.add(new Option(list[i].bookStyleName, list[i].bookStyleId));
                    }
                },
                error:function(){
                    alert("失败");
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
                },1000);
            });
        }
    });
    EventUtil.addEvent(EventUtil._$('submit1'),'click', function() {
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
    document.getElementById("radio1").onclick = function () {
        document.getElementById("select11").style.display = "block";
        document.getElementById("select12").style.display = "none";
    }
    document.getElementById("radio2").onclick = function () {
        document.getElementById("select11").style.display = "none";
        document.getElementById("select12").style.display = "block";
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
<script type="text/javascript">
    document.getElementById("bookName2").onblur = function () {
        var value = document.getElementById("bookName2").value;
        if(value == ""){
            document.getElementById("bookName3").innerHTML = "书名不能为空";
            document.getElementById("bookName3").style.color = "red";
        }else {
            var url = '${pageContext.request.contextPath }/Writer/checkBookName2.action';
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

    document.getElementById("select11").onblur = function () {
        var value1 = document.getElementById("select11").value;
        if(value1 == "-"){
            document.getElementById("select111").innerHTML = "请选择类型";
            document.getElementById("select111").style.color = "red";
        }else {
            document.getElementById("select111").innerHTML = "";
            document.getElementById("select111").style.color = "lightgreen";
        }
    }
    document.getElementById("select12").onblur = function () {
        var value1 = document.getElementById("select12").value;
        if(value1 == "-"){
            document.getElementById("select111").innerHTML = "请选择类型";
            document.getElementById("select111").style.color = "red";
        }else {
            document.getElementById("select111").innerHTML = "";
            document.getElementById("select111").style.color = "lightgreen";
        }
    }
    document.getElementById("select2").onblur = function () {
        var value11 = document.getElementById("select11").value;
        var value12= document.getElementById("select12").value;
        var value2 = document.getElementById("select2").value;
        if((value11 == "-" && value12 == "-") || value2 == "-" ){
            document.getElementById("select111").innerHTML = "请选择类型";
            document.getElementById("select111").style.color = "red";
        }else {
            document.getElementById("select111").innerHTML = "";
            document.getElementById("select111").style.color = "lightgreen";
        }
    }

    function check() {
        var value1 = document.getElementById("bookName3").style.color;
        var value2 = document.getElementById("select111").style.color;
        if((value1 == "red") || (value2 == "red")){
            return false;
        }else
            return true;
    }
</script>
</body>
</html>
