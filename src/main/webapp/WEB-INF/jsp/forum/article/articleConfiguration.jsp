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
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

h1 {
  margin-top: 0;
}

button {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #0062cc;
}

form {
  margin: 20px 0;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

input[type="text"],
select {
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  width: 100%;
}

input[type="text"]:focus,
select:focus {
  outline: none;
  border-color: #007bff;
}
.table-container {
  height: 400px; /* 設置容器高度 */
  overflow: auto; /* 設置卷軸 */
}
table {

  width: 80%;
  margin: 0 auto;
  border-collapse: collapse;
  margin-top: 20px;
}

th,
td {
  padding: 10px;
  text-align: left;
}

th {
  border-bottom: 2px solid #007bff;
}

td {
  border-bottom: 1px solid #ccc;
}

.delete-category {
  background-color: #dc3545;
  color: #fff;
  border: none;
  padding: 5px 10px;
  font-size: 14px;
  cursor: pointer;
  border-radius: 5px;
  transition: background-color 0.3s;
}

.delete-category:hover {
  background-color: #c82333;
}
input[type="text"], select {
  width: 30%;
}
</style>


</head>
<body class="sb-nav-fixed">
	
			<main>
				
					<h1>文章類別設定</h1>
					<button id="insert-category">類別設定</button>
					<div id="category-div" style="display: none;">
						<form:form id="category-add" method="POST"
							modelAttribute="category"
							action="${contextRoot}/articleConfiguration/postCategory">
							<label for="category">新增類別：</label>
							<form:input path="articleCategoryName" id="category"
								required="required" />
							<select name="articleCategoryPermissions">
								<option value="1">公開</option>
								<option value="0">管理員</option>
							</select>
							<button type="submit">提交</button>
						</form:form>
<div class="table-container">
						<table>
							<thead>
								<tr>
									<th>類別編號</th>
									<th>類別名稱</th>
									<th>類別權限</th>
									<th>移除類別</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cate" items="${categoryList}">
									<tr>
										<td>${cate.articleCategoryID}</td>
										<td>${cate.articleCategoryName}</td>
										<td>
											<form id="edit-category-${cate.articleCategoryID}"
												action="${contextRoot}/articleConfiguration/editCategory"
												method="post">
												<input type="hidden" name="id"
													value="${cate.articleCategoryID}" /> <select
													name="permission" data-category-id="${cate.articleCategoryID}">
													<option value="1"
														${cate.articleCategoryPermissions == 1 ? 'selected' : ''}>
														公開</option>
													<option value="0"
														${cate.articleCategoryPermissions == 0 ? 'selected' : ''}>
														管理員</option>
												</select> 
											</form>
										</td>
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
																location.reload();
																$('#config').html(response);
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
													$('#config').html(response);
												},
												error : function(xhr, status,
														error) {
													alert("刪除失敗");
												}
											});
										}
									});
							
							//類別權限變更
							 $('select[name="permission"]').change(function() {
							        var categoryId = $(this).data('category-id');
							        var permission = $(this).val();
							        $.ajax({
							            url: '${contextRoot}/articleConfiguration/editCategory',
							            method: 'POST',
							            data: {
							                id: categoryId,
							                permission: permission
							            },
							            success: function(data) {
							            	alert("變更成功");
							            	
											$('#config').html(response);
							            },
							            error: function(xhr, status, error) {
							                // 錯誤處理
							            }
							        });
							    });
							
							
							
						});
	</script>


</body>
</html>