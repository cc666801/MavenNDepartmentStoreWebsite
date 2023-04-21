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
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->

	<main id="main">
		<h1>新增資料的頁面</h1>
		<div>
			<form:form action="${contextRoot}/company/postCompany" method="POST"
				modelAttribute="company" enctype="multipart/form-data">
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
					<form:input type="file" path="transferToByteArray" id="companyLogo"
						class="form-control"></form:input> 
				</div>
		</div>
		<div class="form-group">
			<label for="address">Address:</label>
			<form:select path="address" id="address" class="form-control">
				<form:option value="">--Select an address--</form:option>
				<jstl:forEach items="${addresses}" var="address">
					<form:option value="${address.addressId}"></form:option>
				</jstl:forEach>
			</form:select>
		</div>
		<div class="form-group">
			<label for="industryCategory">Industry Category:</label>
			<form:select path="industryCategory" id="industryCategory"
				class="form-control">
				<form:option value="">--Select an industry category--</form:option>
				<jstl:forEach items="${industryCategories}" var="industryCategory">
					<form:option value="${industryCategory.industryCategoryId}"></form:option>
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

</body>
</html>