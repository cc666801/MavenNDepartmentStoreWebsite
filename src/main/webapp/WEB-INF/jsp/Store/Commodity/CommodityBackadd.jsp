<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<!-- =======================================================
  * Template Name: ZenBlog
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
  * Author: BootstrapMade.com
  * License: https:///bootstrapmade.com/license/
  ======================================================== -->
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
			<main id="main">

		<h1>新增商品頁面後台(新增)</h1>
		<form:form method="post" modelAttribute="commodity"
			action="${contextRoot}/Store/Commodity/post"
			enctype="multipart/form-data">


			<form:label path="commName">商品名稱</form:label>
			<form:input path="commName" type="text" />
			<br>
			<form:label path="commDesc">商品敘述</form:label>
			<form:input path="commDesc" />
			<br>
			<form:label path="commPicture">商品照片</form:label>
			<form:input path="transferToByteArray" type="file" id="formfile" />
			<br>
			
			<div>
			
			<form:label path="cateId">類別分類</form:label>
			<form:select path="cateId">
			
				<c:forEach  items="${commcateList}"  var="commcate">
				<form:option value="${commcate.cateId}">${commcate.cateName}</form:option>
				</c:forEach>
			</form:select>
			<br>
			</div>
			

			<form:label path="commPrice">商品價格</form:label>
			<form:input path="commPrice" />
			<br>
			<form:label path="commDiscount">商品折扣</form:label>
			<form:input path="commDiscount" />
			<br>
			<label for="comm_Shelve">商品上下架</label>
			<input type="radio" id="commShelvetrue" name="commShelve"
				value="true">
			<label for="commShelvetrue">上架</label>
			<input type="radio" id="commShelvefalse" name="commShelve"
				value="false">
			<label for="commShelvefalse">下架</label>
			<br>

			<button type="submit" value="確定">送出</button>
		</form:form>
	</main>
		
			

			<!-- End #main -->

			<!-- ======= Footer ======= -->
			<jsp:include page="../../layout/footerForBackend.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>
	<!-- 	<script> -->
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextRoot}/assetsForBackend/js/scripts.js"></script>
<!-- 	<script -->
<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" -->
<!-- 		crossorigin="anonymous"></script> -->
<%-- 	<script src="${contextRoot}/assetsForBackend/demo/chart-area-demo.js"></script> --%>
<%-- 	<script src="${contextRoot}/assetsForBackend/demo/chart-bar-demo.js"></script> --%>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>

	<!-- 	</script> -->
	
</body>
</html>