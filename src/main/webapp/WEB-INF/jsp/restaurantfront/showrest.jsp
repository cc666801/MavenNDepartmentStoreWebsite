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
	height: 250px;
}
</style>
<title>餐廳頁面</title>
</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">
		<div class="container">
			<div class="row justify-content-end">
				<div class="col-12 col-md-4 gx-5">
				<form action="${contextRoot}/restaurantfront/UserQueryCompany">
					<div class="input-group mb-3 mt-2">
						<input type="text" class="form-control" placeholder="請輸入餐廳or料理類型"
							aria-label="請輸入餐廳" aria-describedby="basic-addon2"
							name="companyname" />
						<button class="btn btn-outline-secondary" type="submit"
							id="basic-addon2">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</form>
				</div>
			</div>
			<div class="row">
				<jstl:forEach var="restaurant" items="${page.content}">
					<div class="col-12 col-md-4">
						<div class="card mb-3">
							<img
								src="data:image/png;base64,${restaurant.company.base64StringCompanyLogo}"
								class="card-img-top img-thumbnail"
								alt="${restaurant.company.companyName}的logo">
							<div class="card-body">
								<h5 class="card-title">${restaurant.company.companyName}</h5>
								<p class="card-text">
									<jstl:forEach items="${restaurantCounter}" var="Counter" varStatus="status">
										<jstl:if test="${restaurant.company.companyId == Counter.company.companyId}">
											位置:${restaurant.company.address.addressName} &nbsp;${Counter.counter.counterFloor}&nbsp;${Counter.counter.counterName} <br>
										</jstl:if>
									</jstl:forEach>
									
									料理類型:${restaurant.cuisineType.cuisineTypeName}<br>
								</p>
								<jstl:if test="${empty member}">
									<a href="${contextRoot}/member/login"
										class="btn btn-primary stretched-link">登入會員,可享線上訂位</a>
								</jstl:if>
								<jstl:if test="${not empty member}">
									<a href="${contextRoot}/restaurantfront/reservation?restid=${restaurant.resid}"
										class="btn btn-primary stretched-link">訂位去</a>
								</jstl:if>
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
	</main>
</body>
</html>