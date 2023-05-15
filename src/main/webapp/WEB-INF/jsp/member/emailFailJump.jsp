<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>失敗！哭阿...</title>
	<script>
		setTimeout(function() {
			window.location.href = "${pageContext.request.contextPath}/";
		}, 3000);
	</script>
</head>
<body>
	<div style="text-align:center;">
		<h1>失敗！哭阿...</h1>
		<h2>拍薩啦...請再試一次</h2>
		<p>若未跳轉，請點擊<a href="${pageContext.request.contextPath}/">這裡</a></p>
	</div>
</body>
</html>