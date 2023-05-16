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
<title>失物招領-後台</title>
</head>

<body class="sb-nav-fixed">
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/headerForBackend.jsp"></jsp:include>
	<!-- End Header -->

	<div id="layoutSidenav">

		<!-- ======= SiderNav ======= -->
		<jsp:include page="../../layout/sideNavForBackend.jsp"></jsp:include>
		<!-- End SiderNav -->

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1>失物招領管理</h1>
					<form action="${contextRoot}/LostAndFoundBack/add">
		<button type="submit">新增</button>
	</form>
	<br>
	<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>文章管理列表
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
		<thead>
			<tr>
				<th>拾獲物登錄單號</th>
				<th>拾獲日期</th>
				<th>拾獲品項/數量</th>
				<th>拾獲地點</th>
				<th>狀態</th>
				<th>編輯</th>
				<th>刪除</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="lost" items="${lostList}">
				<tr>
					<td>${lost.id}</td>
					<td>${lost.founddate}</td>
					<td>${lost.item}</td>
					<td>${lost.place}</td>
					<td>${lost.state}</td>
					<td><form action="${contextRoot}/LostAndFoundBack/edit">
							<input type="hidden" name="id" value="${lost.id}" /> <input
								type="submit" value="編輯" />
						</form></td>
					<td><form action="${contextRoot}/LostAndFoundBack/delete"
							method="post">
							<input type="hidden" name="_method" value="delete" /> <input
								type="hidden" name="id" value="${lost.id}" /> <input
								type="submit" value="刪除" onclick="return confirm('確定要刪除嗎?')"/>
						</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>			
					
	</div>				
</main>
			<!-- End #main -->

			<!-- ======= Footer ======= -->
			<jsp:include page="../../layout/footerForBackend.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextRoot}/assetsForBackend/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>
</body>
</html>
















