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
<title>會員登入</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<!-- 自訂 CSS -->
<style>
body {
	background-color: #f7f7f7;
}

.card {
	margin-top: 50px;
	margin-bottom: 50px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}
</style>
</head>

<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="col-auto">
						<a href="${contextRoot}/"
							class="btn btn-link text-decoration-none">首頁</a>
					</div>
					<div class="card-header bg-info text-white">
						<h4 class="mb-0">會員登入</h4>
					</div>
					<div class="card-body">
						<form:form method="POST" modelAttribute="member"
							action="${contextRoot}/member/login">


							<c:if test="${not empty error}">
								<div class="alert alert-danger" role="alert">${error}</div>
							</c:if>
							<div class="form-group">
								<label for="account">帳號：</label>
								<form:input path="account" id="account" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="password">密碼：</label>
								<form:password path="password" id="password"
									cssClass="form-control" required="required" />
							</div>
							<input type="submit" class="btn btn-info btn-block" value="登入">
						</form:form>
					</div>
				</div>
				<p class="text-center">
					還沒有帳號？<a href="${contextRoot}/member/register">立即註冊</a>
				</p>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>

</html>