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
.card img {
	object-fit: contain;
}
</style>
<title>餐廳頁面測試</title>
</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">
		<div class="container-fluid">
			<div class="container">
				<div class="row">
					<jstl:forEach var="company" items="${page.content}">
						<div class="col-md-3 mb-3">
							<div class="card" style="width: 18rem;">
								<img src="data:image/png;base64,${company.base64StringCompanyLogo}" class="card-img-top" alt="...">
								<div class="card-body">
									<h5 class="card-title">帶有延伸連結的卡片</h5>
									<p class="card-text">Some quick example text to build on
										the card title and make up the bulk of the card's content.</p>
									<a href="#" class="btn btn-primary stretched-link">Go
										somewhere</a>
								</div>
							</div>
						</div>
					</jstl:forEach>
					<!-- 					<div class="container-fluid"> -->
					<!-- 			<div class="row justify-content-center "> -->
					<!-- 				      justify-content-center -->
					<%-- 				<jstl:forEach var="company" items="${page.content}"> --%>
					<!-- 					<div class="col-12 col-md-4 mb-3"> -->
					<!-- 						<div class="text"> -->
					<!-- 							<img -->
					<%-- 								src="data:image/png;base64,${company.base64StringCompanyLogo}" --%>
					<!-- 								class="rounded mx-auto d-block"> 1Lorem ipsum dolor, sit -->
					<!-- 							amet consectetur adipisicing elit. Itaque earum veniam saepe -->
					<!-- 							dolor suscipit velit est voluptatum, expedita dolorem asperiores -->
					<!-- 							non ullam doloribus dolores unde atque dolorum, praesentium -->
					<!-- 							laudantium autem. -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<%-- 				</jstl:forEach> --%>
					<!-- 			</div> -->
					<br />
					<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<jstl:choose>
							<jstl:when test="${page.number != pageNumber-1 }">
								<a href="${contextRoot}/restaurantfront?p=${pageNumber}">${pageNumber}</a>
							</jstl:when>
							<jstl:otherwise>
				            ${pageNumber}
				     </jstl:otherwise>

						</jstl:choose>

						<jstl:if test="${pageNumber != page.totalPages }">
				    -
				  </jstl:if>
					</jstl:forEach>
				</div>
			</div>
		</div>
	</main>
</body>
</html>