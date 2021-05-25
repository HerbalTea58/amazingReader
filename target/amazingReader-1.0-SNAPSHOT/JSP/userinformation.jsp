

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
    p:empty{
        display: none;
    }
    #jsTabContents{
        height: 500px;
    }
    #pic{
        margin-top: 110px;
        margin-left: 250px;
    }
    .operate{
        padding-top: 50px;
        padding-left: 210px;
    }
    .img{
        border-radius: 200px;
    }
</style>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息设置_个人中心_惊鸿书院</title>
    <link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css"/>
    <link rel="icon" type="image/x-icon" href="../Images/log.png">
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script language="javascript" type="text/javascript" src="../JS/WdatePicker.js"></script>
    <style>
        #iptBorth{
            height: 30px;
            width: 200px;

        }
    </style>
</head>
<body class="setting">
<div class="personal-header" data-l1="1">
    <div class="header-wrapper">
        <div class="header-logo">
            <img src="../Picture/惊鸿图标.jpg" style="height: 40px;margin-top: 13px; margin-left:-55px" alt="logo" title="惊鸿书院">
        </div>
        <div class="header-logo">
            <img src="../Images/personal.png" style="height: 25px;margin-top: 23px; margin-left:0px" alt="logo" title="惊鸿书院个人中心"/>
        </div>
        <ul class="header-nav">
            <li class="header-nav-li">
                <a href="<%=basePath%>person/personal.action" class="header-nav-a active" accesskey="1" data-eid="qd_M01"><i class=""></i>我的首页</a>
            </li>
            <li class="header-nav-li" id="headerNav">
                <a href="<%=basePath%>bookshelf/searchbookshelf.action" class="header-nav-a " accesskey="2" data-eid="qd_M02"><i class=""></i>我的书架</a>
            </li>


        </ul>
        <a href="<%=basePath%>reader/userinformation.action?readerId=${reader.readerId}" id="headerLog" class="header-log" data-eid="qd_M06">

            书友${reader.readerNeckName}


        </a>
        <div class="header-goHome">
            <a href="<%=basePath%>Reader/homePageShow.action" target="_blank" accesskey="5" data-eid="qd_M05">惊鸿首页</a>
        </div>
    </div>
    <ul id="headerDropList" class="header-drop">
        <li>
            <a href="<%=basePath%>recharge/recharge.action" target="_blank" data-guid="854007726165" class="elNewToPay" data-eid="qd_M07">充值</a>
        </li>
        <li>
            <a href="<%=basePath%>/exit.action" id="elLoginOut" data-eid="qd_M11">退出</a>
        </li>
    </ul>
</div>


<div class="qdp-wrapper">
    <div class="personal-sideBar" data-l1="2">
        <ul class="sideBar-group">
            <li class="">
                <a href="<%=basePath%>person/personal.action" class="sideBar-list-a"><i class=""></i>首页</a>
            </li>

            <li class="">
                <a href="<%=basePath%>reader/readerRecommendTicketsRecord.action" class="sideBar-list-a" data-eid="qd_M13"><i class=" "></i>我的票夹</a>
            </li>

            <li class="">
                <a href="<%= basePath%>readercomment/Readercomments.action" class="sideBar-list-a" data-eid="qd_M15"><i class=""></i>我的书评</a>
            </li>
        </ul>
        <ul class="sideBar-group">
            <li class="">
                <a href="<%=basePath%>score/personalscore.action" class="sideBar-list-a" data-eid="qd_M16"><i class=""></i>积分等级</a>
            </li>
        </ul>
        <ul class="sideBar-group">

            <li>
                <a href="<%=basePath%>reader/readerSecurity.action" class="sideBar-list-a" target="_blank" data-eid="qd_M20"><i class=""></i>安全中心</a>
            </li>

        </ul>
        <ul class="sideBar-group">

            <li>
                <a href="<%=basePath%>reader/readermoney.action" class="sideBar-list-a" target="_blank" data-eid="qd_M20"><i class=""></i>交易记录</a>
            </li>
        </ul>
        <ul class="sideBar-group">
            <li>
                <a href="<%=basePath%>reader/readerRechargeRecord.action" class="sideBar-list-a" target="_blank" data-eid="qd_M20"><i class=""></i>充值记录</a>
            </li>
        </ul>
    </div>
    <div class="qdp-content" data-l1="3" >
        <h2 class="qdp-hometitle"><a href="<%=basePath%>reader/userinformation.action?readerId=${reader.readerId}">首页</a>&nbsp;>&nbsp;个人信息设置</h2>
        <div class="qdp-record setting-record" data-l2="9">
            <div id="tabView" class="ui-tab-tabs">
                <a href="javascript:;" id="tabTarget1" class="checked" data-eid="qd_M134">基本设置</a>
                <a href="javascript:;" class="" id="tabTarget2" data-eid="qd_M135">头像设置</a>
            </div>
            <div id="jsTabContents" class="ui-tab-contents" >
                <div id="tab1" class="ui-tab-content checked" data-l3="24">
                    <div class="qdp-form" style="height: 800px">
                        <form id="setBasicForm" action="/ajax/basicinfo/update" method="post">
                            <input type="hidden" name="_csrfToken" value="" class="elCsrf" >
                            <dl>
                                <dt>昵称</dt>
                                <dd>${reader.readerNeckName}<a href="<%=basePath%>reader/updateReaderName.action?readerId=${reader.readerId}" id="btnEditName" class="blue ml8" role="button" data-eid="qd_M138">修改昵称</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt>惊鸿ID</dt>
                                <dd>${reader.readerId}</dd>
                            </dl>
                            <dl>
                            <dt>性别</dt>
                                <dd>
                                    <c:if test='${reader.readerSex==true}'>
                                        <input type="radio" id="radioSex1" name="gender" data-eid="qd_M139" required  value="0" checked="checked" >
                                        <label for="radioSex1" class="ui-radio mr5" ></label><label for="radioSex1" class="mr20">男</label>
                                        <input type="radio" id="radioSex2" name="gender" value="1" data-eid="qd_M139"  >
                                        <label for="radioSex2" class="ui-radio ml5 mr5"></label><label for="radioSex2">女</label>
                                    </c:if>
                                    <c:if test='${reader.readerSex==false}'>
                                        <input type="radio" id="radioSex1" name="gender" data-eid="qd_M139" required  value="0" >
                                        <label for="radioSex1" class="ui-radio mr5" ></label><label for="radioSex1" class="mr20">男</label>
                                        <input type="radio" id="radioSex2" name="gender" value="1" data-eid="qd_M139" checked="checked"  >
                                        <label for="radioSex2" class="ui-radio ml5 mr5"></label><label for="radioSex2">女</label>
                                    </c:if>
                                </dd>
                            </dl>
                            <dl>
                                <dt>爱好标签</dt>
                                <c:forEach items="${bookStyleList1}" var="bookStyle" varStatus="v">
                                <dd id="dd${v.index}" class="${bookStyle.bookStyleId}">
                                       <p class="label1"  id="${v.index}"  style="border: 1px dashed;border-color: #0f9cd5;border-radius: 10px;width: 80px;text-align: center;">
                                               ${bookStyle.bookStyleName}
                                       </p>
                                        <img class="${v.index}"id="img" src="../Images/delete1.png" width="10px" height="22px" style="margin-top: -28px;margin-left: 75px;display: none" />
                                </dd>
                                </c:forEach>
                                <a href="<%=basePath%>reader/addReaderLabels.action" onclick="showlabel()"><img src="../Images/add1.png" style="height: 15px;width: 15px;margin-top: 5px; margin-left: 10px" title="增加标签"></a>
                            </dl>
                            </dl>
                        </form>
                    </div>
                </div>
                <div id="tab2" class="ui-tab-content" data-l3="24">
                        <form action="<%=basePath%>reader/updateHeadPortrait.action" method="post" enctype="multipart/form-data">
                            <img name="pic" class="img" id="pic" src="../${reader.readerPortrait}" onclick="showImg()"  alt="书友 ${reader.readerNeckName}的头像" width="200px" height="200px" >
                            <input name="imgFileUp" type="file"/>
                            <div class="operate" style="margin-top: 10px;margin-left: 40px">
                                <input type="submit" id="dialogMsgSubmit" class="clip">
                                <label class="ui-button" for="dialogMsgSubmit" >保存</label>
                                <input type="reset" id="dialogMsgSubmit" class="clip">
                                <label class="ui-button" for="dialogMsgSubmit" >取消</label>
                            </div>
                        </form>
                            <img src="<%=basePath%>${reader.readerPortrait}" class="img2" onclick="hide()" style="width: 460px;height: 460px;margin-top: -420px;padding-left: 195px;display: none"/>
                </div>
            </div>
        </div>
    </div>
</div>
<div>

</div>
<div class="go-top dn">
    <div class="go-top-wrap">
        <a href="#" class="icon-go-top bTips" title="返回顶部" ><i class="iconfont icon-backtop"></i></a>
    </div>
</div>
</div>
<div class="personal-footer">

    <div class="footer-menu">
        <a href="//www.qidian.com/about/intro" target="_blank">关于惊鸿</a>
        <a href="//www.qidian.com/about/contact" target="_blank">联系我们</a>
        <a href="//join.book.qq.com/index.html" target="_blank">加入我们</a>
        <a href="//www.qidian.com/help/index/2" target="_blank">帮助中心</a>
        <a href="http://123.206.70.240/online/?cid=0&uid=10&code=0" class="commitAdvice" target="_blank">提交建议</a>

    </div>
    <div class="footer-copyright">
        <p>Copyright (C) 2002-2018 www.qidian.com All Rights Reserved 版权所有 </p>
        <p>上海玄霆娱乐信息科技有限公司 上海玄霆娱乐信息科技有限公司 增值电信业务经营许可证沪B2-20080046 沪网文[2017]0081-031 新出网证(沪)字010 沪ICP备08017520号-1</p>
        <p>请所有作者发布作品时务必遵守国家互联网信息管理办法规定，我们拒绝任何色情小说，一经发现，即作删除！</p>
        <p>本站所收录作品、社区话题、书库评论及本站所做之广告均属其个人行为，与本站立场无关</p>
    </div>
</div>
</body>
<script>
    $(".label1").each(function () {
      $(this).click(function () {
            a=false;
            var idd=$(this).attr("id");
            var id=$("#dd"+idd).attr("class");
            if($("." + idd).css("display")=='none') {
                $("." + idd).css("display", "block");
            }else {
                $("." + idd).css("display", "none");
            }
             $("."+idd).click(function () {
              var c=   $("#"+idd).text()
               $.ajax({
                   type:"POST",
                   url:"<%=basePath%>reader/removeReaderLabel.action",
                   data:"hobbyStyleId="+id,
                   success:function (data) {
                       if(data){
                           alert("标签删除成功！！！")
                       }else {
                           alert("标签删除失败！！！")
                       }
                   },
                   error:function () {
                       alert("哎呀！出错了！！！");
                   },
               })
                $("#"+idd).css("display", "none");
                $("."+idd).css("display","none");
           })
      })
  })
    function showlabel(){
        if($("#selectlabel").css("display")=='none') {
            $("#selectlabel").css("display", "block");
        }else {
            $("#selectlabel").css("display", "none");
        }
    }
    $("#tabTarget1").click(function () {
        $(this).addClass("checked"),
        $(this).siblings().removeClass("checked"),
        $("#tab1").addClass("checked")
        $("#tab1").siblings().removeClass("checked")

    })
    $("#tabTarget2").click(function () {
        $(this).addClass("checked"),
            $(this).siblings().removeClass("checked"),
            $("#tab2").addClass("checked")
        $("#tab2").siblings().removeClass("checked")

    })
    function showImg(){
        $(".img2").css("display","block");
    }
    function hide() {
        $(".img2").css("display","none");
    }
</script>
</html>

