<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>更新會員</title>
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
	color: #4CAF50;
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
		<h1>更新會員資料</h1>
		<form name="myForm"
			action="${contextRoot}/member/edit/${sessionScope.member.id}"
			method="POST" onsubmit="return checkForm()">
			<input type="hidden" name="_method" value="PUT"> <input
				type="hidden" name="id" value="${member.id}" />
			<table class="table">
				<tr>
					<th><label for="name">姓名:</label></th>
					<td><input type="text" name="name" value="${member.name}" /></td>
				</tr>
				<tr>
					<th><label for="account">帳號:</label></th>
					<td><input type="text" name="account"
						value="${member.account}" readonly
						style="border: none; outline: none;" /></td>
				</tr>


				<tr>
					<th><label for="password">密碼:</label></th>
					<td><input type="password" name="password"
						value="${member.password}" /></td>
				</tr>


				<tr>
					<th><label for="phone">電話:</label></th>
					<td><input name="phone" value="${member.phone}" /></td>


				</tr>


				<tr>
					<th><label for="email">Email:</label></th>
					<td><input type="text" name="email" value="${member.email}" /></td>
				</tr>


				<tr>
					<th><label for="address">地址:</label></th>
					<td><input name="address" value="${member.address}" /></td>
				</tr>

				<tr>
					<td colspan="2">
						<button type="submit">確定</button>
					</td>
				</tr>
			</table>
		</form>
	</main>

	<!-- jQuery -->
	<script src="https://cdn.staticfile.org/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
	<script>
		function checkForm() {
			var name = document.forms["myForm"]["name"].value;
			var email = document.forms["myForm"]["email"].value;
			var address = document.forms["myForm"]["address"].value;
			var phone = document.forms["myForm"]["phone"].value;
			var password = document.forms["myForm"]["password"].value;

			if (name == "" || email == "" || address == "" || phone == ""
					|| password == "") {
				alert("欄位不可為空");
				return false;
			}

			var nameRegex = /^[\u4E00-\u9FA5A-Za-z]{1,10}$/;
			if (!nameRegex.test(name)) {
				alert("姓名必須為中英文，最多 10 個字");
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
				return false;
			}

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

			// 如果表單欄位都填寫正確，顯示確認視窗
			if (confirm("確定要更新會員資料嗎？")) {
				return true;
			} else {
				return false;
			}
		}
	</script>

</body>
</html>
