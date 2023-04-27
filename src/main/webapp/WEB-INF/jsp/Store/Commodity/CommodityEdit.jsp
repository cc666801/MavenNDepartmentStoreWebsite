<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>localhost:8080/MavenNDepartmentStoreWebsite/Store/Commodity/Commodityadd
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

		<h1 class="mb-3">修改產品詳細資訊後台(修改後顯示畫面)</h1>

	


		<form:form modelAttribute="commodity" method="put"
			action="${contextRoot}/Store/Commodity/editCommodity"
			enctype="multipart/form-data">

			<form:label path="comm_Id">商品序號</form:label>
			<form:input path="comm_Id" readonly="true" />
			<br>
			<form:label path="comm_Name">商品名稱</form:label>
			<form:input path="comm_Name" />


			<br>
			<form:label path="comm_Desc">商品敘述</form:label>
			<form:input path="comm_Desc" />
			<br>
			<form:label path="comm_Price">商品價格</form:label>
			<form:input path="comm_Price" />
			<br>
			<form:label path="comm_Discount">商品折扣(請輸入1以內之小數)</form:label>
			<form:input path="comm_Discount" />
			<br>
			<label for="comm_Shelve">商品上下架</label>
			<input type="radio" id="comm_Shelve_true" name="comm_Shelve"
				value="true">
			<label for="comm_Shelve_true">上架</label>
			<input type="radio" id="comm_Shelve_false" name="comm_Shelve"
				value="false">
			<label for="comm_Shelve_false">下架</label>
			<br>
			<form:label path="comm_Picture">商品照片</form:label>
			<form:input path="transferToByteArray" type="file" id="formfile" />
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