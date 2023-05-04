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
</head>
<body>

<main id="main">
    <h1>更新會員</h1>
    <form action="${contextRoot}/member/edit/${sessionScope.member.id}" method="POST">
    <input type="hidden" name="_method" value="PUT">
    <input type="hidden" name="id" value="${member.id}" />
    <label for="name">姓名:</label>
    <input type="text" name="name" value="${member.name}" />
    <br />
    <label for="email">Email:</label>
    <input type="text" name="email" value="${member.email}" />
    <br />
    <label for="address">地址:</label>
    <input name="address" value="${member.address}" />
    <br />
    <label for="phone">電話:</label>
    <input name="phone" value="${member.phone}" />
    <br />
    <label for="password">密碼:</label>
    <input type="password" name="password" value="${member.password}" />
    <br />
    <button type="submit">更新</button>
</form>
    </main>
</body>
</html>