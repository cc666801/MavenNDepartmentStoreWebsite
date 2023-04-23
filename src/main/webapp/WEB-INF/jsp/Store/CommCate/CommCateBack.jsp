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
<title>商品類別管理</title>
</head>

<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->

	<main id="main">

		<h1>新增產品類別後台(新增後顯示畫面)</h1>
		<table>
			<thead>
				<tr>
					<th>類別id</th>
					<th>類別名稱</th>
					<th>類別敘述</th>
					<th>類別建立日期</th>
					<th>類別修改日期</th>
				</tr>
				</thead>
				  <tbody>
				<c:forEach var="cate" items="${CateList}">
					<tr>
						<td>${cate.cate_Id}</td>
						<td>${cate.cate_Name}</td>
						<td>${cate.cate_Desc}</td>
						<td>${cate.cate_CDay}</td>
						<td>${cate.cate_MDay}</td>
					</tr>
				</c:forEach>
				</tbody>
		</table>

	</main>
</body>

</html>