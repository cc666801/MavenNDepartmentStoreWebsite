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
<title>驗證信箱</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
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
		<h1 style="text-align: center; color: #4CAF50;">驗證信箱</h1>


		<table class="table">
			<tr>
				<th>即將傳送驗證信到以下信箱：${member.email}</th>

			</tr>
			<tr>
				<td>
					<form action="${contextRoot}/member/verifyEmail" method="POST">
						<input type="hidden" name="id" value="${member.id}" /> <input
							type="hidden" name="account" value="${member.account}" /> <input
							type="hidden" name="password" value="${member.password}" /> <input
							type="hidden" name="email" value="${member.email}" /> <input
							type="hidden" name="name" value="${member.name}" /> <input
							type="hidden" name="phone" value="${member.phone}" /> <input
							type="hidden" name="address" value="${member.address}" /> <input
							type="hidden" name=verify value="${member.verify}" /> <input
							type="hidden" name=token value="${member.token}" /> <input
							type="hidden" name=birthday value="${member.birthday}" />
						<button type="submit" class="btn btn-success">驗證信箱</button>
					</form>
				</td>
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
