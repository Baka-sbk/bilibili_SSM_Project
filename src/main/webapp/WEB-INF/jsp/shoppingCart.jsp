<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${good.commodityname}-->详细页面</title>
<link rel="shortcut icon" href="../favicons/1.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shopping/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shopping/cart.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shopping/vendor.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shopping/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/caomei1.2.8/style.css">
<style type="text/css">
.whole-detail-info-wrapper {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
</head>
<body>
<%@include file="head2.jsp"%>

	<div id="myDiv">
		<div class="whole-detail-info-wrapper">
			<div class="detail-img-icon no_pic"
				style="background-image: url(&quot;${pageContext.request.contextPath}/${good.commodityimg}&quot;);"></div>
			<div class="detail-info-wrapper">
				<div class="product-info-name">${good.commodityname}</div>
				<div class="product-info-time-wrapper">
					<div class="product-info-time-title">时间：</div>
					<div class="product-info-time">${good.commoditytime}</div>
				</div>
				<div class="vuene-wrapper">
					<div class="title">场馆：</div>
					<div class="vuene-info-content">
						<div class="vuene-name">${good.commodityaddress}</div>

						<div class="address-icon"></div>
						<div class="check-map">查看地图</div>
					</div>
				</div>
				<!---->
				<div class="login-show-wrapper">
					<ul class="clearfix mr4">

					</ul>
					<ul class="clearfix">
						<li class="title">价格：</li>
						<li class="tickets"><div class="selectable-option active">
								¥ ${good.commodityprice}</div> <!----></li>
					</ul>
					<ul class="clearfix">
						<li class="title">数量：</li>
						<li class="num-content"><div class="ticket-count">
								<div class="count-reduce  active"></div>
								<div class="count-number">1</div>
								<div class="count-plus active"></div>
							</div></li>
					</ul>
					<!---->
					<div class="product-buy-wrapper">
						<div class="product-buy">
							<div id="submit"
								style="width: 240px; height: 50px; text-align: center; font-size: 16px; line-height: 50px; border-radius: 3px; cursor: pointer; background: #e4eaef; color: #fff; background-image: linear-gradient(-48deg, #ff6a9c, #fe8574); box-shadow: 0 3px 4px 0 #fdb8cc;">立即购票</div>
						</div>
						<!---->
						<div class="want-wrapper">
							<span class="want-icon"></span>
							<div class="want-content">
								<!---->
								<p>剩余${good.commoditystock}张票</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 隐藏域 -->
	<input type="hidden" id="username-hidden" value="1" />
	<!-- ${sessionScope.account.userId} -->
	<input type="hidden" id="commodityid-hidden"
		value="${good.commodityid}" />
	<input type="hidden" id="userId"
		value="${sessionScope.account.userId}" />
	<input type="hidden" id="commoditystock-hidden"
		value="${good.commoditystock}" />


	<footer id="footer">
	<div class="page-width">
		<ul class="footer-c clearfix">
			<li>
				<h6>dilidili</h6> <a href="#" class="card">关于我们</a> <a href="#"
				class="card">友情链接</a> <a href="#" class="card">周边</a> <a href="#"
				class="card">联系我们</a> <a href="#" class="card">加入我们</a> <a href="#"
				class="card">官方认证</a>
			</li>
			<li class="middle">
				<h6>传送门</h6> <a href="#" class="card">帮助中心</a> <a href="#"
				class="card">高级弹幕</a> <a href="#" class="card">活动专题页</a> <a href="#"
				class="card">侵权申诉</a> <a href="#" class="card">分院帽计划</a> <a href="#"
				class="card">活动中心</a> <a href="#" class="card">用户反馈论坛</a> <a
				href="#" class="card">壁纸站</a> <a href="#" class="card">名人堂</a>
			</li>
			<li class="footer-icon">
				<div class="cont">
					<a href="#" class="app"> <i></i> <em>手机端下载</em> <img
						src="${pageContext.request.contextPath}/images/app-qrcode.png"
						alt="#">
					</a> <a href="#" class="weibo"> <i></i> <em>新浪微博</em> <img
						src="${pageContext.request.contextPath}/images/weibo-qrcode.png"
						alt="#">
					</a> <a href="#" class="weixin"> <i></i> <em>官方微信</em> <img
						src="${pageContext.request.contextPath}/images/weixin-arcode.gif"
						alt="#">
					</a>
				</div>
			</li>
		</ul>
	</div>
	</footer>
	<script src="${pageContext.request.contextPath}/js/Jquery-V3.2.1.js"></script>
	<script type="text/javascript">
		//启动
		$(function() {
			var goodId = $("#commodityid-hidden").val();//商品id
			var userId = $("#userId").val();//用户id
			var count = $(".count-number").html();//商品选择数量

			//增加数量  
			$(".count-plus").click(function() {
				if (count < $("#commoditystock-hidden").val()) {
					count++;
					$(".count-number").html(count);
				} else {
					alert("库存不足");
				}

			});

			
			//减少数量  
			$(".count-reduce").click(function() {
				if (count<=1) {
				}else{
					count--;
					$(".count-number").html(count);
					
				}
			});
			//${pageContext.request.contextPath}
			//提交
			$("#submit").click(function(){
				$.post("${pageContext.request.contextPath}/shopping/Buy/"+goodId+"/"+userId+"/"+count,"",function(){
					
					location.href="${pageContext.request.contextPath}/page/orderCart/";
					
				},"JSON");
				
			});
			
		})
	</script>

</body>
</html>