<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的票夹_个人中心_起点中文网</title>
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <link rel="icon" type="image/x-icon" href="../Images/log.png">
    <link rel="stylesheet" data-ignore="true" href="../Css/symbols.3.56.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/common.0.80.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/index.0.3.csss"/>
<link rel="stylesheet" data-ignore="true" href="../Css/idnex.0.11.css"/>
<link rel="stylesheet" data-ignore="true" href="../Css/sprite.0.12.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script>var speedTimer = [], speedZero = new Date().getTime();</script>
    <style>
		.recom-boy {
   			 border-bottom: 1px solid #e0deda;
			}
		.month-wrapper, .recom-boy, .recom-girl {
  			 line-height: 30px;
   			margin: 0 0 0 120px;
   			 padding: 20px 0;
			}
		.qdp-content {
   			 color: #7f7f7f;
			}
		body {
    			font-size: 14px;
    			line-height: 20px;
    			color: #3e3d43;
		}
		.recom-girl{
			background-color:#FFF;
			}
		.recom-ticket {
   			 font-size: 0;
   			 float: left;
   			 width: 120px;
   			 height: 100px;
    		background:url(../Images/piaojia-recom@1x.0.2.png) 42px 24px no-repeat;
    		background:url(../Images/piaojia-recom@1x.0.2.png) 42px 24px/52px no-repeat;
			background-color:
			#FFF;
			}
		.recom-boy {
   				 border-bottom: 1px solid #e0deda;
				 background-color:#FFF;
				}
		.month-wrapper, .recom-boy, .recom-girl {
   			line-height: 30px;
    		margin: 0 0 0 120px;
    		padding: 20px 0;
			
			}
		.qdp-content {
   			 color: #7f7f7f;
			
			}
		body {
    font-size: 14px;
    line-height: 20px;
    color: #3e3d43;
	}
	.piaojia-recom{
		background-color:#FFF;
		}
	.piaojia-tips{
		background-color:#fcfdfa;
		margin-top:0px;
		}
	piaojia-rule {
    margin: 0 0 0 5px;
	}
	.qdp-record piaojia-record{
		margin-top:50px;
		}
	
	</style>
</head>
<body class="piaojia">
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
                       
                        <li class="active">
                            <a href="<%=basePath%>reader/readerRecommendTicketsRecord.action" class="sideBar-list-a" data-eid="qd_M13"><i class=""></i>我的票夹</a>
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
    <div class="qdp-content" data-l1="3">
        <h2 class="qdp-title">我的票夹</h2>
        
        <div class="piaojia-month" data-l2="3">

        </div>
        
        <div class="piaojia-recom" data-l2="3">
            <h3 class="recom-ticket" style="background-image:url(../Images/piaojia-recom@1x.0.2.png) no-repeat; margin-top: 50px;
}" >推荐票</h3>
            <div class="recom-boy">
                <div class="piaojia-title">男生站</div>
                <div >已使用<span class="piaojia-count font-archive"> &nbsp;<b style="font-size: 18px"> ${manNum}</b></span>&nbsp;可用<span class="piaojia-aval font-archive">&nbsp;<b style="font-size: 18px">${reader.readerRecommendTicket}</b></span></div>
            </div>
            <div class="recom-girl">
                <div class="piaojia-title">女生站</div>
                <div>已使用<span class="piaojia-count font-archive"> &nbsp;<b style="font-size: 18px"> ${womanNum}</b></span>&nbsp;可用<span class="piaojia-aval font-archive">&nbsp;<b style="font-size: 18px">${reader.readerRecommendTicket}</b></span></div>
            </div>
            <div class="piaojia-tips" style="margin-left:20px">
                <p>推荐票是根据你的惊鸿经验值等级，由系统每天赠送，根据你的用户类型和当前经验值，有不同的投票资格。</p>
            </div>
        </div>

        <div class="qdp-record piaojia-record" data-l2="3">
            <div id="tabView" class="ui-tab-tabs">
          
                <a href="javascript:;" class="" data-rel="tabTarget2" data-eid="qd_M63">投推荐票记录</a>
            </div>
            <div class="ui-tab-contents">
                <div id="tabTarget1" class="ui-tab-content checked" data-l3="9">
                    <div id="tableTarget1" class="table-x piaojia-month-table">
                        <div class="table-size">
                            <table class="ui-table">
                                  <tr>
                                    <th scope="col" width="180">投票时间</th>
                                    <th scope="col" width="100">票数</th>
                                    <th scope="col" width="150">投票小说</th>
                                  </tr>
                                 <c:forEach items="${readerRecommendTicketsRecordList}" var="readerRecommendTicketsRecord">
                                     <tr>
                                         <td> <fmt:formatDate value="${readerRecommendTicketsRecord.recordPushTime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                         <td>${readerRecommendTicketsRecord.ticketNum}</td>
                                      <c:if test="${readerRecommendTicketsRecord.book.bookDownShelf==false}">
                                         <td><a href="<%=basePath%>bookDetail/getBookDetail.action?bookId=${readerRecommendTicketsRecord.bookId}">${readerRecommendTicketsRecord.book.bookName}</a> </td>
                                      </c:if>
                                      <c:if test="${readerRecommendTicketsRecord.book.bookDownShelf==true}">
                                         <td><a href="javascript:;" class="info">${readerRecommendTicketsRecord.book.bookName}</a> </td>

                                      </c:if>
                                     </tr>
                                 </c:forEach>
                            </table>
                            <div class="ui-loading"><i class="ui-loading-icon"></i></div>
                         </div>
                         <div class="table-page-x elTablePage" >
                             <div class="table-page" data-eid="qd_M65">
                             </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
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
                    <!-- <a href="//wwwploy.qidian.com/help/about_link.aspx" target="_blank">合作伙伴</a> -->
                    <!-- <a href="//bbs.qidian.com" target="_blank">起点论坛</a> -->
                    <!-- <a href="//webgame.qidian.com/jiazhang.html" target="_blank">家长监护工程</a> -->
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
    $(".info").each(function () {
        $(this).click(function () {
            alert("该书籍已下架！！")
        })
    })
</script>
</html>
