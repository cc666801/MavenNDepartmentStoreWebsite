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
.right {
	padding-top: 20px;
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
		<div class="carousel-inner" style="height: 280px">
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
		<div class="row gx-sm-3 mt-2 justify-content-center">
			<div class="col-3 border border-2 border-secondary me-2">
				.col-4<br>Since 9 + 4 = 13 &gt;ts wrapped onto a new line as
				one contiguous unit.
			</div>

			<div class="col-7 right border border-2 border-secondary rounded-2">
				.col-7<br>Subsequent columns continue along the new line.

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
		                        <input type="text" class="form-control" readonly/>
		                        <span class="input-group-append">
		                            <span class="input-group-text bg-white d-block">
		                                <i class="bi bi-calendar"></i>
		                            </span>
		                        </span>
		                    </div>
							


					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${contextRoot}/assetsForFrontend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<%-- 	<script src="${contextRoot}/bootstrap5.0.2/js/bootstrap.bundle.min.js"></script> --%>
	<script src="${contextRoot}/bootstrap5.0.2/js/jquery.min.js"></script>
    <script src="${contextRoot}/bootstrap5.0.2/js/bootstrap.bundle.min.js"></script>
    <script src="${contextRoot}/bootstrap5.0.2/js/bootstrap-datepicker.min.js"></script>
     <script src="${contextRoot}/bootstrap5.0.2/js/bootstrap-datepicker.zh-TW.min.js"></script>
	<script type="text/javascript">
        var now = new Date();
        $(function() {
            $('#datepicker').datepicker({
                    format: 'yyyy/mm/dd',
                    language: 'zh-TW',
                    startDate: new Date(now.getFullYear(), now.getMonth(), 1),
                    endDate: new Date(now.getFullYear(), now.getMonth() + 3, 0),
                    // todayHighlight: true,
                    autoclose: true
            });
        });
    </script>
	
</body>

</html>