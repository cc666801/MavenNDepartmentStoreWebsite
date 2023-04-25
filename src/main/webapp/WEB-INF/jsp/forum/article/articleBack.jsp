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
					<h1>文章管理</h1>
					<form action="${contextRoot}/articleBack/add">
						<button type="submit">新增</button>
					</form>
					<table>
						<thead>
							<tr>
								<th>文章編號</th>
								<th>標題</th>
								<th>發文者帳號</th>
								<th>類別</th>
								<th>文章內容</th>
								<th>建立日期</th>
								<th>最後更新日期</th>
								<th>編輯</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="art" items="${artList}">
								<tr>
									<td>${art.articleID}</td>
									<td>${art.title}</td>
									<td>帳號</td>
									<td>${art.categoryID}</td>
									<td>文章內容連結</td>
									<td>${art.createTime}</td>
									<td>${art.editTime}</td>
									<td><form action="${contextRoot}/articleBack/edit">
											<input type="hidden" name="id" value="${art.articleID}" /> <input
												type="submit" value="編輯" />
										</form></td>
									<td><form action="${contextRoot}/articleBack/delete" method="post">
											<input type="hidden" name="_method" value="delete" /> <input
												type="hidden" name="id" value="${art.articleID}" /> <input
												type="submit" value="刪除" />
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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