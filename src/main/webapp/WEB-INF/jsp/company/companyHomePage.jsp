<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
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
<body>
<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
<!-- End Header --> 

	<main id="main">
	<div>廠商頁面</div>
	<a href="${contextRoot}/company/addCompanyPage">新增廠商資料</a>
	<a href="${contextRoot}/company/showAllCompanys">所有廠商資料(分頁)</a>
	<a href="${contextRoot}/company/showEditedCompany?id=1">找到被更新的資料頁面</a>
	
	</main><!-- End #main -->
	
<!-- ======= Footer ======= -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- End Footer --> 
	 
</body>
</html>