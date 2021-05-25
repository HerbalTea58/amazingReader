
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <title>惊鸿安全</title>
    <link rel="stylesheet" type="text/css" href="https://sta.gtimg.com/aq/=/safe_pc/css/reset.css,/safe_pc/css/header.css,/safe_pc/css/index.css,/safe_pc/css/safe_tools.css,/safe_pc/css/modules.css,/safe_pc/css/layout.css,/safe_pc/css/animate.css,/safe_pc/css/ui.css,/safe_pc/css/footer.css,/safe_pc/css/font.css,/safe_pc/css/password.css,/safe_pc/css/expense.css"/>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
</head>
<div class="wrap">
       <!-- start 头部 -->
    <div class="header">
        <div class="box-center cf">
            <img src="../Images/log.jpg" style="margin-left:-30px"/>
           <div class="nav fr">
                <ul>
                    <li class="act" ><a href="javascript:;">首页</a></li>
                    <li class="line"></li>
                                        <li id="j-userName">
                        <a class="user-name" href="<%=basePath%>person/personal.action">欢迎，书友${reader.readerNeckName}</a><em class="iconfont">&#xe603;</em>
                        <div class="drop-down">
                            <cite>
                                <i></i>
                            </cite>
                            <dl>
                                <dd>
                                    <a href="<%=basePath%>person/personal.action" >回到首页</a>
                                </dd>
                            </dl>
                        </div>
                    </li>
                                    </ul>
            </div>
      </div>
   </div>
    <div class="box-center content">
        <div class="user-info-wrap cf">
            <div class="base-info-wrap fl">

            </div>
            <div class="login-info fr">
            </div>
        </div>
        <div class="account-safe-level">
            <div class="safe-list danger">
            </div>

                        <div class="safe-list" style="display:none;">
                <ul>
                    <li>
                        <cite>用于执行重要操作时收到短信确认</cite>
                        <em class="iconfont">&#xe605;</em>
                        <span>已绑定手机</span>
                    </li>
                                                                                
                                                                                                        </ul>
            </div>

        </div>
        <div class="modules-nav">
            <h3>快捷操作</h3>
            <div class="modules-list cf">
                <ul>
                    <li style="margin-left: 350px">
                        <div class="info">
                            <div class="sprite change"></div>
                            <h3>修改密码</h3>
                            <p>定期修改您的密码，可确保您的账号始终处于安全状态。</p>
                            <a href="<%=basePath%>reader/updateReaderPassword.action">立即修改</a>
                        </div>
                    </li>



                </ul>
            </div>
        </div>

    </div>

<script src="https://sta.gtimg.com/aq/=/safe_pc/js/jquery-1.9.1.min.js,/safe_pc/js/safeV3.js,/safe_pc/js/index.js,/safe_pc/js/statistics.js"></script>
<script>
    $(function() {
        index.init({"ImgCodeUrl":"https:\/\/captcha.qidian.com\/index\/getSync?cap_type=100","jsPath":"https:\/\/sta.gtimg.com","hash":"","from":"","backurl":"","vtype":"","ajaxBaseUrl":"https:\/\/aq.yuewen.com","loginUrl":"https:\/\/passport.yuewen.com\/?ticket=1&appid=37&areaid=2","logoutUrl":"https:\/\/ptlogin.qidian.com\/login\/logout","sk":"","sktime":"","bindPhone":true,"bindEmail":false,"showSafeInfo":true});
        statistics.init({"guid":"854007726165","ip":"221.224.91.50","appid":37,"areaid":1,"ctime":"2018-05-31 08:51:24","uuid":"1527727884_59072774","path":"typclog"});
        statistics.report('homep');
    });
</script>
<script type="text/template" id="template-message-tip">
</script>
<script type="text/template" id="template-unbind-phone-tip">
</script>
<!-- start 页脚 -->
<div class="footer-wrap">
    <div class="footer">
        <div class="box-center">
            <div class="friend-link">
                <a href="https://www.yuewen.com" target="__blank">关于惊鸿</a><em>|</em>
                <a href="https://www.yuewen.com/app.html#appqq" target="__blank">产品介绍</a><em>|</em>
                <a href="https://jubao.yuewen.com/" target="__blank">举报中心</a><em>|</em>
                <a href="https://join.yuewen.com/" target="__blank">诚聘英才</a>
            </div>
            <p>Copyright &copy; 2018 All Right Reserved 上海阅文信息技术有限公司版权所有</p>
        </div>
    </div>
    <!-- end 页脚 -->
</div>
</div>

</body>
</html>
