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
	<jsp:include page="../layout/headerForBackend.jsp" ></jsp:include>
	<!-- End Header -->

	<div id="layoutSidenav">

		<!-- ======= SiderNav ======= -->
		<jsp:include page="../layout/sideNavForBackend.jsp"></jsp:include>
		<!-- End SiderNav -->

		<div id="layoutSidenav_content" style="background-color: #fdf5e6">
			<main>
				<h1>新增訂位</h1>
				<div>
					<form:form class="form-control" method="post"
						modelAttribute="reservation"
						action="${contextRoot}/reservation/post">
						<label for="CId">餐廳：</label>
						<form:select path="company" id="CId" class="form-select"
							style="width: 200px">
							<jstl:forEach items="${findAllCompany}" var="comp">
							
								<form:option value="${comp.companyId}">${comp.companyName}</form:option>
							</jstl:forEach>
						</form:select>

						<label for="NId">姓名：</label>
						<br>
						<form:input type="text" path="name" id="NId" />
						<br>
						<label for="TId">電話：</label>
						<br>
						<form:input type="text" path="telephone" id="TId" />
						<br>
						<label for="EId">email:</label>
						<br>
						<form:input type="text" path="email" id="EId" />
						<br>
						<label for="note">備註：</label>
						<br>
						<form:textarea id="note" path="remark" cols="30" rows="10"></form:textarea>
						<br>
						<label for="DId">日期：</label><br>
						
						<form:input type="date" path="date" id="DId" /><br>
						
						<label for="TimeId">時段：</label><br>
						
						<form:select path="time_interval" id="TimeId" class="form-select"
							style="width: 200px">
							<form:option value="中午">中午</form:option>
							<form:option value="下午">下午</form:option>
							<form:option value="晚上">晚上</form:option>
						</form:select>

						<label for="meeting-time">選擇時間：</label><br>					
						<form:select path="time" id="meeting-time" class="form-select"
							style="width: 200px">
							
							<jstl:forEach var="i" begin="10" end="20">
								<jstl:forEach var="j" begin="00" end="30" step="30">
								<option value="${i}:<fmt:formatNumber value="${j}" pattern="00"/>">${i}:<fmt:formatNumber value="${j}" pattern="00"/></option>
								</jstl:forEach>
							</jstl:forEach>
						
						</form:select>
						
						<label for="AId">大人：</label><br>
						<form:select path="adult" id="AId" class="form-select"
							style="width: 200px">
							<jstl:forEach var="i" begin="0" end="10">
								<option value="${i}">${i}</option>
							</jstl:forEach>
						</form:select>

						<label for="CId">小孩：</label><br>
						<form:select path="children" id="CId" class="form-select"
							style="width: 200px">
							<jstl:forEach var="i" begin="0" end="10">
								<option value="${i}">${i}</option>
							</jstl:forEach>
						</form:select><br>

						<button type="submit" class="btn btn-primary">送出</button>
					</form:form>
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