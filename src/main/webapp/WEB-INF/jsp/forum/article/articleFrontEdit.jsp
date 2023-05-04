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
<title>編輯文章</title>

<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Summernote JS - CDN Link -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="../summernote/lang/summernote-zh-TW.js"></script>


</head>
<body>
<jsp:include page="../../layout/header.jsp"></jsp:include>
	<main id="main">
		<div class="card">
			<h2>編輯文章</h2>
						<form:form modelAttribute="art" method="put"
							enctype="multipart/form-data"
							action="${contextRoot}/articleManage/edit">
							<form:label path="articleID">文章編號:</form:label>
							<form:input type="hidden" path="articleID" />
							<br>
							<form:label path="articleTitle">標題:</form:label>
							<form:input path="articleTitle" required="required" />
							<br>

							<form:label path="articleCategory">類別:</form:label>
							<form:select path="articleCategory" required="required">
								<c:forEach items="${categoryList}" var="category">
									<form:option value="${category.articleCategoryID}">${category.articleCategoryName}</form:option>
								</c:forEach>
							</form:select>
							<br>
							<form:label path="articleImage">文章縮圖:</form:label>
							<form:input id="articleImage" path="imgToByte" type="file"
								accept="image/*"></form:input>
							<form:hidden path="articleImage" id="articleImageBase64"
								value="${imageData}" />
							<img id="imagePreview" src="data:image/jpeg;base64,${imageData}"
								alt="圖片預覽" style=" max-width: 200px; max-height: 200px; object-fit: cover; margin-left: 10px;">
							<br>

							<form:hidden name="articleContent" path="articleContent"
								id="summernote-input" />
							<div id="summernote">${articleContent}</div>
							<button type="submit">送出</button>
						</form:form>
					</div>
				
			</main>
			<!-- End #main -->

<jsp:include page="../../layout/footer.jsp"></jsp:include>

<!-- Summernote JS - CDN Link -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


	<script>
		$(document).ready(function() {
			$('#summernote').summernote({

				codeviewFilter : true,
				codeviewIframeFilter : true,
				callbacks : {
					onChange : function(contents, $editable) {
						$('#summernote-input').val(contents);
					}
				}
			});
		});
	</script>
<script>
		//圖片預覽
		var input = document.getElementById('articleImage');
		input.addEventListener('change', function() {
			var preview = document.getElementById('imagePreview');
			preview.src = URL.createObjectURL(input.files[0]);
		});
	</script>

</body>
</html>