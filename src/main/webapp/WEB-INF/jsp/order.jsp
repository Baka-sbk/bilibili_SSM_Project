<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.min.css"
	type="text/css">
<link
	href="${pageContext.request.contextPath}/css/vendor.c15a8ed07b6adf480aa4b159f4fd60a5.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/confirmOrder.3c8fca21013732b74f15dde47e1dfc43.css"
	rel="stylesheet">
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
</head>
<body>
	<%@include file="head2.jsp"%>



	<div id="app">

		<div class="detail-content-wrapper">
			<div class="confirmorder-container">
				<h1>订单信息</h1>
				<div class="project-info">
					<table>
						<tbody>
							<tr>
								<th>商品</th>
								<!---->
								<th>单价</th>
								<th>数量</th>
								<!---->
								<th>合计</th>
							</tr>
							<tr>
								<td><div class="project-content">
										<div class="content-left">
											<img src="${pageContext.request.contextPath}${good.commodityimg}">
										</div>
										<div class="content-right">
											<h1>
												${good.commodityname}
												<!---->
											</h1>
											<p>${good.commodityaddress}</p>
											<p class="ticket-name">
												<span title="7月12日-7月14日">${good.commoditytime}</span> <span></span>
												<span title="单日预售票">预售票</span>
											</p>
											<div class="ticket-type clearfix">
												<span></span>电子票
											</div>
											<!---->
										</div>
									</div></td>
								<!---->
								<td>
									<div>￥${good.commodityprice}</div>
								</td>
								<td>
									<div>${goodNum}张</div>
								</td>
								<!---->
								<td class="total"><p>￥总价<span id="price3"></span></p>
									<p>(不含运费)</p></td>
							</tr>
							<!---->
						</tbody>
					</table>
				</div>



				<!---->
				<div class="total-container clearfix">
					<div>
						商品总额￥<span id="price1">58</span>
					</div>
					<!---->

					<!---->
					<div>
						应付金额<span class="allPrice">￥<span id="allPrice" >58</span></span>
					</div>
				</div>
				<div class="confirm-bottom">
					<div class="check-lists">
						<!---->

					</div>
					<div class="confirm-paybtn active">下一步支付,￥<span id="nextStep">58</span></div>
				</div>
				<!---->
				<!---->

				<!---->
			</div>
		</div>

	</div>
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
<!-- 	隐藏域 -->
<input type="hidden" id="username-hidden" value="${sessionScope.account.userId}"/>
<input type="hidden" id="goodId-hidden" value="${good.commodityid}"/>
<input type="hidden" id="goodName-hidden" value="${good.commodityname}"/>
<input type="hidden" id="goodPrice-hidden" value="${good.commodityprice}"/>
<input type="hidden" id="goodStock-hidden" value="${good.commoditystock}"/>
<input type="hidden" id="num-hidden" value="${goodNum}"/>
</body>
<script type="text/javascript">


//启动
$(function(){
	var price = $("#goodPrice-hidden").val();
	var num =$("#num-hidden").val();
	var totalPrice= num*price;
	$("#nextStep").html(totalPrice);
	$("#allPrice").html(totalPrice);
	$("#price1").html(totalPrice);
	$("#price3").html(totalPrice);
});

</script>
</html>