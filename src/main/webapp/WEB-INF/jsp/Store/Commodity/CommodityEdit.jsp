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

		<h1 class="mb-3">修改產品詳細資訊後台(修改後顯示畫面)</h1>

		<form:form modelAttribute="commodity" method="put"
			action="${contextRoot}/Store/Commodity/editCommodity">

			<form:input type="hidden" path="comm_Id" />
			<form:label path="comm_Name">分類名稱</form:label>
			<form:input path="comm_Name" />





		</form:form>


		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">商品序號</th>
					<th scope="col">商品名稱</th>
					<th scope="col">商品照片</th>
					<th scope="col">類別序號</th>
					<th scope="col">商品敘述</th>
					<th scope="col">商品價格</th>
					<th scope="col">商品折扣</th>
					<th scope="col">商品上下架</th>
					<th scope="col">商品建立日期</th>
					<th scope="col">商品修改日期</th>
				</tr>
			</thead>
			<tbody>


				<tr>
					<td>${commodity.comm_Id}</td>
					<td>${commodity.comm_Name}</td>
					<td><img
						src="data:image/png;base64,${commodity.base64Stringcomm_Picture}"
						style="width: 100px; height: 100px;" /></td>
					<td>${cate.cate_Id}</td>
					<td>${commodity.comm_Desc}</td>
					<td>${commodity.comm_Price}</td>
					<td>${commodity.comm_Discount}</td>
					<td>${commodity.comm_Shelve}</td>
					<td>${commodity.comm_CDay}</td>
					<td>${commodity.comm_MDay}</td>
					<td><form:form
							action="${contextRoot}/Store/Commodity/editCommodity"
							method="put">
							<input type="hidden" name="comm_Id" value="${commodity.comm_Id}">
							<button type="submit" class="btn btn-warning">編輯</button>


							<button type="submit">送出</button>

						</form:form>
			</tbody>
		</table>

	</main>

	<!-- jQuery -->
	<script src="${contextRoot}/resources/js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="${contextRoot}/resources/js/bootstrap.bundle.min.js"></script>
	<!-- Custom JS -->
	<script src="${contextRoot}/resources/js/main.js"></script>

</body>

</html>