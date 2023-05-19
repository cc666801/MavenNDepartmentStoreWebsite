<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
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
	<jsp:include page="../layout/headerForBackend.jsp" ></jsp:include>
	<!-- End Header -->

	<div id="layoutSidenav">

		<!-- ======= SiderNav ======= -->
		<jsp:include page="../layout/sideNavForBackend.jsp"></jsp:include>
		<!-- End SiderNav -->

		<div id="layoutSidenav_content" style="background-color: #fdf5e6">
			<main>
				<h1>修改餐廳詳細資訊</h1>
				<div>
					<div><p style="color:red">${companyexist}</p></div>
					<form:form class="form-control" method="put"
						modelAttribute="thisRestInformation"
						action="${contextRoot}/editRestInformationPage/edit">
						<form:input type="hidden" path="resid"/>
						<form:input type="hidden" path="company"/>
						<label for="companyId">餐廳名稱：</label><br>
						<input type="text" value="${thisRestInformation.company.companyName}" style="font-size:18px" disabled/>
						
						<br>
						<label for="CId">料理類型：</label>
						<form:select path="cuisineType" id="CId" class="form-select" style="width: 200px">
							<jstl:forEach items="${CuisineType}" var="ctype">
								<jstl:choose>
									<jstl:when test="${thisRestInformation.cuisineType.cuisineTypeId == ctype.cuisineTypeId}">
										<form:option value="${ctype.cuisineTypeId}" selected="selected">
											${ctype.cuisineTypeName}
										</form:option>
									</jstl:when>
									<jstl:otherwise>
										<option value="${ctype.cuisineTypeId}">${ctype.cuisineTypeName}</option>						
									</jstl:otherwise>
								</jstl:choose>	
								
							</jstl:forEach>
						</form:select>
						<div class="mt-2">
						<button type="submit" class="btn btn-primary">送出</button>
						<a href="${contextRoot}/restaurantInformation">
						<button type="button" class="btn btn-primary ms-2">回查詢頁面</button></a>
						</div>
					</form:form>
				</div>
			</main>

			<!-- End #main -->

			<!-- ======= Footer ======= -->
			<jsp:include page="../layout/footerForBackend.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>
	<!-- 	<script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextRoot}/assetsForBackend/js/scripts.js"></script>
	<!-- 	<script -->
	<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" -->
	<!-- 		crossorigin="anonymous"></script> -->
	<%-- 	<script src="${contextRoot}/assetsForBackend/demo/chart-area-demo.js"></script> --%>
	<%-- 	<script src="${contextRoot}/assetsForBackend/demo/chart-bar-demo.js"></script> --%>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>

	<!-- 	</script> -->

</body>
</html>