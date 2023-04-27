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

		<h1 style="padding-top: 100px;">新增產品詳細資訊後台(新增後顯示畫面)</h1>



		<form action="${contextRoot}/Store/Commodity/add">
			<button type="submit" class="btn btn-primary mb-3">新增</button>
		</form>


		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">商品序號</th>
					<th scope="col">商品名稱</th>
					<th scope="col">商品照片</th>
					<th scope="col">類別序號</th>
					<th scope="col">商品敘述</th>
					<th scope="col">商品價格</th>
					<th scope="col">商品折扣</th>
					<th scope="col">商品上下架</th>
					<th scope="col">商品建立日期</th>
					<th scope="col">商品修改日期</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="commodity" items="${commodityList}">

					<tr>
						<td>${commodity.comm_Id}</td>
						<td>${commodity.comm_Name}</td>
						<td><img
							src="data:image/png;base64,${commodity.base64Stringcomm_Picture}"
							style="width: 100px; height: 100px;" /></td>



						<td>${cate.cate_Id}</td>
						<td>${commodity.comm_Desc}</td>
						<td>${commodity.comm_Price}</td>
						<td>${commodity.comm_Discount}</td>
						<td>${commodity.comm_Shelve}</td>
						<td>${commodity.comm_CDay}</td>
						<td>${commodity.comm_MDay}</td>
						<td><form:form
								action="${contextRoot}/Store/Commodity/editCommodity"
								method="get">
								<input type="hidden" name="comm_Id" value="${commodity.comm_Id}">
								<button type="submit" class="btn btn-warning">編輯</button>


							</form:form></td>
						<td><form:form action="${contextRoot}/Store/Commodity/delete"
								method="DELETE">
								<input type="hidden" name="comm_Id" value="${commodity.comm_Id}">
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