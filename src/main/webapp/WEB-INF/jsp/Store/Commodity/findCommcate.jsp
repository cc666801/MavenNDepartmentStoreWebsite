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
<title>商城首頁</title>
<!-- 引入 Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">



<!-- ** Plugins Needed for the Project ** -->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/themify/css/themify-icons.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/counto/animate.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/aos/aos.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/magnific-popup/magnific-popup.css">
<link rel="stylesheet"
	href="${contextRoot}/assetsForFrontend/store/plugins/animated-text/animated-text.css">

<!-- Main Stylesheet -->
<link href="${contextRoot}/assetsForFrontend/store/css/style.css"
	rel="stylesheet">






</head>
<body>
	
	<main id="main">

		<!-- 			嘗試套分類樣版  有出現 但未能實現 -->



		<div class="text-center my-4">
			<a href="${contextRoot}/Store/Commodity/findAllComm"
				class="btn btn-primary mx-3">返回商品總表</a>
			<c:forEach var="findAllCate" items="${findAllCate}"
				varStatus="status">
				<a
					href="${contextRoot}/Store/Commodity/findAllCommByCate?cateId=${findAllCate.cateId}"
					class="btn btn-primary mx-3 my-2">${findAllCate.cateName}</a>
			</c:forEach>
		</div>


		



		<div class="d-flex justify-content-end">
			<form class="form-inline my-2 my-lg-0"
				action="${contextRoot}/Store/Commodity/findCommByName" method="get">
				<div class="input-group">
					<input type="text" class="form-control" id="commName"
						name="commName" placeholder="輸入商品名稱...">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit">搜尋</button>
					</div>
				</div>
			</form>
		</div>


</main>

</body>
</html>