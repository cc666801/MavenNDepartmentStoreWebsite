<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->

	<main id="main">
		<div>找到被更新的資料頁面</div>
		<div>
			<form:form action="${contextRoot}/company/updateCompany" method="PUT"
				modelAttribute="company" enctype="multipart/form-data"
				id="companyForm">
				<div class="form-group">
					<form:input path="companyId" id="companyId" class="form-control"
						type="hidden"></form:input>
				</div>
				<div class="form-group">
					<label for="companyName">Company Name:</label>
					<form:input path="companyName" id="companyName"
						class="form-control"></form:input>
				</div>
				<div class="form-group">
					<label for="companyPhone">Company Phone:</label>
					<form:input path="companyPhone" id="companyPhone"
						class="form-control"></form:input>
				</div>
				<div class="form-group">
					<label for="companyLogo">Company Logo:</label> <img
						src="data:image/jpeg;base64, ${company.base64StringCompanyLogo}" />
					<form:input type="file" path="transferToByteArray" id="companyLogo"
						class="form-control"></form:input>
				</div>
				<div class="form-group">
					<label for="address">Address:</label>
					<form:select path="address" id="address" class="form-control" value="${company.address.addressId}">
					${company.address.addressName}
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
						class="form-control" value="${company.industryCategory.industryCategoryId}">
							${company.industryCategory.industryCategoryName}
						<jstl:forEach items="${industryCategories}" var="industryCategory">
							<form:option value="${industryCategory.industryCategoryId}">
					${industryCategory.industryCategoryName}
					</form:option>
						</jstl:forEach>
					</form:select>
				</div>
				<div class="form-group">
					<label for="cooperationStatus">Cooperation Status:</label>
					<form:select path="cooperationStatus" id="cooperationStatus"
						class="form-control" value="${company.cooperationStatus.cooperationStatusId}">
						${company.cooperationStatus.cooperationStatusName}
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
					<form:select path="openingHours" id="openingHours"
						class="form-control" value="${company.openingHours.openingHoursId}">${company.openingHours.openingHoursName}
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
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- End Footer -->
	<script>
	
	</script>
</body>
</html>