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
	border-top: 1px solid ;
}

.title{
	
/* 	margin: 10px; */
	text-align: start;
	font-size: 17px;
	
}
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
				<img src="https://picsum.photos/300/200?random=1"
					 class="img-fluid rounded " alt="餐廳圖片">
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
							<input type="text" class="form-control" id="DId" readonly /> <span
								class="input-group-append"> <span
								class="input-group-text bg-white d-block"> <i
									class="bi bi-calendar"></i>
							</span>
							</span>
						</div>
					</div>
				</div>

				<div class="row">
					
					<form id="myForm" action="#">
						<fieldset>
							<legend class="title">中午</legend>
							<button type="button" class="bt" value="11:00">按鈕1</button>
							<button type="button" class="bt" value="11:30">按鈕2</button>
							<button type="button" class="bt" value="12:00">按鈕3</button>
						</fieldset>
						<fieldset>
							<legend class="title">下午</legend>
							<button type="button" class="bt" value="13:00">按鈕1</button>
							<button type="button" class="bt" value="13:30">按鈕2</button>
							<button type="button" class="bt" value="14:30">按鈕3</button>
							<button type="button" class="bt" value="14:40">按鈕3</button>
						</fieldset>
						<fieldset>
							<legend class="title">下午</legend>
							<button type="button" class="bt" value="18:00">按鈕1</button>
							<button type="button" class="bt" value="18:30">按鈕2</button>
							<button type="button" class="bt" value="19:00">按鈕3</button>
							<input type="hidden" name="selectedButton" id="selectedButton">
						</fieldset>
						<input type="submit" value="送出表單">
					</form>




				</div>


			</div>
		</div>
	</div>

	<script
		src="${contextRoot}/assetsForFrontend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<%-- 	<script src="${contextRoot}/bootstrap5.0.2/js/bootstrap.bundle.min.js"></script> --%>
	<script src="${contextRoot}/bootstrap5.0.2/js/jquery.min.js"></script>
	<script src="${contextRoot}/bootstrap5.0.2/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/bootstrap5.0.2/js/bootstrap-datepicker.min.js"></script>
	<script src="${contextRoot}/bootstrap5.0.2/js/bootstrap-datepicker.zh-TW.min.js"></script>


	<script type="text/javascript">
		let now = new Date();
		let year = now.getFullYear()
		let mouth = (now.getMonth() + 1).toString().padStart(2, '0');
		let date = now.getDate().toString().padStart(2, '0');
		document.getElementById('DId').value = year + "/" + mouth + "/" + date;
		$(function() {
			$('#datepicker').datepicker({
					format : 'yyyy/mm/dd',
					showOtherMonths : false,
					language : 'zh-TW',
					//        startDate: new Date(now.getFullYear(), now.getMonth(), now.getDate()),
					//        endDate: new Date(now.getFullYear(), now.getMonth() + 3, 0),
					//        todayHighlight: true,
					autoclose : true,

					beforeShowDay : function(date) {
					// 禁用今天之前和3個月之後的日期
					return date < now || date.getMonth() > (now.getMonth() + 3) ? false: true;
					}

				});
		});

		//   ---------以下是按鈕事件
		$('.bt').on('click', function() {
			$('.bt').removeClass('active');
			$(this).addClass('active');
			$('#selectedButton').val($(this).val());
		});

		$('#myForm').on('submit', function() {
			const selectedButtonValue = $('#selectedButton').val();
			console.log(selectedButtonValue); // 傳至後端的值
			// 在此處發送表單至後端...
		});
	</script>

</body>

</html>