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

		<h1>findCommByCate</h1>
		
		
		
		<dl>
			<dt>類別名稱：</dt>
			<dd>${commodityList[0].commCate.cateName}</dd>
			<dd>給我一個頁面連結 ${page.totalPages}</dd>
		</dl>

		<div class="row  row-cols-md-3 ">




			<c:forEach var="page" items="${page.content}">
				<div class="card">
					<a
						href="${contextRoot}/Store/Commodity/findComm?commId=${name.commId}">
						<img
						src="data:image/png;base64,${name.base64StringcommPicture}"
						class="card-img-top" alt="商品圖片"
						style="width: 100px; height: 100px;">
					</a>
					<div class="card-body">
						<p class="card-text">商品名稱:${name.commName}</p>
						<a
							href="${contextRoot}/Store/Commodity/findCate?cateId=${name.commCate.cateId}">商品分類:${name.commCate.cateName}</a>
						<p class="card-text">商品價格:${name.commPrice}</p>
					</div>
				</div>
			</c:forEach>
		</div>




		<!-- 				這裡是分頁器 -->
		<c:forEach var="pageNumber" begin="1" end="${commodityPage.totalPages}">
			<a href="${contextRoot}/Store/Commodity/findCate?cateId=${commodity.commCate.cateId}?p=${pageNumber}">${pageNumber}</a>
		</c:forEach>




	</main>

	<!-- ======= Footer ======= -->
	<%-- 	<jsp:include page="../../layout/footer.jsp"></jsp:include> --%>
	<!-- End Footer -->

	<!-- 引入 Bootstrap 的 JavaScript 文件 -->
	<!-- 	<script -->
	<%-- 		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script> --%>




</body>
</html>
