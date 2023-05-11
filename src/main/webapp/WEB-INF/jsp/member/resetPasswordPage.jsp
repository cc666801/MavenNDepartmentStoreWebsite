<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>重設密碼</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>


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
	<h1>重設密碼</h1>
	<p>請輸入新的密碼以重設您的帳戶密碼：</p>

	<form method="POST" action="${contextRoot}/member/resetPassword">
		<input type="hidden" name="email" value="${member.email}"> <label
			for="password">新密碼：</label> <input type="password" id="password"
			name="password"> <br>
		<br> <label for="confirmPassword">確認新密碼：</label> <input
			type="password" id="confirmPassword" name="confirmPassword">
		<br>
		<br> <input type="submit" value="重設密碼">
	</form>

	<p style="color: red;">${error}</p>
	<p style="color: green;">${success}</p>
	</main>
</body>
</html>
