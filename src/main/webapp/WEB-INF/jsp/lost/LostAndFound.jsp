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
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<main id="main">
		<div class="container" >
			<div class="row">
				<div class="col-lg-12 text-center mb-5">
					<h2 >失物招領</h2>
					<h1>Lost And Found</h1>
				</div>
			</div>

			<article class="content">
				<section class="topTitle">
					<h1>overview</h1>
					<div class="button">
						<button class="btn btn-outline-primary">遺失物招領期限</button>
						<button>遺失物認領須知</button>
						<button>館內遺失物洽詢</button>
					</div>
				</section>

				<section class="table">
					<div class="search_show">
						<h1>遺失物招領清單</h1>
						<form>
							<div class="drapdown">
								<ul></ul>
							</div>
						</form>
					</div>
					<div class="list_show">
						<div class="listHeader">
							<p>拾獲物登錄單號</p>
							<p>拾獲日期</p>
							<p>拾獲品項/數量</p>
							<p>拾獲地點</p>
							<p>狀態</p>
						</div>
						<div class="listContent">
							<ul>
								<li></li>
							</ul>
						</div>
					</div>
				</section>
			</article>
		</div>
	</main>
	<jsp:include page="../layout/footer.jsp"></jsp:include>


</body>
</html>