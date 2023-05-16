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

				<h1 class="mb-3">廣告資料後台</h1>
				<form action="${contextRoot}/Advertise/Advertise/add">
					<button type="submit" class="btn btn-primary mb-3">新增</button>
				</form>
				<table class="table table-striped" id="datatablesSimple">
					<!-- 				上面這行會出現套版效果 -->
					<thead class="thead-dark">
						<tr>
							<th scope="col">廣告資料id</th>
							<th scope="col">廣告資料名稱</th>
							<th scope="col">廣告圖片</th>
							<th scope="col">廣告資料敘述</th>
							<th scope="col">廣告類別</th>
							<th scope="col">廣告資料URL</th>
							<th scope="col">廣告廠商</th>
							<th scope="col">廣告資料建立日期</th>
							<th scope="col">廣告資料修改日期</th>
							<th scope="col">廣告資料上架日期</th>
							<th scope="col">廣告資料下架日期</th>
							<th scope="col">廣告資料上下架</th>
							<th scope="col">廣告資料費用</th>
							<th scope="col">廣告資料折扣</th>
							<th scope="col">廣告點擊次數設定</th>
							<th scope="col">廣告已被點擊次數</th>
							<th scope="col">編輯</th>
							<th scope="col">刪除</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="advertise" items="${advertiseList}">
							<tr>
								<td>${advertise.advertiseId}</td>
								<td>${advertise.advertiseName}</td>
								<td><img
									src="data:image/png;base64,${advertise.base64StringadvertisePicture}"
									style="width: 100px; height: 100px;" /></td>

								<td>${advertise.advertiseDesc}</td>
								<td>${advertise.advertiseCate.advertiseCateName}</td>
								<td>${advertise.advertiseURL}</td>
								<td>${advertise.company.companyName}</td>
								<td>${advertise.advertiseCDay}</td>
								<td>${advertise.advertiseMDay}</td>
								<td>${advertise.advertiseStartDay}</td>
								<td>${advertise.advertiseRemoveDay}</td>
								<td>${advertise.advertiseShelve}</td>
								<td>${advertise.advertiseFee}</td>
								<td>${advertise.advertiseDiscount}</td>
								<td>${advertise.advertiseFrequency}</td>
								<td>${advertise.advertiseClick}</td>
								<td><form:form
										action="${contextRoot}/Advertise/Advertise/editAdvertise"
										method="get">
										<input type="hidden" name="advertiseId"
											value="${advertise.advertiseId}">
										<button type="submit" class="btn btn-warning">編輯</button>


									</form:form></td>
								<td><form:form
										action="${contextRoot}/Advertise/Advertise/delete"
										method="DELETE">
										<input type="hidden" name="advertiseId"
											value="${advertise.advertiseId}">
										<button type="submit" class="btn btn-danger">刪除</button>
									</form:form></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

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