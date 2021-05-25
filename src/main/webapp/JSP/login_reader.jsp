<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>读者登陆</title>
<link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
<link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap/js/bootstrap.min.js">
<link rel="stylesheet" href="<%=basePath%>Css/normalize.css">
<link rel="stylesheet" href="<%=basePath%>Css/login.css">
<link rel="stylesheet" href="<%=basePath%>Css/sign-up-login.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>Css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>Css/inputeffect.css" />
<link rel="stylesheet" href="<%=basePath%>Css/tooltips.css" />
<link rel="stylesheet" href="<%=basePath%>Css/spop.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
	<script src="<%=basePath%>layui/layui.js"></script>
<script src="<%=basePath%>Scripts/jquery.min.js"></script>
<%--<script src="<%=basePath%>Scripts/snow.js"></script>--%>
<script src="<%=basePath%>Scripts/jquery.pure.tooltips.js"></script>
<script src="<%=basePath%>Scripts/spop.min.js"></script>
<script>	
	(function() {
		// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
		if (!String.prototype.trim) {
			(function() {
				// Make sure we trim BOM and NBSP
				var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
				String.prototype.trim = function() {
					return this.replace(rtrim, '');
				};
			})();
		}

		[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
			// in case the input is already filled..
			if( inputEl.value.trim() !== '' ) {
				classie.add( inputEl.parentNode, 'input--filled' );
			}

			// events:添加事件
			inputEl.addEventListener( 'focus', onInputFocus );
			inputEl.addEventListener( 'blur', onInputBlur );
		} );

		function onInputFocus( ev ) {
			classie.add( ev.target.parentNode, 'input--filled' );
		}

		function onInputBlur( ev ) {
			if( ev.target.value.trim() === '' ) {
				classie.remove( ev.target.parentNode, 'input--filled' );
			}
		}
	})();
	
	$(function() {	
		$('#login #login-password').focus(function() {
			$('.login-owl').addClass('password');
		}).blur(function() {
			$('.login-owl').removeClass('password');
		});
		$('#login #register-password').focus(function() {
			$('.register-owl').addClass('password');
		}).blur(function() {
			$('.register-owl').removeClass('password');
		});
		$('#login #register-repassword').focus(function() {
			$('.register-owl').addClass('password');
		}).blur(function() {
			$('.register-owl').removeClass('password');
		});
		$('#login #forget-password').focus(function() {
			$('.forget-owl').addClass('password');
		}).blur(function() {
			$('.forget-owl').removeClass('password');
		});
	});
	
	function goto_register(){
		$("#register-username").val("");
		$("#register-password").val("");
		$("#register-repassword").val("");
		$("#register-code").val("");
		$("#tab-2").prop("checked",true);
	}
	
	function goto_login(){
		$("#login-username").val("");
		$("#login-password").val("");
		$("#tab-1").prop("checked",true);
	}
	
	function goto_forget(){
		$("#forget-username").val("");
		$("#forget-password").val("");
		$("#forget-code").val("");
		$("#tab-3").prop("checked",true);
	}
	var flag=true;
	/*  当失去焦点 时,做出提示信息  */
	$(function loginUsername(){
		$("#login-username").blur(function(){
			var username=$("#login-username").val();
			 if(username == ""){

					$.pt({
		        		target: $("#login-username"),
		        		position: 'r',
		        		align: 't',
		        		width: 'auto',
		        		height: 'auto',
		        		content:"用户名不能为空"
		        	});
			 }
		 });
	
	});
	 $(function loginPass(){
		$("#login-password").blur(function(){
			var password=$("#login-password").val();
			if(password == ""){

				$.pt({
	        		target: $("#login-password"),
	        		position: 'r',
	        		align: 't',
	        		width: 'auto',
	        		height: 'auto',
	        		content:"密码不能为空"
	        	});

				
			}
		});
	});
	 /*忘记密码  */
	 $(function forgetPhone(){
		 $("[name='phone']").blur(function(){
				var username=$("[name='phone']").val();
				 if(username == ""){

						$.pt({
			        		target: $("[name='phone']"),
			        		position: 'r',
			        		align: 't',
			        		width: 'auto',
			        		height: 'auto',
			        		content:"手机号不能为空"
			        	});
				 }
			 });
		
		});
		 $(function forgetCode(){
			 $("[name='code']").blur(function(){
				var code=$("[name='code']").val();
				if(code == ""){

					$.pt({
		        		target: $("[name='code']"),
		        		position: 'r',
		        		align: 't',
		        		width: 'auto',
		        		height: 'auto',
		        		content:"验证码不能为空"
		        	});
					
				}
			});
		});
		 $(function rePass(){
				$("#forget-password").blur(function(){
					var password=$("#forget-password").val();
					if(password == ""){

						$.pt({
			        		target: $("#forget-password"),
			        		position: 'r',
			        		align: 't',
			        		width: 'auto',
			        		height: 'auto',
			        		content:"密码不能为空"
			        	});
						
					}
				});
		});
		 
		 /*注册  */
		 var flag2=true;
		 $(function regName(){
				$("#register-username").blur(function(){
					var username=$("#register-username").val();
					var ret=/^\d+$/;
					if(username == ""){

						$.pt({
			        		target: $("#register-username"),
			        		position: 'r',
			        		align: 't',
			        		width: 'auto',
			        		height: 'auto',
			        		content:"用户名不能为空"
			        	});

					}else if(ret.test(username)){

						$.pt({
			        		target: $("#register-username"),
			        		position: 'r',
			        		align: 't',
			        		width: 'auto',
			        		height: 'auto',
			        		content:"用户名必须含有字母"
			        	});

                        $("#nameEoor").val("用户名必须含有字母");

					}
				});
			});
		 
		 
		 $(function regPass(){

				$("#register-password").blur(function(){
					var password=$("#register-password").val();
					if(password == ""){

						$.pt({
			        		target: $("#register-password"),
			        		position: 'r',
			        		align: 't',
			        		width: 'auto',
			        		height: 'auto',
			        		content:"密码不能为空"
			        	});

					}
				});
			});
		 
		$(function regRepass(){
			$("#register-repassword").blur(function(){
				var password = $("#register-password").val();
				/* alert(password); */
				var repassword = $("#register-repassword").val();
				/* alert(repassword); */
				if(repassword == ""){
                    flag2=false;
					$.pt({
		        		target: $("#register-repassword"),
		        		position: 'r',
		        		align: 't',
		        		width: 'auto',
		        		height: 'auto',
		        		content:"请确认密码"
		        	});

				}else if(password != repassword){
                    flag2=false;
					$.pt({
		        		target: $("#register-repassword"),
		        		position: 'r',
		        		align: 't',
		        		width: 'auto',
		        		height: 'auto',
		        		content:"两次密码不一致"
		        	});
					$("#register-repassword").val("");
				}else {
                    flag2=true;
                }
			});
		});
				
		
		 $(function regCode(){
				$("#register-code").blur(function(){
					var tel=$("#register-code").val();
					var regex = /^1[0-9]{10}$/;
						///^1[34578]\d{9}$/;
					///^1(3[0-9]|5[189]|8[6789])[0-9]{8}$/ ;
					if(tel == "") {
                        flag2 = false;
                        $.pt({
                            target: $("#register-code"),
                            position: 'r',
                            align: 't',
                            width: 'auto',
                            height: 'auto',
                            content: "手机号不能为空"
                        });
                        $("#phoneEoor").val("手机号不能为空");
                    }else if(!regex.test(tel)){
                        $.pt({
                            target: $("#register-code"),
                            position: 'r',
                            align: 't',
                            width: 'auto',
                            height: 'auto',
                            content:"手机号格式错误"
                        });
                        $("#phoneEoor").val("手机号格式错误");
                    }
				});
			});
		
		
	
	/*连接后台登录验证
	*/
    $(function loginCheck(){//判断用户名是否存在
        $.ajax({
            type: "post",
            url: "<%=basePath%>Reader/login.action?name="+name,
            //  data: "tel="+tel,
            success: function (Info) {
                if (Info == 2) {

                    $.pt({
                        target: $("#login-username"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "用户不存在"
                    });

                   // $("#nameEoor1").val("用户不存在");


                }else if(Info==0){
                    $.pt({
                        target: $("#login-password"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "密码错误"
                    });
                }
            }
        });

	});
    window.onload=function(){

        if(${param.Info==2}){
            $.pt({
                target: $("#login-username"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content: "登录账号不存在"
            });
            // $("#login-username").val("");
        }
        if(${param.Info==0}){
            $.pt({
                target: $("#login-password"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content: "密码错误"
            });

        }
	}



	/*注册页面的后台验证*/
	$(function checkRegisterName() {
        $("#register-username").keyup(function() {
            var name = $("#register-username").val();

            $.ajax({
                type: "post",
                url: "<%=basePath%>Reader/loginCheck.action?name="+name,
                //  data: "tel="+tel,
                success: function (Info) {
                    if (Info == true) {
                        flag2=false;
                        $.pt({
                            target: $("#register-username"),
                            position: 'r',
                            align: 't',
                            width: 'auto',
                            height: 'auto',
                            content: "用户昵称已存在，换一个吧"
                        });

                        $("#nameEoor").val("用户昵称已存在，换一个吧");


                    }else{
                        $("#nameEoor").val("");
					}
                }
            });
        });
    });

    $(function checkRegisterTel() {
        $("#register-code").keyup(function() {
            var tel = $("#register-code").val();

            $.ajax({
                type: "post",
                url: "<%=basePath%>Reader/registerCheckTel.action?tel="+tel,
                //  data: "tel="+tel,
                success: function (Info) {
                    if (Info == false) {

                        $.pt({
                            target: $("#register-code"),
                            position: 'r',
                            align: 't',
                            width: 'auto',
                            height: 'auto',
                            content: "该手机号已被使用"
                        });

                        $("#phoneEoor").val("该手机号已被使用");
                    }else {
                        $("#phoneEoor").val("");
					}

                }
            });
        });
    });

//注册的提交 判断
    $(
        function () {

            $("#regForm").submit(function () {

                if($("#register-username").val()==null||$("#register-username").val().length==0){
                    $.pt({
                        target: $("#register-username"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "用户名不能为空"
                    });
                      return false;
                }
                $("#nameEoor").val()
                if( $("#nameEoor").val()=="用户名必须含有字母"){
                    $.pt({
                        target: $("#register-username"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "用户名必须含有字母"
                    });
                    return false;
                }
                if( $("#nameEoor").val()=="用户昵称已存在，换一个吧"){
                    $.pt({
                        target: $("#register-username"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "用户昵称已存在，换一个吧"
                    });
                    return false;
				}

                if($("#register-password").val()==null||$("#register-password").val().length==0){
                    $.pt({
                        target: $("#register-password"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "密码不能为空"
                    });
                    return false;
                }

                if($("#register-repassword").val()==null||$("#register-repassword").val().length==0){
                    $.pt({
                        target: $("#register-repassword"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "确认密码不能为空"
                    });
                    return false;
                }

                if($("#register-repassword").val()!=$("#register-password").val()){
                    $.pt({
                        target: $("#register-repassword"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "两次输入密码不一致"
                    });
                    return false;
                }

                if($("#register-code").val()==null||$("#register-code").val().length==0){
                    $.pt({
                        target: $("#register-code"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "手机号不能为空"
                    });
                    return false;
                }

//                手机验证 1.空 2.格式错误 3.已存在
				if($("#phoneEoor").val()=="手机号不能为空"){
                    $.pt({
                        target: $("#register-code"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "手机号不能为空"
                    });
					return false;
				}
				if($("#phoneEoor").val()=="该手机号已被使用"){
                    $.pt({
                        target: $("#register-code"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "该手机号已被使用"
                    });
				    return false;
				}
				if($("#phoneEoor").val()=="手机号格式错误"){
                    $.pt({
                        target: $("#register-code"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "手机号格式错误"
                    });
				    return false;
				}
                 return true;
            });


            $("#nameEoor").val("");
            $("#phoneEoor").val("");
        }
	);


    /*忘记密码*/


	$(function () {
        $("#forget").submit(function () {

            if ($("[name='phone']").val() == null || $("[name='phone']").val().length == 0) {
                $.pt({
                    target: $("[name='phone']"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "手机号不能为空"
                });
                return false;
            }
            if ($("[name='code']").val() == null || $("[name='code']").val().length == 0) {
                $.pt({
                    target: $("[name='code']"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "验证码不能为空"
                });
                return false;
            }


            if ($("[name='repass']").val() == null || $("[name='repass']").val().length == 0) {
                $.pt({
                    target: $("[name='repass']"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "密码不能为空"
                });
                return false;
            }
            if ($("#codeEoor").val() == "验证码错误") {
                $.pt({
                    target: $("[name='code']"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "验证码错误",
                    color: 'red'
                });
                return false;
            }

            return true;
        });
        $("#codeEoor").val("");

});





</script>
<style type="text/css">
html{width: 100%; height: 100%;}

body{

	background-repeat: no-repeat;

	background-position: center center #2D0F0F;

	background-color:white;

	background-image: url(<%=basePath%>Images/loginPic.jpg);

	background-size: 100% 100%;

}

.snow-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 100001; }

</style>
<script type="text/javascript">
    var InterValObj; //timer变量，控制时间
    var count = 30; //间隔函数，1秒执行
    var curCount;//当前剩余秒数
    function sendMessage(){curCount = count;
        $("#btn").attr("disabled", "true");
        $("#btn").val(curCount + "秒后可重新发送");
        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
    }
    //timer处理函数
    function SetRemainTime() {
        if (curCount == 0) {
            window.clearInterval(InterValObj);//停止计时器
            $("#btn").removeAttr("disabled");//启用按钮
            $("#btn").val("重新发送验证码");
        }
        else {
            curCount--;
            $("#btn").val(curCount + "秒后可重新发送");
        }
    }

    //忘记密码

</script>
</head>
<body>
	<c:set var="mycookie" value="${cookie.loginInfo.value }"></c:set>
	<c:set var="rem" value='${fn:split(mycookie,"-") }'></c:set>
	<!-- 雪花背景 -->
	<div class="snow-container"></div>


	<!-- 登录控件 -->
	<div id="login">
		<input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked />
		<input id="tab-2" type="radio" name="tab" class="sign-up hidden" />
		<input id="tab-3" type="radio" name="tab" class="sign-out hidden" />
		<div class="wrapper" style="margin-top: 30px;">
			<!-- 登录页面 -->
			<div class="login sign-in-htm">
				<form action="<%=basePath%>Reader/login.action" class="container offset1 loginform" method="post" onsubmit="login()">
					<!-- 猫头鹰控件 -->
					<div id="owl-login" class="login-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo
">
								     <c:choose>

										 <c:when test="${not empty mycookie}">
											 <input class="input__field input__field--hideo" type="text" id="login-username"
													value="${rem[0]}" name="readerNeckName" autocomplete="off" placeholder="请输入用户名" tabindex="1" maxlength="15" />

										 </c:when>
										 <c:otherwise>
											 <input class="input__field input__field--hideo" type="text" id="login-username"
													value="${requestScope.uname}" name="readerNeckName" autocomplete="off" placeholder="请输入用户名" tabindex="1" maxlength="15" />

										 </c:otherwise>

									 </c:choose>
								<label class="input__label input__label--hideo" for="login-username">
									<%--<i class="fa fa-fw fa-user icon icon--hideo"></i>--%>
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" name="readerPassword" type="password"
									   value="${rem[1]}" id="login-password" placeholder="请输入密码" tabindex="2" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-password">
									<%--<i class="fa fa-fw fa-lock icon icon--hideo"></i>--%>
									<i class="glyphicon glyphicon-lock"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<c:if test="${not empty mycookie}">
								<span class="input input--hideo" style=" align-content: flex-end">
								<input lass="input__field input__field--hideo" type="checkbox" name="rem" value="checked" checked="checked">&nbsp;&nbsp;记住密码</span>
								</span>							</c:if>
							<c:if test="${empty mycookie}">
								<span class="input input--hideo" style=" align-content: flex-end">
								<input lass="input__field input__field--hideo" type="checkbox" name="rem" value="checked">&nbsp;&nbsp;记住密码</span>
								</span>								</c:if>


						</section>
					</div>
					<div class="form-actions">
						<a tabindex="4" class="btn pull-left btn-link text-muted" onClick="goto_forget()">忘记密码?</a>
						<a tabindex="5" class="btn btn-link text-muted" onClick="goto_register()">注册</a>
						<input class="btn btn-primary" id="sub1" type="submit" tabindex="3" value="登录"
							style="color:white;"/>
					</div>
				</form>
			</div>
			<!-- 忘记密码页面 -->
			<div class="login sign-out-htm">
				<form action="<%=basePath%>Reader/findPass.action" method="post" class="container offset1 loginform" id="forget">
					<input type="hidden" id="codeEoor"/>
					<!-- 猫头鹰控件 -->
					<div id="owl-login" class="forget-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-username phone" name = "phone" autocomplete="off" placeholder="请输入手机号"/>
								<label class="input__label input__label--hideo" for="forget-username">
									<%--<i class="fa fa-fw fa-user icon icon--hideo"></i>--%>
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="code" id="forget-code code" name="code" autocomplete="off" placeholder="请输入验证码"/>
								<!-- <input class="input__field input__field--hideo"  id="forget-code btn" autocomplete="off" name="btn" value="发送验证码" onclick="sendMessage()"/> -->
								
								<label class="input__label input__label--hideo" for="forget-code">
									<%--<i class="fa fa-fw fa-wifi icon icon--hideo"></i>--%>
									<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
								
							</span>
							<!-- <span id="check" style="color: red"></span> -->
							<span> <input class="btn btn-default" id="btn" name="send" value="发送验证码" onclick="sendMessage()" /></span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" name="repass" id="forget-password" placeholder="请重置密码" />
								<label class="input__label input__label--hideo" for="forget-password">
									<%--<i class="fa fa-fw fa-lock icon icon--hideo"></i>--%>
										<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						</section>
					</div>
					<div class="form-actions">
						<a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
						<input class="btn btn-primary" id="lo" type="submit" value="重置密码"
							style="color:white;"/>
					</div>
				</form>
			</div>
			<!-- 注册页面 -->
			<div class="login sign-up-htm">
				<form action="<%=basePath%>Reader/register.action" method="post" class="container offset1 loginform" id="regForm">

					<input type="hidden" id="nameEoor"/>
					<input type="hidden" id="nameEoor1"/>
					<input type="hidden" id="phoneEoor" value="1"/>
					<!-- 猫头鹰控件 -->
					<div id="owl-login" class="register-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="register-username"
									   name="readerNeckName" autocomplete="off" placeholder="请输入用户名" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-username">
									<%--<i class="fa fa-fw fa-user icon icon--hideo"></i>--%>
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" name="readerPassword" type="password"
									   id="register-password" placeholder="请输入密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-password">
									<%--<i class="fa fa-fw fa-lock icon icon--hideo"></i>--%>
										<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" name="readerRePassword" type="password"
									   id="register-repassword" placeholder="请确认密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<%--<i class="fa fa-fw fa-lock icon icon--hideo"></i>--%>
										<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" name="readerTel" id="register-code" autocomplete="off" placeholder="请输入手机号"/>
								<label class="input__label input__label--hideo" for="register-code">
									<%--<i class="fa fa-fw fa-wifi icon icon--hideo"></i>--%>
										<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						</section>
					</div>
					<div class="form-actions">
						<a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
						<input class="btn btn-primary" type="submit" onClick="register()" value="注册"
							style="color:white;"/>
					</div>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">


    $("#btn").click(function(){
        var phone=$("[name='phone']").val();
        if(phone!="")
        {
            $.ajax({
                url:"<%=basePath%>sendSMS.action",
                type:"post",
                data:{"phone":phone},
                success:function() {
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        var index = layer.msg(1,{content:'验证码已发送，请注意查收',offset:['45%','45%']});
                        layer.style(index, {
                            width: '200px',
                            height:'25px'
                        });
                    })
                }
            });
        }else{

            $.pt({
                target: $("[name='phone']"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content:"手机号不能为空"
            });
            return false;
        }

    });

        $("[name='code']").blur(function(){
            var phone=$("[name='phone']").val();
            var code=$("[name='code']").val();
            if(phone!="")
            {
                $.ajax({
                    url:"<%=basePath%>Reader/checkIdentifyCode.action?code="+code,
                    type:"post",
                    data:{"phone":phone},
                    success:function(result){

                        if (result){
                            $.pt({
                                target: $("[name='code']"),
                                position: 'r',
                                align: 't',
                                width: 'auto',
                                height: 'auto',
                                content:"验证码正确",
                                color:'green'
                            });
                            $("#codeEoor").val("验证码正确");
                        }else{

                            $.pt({
                                target: $("[name='code']"),
                                position: 'r',
                                align: 't',
                                width: 'auto',
                                height: 'auto',
                                content:"验证码错误",
                                color:'red'
                            });
                            $("#codeEoor").val("验证码错误");
                        }
                    }
                });
            }else{

                $.pt({
                    target: $("[name='phone']"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content:"手机号不能为空"
                });

            }

        });


</script>
</body>
</html>