<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>屄哩屄哩-登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body style="background-image: url(${pageContext.request.contextPath}/images/regist/test.jpg);width: 100%;height: 100%;">
<article class="htmleaf-container">
		<header class="htmleaf-header">
			</div>
		</header>
		<div class="panel-lite">
		  <div class="thumbur">
		    <div class="icon-lock"></div>
		  </div>
		  <form id="loginForm">
		  <h4>用户登录</h4>
		  <div class="form-group">
		    <input required="required" name="account" id="userName" class="form-control"/>
		    <label class="form-label">用户名    </label>
		  </div>
		  <div class="form-group">
		    <input type="password" name="password" id="passWord" required="required" class="form-control"/>
		    <label class="form-label">密　码</label>
		  </div>
		  <div><%if(request.getAttribute("PHO")!=null){ %>
		 		<b style="color: red"><%= request.getAttribute("PHO") %></b>
		  <%} %>
		  </div>
		  
		  <a href="#">忘记密码 ?  </a>    <a href="regist.jsp">立即注册? </a> 
		  <br>
		    <a href="index">返回首页 </a>
			 <input type="button" class="floating-btn" id="tijiao" value=">"><i class="icon-arrow"></i>
		</form>
		</div>
	</article>
	<script src="${pageContext.request.contextPath}/js/Jquery-V3.2.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#tijiao").click(function(){
			$.post("${pageContext.request.contextPath}/user/login",$("#loginForm").serialize(),function(data){
				if(data.result=="ok"){
					alert("欢迎"+data.account.account+"登录!");
					//"${pageContext.request.contextPath}/page/index"
					location.href="${pageContext.request.contextPath}/index.jsp";
				}else{
					alert("账号或密码错误！请重新输入！");
					location.href="${pageContext.request.contextPath}/page/login";
				}
			},"json");
		});
	});
</script>
</body>
</html>