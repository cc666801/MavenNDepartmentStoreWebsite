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
<title>忘記密碼</title>
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

form {
	margin-top: 50px;
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

label {
	font-weight: bold;
	margin-right: 10px;
}

th {
	text-align: right;
	font-weight: bold;
}

h1 {
	text-align: center;
	color: #0a0a0a;
	margin-bottom: 30px;
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
input[type="email"],
input[type="email"]:focus {
	border: 2px solid #000;
	border-radius: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<main id="main" class="container">
		<h1>忘記密碼</h1>
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-6">
				<div class="card">
					<div class="card-body">
						<table class="table">

							<tr>
								<th style="text-align: center;">請輸入您註冊時使用的電子郵件地址，</th>
							</tr>
							<tr>
								<th style="text-align: center;">我們將向您發送一封包含驗證鏈接的郵件。</th>
							</tr>

							<tr>
								<td style="text-align: center;">
									<form method="POST"
										action="${contextRoot}/member/sendResetPasswordEmail"
										class="needs-validation" novalidate>
										<div class="form-group">
											<label for="email" style="text-align: center">電子郵件地址：</label>
											<input type="email" class="form-control" id="email"
												name="email" required>
											<div class="invalid-feedback">請輸入有效的電子郵件地址</div>
										</div>
										<button type="submit" class="btn btn-primary">發送驗證郵件</button>
									</form> <c:if test="${not empty error}">
										<p class="text-danger text-center mt-3">${error}</p>
									</c:if> <c:if test="${not empty success}">
										<p class="text-success text-center mt-3">${success}</p>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Bootstrap JS -->
	<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.staticfile.org/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

	<script>
		// 表單驗證
		(function() {
			'use strict';
			window.addEventListener('load', function() {
				var form = document.querySelector('.needs-validation');
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			}, false);
		})();
	</script>
</body>
</html>