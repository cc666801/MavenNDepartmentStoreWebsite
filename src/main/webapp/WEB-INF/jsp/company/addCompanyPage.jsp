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
	<jsp:include page="../layout/headerForBackend.jsp"></jsp:include>
	<!-- End Header -->

	<div id="layoutSidenav">

		<!-- ======= SiderNav ======= -->
		<jsp:include page="../layout/sideNavForBackend.jsp"></jsp:include>
		<!-- End SiderNav -->

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1>新增資料的頁面</h1>
					<form:form action="${contextRoot}/company/addCompany" method="POST"
						modelAttribute="company" enctype="multipart/form-data"
						id="companyForm">
						<div class="form-group">
							<label for="companyName">Company Name:</label>
							<form:input path="companyName" id="companyName"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="companyPhone">Company Phone:</label>
							<form:input path="companyPhone" id="companyPhone"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="companyLogo">Company Logo:</label>
							<form:input type="file" path="transferToByteArray"
								id="companyLogo" class="form-control"></form:input>
						</div>
						<div class="form-group">
							<label for="address">Address:</label>
							<form:select path="address" id="address" class="form-control">
								<form:option value="">--Select an address--</form:option>
								<jstl:forEach items="${addresses}" var="address">
									<form:option value="${address.addressId}"> 
					${address.addressName}
					</form:option>
								</jstl:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label for="industryCategory">Industry Category:</label>
							<form:select path="industryCategory" id="industryCategory"
								class="form-control">
								<form:option value="">--Select an industry category--</form:option>
								<jstl:forEach items="${industryCategories}"
									var="industryCategory">
									<form:option value="${industryCategory.industryCategoryId}">
					${industryCategory.industryCategoryName}
					</form:option>
								</jstl:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label for="cooperationStatus">Cooperation Status:</label>
							<form:select path="cooperationStatus" id="industryCategory"
								class="form-control">
								<form:option value="">--Select an cooperation status--</form:option>
								<jstl:forEach items="${cooperationStatuses}"
									var="cooperationStatus">
									<form:option value="${cooperationStatus.cooperationStatusId}">
					${cooperationStatus.cooperationStatusName}
					</form:option>
								</jstl:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label for="industryCategory">Opening Hours:</label>
							<form:select path="openingHours" id="industryCategory"
								class="form-control">
								<form:option value="">--Select an opening hours--</form:option>
								<jstl:forEach items="${openingHourses}" var="openingHours">
									<form:option value="${openingHours.openingHoursId}">
					${openingHours.openingHoursName}
					</form:option>
								</jstl:forEach>
							</form:select>
						</div>
						<button type="submit" class="btn btn-primary">送出</button>
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