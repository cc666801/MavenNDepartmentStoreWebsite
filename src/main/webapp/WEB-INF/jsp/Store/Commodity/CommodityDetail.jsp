<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

		<!-- 原本的 -->

		<!-- 		<h1>商品詳細資料</h1> -->
		<!-- 		<dl> -->
		<!-- 			<dt>商品圖片：</dt> -->
		<!-- 			<dd> -->

		<!-- 				<img -->
		<%-- 					src="data:image/png;base64,${commodityInfo.base64StringcommPicture}" --%>
		<!-- 					class="card-img-top" alt="商品圖片" -->
		<!-- 					style="width: 100px; height: 100px;"> -->

		<!-- 			</dd> -->

		<!-- 			<dt>商品編號：</dt> -->
		<%-- 			<dd>${commodityInfo.commId}</dd> --%>
		<!-- 			<dt>商品分類：</dt> -->
		<!-- 			<dd> -->
		<!-- 				<a -->
		<%-- 					href="${contextRoot}/Store/Commodity/findCate?cateId=${commodityInfo.commCate.cateId}">${commodityInfo.commCate.cateName}</a> --%>
		<!-- 			</dd> -->
		<!-- 			<dt>商品描述：</dt> -->
		<%-- 			<dd>${commodityInfo.commDesc}</dd> --%>
		<!-- 			<dt>商品原價：</dt> -->
		<%-- 			<dd>${commodityInfo.commPrice}</dd> --%>
		<!-- 			<dt>商品特價價格：</dt> -->
		<%-- 			<dd>${commodityInfo.commPrice*commodityInfo.commDiscount}</dd> --%>
		<!-- 顯示其他需要的資訊 -->

		<!-- 		</dl> -->

		<!-- 新增兩個按鈕 -->

		<!-- 		<label for="quantity">數量:(單筆最高為10件)</label> <input type="number" -->
		<!-- 			name="quantity" id="quantity" min="1" max="10" value="1"> -->
		<%-- 		<form action="${contextRoot}/add-to-cart/${commodityInfo.commId}" --%>
		<%-- 			method="POST"> --%>
		<!-- 			<button type="submit" class="btn btn-primary">加入購物車</button> -->
		<%-- 		</form> --%>

		<%-- 		<form action="${contextRoot}/add-to-wishlist/${commodityInfo.commId}" --%>
		<%-- 			method="POST"> --%>
		<!-- 			<button type="submit" class="btn btn-outline-primary">心願清單</button> -->
		<%-- 		</form> --%>
		<!-- 結束新增按鈕 -->


		<!-- 嘗試新增 -->
		<section class="section portfolio-single">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<img
							src="data:image/png;base64,${commodityInfo.base64StringcommPicture}"
							alt="商品圖片" class="img-fluid w-100">
					</div>
					<div class="col-lg-6">
						<div class="project-info">
<%-- 							<h3 class="mb-4">${commodityInfo.commName}</h3> --%>
<!-- 上面這個是名稱欄位 可隱藏 -->
							

							<div class="row mt-4">
								<div class="col-lg-6">
									<div class="info">
										<h5 class="mb-0">商品名稱</h5>
										<p id="commodityName">${commodityInfo.commName}</p>
									</div>

									<div class="info">
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
									</div>
									
								</div>

								<div class="col-lg-6">
									<div class="info">
										<h5 class="mb-0">商品分類</h5>
										<p>
											<a
												href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${commodityInfo.commCate.cateId}">${commodityInfo.commCate.cateName}</a>
										</p>
									</div>

									<div class="info">
										<h5 class="mb-0">加入購物車</h5>
										
										<button class="btn btn-primary"  id="shopping-cart-button">加入購物車</button>
										
									</div>

									<div class="info">
										<h5 class="mb-0">心願清單</h5>
										<form
											action="${contextRoot}/addtowishlist/${commodityInfo.commId}"
											method="POST">
											<button type="submit" class="btn btn-outline-primary">心願清單</button>
										</form>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="row mt-5 justify-content-center">
					<div class="col-lg-6 text-center">
<!-- 						<a -->
<%-- 							href="${contextRoot}/Store/Commodity/findComm?commId=${commodityInfo.commId-1}" --%>
<!-- 							class="btn btn-dark">前一項產品</a> <a -->
<%-- 							href="${contextRoot}/Store/Commodity/findComm?commId=${commodityInfo.commId+1}" --%>
<!-- 							class="btn btn-dark">後一項產品</a> -->
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
				class="btn btn-dark">
				<img src="${contextRoot}/resources/images/prevButton.png" alt="上一項產品">
			</a>
		</c:if>
		<c:if test="${not empty nextCommId}">
			<a href="${contextRoot}/Store/Commodity/nextComm/${nextCommId}"
				class="btn btn-dark">
				<img src="${contextRoot}/resources/images/nextButton.png" alt="下一項產品">
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



						<!-- 	購物車 -->
						<script>
							// load on 事件
							document.addEventListener("DOMContentLoaded", function () {
								var shoppingCartButton = document.getElementById('shopping-cart-button');
								var commodityId = document.getElementById('commodityId').innerText;
								var memberId = "${member.id}";

								shoppingCartButton.addEventListener('click', function (e) {
									e.preventDefault(); // 防止表单提交

									var quantity = document.getElementById('quantity').value; // 获取数量

									console.log("memberId:" + memberId + "commodityId:" + commodityId + "quantity:" + quantity);

									fetch('${contextRoot}/api/shoppingCart', {
										method: 'POST',
										headers: {
											'Content-Type': 'application/json'
										},
										body: JSON.stringify({
											commodityId: commodityId,
											quantity: quantity,
											memberId: memberId
										})
									})
										.then(response => {
											if (response.ok) {
												console.log('加入購物車成功');
												alert('加入購物車成功');
											} else {
												console.log('加入購物車失敗');
												alert('加入購物車失敗');
											}
										})
										.catch(error => {
											console.error('Error:', error);
										});
								});
							});
						</script>


				</body>

				</html>