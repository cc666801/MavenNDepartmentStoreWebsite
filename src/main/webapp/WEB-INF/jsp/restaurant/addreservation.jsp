<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂位頁面</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<main id="main">
	<div>
		<form:form class="form-control" method="post" modelAttribute="reservation" action="${contextRoot}/reservation/post">
<!-- 			${contextRoot}/reservation/post
				<label for="RId">餐廳：</label> -->
<!-- 			<input type="text" id="RId" name="Resid"><br><br> -->
			<label for="NId">姓名：</label><br>
			<form:input type="text" path="name" id="NId"/><br>
			<label for="TId">電話：</label><br>
			<form:input type="text" path="telephone" id="TId"/><br>
			<label for="EId">email:</label><br>
			<form:input type="text" path="email" id="EId" /><br>
			<label for="note">備註：</label><br>
			<form:textarea id="note" path="remark" cols="30" rows="10"></form:textarea><br>
			<label for="DId">日期：</label><br>
			<form:input type="date" path="date" id="DId"/><br>
			<label for="TimeId">時段：</label><br>
			<form:select path="time_interval" id="TimeId" class="form-select" style="width: 200px">
			    <form:option value="中午"></form:option>
			    <form:option value="下午"></form:option>
				<form:option value="晚上"></form:option>
			</form:select>
			
			<label for="meeting-time">選擇時間：</label><br>
		    <form:input type="time" path="time" id="meeting-time" value="09:00" step="1800"/><br>
			<label for="AId">大人：</label><br>
			<form:select path="adult" id="AId" class="form-select" style="width: 200px">
				<jstl:forEach var="i" begin="0" end="10">
					<form:option value="${i}"></form:option>
				</jstl:forEach>
			</form:select>
			
			<label for="CId">小孩：</label><br>
			<form:select path="children" id="CId" class="form-select" style="width: 200px">
				<jstl:forEach var="i" begin="0" end="10">
					<form:option value="${i}"></form:option>
				</jstl:forEach>
			</form:select>
			
			<button type="submit" class="btn btn-primary">送出</button>
		</form:form>
	</div>	
	</main>
</body>
</html>