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
	
button {
  background-color: #007bff !important;
  color: #fff !important;
  padding: 10px 20px !important;
  border: none !important;
  border-radius: 5px !important;
  font-size: 16px !important;
  cursor: pointer !important;
  transition: background-color 0.3s ease !important;
}

button:hover {
  background-color: #0069d9 !important;
}	
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
					<div>
						<form action="${contextRoot}/articleBack/add"
							style="display: inline-block;">
							<button type="submit">新增文章</button>
						</form>

						<form
							onsubmit="openWindow('${contextRoot}/articleConfiguration'); return false;" style="display: inline-block;">
							<button type="submit">設定</button>
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
										<th>縮圖</th>
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
											<td><img
												src="data:image/jpeg;base64,${art.articleBase64}"></td>
											<td>${art.articleID}</td>
											<td>${art.articleTitle}</td>
											<td>${art.member.account}</td>
											<td>${art.articleCategory.articleCategoryName}</td>
											<td><a
												href="${contextRoot}/articleContent/${art.articleID}">文章內容</a></td>
											<td>${art.articleCreateTime}</td>
											<td>${art.articleEditTime}</td>
											<td><form action="${contextRoot}/articleBack/edit">
													<input type="hidden" name="id" value="${art.articleID}" />
													<input type="submit" value="編輯" />
												</form></td>
											<td><form action="${contextRoot}/articleBack/delete"
													method="post" onclick="return confirm('確定要刪除這篇文章嗎?')">
													<input type="hidden" name="_method" value="delete" /> <input
														type="hidden" name="id" value="${art.articleID}" /> <input
														type="submit" value="刪除" />
												</form></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
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