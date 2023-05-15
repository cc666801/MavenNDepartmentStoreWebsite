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
<title>文章管理-後台</title>
<style>
img {
	max-width: 100px;
	max-height: 100px;
}

.popup-wrap {
	width: 100%;
	height: 100%;
	display: none;
	position: fixed;
	top: 0px;
	left: 0px;
	content: '';
	background: rgba(0, 0, 0, 0.85);
	z-index: 9999;
}

.popup-box {
	width: 100%;
	height: 100%;	
	transform: translate(-50%, -50%) scale(2);
	position: absolute;
	top: 50%;
	left: 50%;
	box-shadow: 0px 2px 16px rgba(0, 0, 0, 0.5);
	border-radius: 3px;
	background: #fff;
	text-align: center;
	z-index: 10000;
}

.close-btn {
	width: 50px;
	height: 50px;
	display: inline-block;
	position: absolute;
	top: 10px;
	right: 10px;
	border-radius: 100%;
	background: #d75f70;
	font-weight: bold;
	text-decoration: none;
	color: #fff;
	line-height: 40px;
	font-size: 32px;
}

.transform-in, .transform-out {
	display: block;
	-webkit-transition: all ease 0.5s;
	transition: all ease 0.5s;
}

.transform-in {
	-webkit-transform: translate(-50%, -50%) scale(2);
	transform: translate(-50%, -50%) scale(2);
}

.transform-out {
	-webkit-transform: translate(-50%, -50%) scale(0.9);
	transform: translate(-50%, -50%) scale(0.9);
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body class="sb-nav-fixed">
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/headerForBackend.jsp"></jsp:include>
	<!-- End Header -->

	<div id="layoutSidenav">

		<!-- ======= SiderNav ======= -->
		<jsp:include page="../../layout/sideNavForBackend.jsp"></jsp:include>
		<!-- End SiderNav -->

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1>文章管理</h1>
					<div>
						<form action="${contextRoot}/articleBack/add"
							style="display: inline-block;">
							<button type="submit">新增文章</button>
						</form>

						<button class="popup-btn" id="popup-btn" type="submit">文章類別設定</button>
						

						<div class="popup-wrap" id="letmeopen">
							<div class="popup-box transform-out">
							<div id="config"></div>
								<a class="close-btn popup-close" href="#">x</a>
							</div>
						</div>
					</div>
					<br>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>文章管理列表
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>縮圖</th>
										<th>文章編號</th>
										<th>標題</th>
										<th>發文者帳號</th>
										<th>類別</th>
										<th>文章內容</th>
										<th>建立日期</th>
										<th>最後更新日期</th>
										<th>編輯</th>
										<th>刪除</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="art" items="${artList}">
										<tr>
											<td><img
												src="data:image/jpeg;base64,${art.articleBase64}"></td>
											<td>${art.articleID}</td>
											<td>${art.articleTitle}</td>
											<td>${art.member.account}</td>
											<td>${art.articleCategory.articleCategoryName}</td>
											<td><a
												href="${contextRoot}/articleContent/${art.articleID}">文章內容</a></td>
											<td>${art.articleCreateTime}</td>
											<td>${art.articleEditTime}</td>
											<td><form action="${contextRoot}/articleBack/edit">
													<input type="hidden" name="id" value="${art.articleID}" />
													<input type="submit" value="編輯" />
												</form></td>
											<td><form action="${contextRoot}/articleBack/delete"
													method="post" onclick="return confirm('確定要刪除這篇文章嗎?')">
													<input type="hidden" name="_method" value="delete" /> <input
														type="hidden" name="id" value="${art.articleID}" /> <input
														type="submit" value="刪除" />
												</form></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<!-- End #main -->

			<!-- ======= Footer ======= -->
			<jsp:include page="../../layout/footerForBackend.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>

	<!-- =============================== bootstrap ================================================= -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextRoot}/assetsForBackend/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>
	<!-- =================================== bootstrap ============================================= -->
	<script>
	$(document).ready(function() {
		// 當按下設定按鈕時顯示彈出視窗
		$("#popup-btn").click(function() {
			$("#letmeopen").fadeIn(250);
			$("#letmeopen").children("popup-box").removeClass("transform-out").addClass("transform-in");
			event.preventDefault();
		});

		// 當按下關閉按鈕時關閉彈出視窗
		$(".popup-close").click(function() {
			closeWindow();
		});

		// 關閉彈出視窗
		function closeWindow() {
			$("#letmeopen").fadeOut(200);
			$("#letmeopen").children(".popup-box").removeClass("transform-in").addClass("transform-out");
			event.preventDefault();
		}

		// 使用AJAX載入要彈出的內容
		$.ajax({
			url : '${contextRoot}/articleConfiguration',
			type : 'GET',
			dataType : 'html',
			success : function(response) {
				// 將載入的內容插入到彈出框中
				$('#config').html(response);
			},
			error : function(xhr, status, error) {
				// 處理錯誤
				console.log('AJAX錯誤：' + error);
			}
		});
	});
	</script>


</body>
</html>