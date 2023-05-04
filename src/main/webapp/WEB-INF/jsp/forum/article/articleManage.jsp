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
<title>會員個人文章管理</title>
<!-- =================== 後台表格CSS ======================================-->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${contextRoot}/assetsForBackend/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- =========================== 後台表格CSS================================== -->
<style>
img {
	max-width: 100px;
	max-height: 100px;
}
</style>
</head>
<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<main id="main">
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
								<td><img src="data:image/jpeg;base64,${art.articleBase64}"></td>
								<td>${art.articleID}</td>
								<td>${art.articleTitle}</td>
								<td>帳號</td>
								<td>${art.articleCategory.articleCategoryName}</td>
								<td><a
									href="${contextRoot}/articleContent/${art.articleID}">文章內容</a></td>
								<td>${art.articleCreateTime}</td>
								<td>${art.articleEditTime}</td>
								<td><form action="${contextRoot}/articleBack/edit">
										<input type="hidden" name="id" value="${art.articleID}" /> <input
											type="submit" value="編輯" />
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
	</main>

	<jsp:include page="../../layout/footer.jsp"></jsp:include>

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

</body>
</html>