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
<title>文章管理後台-新增</title>

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
    /* 設定 body 的背景顏色與文字顏色 */
    body {
        background-color: #f8f9fa;
        color: #333333;
    }

    /* 設定 card 樣式 */
    .card {
        margin: 20px;
        padding: 20px;
        border: none;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background-color: white;
    }

    /* 設定 card-header 樣式 */
    .card-header {
        border-bottom: none;
        padding-bottom: 0;
    }

    /* 設定 card-title 樣式 */
    .card-title {
        font-size: 24px;
        font-weight: bold;
        margin: 0;
    }

    /* 設定 label 樣式 */
    label {
        font-size: 16px;
        font-weight: bold;
    }

    /* 設定 input 樣式 */
    input[type="text"],
    select {
        font-size: 16px;
        padding: 8px;
        border: 1px solid #cccccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-bottom: 10px;
        width: 100%;
    }

    /* 設定 input[type="file"] 樣式 */
    input[type="file"] {
        display: block;
        margin-bottom: 10px;
    }

    /* 設定 img 樣式 */
    img {
        max-width: 200px;
        max-height: 200px;
        object-fit: cover;
        margin-left: 10px;
    }

    /* 設定 summernote 樣式 */
    #summernote {
        font-size: 16px;
        padding: 10px;
        border: 1px solid #cccccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-bottom: 10px;
        width: 100%;
        height: 300px;
    }

    /* 設定 button 樣式 */
    button[type="submit"] {
        background-color: #007bff;
        color: white;
        font-size: 16px;
        font-weight: bold;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    /* 設定 button:hover 樣式 */
    button[type="submit"]:hover {
        background-color: #0069d9;
    }
</style>

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
				<div class="container-fluid px-4">
					<div class="card">
						<div class="card-header">
							<h2 class="card-title">文章管理-新增</h2>
						</div>

						<form:form modelAttribute="article" method="post"
							enctype="multipart/form-data"
							action="${contextRoot}/articleBack/post">
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
							<div id="summernote" required="required"></div>
							<br>
							<button type="submit">送出</button>
						</form:form>
					</div>
				</div>

			</main>
			<!-- End #main -->

			<!-- ======= Footer ======= -->
			<jsp:include page="../../layout/footerForBackend.jsp"></jsp:include>
			<!-- End Footer -->
		</div>
	</div>

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

</body>
</html>