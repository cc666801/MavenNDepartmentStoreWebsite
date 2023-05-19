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
<body>
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
					<div class="row">
						<div class="col-md-6 offset-md-3">
							<div class="card"  style="background-color:rgb(231, 240, 240);margin-top: 2%;">
								<div class="card-body">
							<h1 class="text-center border-bottom"><i class="fa-solid fa-building fa-2xs"></i> 新增廠商</h1>
							
					<form:form action="${contextRoot}/company/addCompany" method="POST"
						modelAttribute="company" enctype="multipart/form-data"
						id="companyForm">
						<div class="form-group">
							<label for="companyName">廠商名稱:</label>
							<form:input path="companyName" id="companyName"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="companyPhone">廠商電話:</label>
							<form:input path="companyPhone" id="companyPhone"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="companyLogo">廠商商標:</label>
							<form:input type="file" path="transferToByteArray"
								id="companyLogo" class="form-control"></form:input>
						</div>
						<div class="form-group">
							<label for="address">廠商地址:</label>
							<form:select path="address" id="address" class="form-control">
								<form:option value="">-- 選擇地址 --</form:option>
								<jstl:forEach items="${addresses}" var="address">
									<form:option value="${address.addressId}"> 
					${address.addressName}
					</form:option>
								</jstl:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label for="industryCategory">產業類別:</label>
							<form:select path="industryCategory" id="industryCategory"
								class="form-control">
								<form:option value="">-- 選擇產業類別 --</form:option>
								<jstl:forEach items="${industryCategories}"
									var="industryCategory">
									<form:option value="${industryCategory.industryCategoryId}">
					${industryCategory.industryCategoryName}
					</form:option>
								</jstl:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label for="cooperationStatus">合作狀態:</label>
							<form:select path="cooperationStatus" id="industryCategory"
								class="form-control">
								<form:option value="">-- 選擇合作狀態 --</form:option>
								<jstl:forEach items="${cooperationStatuses}"
									var="cooperationStatus">
									<form:option value="${cooperationStatus.cooperationStatusId}">
					${cooperationStatus.cooperationStatusName}
					</form:option>
								</jstl:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label for="industryCategory">營業時間:</label>
							<form:select path="openingHours" id="industryCategory"
								class="form-control">
								<form:option value="">-- 選擇營業時間 --</form:option>
								<jstl:forEach items="${openingHourses}" var="openingHours">
									<form:option value="${openingHours.openingHoursId}">
					${openingHours.openingHoursName}
					</form:option>
								</jstl:forEach>
							</form:select>
						</div>
						<button type="submit" class="btn btn-primary" style="margin-top: 2%;">送出</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
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