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
.card img {w-100;
	height: 200px;
}
</style>
<title>餐廳頁面測試</title>
</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">
		<form action="#">
			<div class="input-group mb-3 w-25">
				<input type="text" class="form-control" placeholder="請輸入餐廳"
					aria-label="請輸入餐廳" aria-describedby="basic-addon2">
				<button class="btn btn-outline-secondary" type="button"
					id="basic-addon2">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>
		<div class="container-fluid">
			<div class="container">
				<div class="row ">
					<jstl:forEach var="company" items="${page.content}">
						<div class="col-12 col-md-4">
							<div class="card">
								<img
									src="data:image/png;base64,${company.base64StringCompanyLogo}"
									class="card-img-top img-thumbnail"
									alt="${company.companyName}的logo">
								<div class="card-body">
									<h5 class="card-title">${company.companyName}</h5>
									<p class="card-text">Some quick example text to build on
										the card title and make up the bulk of the card's content.</p>
									<a href="${contextRoot}/restaurant/add"
										class="btn btn-primary stretched-link">訂位去</a>
								</div>
							</div>
						</div>
					</jstl:forEach>
					<br />
					<div class="text-center">
						<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
							<jstl:choose>
								<jstl:when test="${page.number != pageNumber-1 }">
									<a href="${contextRoot}/restaurantfront?p=${pageNumber}"><span
										style="color: #1e90ff; font-size: 25px;">${pageNumber}</span></a>
								</jstl:when>
								<jstl:otherwise>
									<span style="font-size: 25px; color: gray;">${pageNumber}</span>
								</jstl:otherwise>
							</jstl:choose>

							<jstl:if test="${pageNumber != page.totalPages}">
						    -
						 </jstl:if>
						</jstl:forEach>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>