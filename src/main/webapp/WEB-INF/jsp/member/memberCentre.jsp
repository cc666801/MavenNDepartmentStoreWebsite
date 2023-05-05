<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>會員資料</title>
</head>
<body>
	<main id="main">
		<h1>會員資料</h1>
		<table>
			<tr>
				<th>姓名</th>
				<td>${sessionScope.member.name}</td>
			</tr>
			<tr>
				<th>帳號</th>
				<td>${sessionScope.member.account}</td>
			</tr>
			<tr>
				<th>密碼</th>
				<td>${sessionScope.member.password}</td>
			</tr>
			<tr>
				<th>生日</th>
				<td><fmt:formatDate value="${sessionScope.member.birthday}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>電話</th>
				<td>${sessionScope.member.phone}</td>
			</tr>
			<tr>
				<th>地址</th>
				<td>${sessionScope.member.address}</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>${sessionScope.member.email}</td>
			</tr>
			<tr>
				<th>點數</th>
				<td>${sessionScope.member.points}</td>
			</tr>

			<tr>
				<td><form
						action="${contextRoot}/member/edit/${sessionScope.member.id}"
						method="GET">

						<button type="submit">修改資料</button>
					</form></td>

			</tr>
		</table>
	</main>
</body>
</html>
