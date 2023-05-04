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

    if (name == "") {
        alert("姓名不可為空！");
        return false;
    }

    if (account == "") {
        alert("帳號不可為空！");
        return false;
    }

    if (password == "") {
        alert("密碼不可為空！");
        return false;
    }

    if (email == "") {
        alert("Email 不可為空！");
        return false;
    }

    if (phone == "") {
        alert("電話不可為空！");
        return false;
    }

    if (address == "") {
        alert("地址不可為空！");
        return false;
    }

    if (birthday == "") {
        alert("生日不可為空！");
        return false;
    }
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
					<td>姓名：</td>
					<td><input type="text" name="name" maxlength="10"
							pattern="^[\u4E00-\u9FA5A-Za-z]{1,10}$" title="最多輸入10個字，只能使用中英文" /></td>
				</tr>
				<tr>
					<td>帳號：</td>
					<td><input type="text" name="account" maxlength="20"
							pattern="^[a-zA-Z0-9]+$" title="只能輸入英文字母和數字，最多20個字" /></td>
				</tr>
				<tr>
					<td>密碼：</td>
					<td><input type="password" name="password" maxlength="20"
							pattern="^[a-zA-Z0-9]+$" title="只能輸入英文字母和數字，最多20個字" /></td>
				</tr>
				<tr>
								<tr>
					<td>Email：</td>
					<td><input type="email" name="email"
							pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
							title="請輸入正確的Email格式，例如：example@mail.com" /></td>
				</tr>
				<tr>
					<td>電話：</td>
					<td><input type="tel" name="phone" maxlength="10" pattern="^[0-9]+$"
							title="只能輸入10個阿拉伯數字，不能輸入英文或中文" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" name="address" maxlength="50"
							pattern="^[\u4E00-\u9FA5]+$" title="只能輸入中文，最多50個字" /></td>
				</tr>
				<tr>
					<td>生日：</td>
					<td><input type="date" name="birthday" /></td>
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
				