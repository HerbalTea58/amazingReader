
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="小说阅读,精彩小说尽在起点中文网. 起点中文网提供玄幻小说,武侠小说,原创小说,网游小说,都市小说,言情小说,青春小说,历史小说,军事小说,网游小说,科幻小说,恐怖小说,首发小说,最新章节免费">
    <meta name="keywords" content="小说,小说网,玄幻小说,武侠小说,都市小说,历史小说,网络小说,言情小说,青春小说,原创网络文学">
    <meta name="robots" content="all">
    <meta name="googlebot" content="all">
    <meta name="baiduspider" content="all">
    
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit"/>
    <title>身份验证_阅文安全_阅文集团</title>

     <link rel="stylesheet" type="text/css" href="../Css/reset1.css"/>
        <link rel="stylesheet" type="text/css" href="../Css/header.css"/>
        <link rel="stylesheet" type="text/css" href="../Css/index.css"/>
        <link rel="stylesheet" type="text/css" href="../Css/moulders.css"/>
        <link rel="stylesheet" type="text/css" href="../Css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="../Css/font.css"/>
        <link rel="stylesheet" type="text/css" href="../Css/ui.css"/>
        <link rel="stylesheet" type="text/css" href="../Css/tools.css"/>
        <link rel="stylesheet" type="text/css" href="../Css/layout.css"/>
         <link rel="stylesheet" type="text/css" href="../Css/animate.css"/>
    <script src="https://sta.gtimg.com/aq/=/safe_pc/js/common.js,/safe_pc/js/jquery-1.9.1.min.js,/safe_pc/js/account_manager_v3.js"></script>

    <script src="https://sta.gtimg.com/safe_pc/js/lulu/LightTip.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="https://sta.gtimg.com/safe_pc/images/favicon.ico">
    <link rel="Bookmark" type="image/x-icon" href="https://sta.gtimg.com/safe_pc/images/favicon.ico">
</head>
<div class="wrap">        <!-- start 头部 -->
   <!-- start 头部 -->
    <div class="header">
                <div class="box-center cf">
                    <img src="../Images/log.jpg" style="margin-left:-330px; margin-top:-3px"/>
                    <h1 class="logo fl">
                        <h3>实名认证</h3>
           <div class="nav fr">
                <ul>
                     <li  ><a href="security.jsp">首页</a></li>
                    <li class="act" ><a href="security1.jsp">安全工具</a></li>
                    <li  ><a href="security-password.jsp">密码管理</a></li>
                    <li ><a href="security3cost.jsp">消费设置</a></li>
                    <li class="line"></li>
                                        <li id="j-userName">
                        <a class="user-name" href="javascript:">欢迎，书友20180529192024748</a><em class="">&#xe603;</em>
                        <div class="drop-down">
                            <cite>
                                <i></i>
                            </cite>
                            <dl>
                                <dd>
                                    <a href="personal.jsp" id="logout">回到首页</a>
                                </dd>
                            </dl>
                        </div>
                    </li>
                                    </ul>
            </div>
      </div>
   </div><!-- end 头部 -->
<!-- start 步骤进度提示 -->
<div class="step-tips">
    <div class="box-center">
                <span class="act"><i>1</i><em>身份验证</em></span>
        <span><i>2</i><em>绑定手机</em></span>
        <span><i>3</i><em>绑定成功</em></span>
            </div>
</div>
<!-- end 步骤进度提示 -->
    <div class="box-center content">
        <!-- start 表单 -->
        <div class="form-list-wrap">
            <div class="form-list">
                <dl>
                    <dd><em>已绑定手机</em>
                        <div class="input-box input-wrap">
                            <i class="text">182****3187</i>
                        </div>
                    </dd>

                    <dd>
                        <em></em>
                        <div class="input-box">
                            <div id="cap_iframe" style="width:230px;height:44px;margin-top:-8px;">
                            </div>
                        </div>
                        <input type="hidden" id="sig" value="" />
                        <input type="hidden" id="code" value="" />
                    </dd>

                    <dd><em>验证码</em>
                        <div class="input-wrap fl">
                            <div class="select-form cf">
                                <div class="input-box">
                                    <input type="text" id="phoneCode" value="" placeholder="请输入6位验证码">
                                </div>
                                <!-- 可点状态 -->
                                <a class="blue-btn" id="sendSmsBtn" default-value="获取验证码" href="javascript:">获取验证码</a>
                                <!-- 不可点状态 -->
                            </div>
                        </div>
                    </dd>
                </dl>
                <div class="form-btn-wrap">
                    <a class="blue-btn disabled" href="javascript:" data="1" id="checkBtn">立即验证</a>
                </div>
            </div>
        </div>
        <!-- end 表单 -->

        <!-- start 问题 -->
        <div class="faq-tip">
            <div class="faq-list">
                <h3>没有收到短信验证码？</h3>
                <p>1.网络通讯异常可能会造成短信丢失，请重新获取或稍后再试。</p>
                <p>2.手机是否欠费停机，或屏蔽了系统短信。</p>
                <p>3.如手机已丢失或停用，请选择其他验证方式。</p>
            </div>
        </div>
        <!-- end 问题 -->
    </div>
    <!-- end 主体内容 -->


    <script src="https://sta.gtimg.com/aq/=/safe_pc/js/safeV3.js,/safe_pc/js/verifyUser_v1.js,/safe_pc/js/statistics.js,/safe_pc/js/lulu/LightTip.js,/safe_pc/js/validateUser_v3.js"></script>
    <script src="https://ssl.captcha.qq.com/template/TCapIframeApi.js?aid=1600000770&rand=0.7595169853884727&clientype=2&apptype=1&captype=7&disturblevel=1"></script>

    <script>
        $(function() {
            verifyUser.init({"ImgCodeUrl":"https:\/\/captcha.qidian.com\/index\/getSync?cap_type=100","jsPath":"https:\/\/sta.gtimg.com","hash":"","from":"authen","backurl":"authen","vtype":"","ajaxBaseUrl":"https:\/\/aq.yuewen.com","loginUrl":"https:\/\/passport.yuewen.com\/?ticket=1&appid=37&areaid=2","logoutUrl":"https:\/\/ptlogin.qidian.com\/login\/logout","sk":"a537ac917ddb451be0a03df179050b56","sktime":1528075333,"ywGuid":854007726165,"username":"18238883187","type":1,"sendVkey":"182845433465481d47d78734a2e61977","active":"","templateid":9});
            statistics.init({"guid":"854007726165","ip":"221.224.91.50","appid":37,"areaid":1,"ctime":"2018-06-04 09:22:13","uuid":"1528075333_1458207269","path":"typclog"});
        });
    </script>
    <script type="text/template" id="template-modify-psw">
        <!-- start 表单 -->
        <div class="form-list-wrap">
            <div class="form-list">
                <dl>
                    <dd><em>新密码:</em>
                        <div class="input-box">
                            <input type="password" id="password" placeholder="6-18位大小写字母、符号或数字">
                        </div>
                        <!-- strong-tip 密码强度提示在输入的时候实时检验，共有3个阶段 切换lv1-lv3 分别是 红、橙、绿色 -->
                        <div class="strong-tip lv1" style="display: none">
                            <span><em></em><i>低</i></span><span><em></em><i>中</i></span><span><em></em><i>高</i></span>
                        </div>
                    </dd>
                    <dd><em>确认新密码</em>
                        <div class="input-box">
                            <input type="password" id="confirmPassword" placeholder="再次输入新密码">
                        </div>
                    </dd>
                </dl>
                <div class="form-btn-wrap">
                    <a class="blue-btn disabled" id="modifyPasswordBtn" href="javascript:">确定</a>
                </div>
            </div>
        </div>
        <!-- end 表单 -->
    </script>
    <script type="text/template" id="template-modify-psw-ok">
        <!-- start 表单 -->
        <div class="form-list-wrap">
            <!-- start 操作状态提示 成功 -->
            <div class="state-wrap">
                <span class="iconfont state-icon ok">&#xe605;</span>
                <h3>密码修改成功</h3>
                <a class="blue" href="/welcome/pswmanager">返回密码管理</a>
            </div>
            <!-- end 操作状态提示 成功 -->
        </div>
        <!-- end 表单 -->
    </script>

    <script type="text/template" id="template_account_info">
        <!-- start 表单 -->
        <div class="form-list-wrap">
            <!-- start 操作状态提示 成功 -->
            <div class="state-wrap">
                <span class="iconfont state-icon ok">&#xe605;</span>
                <h3>查询账号成功</h3>
                <p>该手机绑定的阅文通行证：<span id="yw_acc"></span></p>
                <a class="blue" href="/">返回首页</a>
            </div>
            <!-- end 操作状态提示 成功 -->

        </div>
        <!-- end 表单 -->
    </script>

    <script type="text/template" id="template_query_account_fail">
        <!-- start 表单 -->
        <div class="form-list-wrap">
            <!-- start 操作状态提示 失败 -->
            <div class="state-wrap">
                <span class="iconfont state-icon no">&#xe606;</span>
                <h3>查询账号失败</h3>
                <p>该手机号未绑定任何阅文通行证</p>
            </div>
            <!-- end 操作状态提示 失败 -->
        </div>
        <!-- end 表单 -->
    </script>
    <!-- start 页脚 -->
    <div class="footer-wrap">
        <div class="footer">
            <div class="box-center">
                <div class="friend-link">
                    <a href="" target="__blank">关于阅文</a><em>|</em>
                    <a href="" target="__blank">产品介绍</a><em>|</em>
                    <a href="" target="__blank">举报中心</a><em>|</em>
                    <a href="" target="__blank">诚聘英才</a>
                </div>
                <p>Copyright &copy; 2018 All Right Reserved 上海阅文信息技术有限公司版权所有</p>
            </div>
        </div>
        <!-- end 页脚 -->
    </div>
</div>
<script>
    try { Common.logout();} catch(e) {}
</script>
<script src="https://sta.gtimg.com/js/login_yuewen2.js"></script>
<script src="https://sta.gtimg.com/safe_pc/js/login.js"></script>
</body>
</html>
