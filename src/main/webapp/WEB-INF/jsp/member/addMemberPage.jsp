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
<style>
.error {
	color: red;
}

.center {
	text-align: center;
}

table {
	margin: 0 auto;
}

h1 {
	text-align: center;
}
</style>
<script>
	function checkForm() {
		var name = document.forms["myForm"]["name"].value;
		var account = document.forms["myForm"]["account"].value;
		var password = document.forms["myForm"]["password"].value;
		var email = document.forms["myForm"]["email"].value;
		var phone = document.forms["myForm"]["phone"].value;
		var address = document.forms["myForm"]["address"].value;
		var birthday = document.forms["myForm"]["birthday"].value;

		if (name == "" || account == ""|| password == ""|| email == "" || address == "" || phone == ""
			|| password == "") {
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

		return true;
		
	}
</script>
</head>
<body>
	<main id="main">
		<h1>註冊會員</h1>

		<form name="myForm" method="post" action="${contextRoot}/member/post"
			modelAttribute="member" onsubmit="return checkForm();">
			<table>
				<tr>
					<td><label for="name">姓名：</label></td>
					<td><input type="text" name="name" id="name" /></td>
				</tr>
				<tr>
					<td><label for="account">帳號：</label></td>
					<td><input type="text" name="account" id="account"/></td>
				</tr>
				<tr>
					<td><label for="password">密碼：</label></td>
					<td><input type="password" name="password" id="password"/></td>
				</tr>
				<tr>
					<td><label for="email">Email：</label></td>
					<td><input type="email" name="email" id="email"/></td>
				</tr>
				<tr>
					<td><label for="phone">電話：</label></td>
					<td><input type="tel" name="phone" id="phone"/></td>
				</tr>
				<tr>
					<td><label for="address">地址：</label></td>
					<td><input type="text" name="address" id="address"/></td>
				</tr>
				<tr>
					<td><label for="birthday">生日：</label></td>
					<td><input type="date" name="birthday" id="birthday" /></td>
				</tr>
				<tr>
					<td colspan="2" class="center"><input type="submit"
						class="btn btn-outline-primary" value="註冊" /> <a
						href="${contextRoot}/member/login" class="btn btn-outline-primary">登入</a></td>
				</tr>
			</table>
		</form>
	</main>
</body>
</html>
