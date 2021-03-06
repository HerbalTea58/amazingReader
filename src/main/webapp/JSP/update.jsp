


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息设置_个人中心_惊鸿书院</title>
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <link rel="icon" type="image/x-icon" href="//qidian.gtimg.com/qdp/img/favicon.0.2.ico">



    <link rel="icon" type="image/x-icon" href="../Images/log.png">
<link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/common.0.80.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/index.0.3.csss"/>
<link rel="stylesheet" data-ignore="true" href="../Css/idnex.0.11.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/sprite.0.12.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/index.0.14.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/Date.04.css"/>
<script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>



</head>
<style>
    .btn btn-info{
        border-radius: 2px;
        background-color: #0f9cd5;
    }
</style>
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
                <a href="javascript:;" data-rel="tabTarget1" class="checked" data-eid="qd_M134">修改昵称</a>
            </div>
            <div id="jsTabContents" class="ui-tab-contents" >
                <div id="tabTarget1" class="ui-tab-content checked" data-l3="24" style="background-color:#f7f6f2">
                    <div class="qdp-form">
                        <p style="color: red">昵称不能为空哦！！！</p>
                    </div>
                    <div style="margin-left:40px; margin-top:-10px; background-color:#FFF; width:300px;height: 30px ">
                     		<input type="text" name="kw" id="name" value="${reader.readerNeckName}" class="shelf-search-input" placeholder="">
                    </div>

                    <div class="" style="margin-top: 10px;margin-left: 40px">
                        <input type="submit" id="dialogMsgSubmit" class="clip">
                        <label class="ui-button" for="dialogMsgSubmit" onclick="update()">保存</label>
                    </div>
                </div>
                </div>
                </div>
                </div>
                </div>
				<div>
                </div>

        </div>
            <div class="personal-footer">
                
                <div class="footer-menu">
                    <a href="" target="_blank">关于惊鸿</a>
                    <a href="" target="_blank">联系我们</a>
                    <a href="">加入我们</a>
                    <a href="" target="_blank">帮助中心</a>
                    <a href="" class="commitAdvice" target="_blank">提交建议</a>
                </div>
                <div class="footer-copyright">
                    <p>Copyright (C) 2002-2018 www.qidian.com All Rights Reserved 版权所有 </p>
                    <p>上海玄霆娱乐信息科技有限公司 上海玄霆娱乐信息科技有限公司 增值电信业务经营许可证沪B2-20080046 沪网文[2017]0081-031 新出网证(沪)字010 沪ICP备08017520号-1</p>
                    <p>请所有作者发布作品时务必遵守国家互联网信息管理办法规定，我们拒绝任何色情小说，一经发现，即作删除！</p>
                    <p>本站所收录作品、社区话题、书库评论及本站所做之广告均属其个人行为，与本站立场无关</p>
                </div>
            </div>
<script>
    function update() {
        var name=$(".shelf-search-input").val()
        $(".shelf-search-input").text(name);
            $.ajax({
            type:"POST",
            url:"<%=basePath%>reader/updateReaderNameTrue.action",
            data:"name="+$(".shelf-search-input").val(),
            success:function (data) {
                 if(data) {
                    $(".shelf-search-input").text(name);
                    alert("修改昵称成功！！");
                 }else{
                     alert("昵称不能为空!!!请您重新输入！")
                }
             },
            });
    }
</script>
</body>
</html>
