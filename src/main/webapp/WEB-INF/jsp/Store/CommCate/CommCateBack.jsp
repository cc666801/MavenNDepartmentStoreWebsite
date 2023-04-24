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
	<link href="${contextRoot}/resources/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome CSS -->
	<link href="${contextRoot}/resources/css/font-awesome.min.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="${contextRoot}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main" class="container my-5">

	<h1 class="mb-3">新增產品類別後台(新增後顯示畫面)</h1>
	<form action="${contextRoot}/Store/CommCate/add">
		<button type="submit" class="btn btn-primary mb-3">新增</button>
	</form>
	<table class="table table-striped">
		<thead class="thead-dark">
			<tr>
				<th scope="col">類別id</th>
				<th scope="col">類別名稱</th>
				<th scope="col">類別敘述</th>
					<th scope="col">類別建立日期</th>
					<th scope="col">類別修改日期</th>
					<th scope="col">編輯</th>
					<th scope="col">刪除</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach var="cate" items="${cateList}">
			<tr>
				<td>${cate.cate_Id}</td>
				<td>${cate.cate_Name}</td>
				<td>${cate.cate_Desc}</td>
				<td>${cate.cate_CDay}</td>
				<td>${cate.cate_MDay}</td>
				<td><a href="${contextRoot}/Store/CommCate/edit/${cate.cate_Id}" class="btn btn-warning">編輯</a></td>
				<td>
					<form:form action="${contextRoot}/Store/Commcate/delete" method="DELETE">
						<input type="hidden" name="cate_Id" value="${cate.cate_Id}">
						<button type="submit" class="btn btn-danger">刪除</button>
					</form:form>
				</td>
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