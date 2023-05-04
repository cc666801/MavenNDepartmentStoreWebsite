<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>會員登入</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<main id="main">
		<h1 style="text-align: center;">會員登入</h1>
	    <form:form method="POST" modelAttribute="member" action="${contextRoot}/member/login">
	        <table style="margin: 0 auto;">
	            <tr>
	                <td>帳號：</td>
	                <td><form:input path="account" /></td>
	            </tr>
	            <tr>
	                <td>密碼：</td>
	                <td><form:password path="password" /></td>
	            </tr>
	            <tr>
	                <td colspan="2" style="text-align: center;"><input type="submit" class="btn btn-outline-primary" value="登入" />
	                <a
						href="${contextRoot}/member/register" class="btn btn-outline-primary">註冊</a>
	                </td>
	            </tr>
	        </table>
	    </form:form>
	    <c:if test="${not empty error}">
	        <p style="color: red; text-align: center;">${error}</p>
	    </c:if>
    </main>
</body>
</html>
