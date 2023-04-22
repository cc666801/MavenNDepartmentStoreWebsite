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
<title>商品類別新增</title>
</head>

<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">

		<h1>新增產品類別</h1>
		<form:form method="post" modelAttribute="CommCate"
			action="${contextRoot}/Store/CommCate/create"
			enctype="multipart/form-data">


			<form:label path="Cate_name">類別名稱</form:label>
			<form:input path="Cate_name" />
			<br>
			<form:label path="Cate_desc">類別敘述</form:label>
			<form:input path="Cate_desc" />
			<br>

			<button type="submit" value="確定"></button>
		</form:form>
	</main>



</body>

</html>