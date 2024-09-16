<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css">
</head>
<body>
	<div class="bili-header-m report-wrap-module">
		<div class="nav-menu">
			<div class="blur-bg"
				style="background-image: url(${pageContext.request.contextPath}/images/header_bg.jpg);"></div>
			<div class="nav-mask"></div>
			<div class="nav-wrapper clearfix bili-wrapper">
				<div class="nav-con fl">
					<ul>
						<li report-id="playpage_main" class="nav-item home"><a
							href="${pageContext.request.contextPath}/index.jsp" title="主站" class="t"><i
								class="header-iconfont header-icon-bilibili-tv"></i> 主站 <!----></a>
						<!----></li>
						<li report-id="playpage_buy" class="nav-item buy"><a
							href="${pageContext.request.contextPath}/page/shopping">会员购</a></li>
					</ul>
				</div>
				<div report-id="playpage_contribution" class="up-load fr">
					<a href="#" class="u-link" id="opload"> 投稿 </a>
					<!---->
				</div>
				<div class="nav-con fr">
					<ul>
						<li class="nav-item profile-info"  id="face"><a
							href="${pageContext.request.contextPath}page/login" class="t"><div
									class="i-face">
									<img src="${pageContext.request.contextPath}/images/userhead.jpg"
										class="face">
								</div></a>
						<div class="i_menu i_menu_login" style="display: none;" id="login_div">
								<p class="tip">登录后你可以修改个人信息</p>
								<c:if test="${not empty account}">
									<p class="tip"><a href="${pageContext.request.contextPath}/page/Information" class="login-btn">个人中心</a></p>
									欢迎<span style="color:#ff4e00;">${account.account}</span>登录
									<a href="javascript:void(0)" style="color:#ff4e00;" id="logout">注销</a>
								</c:if>
								<c:if test="${empty account}">
								<a href="${pageContext.request.contextPath}/page/login" class="login-btn">登录</a>
								<p class="reg">
									首次使用？<a
										href="${pageContext.request.contextPath}/page/regist">点我去注册</a>
								</p>
								</c:if>
								</div>
							</li>
							<li report-id="playpage_history" id="username" class="nav-item" style="margin: 0px;">${account.account}</li>
						<li report-id="playpage_history" class="nav-item"><a
							href="#">历史</a>
						</li>
					</ul>
				</div>
				<div class="nav-con fr">
					<!---->
					<!---->
				</div>
			</div>
		</div>
		<div id="banner_link"
			class="head-banner report-wrap-module report-scroll-module"
			style="background-image: url(${pageContext.request.contextPath}/images/header_bg.jpg);"
			scrollshow="true">
			<div class="head-content bili-wrapper">
				<div class="search">
					<form class="searchform">
						<input type="text" autocomplete="off" accesskey="s"
							x-webkit-speech="" x-webkit-grammar="builtin:translate"
							placeholder="大佬，你的肝还好吗" value="" class="search-keyword">
						<button type="submit" class="search-submit"></button>
					</form>
					<!---->
					<!---->
					<a href="#"><span>排行榜</span></a>
				</div>
				<a href="${pageContext.request.contextPath}/page/index" class="head-logo"
					style="background-image: url(${pageContext.request.contextPath}/images/header_logo.png);"></a>
			</div>
			<a target="_blank" class="banner-link"></a>
		</div>
		
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Jquery-V3.2.1.js"></script>
	<script type="text/javascript">
		$("#face").hover(function () {
			$("#login_div").show();
		},function(){
			$("#login_div").hide();
		});
		<!--没有登陆不能投稿 -->
		function isOnline() {
			var account = $("#username").text();
			if (account==null || account=="") {
				location.href="${pageContext.request.contextPath}page/login";
			}else{
				location.href="${pageContext.request.contextPath}page/videoFileTop";
			}
		}
		
		$("#opload").click(function () {
			isOnline();
		});
		$(function(){
			$("#logout").click(function(){
				$.post("${pageContext.request.contextPath}/user/logout",function(data){
					if(data.result=="ok"){
						location.href="${pageContext.request.contextPath}/page/login";
					}else{
						alert("服务器繁忙，注销失败，请稍后重试！");
					}
				},"json");
			});
		})
	</script>
</body>
</html>