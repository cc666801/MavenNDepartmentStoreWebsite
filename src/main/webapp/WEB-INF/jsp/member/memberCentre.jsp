<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>會員資料</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<!-- 自訂 CSS -->
<style>
input[type="password"] {
	border: none;
	background-color: transparent;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

table {
	margin: auto;
}

.btn-custom {
	background-color: #4CAF50;
	color: white;
}

.btn-link {
	color: #4CAF50;
	text-decoration: none;
	border: none;
	background-color: transparent;
	font-size: 16px;
	padding: 0;
	margin-right: 20px;
}

.btn-link:hover {
	color: #3e8e41;
}
button[type="submit"] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-top: 20px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #3e8e41;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<main id="main" class="container">
		<h1 style="text-align: center; color: #4CAF50;">會員資料</h1>
		<table class="table">
			<tr>
				<th>姓名:</th>
				<td>${sessionScope.member.name}</td>
			</tr>
			<tr>
				<th>帳號:</th>
				<td>${sessionScope.member.account}</td>
			</tr>
			<tr>
				<th>密碼:</th>
				<td><input type="password"
					value="${sessionScope.member.password}" disabled></td>
			</tr>
			<tr>
				<th>生日:</th>
				<td><fmt:formatDate value="${sessionScope.member.birthday}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>電話:</th>
				<td>${sessionScope.member.phone}</td>
			</tr>
			<tr>
				<th>Email:</th>
				<td>${sessionScope.member.email}</td>
			</tr>
			<tr>
				<th>地址:</th>
				<td>${sessionScope.member.address}</td>
			</tr>
			<tr>
				<th>點數:</th>
				<td>${sessionScope.member.points}</td>
			</tr>
			<tr>
				<td><form:form
						action="${contextRoot}/member/edit/${sessionScope.member.id}"
						method="GET">
						<button type="submit">修改資料</button>
					</form:form></td>
			</tr>
		</table>
	</main>

	<!-- jQuery -->
	<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>