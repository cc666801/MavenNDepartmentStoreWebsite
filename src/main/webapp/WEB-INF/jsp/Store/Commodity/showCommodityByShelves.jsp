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
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">


		<!-- 				再來一組測試 5/3  -->
		<div class="container">
			<div class="row">
				<c:forEach var="commodities" items="${commodities}"
					varStatus="status">

					<div class="col-lg-4 col-6 mb-4 shuffle-item"
						data-groups='["${category}"]'>
						<div class="position-relative inner-box">
							<div class="image position-relative">
								<a
									href="${contextRoot}/Store/Commodity/findComm?commId=${commodities.commId}">
									<img
									src="data:image/png;base64,${commodities.base64StringcommPicture}"
									alt="portfolio-image" class="img-fluid w-100 d-block"
									style="width: 150px; height: 150px; object-fit: cover;">
									<div class="overlay-box">
										<div class="overlay-inner">
											<a class="overlay-content"
												href="${contextRoot}/Store/Commodity/findComm?commId=${commodities.commId}">
												<h5 class="mb-0">${commodities.commName}</h5>
												<p>商品詳細頁面</p>
												<p class="card-text">商品價格:${commodities.commPrice}</p>
											</a>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="card-body">
							<p class="card-text">商品名稱:${commodities.commName}</p>
							<a
								href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodities.commCate.cateId}">商品分類:${commodities.commCate.cateName}</a>
							<p class="card-text">商品特價:${commodities.commPrice*commodities.commDiscount}</p>
						</div>
					</div>
				</c:forEach>







				<!-- 分頁器 勿動  原本陽春-->
				<%-- 				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>
				<!-- 					<a -->
				<%-- 						href="${contextRoot}/Store/Commodity/findAllComm?p=${pageNumber}" --%>
				<%-- 						style="display: inline">${pageNumber}</a> --%>
				<%-- 				</c:forEach> --%>


				<div class="row">
					<div class="col-lg-12">
						<div class="pagination">
							<ul class="list-inline d-block mx-auto">

								<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
									<li class="list-inline-item"><a
										href="${contextRoot}/Store/Commodity/commodities?p=${pageNumber}"
										style="display: inline"> <span>${pageNumber}</span>
									</a></li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>


			</div>


		</div>
	</main>


	<!-- ======= Footer ======= -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<!-- End Footer -->

	<!-- 引入 Bootstrap 的 JavaScript 文件 -->
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>
</body>
</html>
