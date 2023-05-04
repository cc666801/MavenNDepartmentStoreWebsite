<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>商品查詢</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#search-form").submit(function(event) {
				event.preventDefault(); // 阻止表單提交
				var name = $("#name").val();
				$.ajax({
					url: "/api/commodities?name=" + name, // 呼叫商品查詢 API
					type: "GET",
					success: function(data) {
						$("#results").empty();
						if (data.length == 0) {
							$("#results").append("<p>查無商品</p>");
						} else {
							$.each(data, function(index, commodity) {
								$("#results").append("<p>" + commodity.commName + "</p>");
							});
						}
					},
					error: function() {
						alert("查詢失敗");
					}
				});
			});
		});
	</script>
</head>
<body>
	<h1>商品查詢</h1>
	<form id="search-form">
		<label for="name">商品名稱：</label>
		<input type="text" id="name" name="name">
		<input type="submit" value="查詢">
	</form>
	<div id="results"></div>
</body>
</html>
