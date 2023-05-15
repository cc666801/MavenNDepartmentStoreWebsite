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
<title>失物招領</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
/* 設定 button 的基本樣式 */
button {
	align-items: center;
	justify-content: center;
	padding: 30px;
	font-size: 18px;
	font-weight: bold;
	text-transform: uppercase;
	color: #000;
	border: 2px solid #f1f1f1;
	border-radius: 50px;
	cursor: pointer;
	background-color: transparent;
	transition: all 0.3s ease-in-out;
}

/* 設定 icon 的樣式 */
button i {
	display: block;
	font-size: 36px;
	margin: 0 auto;
	margin-bottom: 10px;
}

/* 設定文字的樣式 */
button p {
	margin: 0;
	line-height: 1.2;
	text-align: center;
}

/* 設定 hover 時的特效 */
button:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	background-color: transparent;
	color: #fff;
	border-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

/* 設定每個 button 的特殊樣式 */
button:nth-child(odd) {
	/*   background-color: #f1f1f1; */
	
}

/* 設定 icon 的特殊樣式 */
button:nth-child(odd) i {
	color: #007bff;
}

/* 設定文字的特殊樣式 */
button:nth-child(odd) p {
	color: #2F4F4F;
}

/* 設定被點擊時的特效 */
button:focus {
	outline: none;
	transform: scale(0.95);
	box-shadow: none;
}

.popup {
display: none;
position: fixed;
z-index: 999;
left: 0;
top: 0;
width: 100%;
height: 100%;
overflow: auto;
background-color: rgba(0, 0, 0, 0.4);
}

.popup-content {
background-color: #ffffff;
margin: 10% auto;
padding: 20px;
border: 1px solid #bcbcbc;
width: 80%;
height: 60%;
max-width: 600px;
position: relative;
border-radius: 10px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
text-align: center;
}

.popup-content p {
font-size: 18px;
line-height: 1.6;
color: #4d4d4d;
margin-bottom: 25px;
text-align: left;
margin-left: 20px;
margin-right: 20px;
}

.popup-content h2 {
color: #007bff; /修改顏色/
font-size: 32px;
margin-bottom: 20px;
}

.popup-content h3 {
color: #3e3e3e;
font-size: 24px;
margin-bottom: 15px;
}

.close {
position: absolute;
top: 10px;
right: 10px;
font-size: 28px;
font-weight: bold;
color: #999999;
cursor: pointer;
transition: color 0.3s ease;
}

.close:hover {
color: #3e3e3e;
}

.popup i {
font-size: 48px;
color: #999999;
margin-right: 20px;
display: inline-block;
vertical-align: middle;
display: block;
margin: 0 auto;
}

.popup-content h2,
.popup-content h3,
.popup-content p {
text-align: center;
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
font-weight: 400;
}


#popup-date .popup-content {
background-color: #f8f8f8;
}

#popup-know .popup-content {
background-color: #fafafa;
}

#popup-ask .popup-content {
background-color: #f6f6f6;
}
</style>


</head>
<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>


	<main id="main">
		<section id="contact" class="contact mb-5">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-12 text-center mb-5">
						<h3 class="page-title">失物招領</h3>
						<h1 class="page-title">Lost And Found</h1>
					</div>
				</div>

				<div class="row gy-4">

					<div class="col-md-4">
						<div class="info-item">
							<button class="date">
								<i class="fa-regular fa-calendar-days"></i><br>
								<p>遺失物招領期限</p>
								<p>Time limit for Claiming</p>
							</button>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-md-4">
						<div class="info-item info-item-borders">

							<button class="know">
								<i class="fa-regular fa-clipboard"></i><br>
								<p>遺失物認領須知</p>
								<p>Claiming</p>
							</button>
						</div>
					</div>
					<!-- End Info Item -->

					<div class="col-md-4">
						<div class="info-item">

							<button class="ask">
								<i class="fa-solid fa-phone-volume"></i><br>
								<p>館內遺失物洽詢</p>
								<p>Contact us</p>
							</button>
						</div>
					</div>
					<!-- End Info Item -->

				</div>
				<br> <br>
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>拾獲物登錄單號</th>
								<th>拾獲日期</th>
								<th>拾獲品項/數量</th>
								<th>拾獲地點</th>
								<th>狀態</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lost" items="${lostList}">
								<tr>
									<td>${lost.id}</td>
									<td>${lost.founddate}</td>
									<td>${lost.item}</td>
									<td>${lost.place}</td>
									<td>${lost.state}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>



		<div id="popup-date" class="popup">
			<div class="popup-content">
				<span class="close">&times;</span> <i
					class="fa-regular fa-calendar-days"></i><br>
				<h2>遺失物招領期限</h2>
				<h3>Time limit for Claiming</h3>
				<p>遺失物在本公司招領期限： 自拾獲日起15日內（但手機、證件隔日即送新莊派出所； 又遺失物易於腐壞者，本公司將逕行拋棄
					），15日後送交新莊派出所處理， 請自行向該派出所查詢領取。</p>


			</div>
		</div>
		<div id="popup-know" class="popup">
			<div class="popup-content">
				<span class="close">&times;</span> <i
					class="fa-regular fa-clipboard"></i><br>
				<h2>遺失物認領須知</h2>
				<h3>Claiming</h3>
				<p>在本公司認領遺失物時,請至服務台出示身份證件並填寫『遺失物 ( 拾獲 / 認領 ) 登錄單』後取回遺失物。</p>

			</div>
		</div>
		<div id="popup-ask" class="popup">
			<div class="popup-content">
				<span class="close">&times;</span> <i
					class="fa-solid fa-phone-volume"></i><br>
				<h2>館內遺失物洽詢</h2>
				<h3>Contact us</h3>
				<p>查詢遺失物相關資訊請電洽 -</p>
				<ul>
					<li>館內招領中遺失物｜Maven百貨服務台：oo-xxx-oooo 轉分機ooxx</li>
					<li>已送交警局遺失物｜OO派出所：oo-xxx-oxox</li>
				</ul>
			</div>
		</div>

	</main>
	<!-- End #main -->

	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			// 綁定每個 button 的 click 事件
			$('button').click(function() {
				// 判斷該按鈕是否有對應的類別，以開啟對應的 popup
				if ($(this).hasClass('date')) {
					$('#popup-date').fadeIn();
				} else if ($(this).hasClass('know')) {
					$('#popup-know').fadeIn();
				} else if ($(this).hasClass('ask')) {
					$('#popup-ask').fadeIn();
				}
			});

			// 綁定關閉彈出視窗的事件
			$('.close').click(function() {
				$('#popup-date, #popup-know, #popup-ask').fadeOut();
			});
		});
	</script>

</body>
</html>