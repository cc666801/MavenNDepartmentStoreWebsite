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
</head>
<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>

	<main id="main">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12 text-center mb-5">
					<h2>失物招領</h2>
					<h1>Lost And Found</h1>
				</div>
			</div>

			<article class="content">
				<div class="row justify-content-center">
					<div class="col-lg-12 text-center mb-5">
						<section class="topTitle">
							<h1>overview</h1>
							<div class="button">
								<button class="btn btn-outline-primary">遺失物招領期限</button>
								<button>遺失物認領須知</button>
								<button>館內遺失物洽詢</button>
							</div>
						</section>

						<section class="table justify-content-center">
							<div class="search_show">
								<h1>遺失物招領清單</h1>
								<form>
									<div class="drapdown">
										<ul></ul>
									</div>
								</form>
							</div>
							<div class="listContent">
								<table>
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
						</section>
					</div>
				</div>
			</article>
		</div>
	</main>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>


</body>
</html>