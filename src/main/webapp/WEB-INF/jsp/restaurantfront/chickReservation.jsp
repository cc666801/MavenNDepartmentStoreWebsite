<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.card img {w-100;
	height: 250px;
}
</style>
<title>餐廳頁面</title>
</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">
		<div>
				<table id="datatablesSimple" class="table table-success table-striped" >
					<thead>
						<tr>
<!-- 				        <td>訂位單號碼</td> -->
							<th>餐廳</th>     
							<th>姓名</th>
							<th>電話</th>
							<th>email</th>
							<th>備註</th>
							<th>日期</th>
							<th>時段</th>
							<th>時間</th>
							<th>大人</th>
							<th>小孩</th>
							<th>編輯</th>
							<th>刪除</th>
						</tr>
					</thead>
					<tbody>
						<jstl:forEach items="${findAllReservation}" var="far">
							<tr>
								<%-- 	<td>${far.id}</td>    --%>
								<td>${far.company.companyName}</td>
								<td>${far.name}</td>
								<td>${far.telephone}</td>
								<td>${far.email}</td>
								<td>${far.remark}</td>
								<td>${far.date}</td>
								<td>${far.time_interval}</td>
								<td>${far.time}</td>
								<td>${far.adult}</td>
								<td>${far.children}</td>
								<td><form action="${contextRoot}/restaurant/edit">
										<input type="hidden" name="r_id" value="${far.r_id}" /> <input
											type="submit" class="btn btn-warning btn-sm" value="編輯" />
									</form></td>
								<td><form action="${contextRoot}/restaurant/delete"
										method="post">
										<input type="hidden" name="_method" value="delete" /> <input
											type="hidden" name="r_id" value="${far.r_id}" /> <input
											type="submit" class="btn btn-danger btn-sm" value="刪除" />
									</form></td>
								<%-- 			<td><a href="DeleteBookById.do?Id=${m.id}"><button>刪除</button></a></td> --%>
							</tr>
						</jstl:forEach>
					</tbody>
				</table>
			</div>
	</main>
</body>
</html>