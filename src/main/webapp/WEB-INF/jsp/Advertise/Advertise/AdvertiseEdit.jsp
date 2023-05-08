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

			<main id="main" class="container my-5">

				<h1 class="mb-3">修改廣告詳細資訊後台(修改後顯示畫面)</h1>




				<form:form modelAttribute="advertise" method="put"
					action="${contextRoot}/Advertise/Advertise/editAdvertise"
					enctype="multipart/form-data">

					<form:label path="advertiseId">廣告序號</form:label>
					<form:input path="advertiseId" readonly="true" />
					<br>
					<form:label path="advertiseName">廣告名稱</form:label>
					<form:input path="advertiseName" />


					<br>
					<form:label path="advertiseDesc">廣告敘述</form:label>
					<form:input path="advertiseDesc" />
					<br>




		<form:label path="company">類別分類</form:label>
					<form:select path="company">
						<c:forEach items="${companyList}" var="company">
						
						
						<c:choose>
								<c:when
									test="${advertise.company.companyId == company.companyId}">
									<form:option value="${company.companyId}"
										selected="selected">${company.companyName}</form:option>
								</c:when>
								<c:otherwise>
							<option value="${company.companyId}">${company.companyName}</option>
								</c:otherwise>


							</c:choose>
												
						</c:forEach>
					</form:select>


					<form:label path="advertiseCate">類別分類</form:label>
					<form:select path="advertiseCate">

						<c:forEach items="${advertiseCateList}" var="advertisecate">
						
							<c:choose>
								<c:when
									test="${advertise.advertiseCate.advertiseCateId == advertisecate.advertiseCateId}">
									<form:option value="${advertisecate.advertiseCateId}"
										selected="selected">${advertisecate.advertiseCateName}</form:option>
								</c:when>
								<c:otherwise>
									<form:option value="${advertisecate.advertiseCateId}">${advertisecate.advertiseCateName}</form:option>
								</c:otherwise>


							</c:choose>
						</c:forEach>
					</form:select>


					




					<form:label path="advertiseFee">廣告價格</form:label>
					<form:input path="advertiseFee" />
					<br>
					<form:label path="advertiseDiscount">廣告折扣(請輸入1以內之小數)</form:label>
					<form:input path="advertiseDiscount" />
					<br>
					<label for="advertiseShelve">廣告上下架</label>
					<input type="radio" id="advertiseShelvetrue" name="advertiseShelve"
						value="true">
					<label for="advertiseShelvetrue">上架</label>
					<input type="radio" id="advertiseShelvefalse"
						name="advertiseShelve" value="false">
					<label for="advertiseShelvefalse">下架</label>
					<br>
					<form:label path="advertisePicture">廣告照片</form:label>
					<form:input path="transferToByteArray" type="file" id="formfile" />
					<br>
					<form:label path="advertiseURL">廣告URL</form:label>
					<form:input path="advertiseURL" />
					<br>
					<form:label path="advertiseFrequency">商品點擊次數</form:label>
					<form:input path="advertiseFrequency" />
					<br>

					<form:label path="advertiseStartDay">廣告上架日期</form:label>
					<form:input type="datetime-local" path="advertiseStartDay" />

					<br>

					<form:label path="advertiseRemoveDay">廣告下架日期</form:label>
					<form:input type="datetime-local" path="advertiseRemoveDay" />
					<br>




					<button type="submit">送出</button>
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