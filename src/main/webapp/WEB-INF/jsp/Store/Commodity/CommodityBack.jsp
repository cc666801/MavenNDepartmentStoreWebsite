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
	<jsp:include page="../../layout/headerForBackend.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main" class="container my-5">

		<h1 class="mb-3">新增產品詳細資訊後台(新增後顯示畫面)</h1>



		<form action="${contextRoot}/Store/Commodity/add">
			<button type="submit" class="btn btn-primary mb-3">新增</button>
		</form>
		<%-- 如果有成功訊息，顯示綠色框框 --%>
		<c:if test="${not empty successMessage}">
			<div class="alert alert-success" role="alert">
				${successMessage}</div>
		</c:if>

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
				<c:forEach var="commodity" items="${commodityList}">

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
								method="get">
								<input type="hidden" name="comm_Id" value="${commodity.comm_Id}">
								<button type="submit" class="btn btn-warning">編輯</button>


							</form:form></td>
						<td><form:form action="${contextRoot}/Store/Commodity/delete"
								method="DELETE">
								<input type="hidden" name="comm_Id" value="${commodity.comm_Id}">
								<button type="submit" class="btn btn-danger">刪除</button>
							</form:form></td>
					</tr>
				</c:forEach>
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