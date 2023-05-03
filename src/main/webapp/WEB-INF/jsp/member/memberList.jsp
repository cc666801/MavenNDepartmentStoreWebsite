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
<title>會員列表</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>


	<main id="main">
		<section id="contact" class="contact mb-5">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-12 text-center mb-5">
						<h3 class="page-title">會員列表</h3>
						<h1 class="page-title">Member List</h1>
					</div>
				</div>

				<br> <br>
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>會員ID</th>
								<th>會員姓名</th>
								<th>會員帳號</th>
								<th>會員信箱</th>
								<th>會員手機</th>
								<th>會員地址</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${memberList}">
								<tr>
									<td>${member.id}</td>
									<td>${member.name}</td>
									<td>${member.account}</td>
									<td>${member.email}</td>
									<td>${member.phone}</td>
									<td>${member.address}</td>
									<td>
										<form method="post"
											action="${contextRoot}/memberdelete/${member.id}"
											onsubmit="return confirm('您確定要刪除此會員資料嗎？');">
											<input type="hidden" name="_method" value="DELETE">
											<button type="submit" class="btn btn-danger">刪除</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<jsp:include page="../layout/footer.jsp"></jsp:include>


</body>
</html>