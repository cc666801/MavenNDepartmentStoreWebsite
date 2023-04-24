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
<title>商品類別管理</title>
<!-- Bootstrap CSS -->
<link href="${contextRoot}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CSS -->
<link href="${contextRoot}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="${contextRoot}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main" class="container my-5">

		<h1 class="mb-3">編輯商品類別</h1>

		<form:form modelAttribute="cate" method="put"
			action="${contextRoot}/Store/Commcate/editCommCate">
			<form:input type="hidden" path="cate_Id" />
			<form:label path="cate_Name">分類名稱</form:label>
			<form:input path="cate_Name" />
			<br>
			<form:label path="cate_Desc">分類敘述</form:label>
			<form:input path="cate_Desc" />
			<br>
			<form:label path="cate_MDay">分類調整時間</form:label>
			<form:input path="cate_MDay" readonly="true" />
			<br>


			<button type="submit">送出</button>

		</form:form>
	</main>

	<!-- jQuery -->
	<script src="${contextRoot}/resources/js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="${contextRoot}/resources/js/bootstrap.bundle.min.js"></script>
	<!-- Custom JS -->
	<script src="${contextRoot}/resources/js/main.js"></script>

</body>
</html>