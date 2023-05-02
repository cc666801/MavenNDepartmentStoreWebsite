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
</head>
<body>
	<main id="main">
		<h1>註冊會員</h1>
		
		<form:form method="post" action="${contextRoot}/member/post"
			modelAttribute="member" onsubmit="return checkForm();">
			<table>
				<tr>
					<td>姓名：</td>
					<td><form:input path="name" maxlength="5"
							pattern="^[\u4E00-\u9FA5]+$" title="只能輸入中文，最多5個字" /></td>
				</tr>
				<tr>
					<td>帳號：</td>
					<td><form:input path="account" maxlength="20"
							pattern="^[a-zA-Z0-9]+$" title="只能輸入英文字母和數字，最多20個字" /></td>
				</tr>
				<tr>
					<td>密碼：</td>
					<td><form:input path="password" type="password" maxlength="20"
							pattern="^[a-zA-Z0-9]+$" title="只能輸入英文字母和數字，最多20個字" /></td>
				</tr>
				<tr>
					<td>Email：</td>
					<td><form:input path="email"
							pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
							title="請輸入正確的Email格式，例如：example@mail.com" /></td>
				</tr>
				<tr>
					<td>電話：</td>
					<td><form:input path="phone" maxlength="10" pattern="^[0-9]+$"
							title="只能輸入10個阿拉伯數字，不能輸入英文或中文" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><form:input path="address" maxlength="50"
							pattern="^[\u4E00-\u9FA5]+$" title="只能輸入中文，最多50個字" /></td>
				</tr>
				<tr>
					<td>生日：</td>
					<td><form:input path="birthday" type="date" /></td>
				</tr>

				<tr>
					<td colspan="2" class="center"><input type="submit"
						class="btn btn-outline-primary" value="註冊" /> <a
						href="${contextRoot}/member/login" class="btn btn-outline-primary">登入</a></td>
				</tr>
			</table>
		</form:form>
		<div id="errorMsg"
			style="display: none; color: red; text-align: center;">欄位不可為空</div>
	</main>

	<!-- End #main -->

	<script>
		function checkForm() {
			var fields = document.getElementsByTagName('input');
			for (var i = 0; i < fields.length; i++) {
				if (fields[i].value.trim() === '') {
					document.getElementById('errorMsg').style.display = 'block';
					return false;
				}
			}
			return true;
		}
	</script>
</body>
</html>