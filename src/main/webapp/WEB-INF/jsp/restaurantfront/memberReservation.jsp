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
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${contextRoot}/assetsForBackend/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
.card img {w-100;
	height: 250px;
}
</style>
<title>餐廳頁面</title>
</head>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->
	<main id="main">
	<div class="card mb-4" style="margin: 0 auto;">
		<div class="card-header">
				<i class="fas fa-table me-1"></i>餐廳預訂資訊
		</div>	
		<div class="card-body">
				<table id="datatablesSimple" class="table table-success table-striped" >
					<thead>
						<tr>
<!-- 				        <td>訂位單號碼</td> -->
							<th>預訂日期</th>
							<th>餐廳名稱</th>     
							<th>入座時間</th>
							<th>用餐人數</th>
							<th>備註</th>
							<th>編輯</th>
							<th>刪除</th>
						</tr>
					</thead>
					<tbody>
						<jstl:forEach items="${memberReservation}" var="far">
							<tr>
								<%-- 	<td>${far.id}</td>    --%>
								<td>${far.date}</td>
								<td>${far.restaurantInformation.company.companyName}</td>
								<td>${far.timeInterval}:${far.time}</td>
								<td>${far.adult}大人 &nbsp; ${far.children}小孩 </td>
								<td>${far.remark}</td>
								<td><form action="${contextRoot}/restaurantfront/memberReservation/edit">
										<input type="hidden" name="r_id" value="${far.r_id}" />
										 <input type="hidden" name="restid" value="${far.restaurantInformation.resid}" />
										<input type="submit" class="btn btn-warning btn-sm" value="編輯" />
									</form></td>
								<td><form action="${contextRoot}/restaurantfront/memberReservation/delete"
										method="post" id="deleteForm">
										<input type="hidden" name="_method" value="delete" /> 
										<input type="hidden" name="r_id" value="${far.r_id}" />
										<input type="hidden" name="memberid" value="${far.member.id}" />  
										<input type="submit" class="btn btn-danger btn-sm" value="刪除" onclick="confirmDelete(event)"/>
									</form></td>
								<%-- 			<td><a href="DeleteBookById.do?Id=${m.id}"><button>刪除</button></a></td> --%>
							</tr>
						</jstl:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
	</main>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${contextRoot}/assetsForBackend/js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${contextRoot}/assetsForBackend/js/datatables-simple-demo.js"></script>
		
	<script>
		  function confirmDelete(event) {
		    event.preventDefault(); // 阻止表單提交
		
		    if (confirm("確定要刪除嗎訂位？")) {
		      // 使用者點擊了確認，繼續提交表單
		      document.getElementById("deleteForm").submit();
		    }
		  }
	</script>
</body>
</html>