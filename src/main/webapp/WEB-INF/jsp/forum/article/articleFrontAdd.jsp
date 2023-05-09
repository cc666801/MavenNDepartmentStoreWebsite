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
<title>發佈文章</title>

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
<style>
/* Center the card */
.card {
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.3);
	max-width: 800px;
}

.card-header {
  background-color: #f8f9fa;
  padding: 1rem;
  border-bottom: 1px solid rgba(0, 0, 0, 0.125);
}

.card-title {
  margin-bottom: 0;
}

/* Style the form elements */
label {
	font-weight: bold;
}

input[type="text"], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="file"] {
	display: none;
}

/* Style the submit button */
button[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #45a049;
}

/* Style the image preview */
#imagePreview {
	display: block;
	max-width: 200px;
	max-height: 200px;
	object-fit: cover;
	margin-left: 10px;
	margin-top: 10px;
}

/* Style the editor */
#summernote {
	margin-top: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

/* Style the error messages */
.error {
	color: red;
	font-size: small;
	display: block;
	margin-top: 5px;
}

/* Responsive design */
@media only screen and (max-width: 600px) {
	.card {
		max-width: 100%;
	}
}
</style>

</head>
<body>




	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<main id="main">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">發表文章</h2>
			</div>

			<form:form modelAttribute="article" method="post"
				enctype="multipart/form-data"
				action="${contextRoot}/articleFront/post">
				<form:label path="articleTitle">標題:</form:label>
				<form:input path="articleTitle" required="required" />
				<br>
				<form:label path="articleCategory">類別:</form:label>
				<form:select path="articleCategory" required="required">
					<option value="" disabled selected>請選擇類別</option>
					<c:forEach items="${categoryList}" var="category">
						<form:option value="${category.articleCategoryID}">${category.articleCategoryName}</form:option>
					</c:forEach>
				</form:select>
				<br>
				<form:label path="articleImage">文章縮圖:</form:label>
				<form:input id="articleImage" path="imgToByte" type="file"
					accept="image/*"></form:input>
				<img id="imagePreview" src=""
					style="display: none; max-width: 200px; max-height: 200px; object-fit: cover; margin-left: 10px;">
				<br>
				<input type="hidden" name="content" id="summernote-input">
				<div id="summernote"></div>
				<br>
				<button type="submit">送出</button>
			</form:form>
		</div>
	</main>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>


	<script>
		$(document).ready(function() {

			$('#summernote').summernote({
				height : 400,
				callbacks : {
					onChange : function(contents, $editable) {
						$('#summernote-input').val(contents);
					}
				},
				codeviewFilter : true,
				codeviewIframeFilter : true,
				lang : 'zh-TW'

			});

		});
	</script>
	<script>
		//圖片預覽
		var input = document.getElementById('articleImage');
		input.addEventListener('change', function() {
			var preview = document.getElementById('imagePreview');
			if (input.files.length === 0) {
				preview.style.display = 'none';
			} else {
				preview.src = URL.createObjectURL(input.files[0]);
				preview.style.display = 'inline-block';
			}
			var preview = document.getElementById('imagePreview');
			preview.src = URL.createObjectURL(input.files[0]);
		});
	</script>
	<script>
		// 在View頁面中加入這個判斷
		if ("${errorMsg}") {
			alert("${errorMsg}");
			window.location.href = "${contextRoot}/member/login";
		}
	</script>
</body>
</html>