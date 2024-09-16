<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员购</title>
<link rel="shortcut icon" href="../favicons/1.png">
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/shopping/home.css">
<link rel="stylesheet" href="../css/caomei1.2.8/style.css">
<style type="text/css">
.not-free a:link {
	color: #f25d8e;
}

.not-free a:visited {
	color: #f25d8e;
}

.not-free a:active {
	color: #f25d8e;
}

.not-free a:hover {
	color: red;
}

.fenye {
	padding-bottom: 30px;
	text-align: center;
}
</style>
</head>
<body>
<%@include file="head2.jsp"%>

	<!-- 商品列表 -->
	<div class="tab-content">

		<div class="project-list-wrapper">
			<div class="project-list">

				<div id="good-div"></div>



				<!---->
				<div class="toolbar-wrapper">
					<div class="left-slider-wrapper">
						<a target="_blank"
							href="https://show.bilibili.com/platform/feedbacklist.html"
							class="service-wrapper"><div class="service-icon"></div>
							<div class="toolbar-title">建议</div></a>
						<!---->
						<!---->
						<!---->
					</div>
				</div>
				<div class="footer">
					<div class="footer-wrp">
						<div class="border"></div>

					</div>
				</div>
			</div>

		</div>

		<div class="fenye">
			<i class='czs-angle-left-l' id="shangye"></i>&nbsp;&nbsp; 
			<span style="color: #f25d8e" id="shouye">1</span> &nbsp;&nbsp; 
			<span style="color: #f25d8e">.....</span>&nbsp;&nbsp; 
			<span style="color: #f25d8e" id="currPage"></span> &nbsp;&nbsp; 
			<span style="color: #f25d8e">.....</span> &nbsp;&nbsp; 
			<span style="color: #f25d8e" id="totalPage"></span>&nbsp;&nbsp;
			<i class='czs-angle-right-l' id="xiaye"></i>
		</div>
		<!-- 分页工具 -->
		<!-- 隐藏域 -->
				<input type="hidden" id="totalPage-hidden" value=""/>
				<input type="hidden" id="username-hidden" value="${sessionScope.account.userId}"/><!-- ${sessionScope.account.userId} -->
		<div></div>
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
					class="card">高级弹幕</a> <a href="#" class="card">活动专题页</a> <a
					href="#" class="card">侵权申诉</a> <a href="#" class="card">分院帽计划</a> <a
					href="#" class="card">活动中心</a> <a href="#" class="card">用户反馈论坛</a>
					<a href="#" class="card">壁纸站</a> <a href="#" class="card">名人堂</a>
				</li>
				<li class="footer-icon">
					<div class="cont">
						<a href="#" class="app"> <i></i> <em>手机端下载</em> <img
							src="../images/app-qrcode.png" alt="#">
						</a> <a href="#" class="weibo"> <i></i> <em>新浪微博</em> <img
							src="../images/weibo-qrcode.png" alt="#">
						</a> <a href="#" class="weixin"> <i></i> <em>官方微信</em> <img
							src="../images/weixin-arcode.gif" alt="#">
						</a>
					</div>
				</li>
			</ul>
		</div>
		</footer>
		<script src="../js/Jquery-V3.2.1.js"></script>
		<script type="text/javascript">
		
		//加入购物车 是否登录
		function isLoginWithCart(goodId){
			if($("#username-hidden").val()==""||$("#username-hidden").val()==null){
				alert("请先登录");
				location.href="login";
			}else{
				var userId=$("#username-hidden").val();
				addCart(goodId,userId);
			}
			
		}
		//订单中心  是否登录
		function isLoginWithOrder(){
			if($("#username-hidden").val()==""||$("#username-hidden").val()==null){
				alert("请先登录");
				location.href="login";
			}else{
				location.href="order";
			}
		}
		
		//加入购物车
		function addCart(goodId,userId){
			$.post("../shopping/addCart/"+goodId+"/"+userId,"",function(map){
				var stock = map.good.commoditystock;
				if(stock>1){
					if(map.addCartRs==1){
						alert("成功将"+map.good.commodityname+"加入到购物车！");
						var goodNum=1;
						location.href="${pageContext.request.contextPath}/shopping/goOrder/"+goodId+"/"+goodNum;
					}else{
						alert("票已售空！");
					}
				}
			},"JSON");		
		}
		
		//详细页
		function goGood(goodId){
			var userId = $("#username-hidden").val();
				location.href="${pageContext.request.contextPath}/shopping/goOrder/"+goodId+"/"+userId;
		}
		
		
		
		
		//分页
		var currpage = 1;
		var pagesize = 4;

		//查询数据
		function showList() {
			
			$("#good-div").html("");
			$.post('../shopping/getAllCommodity/' + currpage + '/'+ pagesize,"",
					function(data) {
						$("#totalPage").html(data.totalpage);
						$("#currPage").html(currpage);
						var content = "";
						for (var i = 0; i < pagesize; i++) {
							content = "<div class='project-list-item'>"
									+ "<div class='project-list-item-img' style='background-image:url(&quot;.."
									+ data.list[i].commodityimg
									+ "&quot;);' onclick='goGood("+data.list[i].commodityid+")'></div>"
									+ "<div class='project-list-item-detail'>"
									+ "<div class='project-list-item-title' onclick='goGood("+data.list[i].commodityid+")'>"
									+ data.list[i].commodityname
									+ "</div><div class='project-list-item-time' style='height: 10px'  onclick='goGood("+data.list[i].commodityid+")'>"
									+ "<i class='czs-calendar'></i>"
									+ data.list[i].commoditytime
									+ "</div><div class='project-list-item-address' onclick='goGood("+data.list[i].commodityid+")'>"
									+ "<span class='icon address-icon'></span>  <span class='city-name'>"
									+ data.list[i].commodityaddress
									+ "</span><span class='venue-name-and-address'></span>"
									+ "</div><div class='project-list-item-price'><div class='not-free'>"
									+ "<span class='price-symbol'><i class='czs-coin'></i></span> <span class='price'>"
									+ data.list[i].commodityprice
									+ "</span><span class='start'>元</span>"
									+ "<i class='czs-shopping-cart' style='margin-left: 100px;'></i><span style='font-size: 14px;font-weight: bolder;'><a href='javascript:isLoginWithCart("+data.list[i].commodityid+")'>加入购物车</a></span>"
									+ "</div></div></div></div>";
							$("#good-div").append(content);
						}
						$("#totalPage-hidden").val(data.totalpage);
					}, "JSON");
		}
			
			//启动
			$(function() {

				showList();
				
				
				//首页
				$("#shouye").click(function(){
					currpage=1;
					showList();
				});
				//尾页
				$("#totalPage").click(function(){
					currpage=$("#totalPage-hidden").val();
					showList();
				});
				//上一页
				$("#shangye").click(function(){
					if(currpage>1){
						currpage=currpage-1;
						showList();
					}else{
						alert("已是第一页");
					}
					
				});
				//下一页
				$("#xiaye").click(function(){
					if(currpage<=$("#totalPage-hidden").val()-1){
						currpage=currpage+1;
					}else{
						alert("已是最后一页");
					}
					showList();
				});
				

			})
		</script>
</body>
</html>