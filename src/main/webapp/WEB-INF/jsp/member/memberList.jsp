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
<title>文章管理-後台</title>
<style>
img {
	max-width: 100px;
	max-height: 100px;
}
</style>
</head>
<body class="sb-nav-fixed">
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/headerForBackend.jsp"></jsp:include>
	<!-- End Header -->

	<div id="layoutSidenav">

		<!-- ======= SiderNav ======= -->
		<jsp:include page="../layout/sideNavForBackend.jsp"></jsp:include>
		<!-- End SiderNav -->

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1>會員管理</h1>

					<br>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>會員管理列表
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>會員ID</th>
										<th>會員姓名</th>
										<th>會員帳號</th>
										<th>會員信箱</th>
										<th>會員手機</th>
										<th>會員地址</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="member" items="${memberList}">
										<tr>
											<td>${member.id}</td>
											<td>${member.name}</td>
											<td>${member.account}</td>
											<td>${member.email}</td>
											<td>${member.phone}</td>
											<td>${member.address}</td>
											<td>
												<form method="post"
													action="${contextRoot}/memberdelete/${member.id}"
													onsubmit="return confirm('您確定要刪除此會員資料嗎？');">
													<input type="hidden" name="_method" value="DELETE">
													<button type="submit" class="btn btn-danger">刪除</button>
												</form>
											</td>
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
			<jsp:include page="../layout/footerForBackend.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>

	<!-- =============================== bootstrap ================================================= -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextRoot}/assetsForBackend/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>
	<!-- =================================== bootstrap ============================================= -->
	<script>
		function openWindow(url) {
			window.open(url, 'myWindow', 'width=800,height=600');
		}
	</script>


</body>
</html>