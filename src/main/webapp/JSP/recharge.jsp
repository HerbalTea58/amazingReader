
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>惊鸿充值</title>
    <meta name="robots" content="all">
    <meta name="googlebot" content="all">
    <meta name="baiduspider" content="all">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit"/>
    <link rel="shortcut icon" type="image/x-icon" href="https://qidian.gtimg.com/yuewen/v1/favicon.ico">
    <link rel="Bookmark" type="image/x-icon" href="https://qidian.gtimg.com/yuewen/v1/favicon.ico">
    <link rel="stylesheet" data-ignore="true"  href="../Css/checkbox.0.44.css"/>
    <link rel="stylesheet" data-ignore="true"  href="../Css/reset1.css"/>
    <link rel="stylesheet" data-ignore="true"  href="../Css/font.css"/>
    <link rel="stylesheet" data-ignore="true"  href="../Css/header019.css"/>
    <link rel="stylesheet" data-ignore="true"  href="../Css/footer.css"/>
    <link rel="stylesheet" data-ignore="true"  href="../Css/index0.20.css"/>
    <link rel="stylesheet" data-ignore="true"  href="../Css/layout0.18.css"/>
    <link rel="stylesheet" data-ignore="true"  href="../Css/moulders.css"/>
    <link rel="stylesheet" data-ignore="true"  href="../Css/popup.css"/>

    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
    <script>
        var speedTimer = [],
                speedZero = new Date().getTime();
    </script>
    <style>
         .main .operator-list ul li span.alipay, .main .pay-list ul li span.alipay {
                width: 28px;
                height: 28px;
                background-image: url(../Images/sprite.0.3.png);
                background-repeat: no-repeat;
                background-position: -96px -108px;
                background-size: 189px;
}
	    .main .operator-list ul li span.we-chat, .main .pay-list ul li span.we-chat {
              width: 28px;
              height: 28px;
              background-image: url(../Images/sprite.0.3.png);
              background-repeat: no-repeat;
              background-position: -143px -28px;
              background-size: 189px;
}


	</style>
</head>
<body>
<!-- start 顶部公告和优惠信息 -->


<!--<div class="notice-wrap sales">
    <div class="box-center cf">
        <a class="close" href="javascript:"><em class="iconfont">&#xe601;</em></a>
        <div class="text-info fl">
            <p><span class="info"></span><i>微信支付9折优惠</i></p>
        </div>
    </div>
</div>-->
<!-- end 顶部公告和优惠信息 -->

<!-- start 头部 -->
<div class="header">
    <div class="box-center cf">
        <h1 class="logo">
            <img src="../Images/log.png" style="width:110px"/>
        </h1>
        <h3 class="lang">惊鸿充值</h3>
        <div class="right-box">
            
            <!-- <a href="http://me.qidian.com/account/charge.aspx" target="_blank">返回旧版充值页 ></a> -->
            
        </div>
        <div style="margin-top:25px">
        	<a href="<%=basePath%>person/personal.action" style="margin-left: 600px">回到个人中心</a>
        </div>
    </div>
</div>
<!-- end 头部 -->

<!-- start 主体 -->
<div class="box-center">
    <div class="main">
        <!-- start 选择充值方式 -->
        <div class="select-pay-method">
            <!-- start 账号 -->
            <div class="account-wrap">
                <h6>账号</h6>
                <p><img src="../${reader.readerPortrait}"><span title="${reader.readerNeckName}">${reader.readerNeckName}</span></p>
            </div>
            <!-- end 账号 -->
        </div>
        <!-- end 选择充值方式 -->

        <!-- start 选择充值方式列表 -->
        <div class="pay-list select-list" id="j-pay-list">
            <h6>充值方式</h6>
            <ul class="cf">
                
                <li class="normal-method  act " data-method="1"
                    data-cury-name="¥"
                    id="alipay"
                    data-hand-fee=0 data-rate=100 >
                    <span class="alipay" data-method="1"></span><em class="lang">支付宝</em>
                    <cite></cite>
                    
                </li>
                
                <li class="normal-method  " data-method="2"
                    id="wechatpay"
                    data-cury-name="¥"
                    data-hand-fee=0 data-rate=100 >
                    <span class="we-chat" data-method="2"></span><em class="lang">微信</em>
                    <cite></cite>
                </li>
            </ul>
        </div>
        <!-- end 选择充值方式列表 -->

        <!-- start 选择充值金额 -->
        <div class="money-list select-list j-normal-list">
            <ul id="money-list-1" class="cf j_detail_panel ">
                <h6>充值金额</h6>
                
                <li class="act" data-amount="10">
                    <p>¥10<span>(1000惊鸿币)</span>
                        
                    </p>
                    <cite></cite>
                </li>
                
                <li class="" data-amount="20">
                    <p>¥20<span>(2000惊鸿币)</span>
                        
                    </p>
                    <cite></cite>
                </li>
                
                <li class="" data-amount="30">
                    <p>¥30<span>(3000惊鸿币)</span>
                        
                    </p>
                    <cite></cite>
                </li>
                
                <li class="" data-amount="50">
                    <p>¥50<span>(5000惊鸿币)</span>
                        
                    </p>
                    <cite></cite>
                </li>
                
                <li class="" data-amount="100" >
                    <p>¥100<span>(10000惊鸿币)</span>
                        
                    </p>
                    <cite></cite>
                </li>
                
                <li class="custom" data-amount="" >
                    <p>其它金额 ¥<input class="item-box" type="tel" placeholder="输入金额" maxlength="5" ><span>(<i class="j_coins">0惊鸿币</i>)</span></p>
                    <cite></cite>
                    <!--<div class="tip">充值金额必须大于或等于1</div>-->
                </li>
                <input class="default-amount-1" type="hidden" value="10">
            </ul>
        </div>
            </div>

            <div id="money-list-8" class="tw-atm j_detail_panel hidden">
                

                    <input class="default-amount-8" type="hidden" value="200" data-amount="200" data-ywamount="2300">
                    <div class="btn-wrap btn-pay mt-12">
                        <label id="next" class="blue-btn" href="javascript:">下一步</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="btn-wrap btn-pay pay-btn-area " style="margin-left: 246px; margin-top:-50px">
            <label id="pay" class="blue-btn" href="javascript:" data-method="1" onclick="recharge()">立即支付 <span class="j_deal_price">¥10</span></label>
            <div class="checkbox-wrap">
                <span class="lbf-checkbox lbf-checkbox-checked" id="J-agree">
                    <input id="agree" type="checkbox" checked/>
                </span>
                <label><a href="" target="_blank">我同意《用户服务协议》</a></label>
            </div>
        </div>
        <!-- end 按钮 -->
    </div>
</div>
<!-- end 主体 -->
<div class="footer">
    <div class="box-center cf">
        
        <div class="copy-right">
            <p>Copyright <span>&copy;</span> 2016 All Rights Reserved 阅文集团 版权所有</p>
        </div>
    </div>
</div>
<!-- start 页脚 -->

<!-- end 等待支付弹窗 -->

<!-- start 页面初始化与访问速度统上报-->
<!-- start LBF lib -->
<script>

    $(function(){
        $(".cf li").click(function(){
            $(this).addClass("act");
            $(this).siblings().removeClass("act");
            var c=($("#money-list-1 li.act").text());
            var num= c.split("(");
            $(".j_deal_price").text( num[0]);
        });
    });
    $(".cf li.custom").keydown(function(e) {
        if (e.keyCode == 13) {
            var money=$(" .cf li.custom input.item-box").val();
            $(".j_deal_price").text("￥"+money );
            $(".j_coins").text(money*100+"惊鸿币")
        }
    });
    function recharge() {
        var money=$(".j_deal_price").text()
        $.ajax({
            type:"POST",
            url:"<%=basePath%>reader/readerRecharge.action",
            data:"money="+money,
            success:function (data) {
                alert("充值"+money.trim()+"成功"+",惊鸿币余额为"+data);
              }
        })
    }
</script>
</body>
</html>