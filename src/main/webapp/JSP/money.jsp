

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
    <title>账务中心_个人中心_惊鸿书院</title>
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <link rel="icon" type="image/x-icon" href="../Images/log.png">
<link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/common.0.80.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/idnex0.15.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/sprite.0.12.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/idnex.0.11.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
<style>
    .act{
        color: #ee4259;

    }
    .button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        margin-left: 600px;
    }
    .button4 {background-color: #e7e7e7; color: black;} /* Gray */

    .top{
        position: absolute;
        z-index: 1;
     }

</style>
</head>
<body class="finance">
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
                            <a href="<%=basePath%>person/personal.action" class="header-nav-a active" accesskey="1" data-eid="qd_M01"><i class=" "></i>我的首页</a>
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
                      
                        <li class="sideBar-group">
                            <a href="<%=basePath%>reader/readerRecommendTicketsRecord.action" class="sideBar-list-a" data-eid="qd_M13"><i class=""></i>我的票夹</a>
                        </li>
                        <li class="sideBar-group">
                            <a href="<%=basePath%>readercomment/Readercomments.action" class="sideBar-list-a" data-eid="qd_M15"><i class=""></i>我的书评</a>
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
        <div class="qdp-content" data-l1="3">
            <h2 class="qdp-title">我的资产</h2>
            
            <div class="finance-asset" data-l2="2">
                <h3 class="asset-title">账户余额（惊鸿币）</h3>
                <div class="asset-count">
                    ${reader.readerBalance}
                    <div class="asset-recharge-wrapper2" style="display: none">
                        <a href="<%=basePath%>recharge/recharge.action" class="recharge-button ui-button elPayBtn" target="_blank" data-eid="qd_M44" data-l3="6">充值</a>
                    </div>
                </div>

                <div class="asset-recharge-wrapper">
                    <a href="<%=basePath%>recharge/recharge.action" class="asset-rebate blue" target="_blank" data-eid="qd_M43" data-l3="5"></a><a href="<%=basePath%>recharge/recharge.action" class="recharge-button ui-button elPayBtn1" target="_blank" data-eid="qd_M44" data-l3="6" style="margin-top: 30px">充值</a>
                </div>
            </div>
            <h2 class="qdp-title">交易记录<span class="qdp-explain">交易记录可能存在延时，仅供参考，请以实际金额变化为准</span></h2>
            <div class="finance-record qdp-record" >
                <div id="tabView" class="ui-tab-tabs" data-l2="2">
                    <a href="javascript:;" class="checked" data-rel="tabTarget1" data-eid="qd_M45">消费记录</a>
                </div>
                <div class="ui-tab-contents" data-l2="2">
                    <div id="tabTarget1" class="ui-tab-content checked">
                        <div id="tableTarget1" class="table-x piaojia-month-table">
                            <div class="table-size">
                                <textarea id="tplTotalMonth" class="dn"><tr>
                                    <th scope="col" width="350">使用惊鸿币数量</th>
                                    <th scope="col">使用时间</th>
                                </tr></textarea>
                                <table class="ui-table" id="shelfTable">
                                      <tr>
                                        <th scope="col" width="50">消费惊鸿币</th>
                                        <th scope="col" width="90">消费时间</th>
                                        <th scope="col" width="40">类别</th>
                                        <th scope="col" width="130">消费对象（点击对象查看消费详情）</th>
                                      </tr>
                                    <c:forEach items="${orderIntroduceLists}" var="orderIntroduceLists">
                                        <tr class="checktr">
                                            <td>${orderIntroduceLists.readerOrder.readerOrderPrice}  </td>
                                            <td><fmt:formatDate value="${orderIntroduceLists.readerOrder.readerOrderTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
                                            <td>${orderIntroduceLists.readerOrderType.orderTypeName}</td>
                                            <td id="all">
                                                <a href="<%=basePath%>reader/readermoneyDetail.action?orderId=${orderIntroduceLists.readerOrder.readerOrderId}" class="tooltip"><span style="font-size: 15px">${orderIntroduceLists.book.bookName}</span></a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </table>
                             </div>
                             <div class="table-page-x elTablePage">
                                 <div class="table-page"></div>
                             </div>
                        </div>
                    </div>
                    <div id="tabTarget3" class="ui-tab-content ">
                        <div class="table-msg">储值记录可能存在延时，仅供参考。台湾储值自动处理时间在6小时内不允许合并缴款，每一笔订单必须独立缴款一次，才能保证储值成功。</div>

                    </div>
                    <div id="tabTarget4" class="ui-tab-content ">
                        <!-- <div class="table-msg">累计获赠<span class="table-outstd">0</span>起点币</div> -->
                    </div>
                </div>
            </div>
        </div>

        <script id="tplDialogConsumeDetail" type="text/ejs-template">
        </script>
        </div>
</body>
<script>
        $(function () {
            $("table#shelfTable tr.checktr td#all a").mouseover(function (e) {
                $(this).addClass("act");
                $(this).siblings().removeClass("act");
                $(this).parent().siblings().children("a").removeClass("act");
                $(this).parent().parent().siblings().children("#all").children("a").removeClass("act")

            })
        })

</script>
</html>

