<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
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
	<jsp:include page="../layout/headerForBackend.jsp"></jsp:include>
	<!-- End Header -->

	<div id="layoutSidenav" style="background-color: #fdf5e6">

		<!-- ======= SiderNav ======= -->
		<jsp:include page="../layout/sideNavForBackend.jsp"></jsp:include>
		<!-- End SiderNav -->

		<div id="layoutSidenav_content">
			<main>
				<h1>訂位單查詢</h1>
				<div>
					<a href="${contextRoot}/restaurant/add"><button
							class="btn btn-dark">新增</button></a>
				</div>
				
				<div>
				<table id="datatablesSimple" class="table table-success table-striped" >
					<thead>
						<tr>
<!-- 				        <td>訂位單號碼</td> -->
							<th>餐廳</th>     
							<th>姓名</th>
							<th>電話</th>
							<th>email</th>
							<th>備註</th>
							<th>日期</th>
							<th>時段</th>
							<th>時間</th>
							<th>大人</th>
							<th>小孩</th>
							<th>編輯</th>
							<th>刪除</th>
						</tr>
					</thead>
					<tbody>
						<jstl:forEach items="${findAllReservation}" var="far">
							<tr>
								<%-- 	<td>${far.id}</td>    --%>
								<td>${far.restaurantInformation.company.companyName}</td>
								<td>${far.name}</td>
								<td>${far.telephone}</td>
								<td>${far.email}</td>
								<td>${far.remark}</td>
								<td>${far.date}</td>
								<td>${far.timeInterval}</td>
								<td>${far.time}</td>
								<td>${far.adult}</td>
								<td>${far.children}</td>
								<td><form action="${contextRoot}/restaurant/edit">
										<input type="hidden" name="r_id" value="${far.r_id}" /> <input
											type="submit" class="btn btn-warning btn-sm" value="編輯" />
									</form></td>
								<td><form action="${contextRoot}/restaurant/delete"
										method="post">
										<input type="hidden" name="_method" value="delete" /> <input
											type="hidden" name="r_id" value="${far.r_id}" /> <input
											type="submit" class="btn btn-danger btn-sm" value="刪除" />
									</form></td>
								<%-- 			<td><a href="DeleteBookById.do?Id=${m.id}"><button>刪除</button></a></td> --%>
							</tr>
						</jstl:forEach>
					</tbody>
				</table>
			</div>
			</main>

			<!-- End #main -->

			<!-- ======= Footer ======= -->
			<jsp:include page="../layout/footerForBackend.jsp"></jsp:include>
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