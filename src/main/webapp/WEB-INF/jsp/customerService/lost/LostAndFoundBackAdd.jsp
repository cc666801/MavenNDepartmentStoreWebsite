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
<title>失物招領-後台(新增)</title>
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
					<h1>失物招領管理-新增</h1>
					<form:form modelAttribute="lost" method="post"
						action="${contextRoot}/LostAndFoundBack/post">
						<form:label path="founddate">拾獲日期:</form:label>
						<form:input type="date" path="founddate" />
						<br>
						<form:label path="item">拾獲品項/數量:</form:label>
						<form:input path="item" />
						<br>
						<form:label path="place">拾獲地點:</form:label>
						<form:input path="place" />
						<br>
						<form:label path="state">狀態:</form:label>
						<form:select path="state">
							<form:option value="館內招領中">館內招領中</form:option>
							<form:option value="已領取">已領取</form:option>
							<form:option value="已送往警局">已送往警局</form:option>
						</form:select>
						<br>
						<button type="submit">送出</button>
					</form:form>
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