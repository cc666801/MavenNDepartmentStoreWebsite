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
<title>失物招領</title>
</head>
<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>


	<main id="main">
		<section id="contact" class="contact mb-5">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-12 text-center mb-5">
						<h3 class="page-title">失物招領</h3>
						<h1 class="page-title">Lost And Found</h1>
					</div>
				</div>

				<div class="row gy-4">

					<div class="col-md-4">
						<div class="info-item">
							<i class="bi bi-geo-alt"></i>
							<h3>遺失物招領期限</h3>
							<button class="btn btn-outline-primary">遺失物招領期限</button>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-md-4">
						<div class="info-item info-item-borders">
							<i class="bi bi-phone"></i>
							<h3>遺失物認領須知</h3>
							<button>遺失物認領須知</button>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-md-4">
						<div class="info-item">
							<i class="bi bi-envelope"></i>
							<h3>館內遺失物洽詢</h3>
							<button>館內遺失物洽詢</button>
						</div>
					</div>
					<!-- End Info Item -->

				</div >
				<br><br>
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>拾獲物登錄單號</th>
								<th>拾獲日期</th>
								<th>拾獲品項/數量</th>
								<th>拾獲地點</th>
								<th>狀態</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lost" items="${lostList}">
								<tr>
									<td>${lost.id}</td>
									<td>${lost.founddate}</td>
									<td>${lost.item}</td>
									<td>${lost.place}</td>
									<td>${lost.state}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<jsp:include page="../../layout/footer.jsp"></jsp:include>


</body>
</html>