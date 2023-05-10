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
</head>

<body class="sb-nav-fixed">
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->




	<main id="main">


		<!-- 嘗試新增 -->
		<section class="section portfolio-single">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<img
							src="data:image/png;base64,${advertiseDetail.base64StringadvertisePicture}"
							alt="廣告圖片" class="img-fluid w-100">
					</div>
					<div class="col-lg-6">
						<div class="project-info">
							<%-- 							<h3 class="mb-4">${commodityInfo.commName}</h3> --%>
							<!-- 上面這個是名稱欄位 可隱藏 -->


							<div class="row mt-4">
								<div class="col-lg-6">
									<div class="info">
										<h5 class="mb-0">廣告名稱</h5>
										<p id="advertiseName">${advertiseDetail.advertiseName}</p>
									</div>

									<!-- <div class="info">
										<h5 class="mb-0">商品原價</h5>
										<p>${commodityInfo.commPrice}</p>
									</div>

									<div class="info">
										<h5 class="mb-0">商品特價價格</h5>
										<p>${commodityInfo.commPrice*commodityInfo.commDiscount}</p>
									</div>

									<div class="info">
										<h5 class="mb-0">數量</h5>
										<input type="number" name="quantity" id="quantity" min="1"
											max="10" value="1">
									</div>
									<br>
									<div class="info">
										<h5 class="mb-0">商品敘述</h5>
										<p>${commodityInfo.commDesc}</p>
									</div> -->

								</div>
							</div>
							<div class="col-lg-6">
								<!-- <div class="info">
										<h5 class="mb-0">商品分類</h5>
										<p>
											<a
												href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodityInfo.commCate.cateId}">${commodityInfo.commCate.cateName}</a>
										</p>
									</div> -->

								<!-- <div class="info">
										<h5 class="mb-0">加入購物車</h5>
										
										<button class="btn btn-primary"  id="shopping-cart-button">加入購物車</button>
										
									</div>

									<div class="info">
										<h5 class="mb-0">心願清單</h5>
										<form
											action="${contextRoot}/add-to-wishlist/${commodityInfo.commId}"
											method="POST">
											<button type="submit" class="btn btn-outline-primary">心願清單</button>
										</form>
									</div>
								</div> -->
							</div>

						</div>
					</div>
				</div>
				<div class="row mt-5 justify-content-center">
					<div class="col-lg-6 text-center">
						<!-- 						<a -->

					</div>
				</div>
			</div>
		</section>
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


			<!-- 		5/3 常識判斷上下一筆資料  失敗-->


			<div class="col-lg-6 text-center">
				<c:if test="${not empty prevCommId}">
					<a href="${contextRoot}/Store/Commodity/prevComm/${prevCommId}"
						class="btn btn-dark"> <img
						src="${contextRoot}/resources/images/prevButton.png" alt="上一項產品">
					</a>
				</c:if>
				<c:if test="${not empty nextCommId}">
					<a href="${contextRoot}/Store/Commodity/nextComm/${nextCommId}"
						class="btn btn-dark"> <img
						src="${contextRoot}/resources/images/nextButton.png" alt="下一項產品">
					</a>
				</c:if>
			</div>
	</main>


	<!-- ======= Footer ======= -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<!-- End Footer -->

	<!-- 引入 Bootstrap 的 JavaScript 文件 -->
	<!-- 	<script -->
	<%-- src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script> --%>

	<script>
		// 		// 獲取商品原價元素
		// 		var commPrice = document.getElementById("commPrice");
		// 		// 將商品原價元素的文字加上刪除線樣式
		// 		commPrice.style.textDecoration = "line-through";
		// 		// 將商品原價元素的文字顏色設為紅色
		// 		commPrice.style.color = "red";
	</script>






</body>

</html>