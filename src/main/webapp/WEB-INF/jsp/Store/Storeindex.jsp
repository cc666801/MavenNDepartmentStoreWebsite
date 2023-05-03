<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商城首頁</title>
<!-- 引入 Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">



<!-- ** Plugins Needed for the Project ** -->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/themify/css/themify-icons.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/counto/animate.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/aos/aos.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/magnific-popup/magnific-popup.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/animated-text/animated-text.css">

<!-- Main Stylesheet -->
<link href="${contextRoot}/assetsForFrontend/store/css/style.css"
	rel="stylesheet">






</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">
		<div class="container">
			<div class="row">
				<c:forEach var="commodity" items="${page.content}">
					<div class="col-md-4 mb-3">
						<div class="card">
							<a
								href="${contextRoot}/Store/Commodity/findComm?commId=${commodity.commId}">
								<img
								src="data:image/png;base64,${commodity.base64StringcommPicture}"
								class="card-img-top" alt="商品圖片"
								style="width: 100px; height: 100px;">
							</a>

							<div class="card-body">
								<p class="card-text">商品名稱:${commodity.commName}</p>
								<!-- 								下面要改寫各別分類頁面 -->
								<a
									href="${contextRoot}/Store/Commodity/findCate?cateId=${commodity.commCate.cateId}">
									商品分類:${commodity.commCate.cateName} </a>
								<p class="card-text">商品價格:${commodity.commPrice}</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<br />


				<!-- 				測試中的地方  可成功套版-->
				<c:forEach var="commodity" items="${page.content}">
					<div class="col-lg-4 col-6 mb-4 shuffle-item"
						data-groups="[&quot;design&quot;,&quot;branding&quot;]">
						<div class="position-relative inner-box">
							<div class="image position-relative">
								<a
									href="${contextRoot}/Store/Commodity/findComm?commId=${commodity.commId}">
									<img
									src="data:image/png;base64,${commodity.base64StringcommPicture}"
									alt="portfolio-image" class="img-fluid w-100 d-block"
									style="width: 250px; height: 250px;">

									<div class="overlay-box">
										<div class="overlay-inner">
											<a class="overlay-content"
												href="${contextRoot}/Store/Commodity/findComm?commId=${commodity.commId}">
												<h5 class="mb-0">${commodity.commName}</h5>
												<p>商品詳細頁面</p>
												<p class="card-text">商品價格:${commodity.commPrice}</p>
											</a>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="card-body">
							<p class="card-text">商品名稱:${commodity.commName}</p>
							<a
								href="${contextRoot}/Store/Commodity/findCate?cateId=${commodity.commCate.cateId}">商品分類:${commodity.commCate.cateName}</a>
							<p class="card-text">商品特價:${commodity.commPrice*commodity.commDiscount}</p>
						</div>
					</div>
				</c:forEach>





				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					<a
						href="${contextRoot}/Store/Commodity/findAllComm?p=${pageNumber}"
						style="display: inline">${pageNumber}</a>
				</c:forEach>
			</div>


		</div>
	</main>


	<!-- ======= Footer ======= -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- End Footer -->

	<!-- 引入 Bootstrap 的 JavaScript 文件 -->
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>
</body>
</html>
