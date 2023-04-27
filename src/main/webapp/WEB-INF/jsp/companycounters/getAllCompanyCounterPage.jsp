<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
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

	<div id="layoutSidenav">

		<!-- ======= SiderNav ======= -->
		<jsp:include page="../layout/sideNavForBackend.jsp"></jsp:include>
		<!-- End SiderNav -->

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">

					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> DataTable Example
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>companyId</th>
										<th>companyName</th>
										<th>counterName</th>
										<th>contractTime</th>
										<th>onCounterTime</th>
										<th>offCounterTime</th>
										<th>更新按鈕</th>
<!-- 										<th>刪除按鈕</th> -->
										
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</tfoot>
								<tbody id="tableBody">
									<tr>
										<th>companyId</th>
										<th>companyName</th>
										<th>counterName</th>
										<th>contractTime</th>
										<th>onCounterTime</th>
										<th>offCounterTime</th>
										<th>更新按鈕</th>
<!-- 										<th>刪除按鈕</th> -->
										
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<!-- End #main -->

			<!-- ======= Footer ======= -->
			<jsp:include page="../layout/footerForBackend.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>
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
		
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		var myTableBody = document.getElementById('tableBody');
		var myHeaders = new Headers();
		myHeaders.append("Cookie", "JSESSIONID=A88D4C1EF2D373665EDA0CE10F5710E2");

		var raw = "";

		var requestOptions = {
		  method: 'GET',
		  headers: myHeaders,
		  redirect: 'follow'
		};
		fetch("http://localhost:8080/MavenNDepartmentStoreWebsite/api/companyCounter/", requestOptions)
		  .then(response => response.json())
		  .then(response => response)
		  .then(result => {
		  			
		  		let tableData='';
		  		result.forEach(function (value, index) {
		  			tableData += '<tr>';
		  			tableData += '<td>' + value.companyId + '</td>';
		  			tableData += '<td>' + value.companyName + '</td>';
		  			tableData += '<td>' + value.counterName + '</td>';
		  			tableData += '<td>' + value.contractTime + '</td>';
		  			tableData += '<td>' + value.onCounterTime + '</td>';
		  			tableData += '<td>' + value.offCounterTime + '</td>';
		  			tableData += '<td><a href="${contextRoot}/companycounters/findCompanyCounterById?companyId=' + encodeURIComponent(value.companyId) + '&counterId=' + encodeURIComponent(value.counterId) + '&onCounterTime=' + encodeURIComponent(value.onCounterTime) + '">更新</a></td>';
// 		  			tableData += '<td><button id="deleteButton" onclick="deleteCompany(' + value.companyId + ')">刪除</button></td>';
		  			tableData += '</tr>';  			
	            });
		  		myTableBody.innerHTML = "";
		  		myTableBody.innerHTML = tableData;
		  		
		  })
		  .catch(error => console.log('error', error));
		});
</script>
</body>
</html>