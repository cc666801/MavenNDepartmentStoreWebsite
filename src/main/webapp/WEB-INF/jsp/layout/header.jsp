<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">


<title>MavenN百貨</title>
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

		<a href="${contextRoot}/" class="logo d-flex align-items-center">
			<!-- Uncomment the line below if you also wish to use an image logo -->
			<!-- <img src="assetsForFrontend/img/logo.png" alt=""> -->
			<h1>ZenBlog</h1>
		</a>


		<nav id="navbar" class="navbar">
			<ul>
				<li><a href="${contextRoot}/">首頁</a></li>
				<li><a href="${contextRoot}/company">廠商專區</a></li>
				<li><a href="${contextRoot}/company/floor">樓層簡介</a></li>
				<li><a href="${contextRoot}/exampleFrontendPage">前台範例頁面</a></li>
				<li class="Store"><a href="${contextRoot}/Store/Storeindex"><span>線上商城</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a></li>
				<li class="dropdown"><a href="category.html"><span>Categories</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<li><a href="search-result.html">Search Result</a></li>
						<li><a href="#">Drop Down 1</a></li>
						<li class="dropdown"><a href="#"><span>Deep Drop
									Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
							<ul>
								<li><a href="#">Deep Drop Down 1</a></li>
								<li><a href="#">Deep Drop Down 2</a></li>
								<li><a href="#">Deep Drop Down 3</a></li>
								<li><a href="#">Deep Drop Down 4</a></li>
								<li><a href="#">Deep Drop Down 5</a></li>
							</ul></li>
						<li><a href="#">Drop Down 2</a></li>
						<li><a href="#">Drop Down 3</a></li>
						<li><a href="#">Drop Down 4</a></li>
					</ul></li>

				<li class="dropdown"><a href="${contextRoot}/articleList"><span>討論區</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<li><a href="${contextRoot}/articleList">文章列表</a></li>
						<li><a href="${contextRoot}/articleManage">會員個人文章管理</a></li>
					</ul></li>
				<li class="dropdown"><a href="${contextRoot}/LostAndFound"><span>顧客服務</span>
						<i class="bi bi-chevron-down dropdown-indicator"></i></a>
					<ul>
						<li><a href="${contextRoot}/LostAndFound">失物招領</a></li>
						<li><a href="#">客服中心</a></li>
						<li><a href="#">關於我們</a></li>
					</ul></li>
				<li><a href="${contextRoot}/backend">後台系統</a></li>
				
				
				
			</ul>
		</nav>

		<!-- .navbar -->

		<div class="position-relative">
			<a href="${contextRoot}/member/register" class="mx-2"> <span class="bi-person-circle">${member.name}</span></a> 
			<a href="${contextRoot}/member/logout" class="mx-2"> <span class="bi bi-box-arrow-right"></span></a>
			<a href="${contextRoot}/member/{id}" class="mx-2"> <span class="bi bi-tencent-qq"></span></a>
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