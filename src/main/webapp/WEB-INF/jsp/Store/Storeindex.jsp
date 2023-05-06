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

		<!-- 			嘗試套分類樣版  有出現 但未能實現 -->



		<div class="text-center my-4">
			<a href="${contextRoot}/Store/Commodity/findAllComm"
				class="btn btn-primary mx-3">返回商品總表</a>
			<c:forEach var="findAllCate" items="${findAllCate}"
				varStatus="status">
				<a
					href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${findAllCate.cateId}"
					class="btn btn-primary mx-3 my-2">${findAllCate.cateName}</a>
			</c:forEach>
		</div>


		<!-- 測試 -->
		<!-- 		<div class="row mb-5"> -->
		<!-- 			<div class="col-10"> -->
		<!-- 				<div class="btn-group" role="group" aria-label="商品分類"> -->
		<!-- 					<button type="button" class="btn btn-primary active" -->
		<!-- 						data-filter="all">所有</button> -->
		<!-- 					<button type="button" class="btn btn-primary" data-filter="maple">楓之谷</button> -->
		<!-- 					<button type="button" class="btn btn-primary" data-filter="magic">神魔</button> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->



		<%-- 		<form:form --%>
		<%-- 			action="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodity.commCate.cateId}" --%>
		<%-- 			method="get"> --%>
		<%-- 			<input type="hidden" name="cateId" value="${commcate.cateId}"> --%>
		<%-- 			<button type="submit" class="btn btn-warning">"${commcate.cateId.cateName}"</button> --%>

		<!-- 			<a -->
		<%-- 				href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodity.commCate.cateId}">商品分類:${commodity.commCate.cateName}</a> --%>
		<%-- 		</form:form> --%>



		<!-- 初版的地方   待修正 -->

		<!-- 		<div class="container"> -->
		<!-- 			<div class="row"> -->
		<%-- 				<c:forEach var="commodity" items="${page.content}"> --%>
		<!-- 					<div class="col-md-4 mb-3"> -->
		<!-- 						<div class="card"> -->
		<!-- 							<a -->
		<%-- 								href="${contextRoot}/Store/Commodity/findComm?commId=${commodity.commId}"> --%>
		<!-- 								<img -->
		<%-- 								src="data:image/png;base64,${commodity.base64StringcommPicture}" --%>
		<!-- 								class="card-img-top" alt="商品圖片" -->
		<!-- 								style="width: 100px; height: 100px;"> -->
		<!-- 							</a> -->

		<!-- 							<div class="card-body"> -->
		<%-- 								<p class="card-text">商品名稱:${commodity.commName}</p> --%>
		<!-- 																下面要改寫各別分類頁面 -->
		<!-- 								<a -->
		<%-- 									href="${contextRoot}/Store/Commodity/findCate?cateId=${commodity.commCate.cateId}"> --%>
		<%-- 									商品分類:${commodity.commCate.cateName} </a> --%>
		<%-- 								<p class="card-text">商品價格:${commodity.commPrice}</p> --%>
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<%-- 				</c:forEach> --%>
		<!-- 				<br /> -->


		<!-- 				5/3 測試中的地方  已可成功套版 處理分類 待修正 遮蔽-->
		<%-- 				<c:forEach var="commodity" items="${page.content}"> --%>
		<!-- 					<div class="col-lg-4 col-6 mb-4 shuffle-item" -->
		<!-- 						data-groups="[&quot;design&quot;,&quot;branding&quot;]"> -->
		<!-- 						<div class="position-relative inner-box"> -->
		<!-- 							<div class="image position-relative"> -->
		<!-- 								<a -->
		<%-- 									href="${contextRoot}/Store/Commodity/findComm?commId=${commodity.commId}"> --%>
		<!-- 									<img -->
		<%-- 									src="data:image/png;base64,${commodity.base64StringcommPicture}" --%>
		<!-- 									alt="portfolio-image" class="img-fluid w-100 d-block" -->
		<!-- 									style="width: 250px; height: 250px;"> -->

		<!-- 									<div class="overlay-box"> -->
		<!-- 										<div class="overlay-inner"> -->
		<!-- 											<a class="overlay-content" -->
		<%-- 												href="${contextRoot}/Store/Commodity/findAllCommByCate?commId=${commodity.commId}"> --%>
		<%-- 												<h5 class="mb-0">${commodity.commName}</h5> --%>
		<!-- 												<p>商品詳細頁面</p> -->
		<%-- 												<p class="card-text">商品原價:${commodity.commPrice}</p> --%>
		<!-- 											</a> -->
		<!-- 										</div> -->
		<!-- 									</div> -->
		<!-- 								</a> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 						<div class="card-body"> -->
		<%-- 							<p class="card-text">商品名稱:${commodity.commName}</p> --%>
		<!-- 							<a -->
		<%-- 								href="${contextRoot}/Store/Commodity/findCate?cateId=${commodity.commCate.cateId}">商品分類:${commodity.commCate.cateName}</a> --%>
		<%-- 							<p class="card-text">商品特價:${commodity.commPrice*commodity.commDiscount}</p> --%>
		<!-- 						</div> -->
		<!-- 					</div> -->
		<%-- 				</c:forEach> --%>
		<!-- 		5/5原版搜尋欄 -->
		<%-- 		<form action="${contextRoot}/Store/Commodity/findCommByName"> --%>
		<!-- 			<input type="text" name="commName" placeholder="輸入關鍵字..."> -->
		<!-- 			<button type="submit">搜尋</button> -->
		<%-- 		</form> --%>

		<!-- 另一組樣式 -->
		<%-- 		<form class="form-inline" --%>
		<%-- 			action="${contextRoot}/Store/Commodity/findCommByName" method="get"> --%>
		<!-- 			<div class="form-group"> -->
		<!-- 				<label for="commName" class="sr-only">商品名稱</label> <input -->
		<!-- 					type="text" class="form-control" id="commName" name="commName" -->
		<!-- 					placeholder="輸入商品名稱..."> -->
		<!-- 			</div> -->
		<!-- 			<button type="submit" class="btn btn-primary">搜尋</button> -->
		<%-- 		</form> --%>





		<div class="d-flex justify-content-end">
			<form class="form-inline my-2 my-lg-0"
				action="${contextRoot}/Store/Commodity/findCommByName" method="get">
				<div class="input-group">
					<input type="text" class="form-control" id="commName"
						name="commName" placeholder="輸入商品名稱...">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit">搜尋</button>
					</div>
				</div>
			</form>
		</div>




		<!-- 				再來一組測試 5/3  -->
		<div class="container">
			<div class="row">
				<c:forEach var="commodity" items="${page.content}"
					varStatus="status">
<!-- 					page.content 會接到所有資料 然後這邊命名為 commodity　　所以下面運用該名稱. 去取得所需資料 -->

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
								<div class="info">
			
										<form
											action="${contextRoot}/add-to-cart/${commodityInfo.commId}"
											method="POST">
											<button type="submit" class="btn btn-outline-warning">加入購物車</button>
										</form>
									</div>

									<div class="info">
										
										<form
											action="${contextRoot}/add-to-wishlist/${commodityInfo.commId}"
											method="POST">
											<button type="submit" class="btn btn-outline-primary">心願清單</button>
										</form>
									</div>
							
<!-- 							<div class="info"> -->
<!-- 										<h5 class="mb-0">數量</h5> -->
<!-- 										<input type="number" name="quantity" id="quantity" min="1" -->
<!-- 											max="10" value="1"> -->
<!-- 									</div> -->
							
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
										href="${contextRoot}/Store/Commodity/findAllComm?p=${pageNumber}"
										> <span>${pageNumber}</span>
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
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- End Footer -->

	<!-- 引入 Bootstrap 的 JavaScript 文件 -->
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>
</body>
</html>
