<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>

<!DOCTYPE html>
<html>
<head>

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
						<!-- 						<div class="card-header"> -->
						<!-- 							<i class="fas fa-table me-1"></i> DataTable Example -->
						<!-- 						</div> -->
						<div class="card-body">
						<h1>廠商上櫃登記</h1>
							<form:form method="POST" modelAttribute="companyCounter" action="${contextRoot}/companycounters/save">
								<form:hidden path="id.companyId" />
								<form:hidden path="id.counterId" />
								<div class="form-group">
									<label for="companyName">Company Name:</label>
									<form:select path="company" class="form-control"
										id="companyName">
										<form:option value="">--Select Company--</form:option>
										<form:options items="${companies}" itemValue="companyId"
											itemLabel="companyName" />
									</form:select>
								</div>

								<div class="form-group">
									<label for="counterName">Counter Name:</label>
									<form:select path="counter" class="form-control"
										id="counterName">
										<form:option value="">--Select Counter--</form:option>
										<form:options items="${counters}" itemValue="counterId"
											itemLabel="counterName" />
									</form:select>
								</div>

								<div class="form-group">
									<label for="contractTime">Contract Time: </label>
									<form:select path="contractTime" class="form-control"
										id="contractTime">
										<form:option value="">--Select Contract Time--  (Year)</form:option>
										<jstl:forEach var="i" begin="1" end="5">
											<form:option value="${i}">${i}</form:option>
										</jstl:forEach>
									</form:select>
								</div>

								<button type="submit" class="btn btn-primary">Submit</button>

							</form:form>


							<!-- 							<table id="datatablesSimple"> -->
							<!-- 								<thead> -->
							<!-- 									<tr> -->
							<!-- 										<th>Name</th> -->
							<!-- 										<th>Position</th> -->
							<!-- 										<th>Office</th> -->
							<!-- 										<th>Age</th> -->
							<!-- 										<th>Start date</th> -->
							<!-- 										<th>Salary</th> -->
							<!-- 									</tr> -->
							<!-- 								</thead> -->
							<!-- 								<tfoot> -->
							<!-- 									<tr> -->
							<!-- 										<th>Name</th> -->
							<!-- 										<th>Position</th> -->
							<!-- 										<th>Office</th> -->
							<!-- 										<th>Age</th> -->
							<!-- 										<th>Start date</th> -->
							<!-- 										<th>Salary</th> -->
							<!-- 									</tr> -->
							<!-- 								</tfoot> -->
							<!-- 								<tbody> -->
							<!-- 									<tr> -->
							<!-- 										<td>Tiger Nixon</td> -->
							<!-- 										<td>System Architect</td> -->
							<!-- 										<td>Edinburgh</td> -->
							<!-- 										<td>61</td> -->
							<!-- 										<td>2011/04/25</td> -->
							<!-- 										<td>$320,800</td> -->
							<!-- 									</tr> -->


							<!-- 								</tbody> -->
							<!-- 							</table> -->
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
</body>
</html>