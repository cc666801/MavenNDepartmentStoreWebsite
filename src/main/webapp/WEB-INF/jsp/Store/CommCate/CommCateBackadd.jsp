<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>新增產品類別後台(新增)</title>
</head>

<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">

		<h1>新增產品類別後台(新增)</h1>
		<form:form method="post" modelAttribute="cate"
			action="${contextRoot}/Store/CommCate/post">


			<form:label path="cate_Name">類別名稱</form:label>
			<form:input path="cate_Name" type="text" />
			<br>
			<form:label path="cate_Desc">類別敘述</form:label>
			<form:input path="cate_Desc" />
			<br>

			<button type="submit" value="確定">送出</button>
		</form:form>
	</main>



</body>

</html>