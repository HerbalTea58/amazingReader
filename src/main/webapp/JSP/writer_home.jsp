<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/1
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html style="background: #efefef">
<head>
    <title>首页</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_all.css" type="text/css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_home.css" type="text/css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>Css/common.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_sign_public.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Css/writer_sign_signin.css" />

    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/PopDrag.js" type="text/javascript"></script>

</head>
<body style="background: #efefef">
<div></div>
<div class="all">
    <div class="head">
        <div class="title">
            <a href="${pageContext.request.contextPath}/JSP/writer_home.jsp"><span class="title1">惊鸿·</span><span class="title2">作家专区</span></a>
            <%--<a href="writer_home.jsp"><img class="logo" src="${pageContext.request.contextPath }/images/logo2.jpg" /><span class="title2">作家专区</span></a>--%>
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
        <button id="close" type="button" id="cancel" class="submit1">取消</button>
    </div>
    <div class="main">
        <div class="All_label">
            <a href="${pageContext.request.contextPath}/Writer/WriterHome.action"><div class="son_label_choosed">
                <span class="label_span_choosed">专 区 首 页</span>
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
            <div class="context_top">
                <img class="img2" src="${pageContext.request.contextPath}/${LoginWriter.writerPortrait}" />
                <span class="call1">${LoginWriter.writerNeckName } 你好</span>
                <jsp:useBean id="time" class="java.util.Date">
                    <jsp:setProperty name="time" property="time"/>
                </jsp:useBean>
                <span class="call2">今天是<fmt:formatDate value="${time }" type="both" pattern="yyyy年MM月dd日，EEEE"/>,今天你已经发布${wordnum}字</span>
                <c:if test="${wordnum < 20}">
                    <div id="sign" style="width: 180px; height: 147px; position: absolute; left: 845px;"></div>
                </c:if>

                <div class="top flex flex-align-end flex-pack-center flex-warp" style="background-color: #cedaeb; float: right; width: 180px;">
                    <div class="out-1 flex flex-align-center flex-pack-center" id="signIn">
                        <div class="out-2 flex flex-align-center flex-pack-center">
                            <div class="signBtn">
                                <strong id="sign-txt">打卡</strong>
                                <span>连续<em id="sign-count">0</em>天</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="context_main">
                <div class="Calendar">
                    <div id="toyear" class="flex flex-pack-center">
                        <div id="idCalendarPre">&lt;</div>
                        <div class="year-month">
                            <span id="idCalendarYear">2018</span>年<span id="idCalendarMonth">6</span>月
                        </div>
                        <div id="idCalendarNext">&gt;</div>
                    </div>
                    <table border="1px" cellpadding="0" cellspacing="0">
                        <thead>
                        <tr class="tou">
                            <td>日</td>
                            <td>一</td>
                            <td>二</td>
                            <td>三</td>
                            <td>四</td>
                            <td>五</td>
                            <td>六</td>
                        </tr>
                        </thead>
                        <tbody id="idCalendar">
                        </tbody>
                    </table>
                </div>
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
<script src="${pageContext.request.contextPath}/jquery-1.11.2.js"></script>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/rili.js"></script>
<script language="JavaScript">
    var isSign = false;
    var myday = new Array(); //已签到的数组
    var signs = ${signins};
    for(var n=0; n<signs.length; n++){
        myday[n] = signs[n];
    }
    var cale = new Calendar("idCalendar", {
        qdDay: myday,
        onToday: function(o) {
            o.className = "onToday";
        },
        onSignIn: function (){
            $$("sign-txt").innerHTML = '已签到';
        },
        onFinish: function() {
            $$("sign-count").innerHTML = myday.length //已签到次数
            $$("idCalendarYear").innerHTML = this.Year;
            $$("idCalendarMonth").innerHTML = this.Month; //表头年份

        }
    });
    $$("idCalendarPre").onclick = function() {
        cale.PreMonth();
    }
    $$("idCalendarNext").onclick = function() {
        cale.NextMonth();
    }
    //添加今天签到
    $$("signIn").onclick = function() {
        if(isSign == false) {
            var res = cale.SignIn();
            if(res == '1') {
                var url = '${pageContext.request.contextPath }/Writer/SignIn.action';
                $.get(url,function(data){
                });
                $$("sign-txt").innerHTML = '已签到';
                $$("sign-count").innerHTML = parseInt($$("sign-count").innerHTML) + 1;
                isSign = true;
            } else if (res == '2'){
                $$("sign-txt").innerHTML = '已签到';
                alert('今天已经签到了')
            }
        } else {
            alert('今天已经签到了')
        }

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
</body>
</html>
