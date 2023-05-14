<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>註冊會員</title>
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
						<h4 class="mb-0">註冊會員</h4>
					</div>
					<div class="card-body">
						<form:form name="myForm" method="post"
							action="${contextRoot}/member/post" modelAttribute="member"
							onsubmit="return checkForm();">

							<c:if test="${not empty error}">
								<div class="alert alert-danger" role="alert">${error}</div>
							</c:if>



							<div class="form-group">
								<label for="name">姓名：</label>
								<form:input path="name" id="name" cssClass="form-control"
									required="required" />
							</div>
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
							<div class="form-group">
								<label for="email">Email：</label>
								<form:input path="email" id="email" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="phone">電話：</label>
								<form:input path="phone" id="phone" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="address">地址：</label>
								<form:input path="address" id="address" cssClass="form-control"
									required="required" />
							</div>
							<div class="form-group">
								<label for="birthday">生日：</label>
								<form:input type="date" path="birthday" id="birthday"
									cssClass="form-control" />
							</div>
							<div class="form-group form-check text-center">
								<input type="checkbox" class="form-check-input"
									id="privacyCheck" required> <label
									class="form-check-label" for="privacyCheck"> 我已經詳細閱讀並同意
									<a href="https://www.moi.gov.tw/cp.aspx?n=10953" target="_blank">隱私權政策</a>
								</label>
							</div>



							<input type="submit" class="btn btn-info btn-block" value="註冊">
						</form:form>
					</div>
				</div>
				<p class="text-center">
					已經有帳號了嗎？<a href="${contextRoot}/member/login">立即登入</a>
				</p>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
	<script>
		function checkForm() {
			var name = document.forms["myForm"]["name"].value;
			var account = document.forms["myForm"]["account"].value;
			var password = document.forms["myForm"]["password"].value;
			var email = document.forms["myForm"]["email"].value;
			var phone = document.forms["myForm"]["phone"].value;
			var address = document.forms["myForm"]["address"].value;
			var birthday = document.forms["myForm"]["birthday"].value;
			var privacyCheck = document.getElementById("privacyCheck").checked;

			if (!privacyCheck) {
				alert("請勾選同意隱私權政策");
				return false;
			}

			if (name == "" || account == "" || password == "" || email == ""
					|| address == "" || phone == "" || password == "") {
				alert("欄位不可為空");
				return false;
			}
			var nameRegex = /^[\u4E00-\u9FA5A-Za-z]{1,10}$/;
			if (!nameRegex.test(name)) {
				alert("姓名必須為中英文，最多 10 個字");
				return false;
			}

			var accountRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$/;
			if (!accountRegex.test(account)) {
				alert("帳號必須為英文和阿拉伯數字混合");
				return false;
			}

			var emailRegex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
			if (!emailRegex.test(email)) {
				alert("Email 格式不正確");
				return false;
			}

			var addressRegex = /^[\u4E00-\u9FA5]+$/;
			if (!addressRegex.test(address)) {
				alert("地址必須為中文，最多 50 個字");
			


			var phoneRegex = /^[0-9]{10}$/;
			if (!phoneRegex.test(phone)) {
				alert("電話必須為 10 個阿拉伯數字");
				return false;
			}

			var passwordRegex = /^[a-zA-Z0-9]{1,20}$/;
			if (!passwordRegex.test(password)) {
				alert("密碼必須為英文字母和數字，最多 20 個字");
				return false;
			}

			return true;

		}
	</script>
</body>
</html>

