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

				<h1>新增廣告詳細資料(新增)</h1>
				<form:form method="post" modelAttribute="advertise"
					action="${contextRoot}/Advertise/Advertise/post"
					enctype="multipart/form-data">


					<form:label path="advertiseName">廣告名稱</form:label>
					<form:input path="advertiseName" type="text" />
					<br>
					<form:label path="advertiseDesc">廣告敘述</form:label>
					<form:input path="advertiseDesc" />
					<br>
					<form:label path="advertisePicture">廣告照片</form:label>
					<form:input path="transferToByteArray" type="file" id="formfile" />
					<br>

					<div>

						<form:label path="AdvertiseCate">類別分類</form:label>
						<form:select path="AdvertiseCate">

							<c:forEach items="${AdvertiseCateList}" var="AdvertiseCate">
								<form:option value="${AdvertiseCate.advertiseCateId}">${AdvertiseCate.advertiseCateName}</form:option>
							</c:forEach>
						</form:select>
						<br>
					</div>

					<div>

						<form:label path="Company">公司</form:label>
						<form:select path="Company">

							<c:forEach items="${CompanyList}" var="CompanyList">
								<form:option value="${CompanyList.companyId}">${CompanyList.companyName}</form:option>
							</c:forEach>
						</form:select>
						<br>
					</div>





					<form:label path="advertiseFee">廣告價格</form:label>
					<form:input path="advertiseFee" />
					<br>
					<form:label path="advertiseDiscount">廣告折扣</form:label>
					<form:input path="advertiseDiscount" />
					<br>
					<form:label path="advertiseURL">廣告URL</form:label>
					<form:input path="advertiseURL" />
					<br>

					<form:label path="advertiseFrequency">設置廣告點級次數</form:label>
					<form:input path="advertiseFrequency" />
					<br>

					<form:label path="advertiseStartDay">廣告上架日期</form:label>
					<form:input type="datetime-local" path="advertiseStartDay" />

					<br>



					<form:label path="advertiseRemoveDay">廣告下架日期</form:label>
					<form:input type="datetime-local" path="advertiseRemoveDay" />
					<br>

					<!-- 					嘗試新增 日期選擇器 原本的程式碼 -->

					<%-- 				<form:input path="advertiseRemoveDay" id="datepicker" /> --%>



					<label for="advertiseShelve">廣告上下架</label>
					<input type="radio" id="advertiseShelvetrue" name="advertiseShelve"
						value="true">
					<label for="advertiseShelve">上架</label>
					<input type="radio" id="advertiseShelvefalse"
						name="advertiseShelve" value="false">
					<label for="advertiseShelvefalse">下架</label>
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


	<!-- 嘗試新增日期選擇器 -->

	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>

</body>
</html>