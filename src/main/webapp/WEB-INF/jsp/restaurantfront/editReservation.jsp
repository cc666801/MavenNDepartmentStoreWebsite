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
<meta name="viewport" content="width=device-width, initial-scale=1">
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
#myForm{
	margin:0px;
	padding: 0;
	border: none;
}

/* .datepicker td{ */
/*   border: 1px solid #ccc; */
/* } */


</style>
<title>餐廳頁面</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextRoot}">回Mavenn百貨公司</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
	   <div class="collapse navbar-collapse" id="navbarScroll">
	      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="${contextRoot}/restaurantfront">餐廳</a>
            </li>
          </ul>
       </div>
       
   </div>   
</nav>

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
				<img src="${contextRoot}/assetsForFrontend/img/${findRestaurant.company.companyName}1.jpg"
					class="d-block w-100" style="height:300px" alt="${findRestaurant.company.companyName}餐廳的圖片">
			</div>
			<jstl:forEach var="i" begin="2" end="3">
			<div class="carousel-item">
				<img src="${contextRoot}/assetsForFrontend/img/${findRestaurant.company.companyName}${i}.jpg"
					class="d-block w-100" style="height:300px" alt="${findRestaurant.company.companyName}餐廳的圖片">
			</div>
			</jstl:forEach>
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
			<div class="col-md-3 col-12 me-2">
				<div class="row mt-2 justify-content-left">
					<div class="col-11">
						<img src="data:image/png;base64,${findRestaurant.company.base64StringCompanyLogo}"
							 class="mx-auto img-thumbnail border border-4 rounded" style="width:250px; height: 200px"
							 alt="${findRestaurant.company.companyName}的logo">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12">
					<h3>${findRestaurant.company.companyName}</h3>
					<p>
					<jstl:forEach items="${restaurantCounter}" var="Counter">
						<jstl:if test="${findRestaurant.company.companyId == Counter.company.companyId}">
						${findRestaurant.company.address.addressName} &nbsp;${Counter.counter.counterFloor}&nbsp;${Counter.counter.counterName} <br>
						</jstl:if>
					</jstl:forEach>
						${findRestaurant.cuisineType.cuisineTypeName} <br>
					</p>
					</div>
				</div>
			</div>

			<div class="col-md-7 col-12 pt-3 border border-2 border-secondary rounded-2">

				<form:form class="row justify-content-center" id="myForm" 
						method="put" modelAttribute="memberReservation"
						action="${contextRoot}/restaurantfront/memberReservation/edit">
						<div class="col-5">
							用餐人數 
							<form:select path="adult" id="AId" value="memberReservation.adult" class="form-select" onchange="updateChildrenOptions()">
								<jstl:forEach var="i" begin="0" end="10">
									<jstl:choose>
										<jstl:when test="${memberReservation.adult == i}">
											<option value="${i}" selected="selected">${i}位大人</option>
								        </jstl:when>
								        <jstl:otherwise>
									        <option value="${i}">${i}位大人</option>
								        </jstl:otherwise>                								
									</jstl:choose>
								</jstl:forEach>
							</form:select><br> 
							
							<form:select path="children" id="CId" class="form-select" onchange="updateAdultOptions()">
								<jstl:forEach var="i" begin="0" end="10">
									<jstl:choose>
										<jstl:when test="${memberReservation.children == i}">
											<option value="${i}" selected="selected">${i}位小孩</option>
								        </jstl:when>
								        <jstl:otherwise>
									        <option value="${i}">${i}位小孩</option>
								        </jstl:otherwise>                								
									</jstl:choose>
								</jstl:forEach>
							</form:select>
	
						</div>
						<div class="col-5">
							用餐時間
							<div class="input-group date" id="datepicker">
								<form:input type="text" path="date" class="form-control" id="DId" readonly="readonly"/>
								 <span class="input-group-append"> 
								 	<span class="input-group-text bg-white d-block"> 
								 		<i class="bi bi-calendar"></i>
									</span>
								</span>
							</div><br>
							<form:input type="hidden" path="restaurantInformation" value="${findRestaurant.resid}" readonly="readonly" />
						</div>
						
						<div class="col-10 mb-3">
							<p style="color:#706363; margin:0px">線上訂位最多可至10人(含大人與小孩),如需團體訂位請撥打餐廳電話</p>
						</div>
	
						<div class="col-12">
						<h5>用餐時段</h5>
							<p class="mb-3" style="color:#706363; margin:0px">*灰色表示該時間已客滿，請選則其他日期</p>						
								<fieldset>
									<legend class="title">中午</legend>
									<div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-2">
										<jstl:forEach var="i" begin="11" end="14">
											<jstl:choose>
												<jstl:when test="${i == 14}">
													<jstl:forEach var="j" begin="00" end="00">
													<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
													<div class="col">
														<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
													</div>
													</jstl:forEach>
												</jstl:when>
												<jstl:otherwise>
													<jstl:forEach var="j" begin="00" end="30" step="30">
													<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
													<div class="col">
														<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
													</div>
													</jstl:forEach>
												</jstl:otherwise>
											</jstl:choose>
										</jstl:forEach>
									</div>
								</fieldset>
								
								<fieldset class="mt-3">
									<legend class="title">下午</legend>
									<div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-2">
										<jstl:forEach var="i" begin="15" end="17">
											<jstl:choose>
												<jstl:when test="${i == 17}">
													<jstl:forEach var="j" begin="00" end="00">
													<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
													<div class="col">
														<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
													</div>
													</jstl:forEach>
												</jstl:when>
												<jstl:otherwise>
													<jstl:forEach var="j" begin="00" end="30" step="30">
													<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
													<div class="col">
														<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
													</div>
													</jstl:forEach>
												</jstl:otherwise>
											</jstl:choose>
										</jstl:forEach>
									</div>
								</fieldset>
								<fieldset class="mt-3">
									<legend class="title">晚上</legend>
									<div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-2">
										<jstl:forEach var="i" begin="17" end="22">
											<jstl:choose>
												<jstl:when test="${i == 17}">
													<jstl:forEach var="j" begin="30" end="50" step="30">
													<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
													<div class="col">
														<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
													</div>
													</jstl:forEach>
												</jstl:when>
												<jstl:otherwise>
													<jstl:forEach var="j" begin="00" end="30" step="30">
													<fmt:formatNumber var="jj" value="${j}" pattern="00"/>
													<div class="col">
														<button type="button" class="bt w-100" value="${i}:${jj}">${i}:${jj}</button>
													</div>
													</jstl:forEach>
												</jstl:otherwise>
											</jstl:choose>
										</jstl:forEach>
									</div>
								</fieldset>
								<div>
								<form:input type="hidden" path="timeInterval" id="timeintervalcode" readonly="readonly" />
								<form:input type="hidden" path="time" id="timecode" readonly="readonly" />
								</div>						
						</div>
						<br>
					
<!--           有按鈕會員登入  -->	
						<jstl:if test="${empty member}">
										
							<div class="row justify-content-center mt-4">
								<div class="d-grid gap-2 col-6 mx-auto">
								  <a href="${contextRoot}/member/login">
									<button type="button" class="btn btn-secondary btn-lg w-100" style="hight:80px"> 登入會員,可享線上訂位</button>
								  </a>
								</div>
							</div>
											
						</jstl:if>
			
						<jstl:if test="${not empty member}">
			
							<div class="row justify-content-center">
								<div class="col-12 px-4 py-2 border border border-secondary rounded-4 mt-4 md-2">
									<h2>聯絡資訊</h2>
									<form:input type="hidden" path="r_id" id="memberId"  class="w-100"/>
									<form:input type="hidden" path="member" id="memberId" class="w-100"/>
									<label for="NId">姓名</label>
									<br>
									<form:input type="text" path="name" id="NId" value="" class="w-100"/>
									<br>
									<label for="TId">電話</label>
									<br>
									<form:input type="text" path="telephone" id="TId" value="" class="w-100"/>
									<br>
									<label for="EId">email</label>
									<br>
									<form:input type="text" path="email" id="EId" value="" class="w-100"/>
									<br>
									<label for="note">備註</label>
									<br>
									<form:textarea id="note" path="remark" rows="8" class="w-100" placeholder="可以填入您的需求,如:小孩需要兒童座椅、吃全素....."></form:textarea>
								</div>
							</div>
							<div class="row justify-content-center mt-2" style="height: 40px">
								<div class="d-grid gap-2 col-6 mx-auto">
								  <button type="submit" class="btn btn-primary btn-block">送出</button>
								</div>
							</div>
			
						</jstl:if>
					</form:form>
					
				<div class="row mt-5 justify-content-center">
					<div class="col-12">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3088.3696025510344!2d120.21466690330259!3d22.99764855243827!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e768d1a35d7a9%3A0x1689894ccb6260d4!2z5oiQ5Yqf5aSn5a24IOWFieW-qeagoeWNgOaTjeWgtA!5e0!3m2!1szh-TW!2stw!4v1683616858505!5m2!1szh-TW!2stw" 
						width="100%" height="450" style="border:0;" allowfullscreen loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					</div>
					<div class="col-11 py-auto  mt-2 border-bottom border-2 border-light">
						<h5>餐廳位置</h5>
						<p style="mergin:0px">
						<jstl:forEach items="${restaurantCounter}" var="Counter">
						<jstl:if test="${findRestaurant.company.companyId == Counter.company.companyId}">
							${findRestaurant.company.address.addressName} &nbsp;${Counter.counter.counterFloor}&nbsp;${Counter.counter.counterName}
						</jstl:if>
						</jstl:forEach>
						</p>
					</div>
					<div class="col-11 py-auto border-bottom border-2 border-light">
						<h5>料理類型</h5>
						<p>${findRestaurant.cuisineType.cuisineTypeName} </p>
					</div>
					<div class="col-11 py-auto border-bottom border-2 border-light">
						<h5>餐廳電話</h5>
						<p>${findRestaurant.company.companyPhone} </p>
					</div>
					<div class="col-11 py-auto border-bottom border-2 border-light">
						<h5>營業時間</h5>
						<p>${findRestaurant.company.openingHours.openingHoursName} </p>
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
	
// 		以下為人數事件
	 function updateChildrenOptions() {
		    let adultSelect = document.getElementById("AId");
		    let childrenSelect = document.getElementById("CId");
		    let adultValue = adultSelect.value;
		    let oldChildrenValue = childrenSelect.value;
		   
		    console.log(oldChildrenValue);
		    
		    childrenSelect.innerHTML = ""; // 清空小孩選項
		    
		    for (let i = 0; i <= 10-adultValue; i++) {
		    	if(i == oldChildrenValue){
			    	let defaultOption = document.createElement("option");
			    	defaultOption.value = i;
			    	defaultOption.text = i + "位小孩";
			    	defaultOption.selected = true;
			        childrenSelect.appendChild(defaultOption);	// 預設小孩選項	    	
		    	}else{	    		
		    	let option = document.createElement("option");
		        option.value = i;
		        option.text = i + "位小孩";
		        childrenSelect.appendChild(option); // 新增小孩選項
		    	}
		    }
		}
		
		function updateAdultOptions(){
			let adultSelect = document.getElementById("AId");
			let childrenSelect = document.getElementById("CId");
			let childrenValue = childrenSelect.value;
			let oldAdultValue = adultSelect.value;
		    
		    console.log(childrenValue);
		    
		    adultSelect.innerHTML = ""; // 清空大人選項
		    
		    for (let i = 0; i <= 10-childrenValue; i++) {
		    	if(i == oldAdultValue){
		    		let defaultOption = document.createElement("option");
			    	defaultOption.value = i;
			    	defaultOption.text = i + "位大人";
			    	defaultOption.selected = true;
			    	adultSelect.appendChild(defaultOption);	// 預設大人選項
		    	}else{
			    	let option = document.createElement("option");
			        option.value = i;
			        option.text = i + "位大人";
			        adultSelect.appendChild(option); // 新增大人選項		    		
		    	}
		    	
		    }
		}
// 		end
	
		$(document).ready(function() {
			let now = new Date();
			$('#datepicker').datepicker({
					format : 'yyyy-mm-dd',
					showOtherMonths : false,
					language : 'zh-TW',
					autoclose : true,

					beforeShowDay : function(date) {
					// 禁用今天之前和3個月之後的日期
						let minDate = new Date(now.getFullYear(), now.getMonth() , now.getDate());
	    				let maxDate = new Date(now.getFullYear(), now.getMonth() + 2, now.getDate());
						return (date < minDate) || (date > maxDate) ? false: true;
					}

				});
			
			//以下為訂單人數>6回傳
            sendDateToBackend();
		});
		
		//以下為訂單人數>6回傳
		function sendDateToBackend() {
			let date = $("#DId").val();			
			let restaurantId = $("#restId").val();
				
		    $.ajax({
		        url: "${contextRoot}/peopleoverten",
		        contentType:"application/json;charset=UTF-8",
                dataType: 'json',
                method:'get',
                data:{"date":date,
                	  "restaurantId":restaurantId},
		        success: function (result) {
		        	console.log(result.length)
		        	console.log(result)
		        	
		       		let buttons = document.querySelectorAll(".bt");

					// 尋找值為 的按鈕並禁止選取
					for (let i = 0; i < buttons.length; i++) {
					  let button = buttons[i];
					  button.disabled = false;
					  button.style.backgroundColor = "";
					  let buttonValue = button.value; // 獲取按鈕的值
					  for(let j = 0; j < result.length; j++){				
						  if (buttonValue === result[j]) {
						    button.disabled = true; // 禁止按鈕選取
						    button.style.backgroundColor = "#C2C2C2";
						    break;
						  }
					  }
					}
		        },
		        error: function (error) {
		        	console.log('沒訂單')		    
		        	let buttons = document.querySelectorAll(".bt");
		        	for (let i = 0; i < buttons.length; i++) {
						  let button = buttons[i];
					       button.disabled = false;
					       button.style.backgroundColor = "";
					}
		        }
		    });
		}
		
		$("#DId").on("change", function() {
		    sendDateToBackend();
		    $('.bt').removeClass('active');
		});
		

		//   ---------以下是按鈕事件
		$('.bt').on('click', function() {
			$('.bt').removeClass('active');
			$(this).addClass('active');
			$('#timecode').val($(this).val());
			let timetime = $(this).closest('fieldset').find('legend').text();
			$('#timeintervalcode').val(timetime);
			
		});
		
		$('.bt').each(function() {
		    if ($(this).val() === '${memberReservation.time}') {
		        // 找到值為 "15:00" 的按鈕
		        $(this).addClass('active');
		        // 執行其他相關操作
		    }
		});

	</script>

</body>

</html>