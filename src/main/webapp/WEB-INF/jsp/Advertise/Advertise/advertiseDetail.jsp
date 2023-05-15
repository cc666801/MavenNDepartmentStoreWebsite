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
										<p id="advertiseName" style="font-family: '微軟正黑體', sans-serif; font-size: 60px; color: #1217 ;">${advertiseDetail.advertiseName}</p>
									</div>

									<div class="info">
										<h5 class="mb-0"></h5>
										<p id="advertiseDesc"
											style="font-family: '微軟正黑體', sans-serif; font-size: 30px; color: #9527 ;">${advertiseDetail.advertiseDesc}</p>
									</div>


								</div>
							</div>
							<div class="col-lg-6"></div>

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
						<li class="list-inline-item"><a href="${contextRoot}/"
							class="btn btn-primary">返回百貨公司首頁</a></li>
					</ul>
				</div>
			</div>


			<!-- 		5/3 常識判斷上下一筆資料  失敗-->
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