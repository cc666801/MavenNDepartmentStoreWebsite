<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
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
<body>
<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
<!-- End Header --> 

	<main id="main">
	<div>所有廠商資料(分頁)
	<jstl:forEach items="${page.content}" var="company">
		<div>${company.companyId}</div>
	</jstl:forEach>
	
	<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<jstl:choose>
					<jstl:when test="${page.number+1 != pageNumber}">
						<a href="${contextRoot}/company/showAllCompanys?page=${pageNumber}">${pageNumber}</a>				
					</jstl:when>
					<jstl:otherwise>						
						<span>${pageNumber}</span>				
					</jstl:otherwise>
				</jstl:choose>
				
				<jstl:if test="${pageNumber != page.totalPages}">
					<span>-</span>	
				</jstl:if>
			</jstl:forEach>
	</div>
	</main><!-- End #main -->
	
<!-- ======= Footer ======= -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- End Footer --> 
	 
</body>
</html>