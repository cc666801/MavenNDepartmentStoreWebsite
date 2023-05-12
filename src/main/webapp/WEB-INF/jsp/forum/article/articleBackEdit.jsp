<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯文章</title>

<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">

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
input[type="text"], select {
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

 button[type="submit"],
.previewArticle {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 0.25rem;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
 margin-right: 20px;
  margin-left: 20px;
}

button[type="submit"]:hover,
.previewArticle:hover {
  background-color: #0069d9;
}
.form-button {
  display: flex;
  justify-content: center;
  margin-top: 1rem;
}
/* 預覽文章 */

.popup {
	display: none;
	position: fixed;
	z-index: 999;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.popup-content {
	background-color: #ffffff;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
	width: 100%;
	height: 100%;
	max-width: 80%;
	position: relative;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	text-align: center;
	overflow: auto;
	 margin-left: 250px;/* 左側navbar寬度 */
}

.close {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 28px;
	font-weight: bold;
	color: #999999;
	cursor: pointer;
	transition: color 0.3s ease;
}

.close:hover {
	color: #3e3e3e;
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
							<h2 class="card-title">文章管理-編輯</h2>
						</div>
						<form:form modelAttribute="art" method="put"
							enctype="multipart/form-data"
							action="${contextRoot}/articleBack/edit">
							<form:label path="articleID">文章編號:</form:label>
							<form:input type="hidden" path="articleID" />
							<br>
							<form:label path="articleTitle">標題:</form:label>
							<form:input path="articleTitle" required="required" />
							<br>

							<form:label path="articleCategory">類別:</form:label>
							<form:select path="articleCategory" required="required">
								<option value="" disabled selected>請選擇類別</option>
								<optgroup label="<管理員>">
									<c:forEach items="${categoryList}" var="category">
										<c:if test="${category.articleCategoryPermissions == 0}">
											<form:option value="${category.articleCategoryID}">
          ${category.articleCategoryName}
        </form:option>
										</c:if>
									</c:forEach>
								</optgroup>
								<optgroup label="<公開>">
									<c:forEach items="${categoryList}" var="category">
										<c:if test="${category.articleCategoryPermissions == 1}">
											<form:option value="${category.articleCategoryID}">
          ${category.articleCategoryName}
        </form:option>
										</c:if>
									</c:forEach>
								</optgroup>
							</form:select>
							<br>
							<form:label path="articleImage">文章縮圖:</form:label>
							<form:input id="articleImage" path="imgToByte" type="file"
								accept="image/*"></form:input>
							<form:hidden path="articleImage" id="articleImageBase64"
								value="${imageData}" />
							<img id="imagePreview" src="data:image/jpeg;base64,${imageData}"
								alt="圖片預覽"
								style="max-width: 200px; max-height: 200px; object-fit: cover; margin-left: 10px;">
							<br>

							<form:hidden name="articleContent" path="articleContent"
								id="summernote-input" />
							<div id="summernote">${articleContent}</div>
							<br>
							<div class="form-button">
								<button type="submit">送出</button>
								<button type="button" class="previewArticle">預覽文章</button>
							</div>
						</form:form>
					</div>
				</div>

				<div id="popup-preview" class="popup">
					<div class="popup-content">
						<span class="close">&times;</span>
						<div id="articlePreview"></div>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Summernote JS - CDN Link -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 400,
				callbacks : {
					onInit : function() {
						var contents = $('#summernote').summernote('code');
						$('#articlePreview').html(contents);
					},
					onChange : function(contents, $editable) {
						$('#summernote-input').val(contents);
						$('#articlePreview').html(contents);
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
			preview.src = URL.createObjectURL(input.files[0]);
		});
	</script>
	<!-- 	預覽文章 -->
	<!-- 	預覽文章 -->
	<script>	
		$(document).ready(function() {
			// 綁定每個 button 的 click 事件
			$('.previewArticle').click(function() {
				// 判斷該按鈕是否有對應的類別，以開啟對應的 popup				 
					$('#popup-preview').fadeIn();				
			});

			// 綁定關閉彈出視窗的事件
			$('.close').click(function() {
				$('#popup-preview').fadeOut();
			});
		});
	</script>

</body>

</html>