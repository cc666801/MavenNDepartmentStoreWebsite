<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>商品類別管理</title>
				</head>

				<body>
					<!-- ======= Header ======= -->
					<jsp:include page="../../layout/header.jsp"></jsp:include>
					<!-- End Header -->
					<h1>產品類別</h1>
					<form:form method="post" modelAttribute="CommCate" action="${contextRoot}/Store/CommCate/create"
						enctype="multipart/form-data"></form:form>

				










				</body>

				</html>