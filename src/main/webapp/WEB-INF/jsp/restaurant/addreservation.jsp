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
	<jsp:include page="${contextRoot}/layout/header"></jsp:include>
	<div>
		<form:form class="form-control" method="post" action="${contextRoot}/reservation/post">
<!-- 			<label for="RId">餐廳：</label> -->
<!-- 			<input type="text" id="RId" name="Resid"><br><br> -->
			<label for="NId">姓名：</label><br>
			<form:input type="text" path="name" modelAttribute="reservation" id="NId"/><br><br>
<!-- 			<label for="TId">電話：</label><br> -->
<!-- 			<input type="text" id="TId" name="Telephone"><br><br> -->
<!-- 			<label for="EId">email:</label> -->
<!-- 			<input type="text" id="EId" name="Email"><br><br> -->
<!-- 			<label for="note">備註：</label> -->
<!-- 			<textarea id="note" name="Remark" rows="5" cols="50"></textarea><br><br> -->
<!-- 			<label for="DId">日期：</label> -->
<!-- 			<input type="date" id="DId" name="Date"><br><br> -->
<!-- 			<label for="TimeId">時段：</label> -->
<!-- 			<input type="text" id="TimeId" name="Timeinterval"><br><br> -->
<!-- 			<label for="meeting-time">選擇時間：</label> -->
<!-- 		    <input type="time" id="meeting-time" name="Time" value="09:00" step="1800"><br><br> -->
<!-- 			<label for="AId">大人：</label> -->
<!-- 			<input type="text" id="AId" name="Adult"><br><br> -->
<!-- 			<label for="CId">小孩：</label> -->
<!-- 			<input type="text" id="CId" name="Child"><br><br> -->
				<button type="submit" class="btn btn-primary">送出</button>
		</form:form>
	</div>	
	
</body>
</html>