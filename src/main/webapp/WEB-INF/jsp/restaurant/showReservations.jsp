<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>訂位單查詢</title>
</head>

<body style="background-color: #fdf5e6">
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<main id="main" style="background-color: #fdf5e6">
		<h1>訂位單查詢</h1>
		<div>
		<a href="${contextRoot}/restaurant/add"><button class="btn btn-dark">新增</button></a>
		</div>
		
		<table class="table table-success table-striped">
			<thead>
				<tr>
<!-- 					<td>訂位單號碼</td>  -->
<!-- 					<td>餐廳</td>      -->
					<td>姓名</td>
					<td>電話</td>
					<td>email</td>
					<td>備註</td>
					<td>日期</td>
					<td>時段</td>
					<td>時間</td>
					<td>大人</td>
					<td>小孩</td>
					<td>刪除</td>
					<td>修改</td>
				</tr>
			</thead>
			<tbody>
				<jstl:forEach items="${findAllReservation}" var="far">
					<tr>
<%-- 											<td>${far.id}</td>    --%>
<%-- 											<td>${far.resid}</td> --%>
						<td>${far.name}</td>
						<td>${far.telephone}</td>
						<td>${far.email}</td>
						<td>${far.remark}</td>
						<td>${far.date}</td>
						<td>${far.time_interval}</td>
						<td>${far.time}</td>
						<td>${far.adult}</td>
						<td>${far.children}</td>
						<td><button>刪除</button></td>
<%-- 						<td><a href="DeleteBookById.do?Id=${m.id}"><button>刪除</button></a></td> --%>
						<td><a href="#"><button>修改</button></a></td>
					</tr>
				</jstl:forEach>
			</tbody>
		</table>
	</main>
</body>

</html>