<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>

<!DOCTYPE html>
<html>
<head>
<!-- =======================================================
      * Template Name: ZenBlog
      * Updated: Mar 10 2023 with Bootstrap v5.2.3
      * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
      * Author: BootstrapMade.com
      * License: https:///bootstrapmade.com/license/
      ======================================================== -->
<!-- ======= Header ======= -->
<jsp:include page="../layout/header.jsp"></jsp:include>

<!-- End Header -->
<meta charset="UTF-8">
<title>更新會員</title>
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
<style>
table {
	margin: auto;
}

button {
	margin-top: 20px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>

	<main id="main">
		<h1 style="text-align: center;">修改會員資料</h1>
		<form name="myForm"
			action="${contextRoot}/member/edit/${sessionScope.member.id}"
			method="POST" onsubmit="return checkForm()">
			<input type="hidden" name="_method" value="PUT"> <input
				type="hidden" name="id" value="${member.id}" />
			<table>
				<tr>
					<td><label for="name">姓名:</label></td>
					<td><input type="text" name="name" value="${member.name}" /></td>
				</tr>

				<tr>
					<td><label for="account">帳號:</label></td>
					<td><input type="text" name="account"
						value="${member.account}" readonly
						style="border: none; outline: none;" /></td>
				</tr>


				<tr>
					<td><label for="password">密碼:</label></td>
					<td><input type="password" name="password"
						value="${member.password}" /></td>
				</tr>


				<tr>
					<td><label for="phone">電話:</label></td>
					<td><input name="phone" value="${member.phone}" /></td>


				</tr>


				<tr>
					<td><label for="email">Email:</label></td>
					<td><input type="text" name="email" value="${member.email}" /></td>
				</tr>


				<tr>
					<td><label for="address">地址:</label></td>
					<td><input name="address" value="${member.address}" /></td>
				</tr>

				<tr>
					<td>
						<button type="submit" class="btn btn-outline-primary">確定</button>

					</td>
				</tr>
			</table>
		</form>
	</main>
</body>
</html>