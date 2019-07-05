<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>屄哩屄哩-注册</title>
<link href="${pageContext.request.contextPath}/css/regist.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/Jquery-V3.2.1.js"></script>
<script language='javascript'
	src="${pageContext.request.contextPath}/js/regist.js"></script>
</head>
<body
	style="background-image: url(${pageContext.request.contextPath}/images/regist/test.jpg);width: 100%;height: 100%;">
	<div class='body_main'>
		<!-- start main content -->
		<div class='index_box' style='margin-top: 20px;'>
			<div
				style="position: fixed; color: red; margin: 70px 0 0 450px; font-size: 16px; Z-index: 100; display: block;"
				id="hint"></div>
			<div class='box_title'>
				<div class='text_content'></div>
			</div>

			<!-- 注册From 表单 -->
			<div class='box_main'>
				<div id="register" class="register">
					<form id="form" action="" method="post" onSubmit="return check();">
						<div id="form_submit" class="form_submit">
							<div class="fieldset">
								<div class="field-group">
									<label class="required title">手机号码</label> <span
										class="control-group" id="mobile_input">
										<div class="input_add_long_background">
											<input class="register_input" type="text" id="mobile"
												name="phone" maxLength="11"
												onblur="__changeUserName('mobile');">
										</div>
									</span> <label class="tips">仅用于发送服务开通与到期提醒以及紧急故障方便联系到您，绝对保密</label>
								</div>
								<div class="field-group">
									<label class="required title">邮箱</label> <span
										class="control-group" id="email_input">
										<div class="input_add_long_background">
											<input class="register_input" type="text" id="email"
												name="email" maxLength="50"
												onblur="__changeUserName('email');">
										</div>
									</span> <label class="tips">请输入您常用的邮箱</label>
								</div>

								<div class="field-group">
									<label class="required title">登录账号</label> <span
										class="control-group" id="email_input">
										<div class="input_add_long_background">
											<input class="register_input" type="text" id=""
												name="account" maxLength="50" onblur="">
										</div>
									</span> <label class="tips">请输入您用作本网站登录的账号</label>
								</div>


								<div class="field-group">
									<label class="required title">设置密码</label> <span
										class="control-group" id="password1_input">
										<div class="input_add_long_background">
											<input class="register_input" type="passWord" id="password1"
												name="password" maxLength="20"
												onblur="checkPwd1(this.value);" />
										</div>
									</span> <label class="tips">请使用6~20个英文字母（区分大小写）、符号或数字</label>
								</div>
								<div class="field-group">
									<label class="required title">验证码</label> <span
										class="control-group" id="code_input">
										<div class="input_add_background" style="margin-right: 15px;">
											<input class="register_input_ot" type="text" id="code"
												name="yanzheng" max_length="6"
												onblur="checkAuthCode(this.value);">
										</div>
										<div id="getCodeDiv">
											<input type="button" value="获取验证码" width="100" id="getCode">
										</div>
									</span> <label class="tips">若尝试多次仍无法接收到短信验证码，请您联系在线客服帮您开通账号</label>
								</div>
							</div>
						</div>
						<div style="color: red" align="center"></div>
						<div id="" class="">
							<div class='div_submit_button'>
								<input id="submit" type="button" value="注册"
									class='button_button disabled'  disabled="disabled"> <a href="login.jsp">返回登录?</a>
							</div>
						</div>
					</form>
				</div>
				<script type="text/javascript">
	
				
	var codes;			
function __changeUserName(of){
  var username=$('#'+of).val();
  if(of=='email'){
	  if (username.search(/^[\w\.+-]+@[\w\.+-]+$/) == -1) {
			showTooltips('email_input','请输入正确的Email地址');
			return;
	}					
  }
  else{
	  if(username=='' || !isMobilePhone(username)) {
		  showTooltips('mobile_input','请输入正确的手机号码');
		  return;
	  }
  }
}
function checkPwd1(pwd1) {
	if (pwd1.search(/^.{6,20}$/) == -1) {
		showTooltips('password1_input','密码为空或位数太少');
	}else {
		hideTooltips('password1_input');
	}
}	

function checkEmail(email) {
	if (email.search(/^.+@.+$/) == -1) {
		showTooltips('email_input','邮箱格式不正确');
	}else {
		hideTooltips('email_input');
	}
}

function checkAuthCode(authcode) {
	if (authcode == '' || authcode.length != 6) {
		showTooltips('code_input','验证码不正确');
	}else {
		hideTooltips('code_input');
 }     
}

function check() {
	hideAllTooltips();
	var ckh_result = true;
	if ($('#email').val() == '') {
	showTooltips('email_input','邮箱不能为空');
	ckh_result = false;
  }
  if ($('#password1').val() == '') {
	showTooltips('password1_input','密码不能为空');
	ckh_result = false;
  }      
  if($('#mobile').val()=='' || !isMobilePhone($('#mobile').val())) {            
	  showTooltips('mobile_input','手机号码不正确');
	  ckh_result = false;
  }
  if ($('#code').val() == '' || $('#code').val().length !=6) {
	showTooltips('code_input','验证码不正确');
	ckh_result = false;
  }
  if ($('#verify').attr('checked') == false){
	showTooltips('checkbox_input','对不起，您不同意Webluker的《使用协议》无法注册');
	ckh_result = false;
  }
  return ckh_result;
}
function checkMobilePhone(telphone) {
	if(telphone=='' || !isMobilePhone(telphone)) {
	showTooltips('mobile_input','请输入正确的手机号码');
  }else{
	hideTooltips('mobile_input');
  }
}
function isMobilePhone(value) {
if(value.search(/^(\+\d{2,3})?\d{11}$/) == -1)
return false;
else
return true;
} 


$(function(){
	$("#submit").click(function(){
		$.post("${pageContext.request.contextPath}/user/regist",$("#form").serialize(),function(data){
			if(data.isOK=="ok"){
			alert("注册成功");	
			 window.location.href = 'login'
			}else if(data.isOK=="no"){
				alert("注册失败"+data.erol);
			}
		},"json");
	});
	
	 $("[name=account]").blur(function(){
		$.post("${pageContext.request.contextPath}/user/regist1",$("#form").serialize(),function(data){
			if(data.yz=="no"){
				alert("用户名重复,请重新输入");
				$("input[name='account']").val(""); 
			}
		},"json");
	})
})

$(function(){
	$("#getCode").click(function(){
		$.post("${pageContext.request.contextPath}/user/phoneCode",$("#form").serialize(),function(data){
			if(data.code==11){
				alert("发送成功，请稍等");
				alert(data.msg);
				codes= data.msg;
			}else if(data.code==00){
				alert("发送失败,请填写正确手机号");
			}
		},"json");
	});
	$("[name=yanzheng]").mouseout(function(){
		if(codes==$("[name=yanzheng]").val()){
			alert("验证成功！");
			document.getElementById("submit").disabled=false;
		}else{
			alert("验证失败");
			$("input[name='yanzheng']").val("");
			 
		}
	});
})
	




</script>
			</div>
			<div class='box_bottom'></div>
		</div>
	</div>


</body>
</html>