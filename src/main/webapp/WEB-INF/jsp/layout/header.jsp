<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">


<title>Mavenn百貨</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${contextRoot}/assetsForFrontend/img/favicon.png" rel="icon">
<link href="${contextRoot}/assetsForFrontend/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${contextRoot}/assetsForFrontend/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${contextRoot}/assetsForFrontend/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${contextRoot}/assetsForFrontend/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link
	href="${contextRoot}/assetsForFrontend/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="${contextRoot}/assetsForFrontend/vendor/aos/aos.css"
	rel="stylesheet">


<!-- Template Main CSS Files -->
<link href="${contextRoot}/assetsForFrontend/css/variables.css"
	rel="stylesheet">
<link href="${contextRoot}/assetsForFrontend/css/main.css"
	rel="stylesheet">
<%-- <link href="${contextRoot}/assetsForFrontend/css/floor.css" rel="stylesheet"> --%>


<!-- =======================================================

    </head>

    <body>
      <!-- ======= Header ======= -->
<header id="header" class="header d-flex align-items-center fixed-top">
	<div
		class="container-fluid container-xl d-flex align-items-center justify-content-between">

		<a href="${contextRoot}/" class="logo d-flex align-items-center" style="position: relative; z-index: 9999;">
  <img src="${contextRoot}/assetsForFrontend/img/Mavenn.png" style="max-width: 250px; max-height: 250px;">
</a>






		<nav id="navbar" class="navbar">
			<ul>
				<li><a href="${contextRoot}/">首頁</a></li>
				<li><a href="${contextRoot}/company/floor">樓層簡介</a></li>

				<li class="dropdown"><a
					href="${contextRoot}/Store/Commodity/findAllComm"><span>線上商城</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<jstl:if test="${empty member}">
						</jstl:if>
						<jstl:if test="${not empty member}">
							<li><a href="${contextRoot}/Store/wishList/readwishlist">心願清單</a></li>
						</jstl:if>
					</ul></li>


				<li class="dropdown"><a
					href="${contextRoot}/orderSystem/shoppingCart"><span>訂單專區</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<li><a href="${contextRoot}/orderSystem/shoppingCart">購物車</a></li>
						<li><a href="${contextRoot}/orderSystem/order">訂單狀態</a></li>
					</ul></li>
					
<!-- 				餐廳系統	 -->
				<li class="dropdown"><a href="${contextRoot}/restaurantfront"><span>餐廳訂位</span>
					<i class="bi bi-chevron-down dropdown-indicator"></i></a>
				<ul>
					<li><a href="${contextRoot}/restaurantfront">餐廳訂位</a></li>
					
					<jstl:if test="${empty member}">
					</jstl:if>
					
					<jstl:if test="${not empty member}">
						<li><a href="${contextRoot}/restaurantfront/chickReservation?memberid=${member.id}">訂位狀態</a></li>
					</jstl:if>
					
				</ul></li>
<!-- 				餐廳系統end	 -->
				
				<li class="dropdown"><a href="${contextRoot}/articleList"><span>討論區</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<li><a href="${contextRoot}/articleList">文章列表</a></li>
						<li><a href="${contextRoot}/articleCollect">收藏文章</a></li>
						<li><a href="${contextRoot}/articleManage">會員個人文章管理</a></li>

					</ul></li>
				<li class="dropdown"><a href="${contextRoot}/LostAndFound"><span>顧客服務</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<li><a href="${contextRoot}/LostAndFound">失物招領</a></li>						
						<li><a href="${contextRoot}/parking">停車資訊</a></li>
						<li><a href="${contextRoot}/chat">智能客服</a></li>
					
					</ul></li>
				<jstl:if test="${sessionScope.member.permissions eq '管理員'}">
					<li><a href="${contextRoot}/backend">後台系統</a></li>
				</jstl:if>
			</ul>
		</nav>

		<div class="position-relative">

			<jstl:if test="${empty member}">


				<a href="${contextRoot}/member/login" class="mx-2"> <span
					class="bi-person-circle">登入/註冊</span></a>


			</jstl:if>

			<jstl:if test="${not empty member}">

				<a href="${contextRoot}/memberCentre" class="mx-2"> <span
					class="bi-person-circle"> ${member.name}</span></a>

				<a href="${contextRoot}/member/logout" class="mx-2"> <span
					class="bi bi-box-arrow-right"></span></a>

			</jstl:if>
			<a href="#" class="mx-2 js-search-open"> <span class="bi-search"></span></a>
			<i class="bi bi-list mobile-nav-toggle"></i>


			<!-- ======= Search Form ======= -->
			<div class="search-form-wrap js-search-form-wrap">
				<form action="search-result.html" class="search-form">
					<span class="icon bi-search"></span> <input type="text"
						placeholder="Search" class="form-control">
					<button class="btn js-search-close">
						<span class="bi-x"></span>
					</button>
				</form>
			</div>
			<!-- End Search Form -->

		</div>

	</div>

</header>
<!-- End Header -->
</body>

</html>