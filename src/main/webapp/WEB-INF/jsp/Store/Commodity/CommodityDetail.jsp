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


	<div id="layoutSidenav">



		<div id="layoutSidenav_content">

			<main id="main" class="container my-5">



				<h1>商品詳細資料</h1>
				<dl>
					<dt>商品圖片：</dt>
					<dd>

						<img
							src="data:image/png;base64,${commodityInfo.base64StringcommPicture}"
							class="card-img-top" alt="商品圖片"
							style="width: 100px; height: 100px;">

					</dd>

					<dt>商品編號：</dt>
					<dd>${commodityInfo.commId}</dd>
					<dt>商品描述：</dt>
					<dd>${commodityInfo.commDesc}</dd>
					<dt>商品原價：</dt>
					<dd>${commodityInfo.commPrice}</dd>
					<dt>商品特價價格：</dt>
					<dd>${commodityInfo.commPrice*commodityInfo.commDiscount}</dd>
					<!-- 顯示其他需要的資訊 -->

				</dl>

				<!-- 新增兩個按鈕 -->

				<label for="quantity">數量:(單筆最高為10件)</label> <input type="number"
					name="quantity" id="quantity" min="1" max="10" value="1">
				<form action="${contextRoot}/add-to-cart/${commodityInfo.commId}"
					method="POST">
					<button type="submit" class="btn btn-primary">加入購物車</button>
				</form>

				<form
					action="${contextRoot}/add-to-wishlist/${commodityInfo.commId}"
					method="POST">
					<button type="submit" class="btn btn-outline-primary">心願清單</button>
				</form>
				<!-- 結束新增按鈕 -->




			</main>

		</div>
	</div>
	<!-- ======= Footer ======= -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<!-- End Footer -->

	<!-- 引入 Bootstrap 的 JavaScript 文件 -->
<!-- 	<script -->
<%-- 		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script> --%>

<script>
// 獲取商品原價元素
var commPrice = document.getElementById("commPrice");
// 將商品原價元素的文字加上刪除線樣式
commPrice.style.textDecoration = "line-through";
// 將商品原價元素的文字顏色設為紅色
commPrice.style.color = "red";
</script>


</body>
</html>
