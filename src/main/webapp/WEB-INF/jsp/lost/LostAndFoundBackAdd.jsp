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
<title>失物招領-後台(新增)</title>
</head>
<body>
<form:form modelAttribute="lost" method="post" action="${contextRoot}/LostAndFoundBack/post">
	<form:label path="founddate">拾獲日期:</form:label>
	<form:input  type="date" path="founddate"/><br>
	<form:label path="item">拾獲品項/數量:</form:label>
	<form:input path="item"/><br>
	<form:label path="place">拾獲地點:</form:label>
	<form:input path="place"/><br>
	<form:label path="state">狀態:</form:label>
	<form:select path="state">	
	<form:option value="館內招領中">館內招領中</form:option>
	<form:option value="已領取">已領取</form:option>
	<form:option value="已送往警局">已送往警局</form:option>
	</form:select>
	
	<br>
	<button type="submit" class="btn btn-primary">送出</button>
</form:form>
</body>
</html>