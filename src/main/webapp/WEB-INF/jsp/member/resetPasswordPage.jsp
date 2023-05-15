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
<title>重設密碼</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<!-- 自訂 CSS -->
<style>
table {
	margin: auto;
}

.btn-custom {
	background-color: #4CAF50;
	color: white;
}

.btn-primary:hover {
  background-color: #3e8e41 !important;
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
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<main id="main" class="container">
		<h1>重設密碼</h1>
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-6">
				<div class="card">
					<div class="card-body">
						<table class="table">
							<form:form method="POST"
								action="${contextRoot}/member/resetPassword" onsubmit="return validateForm();">
								<input type="hidden" name="email" value="${member.email}">
								<tr>
									<th><label for="password">新密碼：</label></th>
									<td><input type="password" id="password" name="password"></td>
								</tr>
								<tr>
									<th><label for="confirmPassword">確認新密碼：</label></th>
									<td><input type="password" id="confirmPassword"
										name="confirmPassword"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="重設密碼"
										class="btn btn-primary btn-block"></td>
								</tr>
							</form:form>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- jQuery -->
	<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

<script>
  function validateForm() {
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirmPassword').value;

    if (password.trim() === '' || confirmPassword.trim() === '') {
      alert('請輸入新密碼和確認新密碼');
      return false;
    } else if (password !== confirmPassword) {
      alert('新密碼和確認新密碼不一致');
      return false;
    }

    return true;
  }
</script>


</body>
</html>
