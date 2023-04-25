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
<title>新增商品類別後台(新增)</title>
</head>

<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">

		<h1>新增商品類別後台(新增)</h1>
		<form:form method="post" modelAttribute="cate"
			action="${contextRoot}/Store/CommCate/post">


			<form:label path="comm_Name">商品名稱</form:label>
			<form:input path="comm_Name" type="text" />
			<br>
			<form:label path="comm_Desc">商品敘述</form:label>
			<form:input path="comm_Desc" />
			<br>
			<form:label path="comm_Picture">商品照片</form:label>
			<form:input path="comm_Picture" />
			<br>
			<form:label path="cate_Id">類別分類</form:label>
			<form:input path="cate_Id" />
			<br>
			<form:label path="comm_Price">商品價格</form:label>
			<form:input path="comm_Price" />
			<br>
			<form:label path="comm_Discount">商品折扣</form:label>
			<form:input path="comm_Discount" />
			<br>
			<form:label path="comm_Shelve">商品上下架</form:label>
			<form:input path="comm_Shelve" />
			<br>


			<button type="submit" value="確定">送出</button>
		</form:form>
	</main>



</body>

</html>