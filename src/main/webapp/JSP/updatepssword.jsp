

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
    <title>修改密码_</title>

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
<div class="wrap">    <script src="https://sta.gtimg.com/aq/=/safe_pc/js/changepwd_v3.js,/safe_pc/js/safeV3.js,/safe_pc/js/statistics.js"></script>
    <script src="https://ssl.captcha.qq.com/template/TCapIframeApi.js?aid=1600000770&rand=0.7595169853884727&clientype=2&apptype=1&captype=7&disturblevel=1"></script>

    <script>
    var Password = new AccountPassword({"title":"\u4fee\u6539\u5bc6\u7801_\u9605\u6587\u5b89\u5168\u4e2d\u5fc3","ajaxUrl":"\/account\/callmethod","thirdAccount":false,"existsPassword":true,"loginUrl":"https:\/\/passport.yuewen.com\/?ticket=1&appid=37&areaid=1&returnurl=http%3A%2F%2Faq.yuewen.com%2Fajax%2Flogin%3Fticket%3D1%26returnurl%3Dhttps%253A%252F%252Faq.yuewen.com"})
    </script>
    
       <!-- start 头部 -->
    <div class="header">
         <div class="box-center cf">
            <img src="../Images/log.jpg" style="margin-left:-290px"/>
            <h1 class="logo fl"><a href="realname.jsp"></a></h1>
                        <div class="title">
                <h3>修改密码</h3>
               
            </div>
                     
           <div class="nav fr">
                <ul>
                    <li ><a href="jaavascript:;">首页</a></li>

                    <li class="line"></li>
                                        <li id="j-userName">
                        <a class="user-name" href="<%=basePath%>person/personal.action?readerId=${reader.readerId}">欢迎，书友${reader.readerNeckName}</a><em class="">&#xe603;</em>
                        <div class="drop-down">
                            <cite>
                                <i></i>
                            </cite>
                            <dl>
                                <dd>
                                    <a href="<%=basePath%>person/personal.action?readerId=${reader.readerId}" >回到首页</a>
                                </dd>
                            </dl>
                        </div>
                    </li>
                                    </ul>
            </div>
      </div>
   </div>    
        <!-- start 主体内容 -->
    <div class="box-center content" id="step1">
        <!-- start 表单 -->
        <div class="form-list-wrap">
            <div class="form-list">
                <dl>
                    <dd><em>当前密码</em>
                        <div class="input-box">
                            <input id="input-old-password" type="password" placeholder="请填写当前密码">
                            <input type="hidden" value="${reader.readerPassword}" id="realpassword">
                        </div>
                        <p class="tip" id="tip-input-old-password" style="display: none"></p>
                    </dd>
                    <!-- 表单输入错误 加class：error 仅在提交时检验 -->
                    <dd ><em>新密码</em>
                        <div class="input-box" >
                            <input id="input-new-password" type="password" placeholder="新密码不能和旧密码相同">
                        </div>
                        <p class="tip" id="tip-input-new-password" style="display: none"></p>
                        <!-- strong-tip 密码强度提示在输入的时候实时检验，共有3个阶段 切换lv1-lv3 分别是 红、橙、绿色 -->
                        <div class="strong-tip lv1" style="display: none">
                            <span><em></em><i>低</i></span><span><em></em><i>中</i></span><span><em></em><i>高</i></span>
                        </div>
                    </dd>
                    <dd><em>确认新密码</em>
                        <div class="input-box">
                            <input id="input-new-password2" type="password" placeholder="请再次输入密码">
                        </div>
                        <p class="tip" id="tip-input-new-password2" style="display: none"></p>
                    </dd>
                </dl>
                <div class="form-btn-wrap">
                    <a class="blue-btn" id="btn-modify-pwd" href="javascript:" onclick="update()">确定</a>
                </div>
            </div>
        </div>
        <!-- end 表单 -->
    </div>
    <!-- end 主体内容 -->
    <!-- start 主体内容 -->
    <div class="box-center content modify-pwd" id="step2" style="display:none">
        <!-- start 表单 -->
        <div class="form-list-wrap">

            <!-- start 操作状态提示 失败 -->
            <div class="state-wrap">
                <span class="iconfont state-icon ok">&#xe605;</span>
                <h3>密码修改成功</h3>
                <a class="blue" href="/welcome/pswmanager">返回密码管理</a>
            </div>
            <!-- end 操作状态提示 失败 -->
        </div>
        <!-- end 表单 -->
    </div>
    <!-- end 主体内容 -->

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

<script src="https://sta.gtimg.com/js/login_yuewen2.js"></script>
<script src="https://sta.gtimg.com/safe_pc/js/login.js"></script>
<script>
    function update() {
        var a = $("#input-old-password").val();
        var b = $("#input-new-password").val();
        var c = $("#input-new-password2").val();
        var d=$("#realpassword").val();
        if (a!=d) {
            alert("当前密码不正确")
        } else if (a == b) {
            alert("新密码与旧密码相同。请重新输入")
        }else  if(b != c){
            alert("确认密码与新密码不一致 请重新输入！！")
        } else {
            $.ajax({
                type: "POST",
                url: "<%=basePath%>/reader/updatePassword.action",
                data: "password=" + b,
                success: function (data) {
                    if (data) {
                        alert("修改密码成功！！")
                    } else {
                        alert("修改失败失败！！")
                    }
                },
                error: function () {
                    alert("哎呀！出错了！！")
                }
            })

        }
    }
</script>
</body>
</html>
