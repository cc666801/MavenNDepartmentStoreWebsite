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
<title>收藏文章</title>

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
		<div class="card mb-4" style="max-width: 70%; margin: 0 auto;">
			<div class="card-header" >
				<i class="fas fa-table me-1"></i>收藏文章
			</div>
			<div class="card-body" >
				<table id="datatablesSimple" >
					<thead>
						<tr>
							<th>縮圖</th>
							<th>文章編號</th>
							<th>標題</th>
							<th>發文者帳號</th>
							<th>類別</th>
							<th>文章內容</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="art" items="${artList}">
							<tr>
								<td><img src="data:image/jpeg;base64,${art.articleBase64}"></td>
								<td>${art.articleID}</td>
								<td>${art.articleTitle}</td>
								<td>${art.member.account}</td>
								<td>${art.articleCategory.articleCategoryName}</td>
								<td><a
									href="${contextRoot}/articleContent/${art.articleID}">文章內容</a></td>
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
<script>
    // 沒會員跳轉
    if ("${errorMsg}") {
        alert("${errorMsg}");
        window.location.href = "${contextRoot}/member/login";
    }
</script>
</body>
</html>