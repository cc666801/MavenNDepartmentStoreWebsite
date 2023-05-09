<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextRoot}/assetsForFrontend/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRoot}/assetsForFrontend/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

<link rel="stylesheet" href="${contextRoot}/bootstrap5.0.2/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="${contextRoot}/bootstrap5.0.2/css/font-awesome.min.css">

<style>
.bt {
	background-color: white;
	border: 1px solid;
	border-radius: 10px;
	padding: 10px;
}

.bt.active {
	background-color: red;
	border: 1px solid;
	border-radius: 10px;
	padding: 10px;
}

fieldset, legend {
   all: revert;
}

fieldset{
	padding: 0;
	border: none;
	border-top: 1px solid gray;
}

.title{
 	margin-bottom: 10px; 
	text-align: start;
	font-size: 17px;
}

/* .datepicker td{ */
/*   border: 1px solid #ccc; */
/* } */


</style>
<title>餐廳頁面</title>
</head>
<body>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="https://picsum.photos/1000/200?random=10"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="https://picsum.photos/1000/200?random=9"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="https://picsum.photos/1000/200?random=8"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container">
		<div class="row g-2 gx-sm-3 mt-2 justify-content-center">
			<div class="col-sm-3 col-12 border border-2 border-secondary me-2">
				<div>
					<img src="https://picsum.photos/300/200?random=1"
						 class="img-fluid rounded " alt="餐廳圖片">
				</div>
			</div>

			<div class="col-sm-7 col-12 pt-3 border border-2 border-secondary rounded-2">

				<div class="row justify-content-center">
					<div class="col-5">
						用餐人數 <select id="AId" class="form-select">
							<jstl:forEach var="i" begin="0" end="10">
								<option value="${i}">${i}位大人</option>
							</jstl:forEach>
						</select><br> <select id="CId" class="form-select">
							<jstl:forEach var="i" begin="0" end="10">
								<option value="${i}">${i}位小孩</option>
							</jstl:forEach>
						</select><br>

					</div>
					<div class="col-5">
						用餐時間
						<div class="input-group date" id="datepicker">
							<input type="text" class="form-control" id="DId" readonly />
							 <span class="input-group-append"> 
							 	<span class="input-group-text bg-white d-block"> 
							 		<i class="bi bi-calendar"></i>
								</span>
							</span>
						</div>
					</div>
				</div>

				<div class="row">
					
					<form id="myForm" action="#">
						<fieldset>
							<legend class="title">中午</legend>
							<div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-2">
								<jstl:forEach var="i" begin="11" end="13">
									<jstl:forEach var="j" begin="00" end="30" step="15">
									<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
									<div class="col">
										<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
									</div>
									</jstl:forEach>
								</jstl:forEach>
							</div>
						</fieldset>
						
						<fieldset class="mt-3">
							<legend class="title">下午</legend>
							<div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-2">
								<jstl:forEach var="i" begin="11" end="13">
									<jstl:forEach var="j" begin="00" end="30" step="15">
									<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
									<div class="col">
										<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
									</div>
									</jstl:forEach>
								</jstl:forEach>
							</div>
						</fieldset>
						<fieldset class="mt-3">
							<legend class="title">下午</legend>
							<div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-2">
								<jstl:forEach var="i" begin="11" end="13">
									<jstl:forEach var="j" begin="00" end="30" step="15">
									<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
									<div class="col">
										<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
									</div>
									</jstl:forEach>
								</jstl:forEach>
							</div>
						</fieldset>
						<div>
						<input type="hidden" name="selectedButton" id="selectedButton">
						<input type="submit" value="送出表單">
						</div>
					</form>
					
					<div class="justify-content-center">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3088.3696025510344!2d120.21466690330259!3d22.99764855243827!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e768d1a35d7a9%3A0x1689894ccb6260d4!2z5oiQ5Yqf5aSn5a24IOWFieW-qeagoeWNgOaTjeWgtA!5e0!3m2!1szh-TW!2stw!4v1683616858505!5m2!1szh-TW!2stw" 
						width="100%" height="450" style="border:0;" allowfullscreen loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					</div>


				</div>


			</div>
		</div>
	</div>

	<script src="${contextRoot}/assetsForFrontend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/bootstrap5.0.2/js/jquery.min.js"></script>
	<%-- 	<script src="${contextRoot}/bootstrap5.0.2/js/bootstrap.bundle.min.js"></script> --%>
	<script src="${contextRoot}/bootstrap5.0.2/js/bootstrap-datepicker.min.js"></script>
	<script src="${contextRoot}/bootstrap5.0.2/js/bootstrap-datepicker.zh-TW.min.js"></script>


	<script type="text/javascript">		
		$(document).ready(function() {
			let now = new Date();
			$('#datepicker').datepicker({
					format : 'yyyy/mm/dd',
					showOtherMonths : false,
					language : 'zh-TW',
					// 		startDate: new Date(now.getFullYear(), now.getMonth(), 1),
					// 		endDate: new Date(now.getFullYear(), now.getMonth() + 1, 0),
					//      todayHighlight: true,
					autoclose : true,

					beforeShowDay : function(date) {
					// 禁用今天之前和3個月之後的日期
					return date < now || date.getMonth() > (now.getMonth() + 3) ? false: true;
					}

				});
			let year = now.getFullYear()
	 		let mouth = (now.getMonth() + 1).toString().padStart(2, '0');
	 		let date = now.getDate().toString().padStart(2, '0');
			$('#DId').val(year + '/' + mouth + '/' + date);
		});

		//   ---------以下是按鈕事件
		$('.bt').on('click', function() {
			$('.bt').removeClass('active');
			$(this).addClass('active');
			$('#selectedButton').val($(this).val());
		});

		$('#myForm').on('submit', function() {
// 			event.preventDefault();
			const selectedButtonValue = $('#selectedButton').val();
			console.log(selectedButtonValue); // 傳至後端的值
			// 在此處發送表單至後端...
		});
	</script>

</body>

</html>