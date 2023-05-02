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
								<p class="card-text">${commodity.commDesc}</p>

							</div>
						</div>
					</div>
				</c:forEach>
				<br />
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
