<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<!-- =======================================================
  * Template Name: ZenBlog
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
  * Author: BootstrapMade.com
  * License: https:///bootstrapmade.com/license/
  ======================================================== -->





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
<body class="sb-nav-fixed">
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->





	<main id="main">


		<dl style="font-size: larger;">
			<dt>您現在所在分類：</dt>
			<dd>${commodityPage.content.get(0).commCate.cateName}</dd>
		</dl>

		<div class="row">
			<div class="col-lg-12">
				<div class="pagination">
					<ul class="list-inline d-block mx-auto">
						<li class="list-inline-item"><a
							href="${contextRoot}/Store/Commodity/findAllComm"
							class="btn btn-primary">返回商品總表</a></li>
					</ul>
				</div>
			</div>




			<div class="container">
				<div class="row">
					<c:forEach var="commodity" items="${commodityPage.content}"
						varStatus="status">
						<div class="col-lg-4 col-6 mb-4 shuffle-item"
							data-groups='["${category}"]'>
							<div class="position-relative inner-box">
								<div class="image position-relative">
									<a
										href="${contextRoot}/Store/Commodity/findComm?commId=${commodity.commId}">
										<img
										src="data:image/png;base64,${commodity.base64StringcommPicture}"
										alt="portfolio-image" class="img-fluid w-100 d-block"
										style="width: 150px; height: 150px; object-fit: cover;">
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
									href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodity.commCate.cateId}">商品分類:${commodity.commCate.cateName}</a>
								<p class="card-text">商品特價:${commodity.commPrice*commodity.commDiscount}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>






		<!-- 				這裡是分頁器 陽春 -->
		<%-- 		<c:forEach var="pageNumber" begin="1" --%>
		<%-- 			end="${commodityPage.totalPages}"> --%>
		<!-- 			<a -->
		<%-- 				href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodityPage.content.get(0).commCate.cateId}&p=${pageNumber}">${pageNumber}</a> --%>
		<%-- 		</c:forEach> --%>


		<div class="row">
			<div class="col-lg-12">
				<div class="pagination">
					<ul class="list-inline d-block mx-auto">

						<c:forEach var="pageNumber" begin="1"
							end="${commodityPage.totalPages}">
							<li class="list-inline-item"><a
								href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodityPage.content.get(0).commCate.cateId}&p=${pageNumber}">
									<span>${pageNumber}</span>
							</a></li>
						</c:forEach>


					</ul>
				</div>
			</div>
		</div>




		<!-- 加點gpt特效 -->
		<!-- 		<div class="pagination"> -->
		<%-- 			<c:forEach var="pageNumber" begin="1" --%>
		<%-- 				end="${commodityPage.totalPages}"> --%>
		<!-- 				<a -->
		<%-- 					href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodityPage.content.get(0).commCate.cateId}&p=${pageNumber}" --%>
		<%-- 					class="page-link">${pageNumber}</a> --%>
		<%-- 			</c:forEach> --%>
		<!-- 		</div> -->

	</main>

	<!-- ======= Footer ======= -->
	<%-- 	<jsp:include page="../../layout/footer.jsp"></jsp:include> --%>
	<!-- End Footer -->

	<!-- 引入 Bootstrap 的 JavaScript 文件 -->
	<!-- 	<script -->
	<%-- 		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script> --%>




</body>
</html>
