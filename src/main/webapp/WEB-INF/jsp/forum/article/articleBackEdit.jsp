<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯文章</title>

<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">

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
				<div class="card">
					<h1>編輯文章</h1>
					<form:form modelAttribute="art" method="put"
						action="${contextRoot}/articleBack/edit">
						<form:label path="articleID">文章編號:</form:label>
						<form:input type="hidden" path="articleID" />
						<br>
						<form:label path="articleTitle">標題:</form:label>
						<form:input path="articleTitle" />
						<br>

						<form:label path="articleCategory">類別:</form:label>
						<form:select path="articleCategory">
							<c:forEach items="${categoryList}" var="category">
								<form:option value="${category.articleCategoryID}">${category.articleCategoryName}</form:option>
							</c:forEach>
						</form:select>
						<br>

						<form:hidden name="articleContent" path="articleContent"
							id="summernote-input" />
						<div id="summernote">${articleContent}</div>
						<button type="submit">送出</button>
					</form:form>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Summernote JS - CDN Link -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


	<script>
		$(document).ready(function() {
			$('#summernote').summernote({

				codeviewFilter : true,
				codeviewIframeFilter : true,
				callbacks : {
					onChange : function(contents, $editable) {
						$('#summernote-input').val(contents);
					}
				}
			});
		});
		
	</script>



</body>

</html>