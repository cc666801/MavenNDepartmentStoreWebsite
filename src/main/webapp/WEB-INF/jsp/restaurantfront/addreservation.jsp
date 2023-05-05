<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
</style>
<title>餐廳頁面</title>
</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner" style="height: 280px">
				<div class="carousel-item active">
					<img src="https://picsum.photos/1000/200?random=10"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="https://picsum.photos/1000/200?random=9"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="https://picsum.photos/1000/200?random=8"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<div>
			<div class="container">
				<div class="row justify-content-center" >
					<div class="col-4">
						.col-4<br>Since 9 + 4 = 13 &gt;ts wrapped onto a new line as one contiguous unit.
					</div>
					<div class="col-7">
						.col-6<br>Subsequent columns continue along the new line.
					</div>
				</div>
			</div>
		</div>


		<!-- list-group modal -->
	</main>
	<!-- Vendor JS Files -->
	<script
		src="${contextRoot}/assetsForFrontend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>