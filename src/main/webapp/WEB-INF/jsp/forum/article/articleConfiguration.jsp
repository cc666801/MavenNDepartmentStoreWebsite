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
<title>其他文章設定</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
				<div class="card">
					<h1>文章其他設定</h1>
					<button id="insert-category">類別設定</button>
					<div id="category-div" style="display: none;">
						<form:form id="category-add" method="POST"
							modelAttribute="category"
							action="${contextRoot}/articleConfiguration/postCategory">
							<label for="category">新增類別：</label>
							<form:input path="articleCategoryName" id="category"
								required="required" />
							<button type="submit">提交</button>
						</form:form>

						<table>
							<thead>
								<tr>
									<th>類別編號</th>
									<th>類別名稱</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cate" items="${categoryList}">
									<tr>
										<td>${cate.articleCategoryID}</td>
										<td>${cate.articleCategoryName}</td>
										<td><form id="delete-category-${cate.articleCategoryID}"
												action="${contextRoot}/articleConfiguration/deleteCategory"
												method="post">
												<input type="hidden" name="_method" value="delete" /> <input
													type="hidden" name="id" value="${cate.articleCategoryID}" />
												<input type="submit" value="刪除" class="delete-category" />
											</form></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


					</div>
				</div>

			</main>
			<!-- End #main -->

			<!-- ======= Footer ======= -->
			<jsp:include page="../../layout/footerForBackend.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>
	<!-- =============================== bootstrap ============================ -->
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
		$(document)
				.ready(
						function() {
							//顯示Category
							$('#insert-category').click(function() {
								$('#category-div').slideToggle();
							});
							//新增Category-Ajax	
							$('#category-add')
									.submit(
											function(event) {
												event.preventDefault()
												var url = $(this)
														.attr('action');
												var data = $(this).serialize();
												$
														.ajax({
															type : "POST",
															url : url,
															data : data,
															success : function(
																	response) {
																alert("新增成功");
																window.location.href = "${contextRoot}/articleConfiguration";
															},
															error : function(
																	xhr,
																	status,
																	error) {
																alert(xhr.responseText);
															}
														});
											});

							//刪除確認			
							$("form[id^='delete-category-']").submit(
									function(event) {
										event.preventDefault();
										var form = $(this);
										var categoryId = form.find(
												"input[name='id']").val();
										if (confirm("確定要刪除此類別嗎？")) {
											$.ajax({
												type : form.attr('method'),
												url : form.attr('action'),
												data : form.serialize(),
												success : function() {
													alert("刪除成功");
													location.reload();
												},
												error : function(xhr, status,
														error) {
													alert("刪除失敗");
												}
											});
										}
									});
						});
	</script>


</body>
</html>