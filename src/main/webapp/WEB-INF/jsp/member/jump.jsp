<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Jump</title>
	<script>
		setTimeout(function() {
			window.location.href = "${pageContext.request.contextPath}/";
		}, 3000);
	</script>
</head>
<body>
	<div style="text-align:center;">
		<h1>成功！即將跳轉...</h1>
		<p>若未跳轉，請點擊<a href="${pageContext.request.contextPath}/">這裡</a></p>
	</div>
</body>
</html>