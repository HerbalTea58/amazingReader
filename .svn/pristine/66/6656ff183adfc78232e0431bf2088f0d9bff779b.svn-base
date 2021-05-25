$(document).ready(function(){
			  var flag = true;
			  
			  var identificationFlag = false;
			  var passwordFlag = false;
			  var emailFlag = false;
			
			  $("#identification").blur(function(){
				  if($("#identification").val().trim()==""){
					  $("#txtHint").html("");
					  return;
				  }
				  htmlobj=$.ajax({url:"view/reader/isReaderNameExiest?readerName="+$("#identification").val(),async:true,
								  success: function(){
									  	if(0!=htmlobj.responseText){
									  		$("#txtHint").html("已存在该用户昵称");
									  		$("#txtHint").removeClass();
									  		$("#txtHint").addClass("errorInfo");
									  		identificationFlag = false;
									  		isAllready();
									  	}
									  	else{
									  		$("#txtHint").html("正确");
									  		$("#txtHint").removeClass();
									  		$("#txtHint").addClass("correctInfo");
									  		identificationFlag = true;
									  		isAllready();
									  	}
								  }
				  });
			  });
			  
			  $("#password").blur(function(){
				  if($("#password").val().trim()==""){
					  $("#txtHint1").html("");
					  return;
				  }
				  var ret = /^(?:(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])).{8,20}$/;
				  if(ret.test($("#password").val())){
					  	$("#txtHint1").html("正确");
				  		$("#txtHint1").removeClass();
				  		$("#txtHint1").addClass("correctInfo");
				  		$("#passwordRe").keyup();
				  		passwordFlag = true;
				  		isAllready();
				  		return;
				  }else if($("#password").val().length<9){
					  	$("#txtHint1").html("密码过短");
				  		
				  }else if($("#password").val().length>20){
					 	$("#txtHint1").html("密码过长");
				  }else{
					  	$("#txtHint1").html("密码格式为包含小写字母、大写字母、数字的8-20位字符串");
				  }
				  $("#txtHint1").removeClass();
			  	  $("#txtHint1").addClass("errorInfo");
			  	  passwordFlag = false;
			  	  isAllready();
			  });
			  
			  $("#passwordRe").blur(function(){
				  
				  if($("#passwordRe").val().trim()==""){
					  $("#txtHint2").html("");
					  return;
				  }
				  if( $("#passwordRe").val() == $("#password").val() ){
					  	$("#txtHint2").html("正确");
				  		$("#txtHint2").removeClass();
				  		$("#txtHint2").addClass("correctInfo");
				  		passwordFlag = true;
				  		isAllready();
				  		return;
				  }else{
					  	$("#txtHint2").html("两次密码不一致");
				  }
				  $("#txtHint2").removeClass();
			  	  $("#txtHint2").addClass("errorInfo");
			  	  passwordFlag = false;
			  	  isAllready();
			  });
			  
			  $("#email").blur(function(){
				  if($("#email").val().trim()==""){
					  $("#txtHint3").html("");
					  return;
				  }
				  var ret = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				  if(ret.test($("#email").val())){
					  	$("#txtHint3").html("正确");
				  		$("#txtHint3").removeClass();
				  		$("#txtHint3").addClass("correctInfo");
				  		emailFlag = true;
				  		isAllready();
				  		return;
				  }else{
					  	$("#txtHint3").html("邮件格式错误");
				  }
				  $("#txtHint3").removeClass();
			  	  $("#txtHint3").addClass("errorInfo");
			  	  emailFlag = false;
			  	  isAllready();
			  });
			  
			  $("#register").attr("disabled","disabled");//初始可用
			  
			  function isAllready(){
				  flag = identificationFlag && passwordFlag && emailFlag;
				  if(!flag)
					  $("#register").attr("disabled","disabled");
				  else
					  $("#register").removeAttr("disabled");
			  }
			  
		});