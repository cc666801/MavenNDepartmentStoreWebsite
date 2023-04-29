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
</head>
<body>




	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<main id="main">
		<div class="card">
			<h1>文章管理-新增</h1>
			<form:form modelAttribute="article" method="post"
				action="${contextRoot}/articleFront/post">
				<form:label path="articleTitle">標題:</form:label>
				<form:input path="articleTitle" />
				<br>
				<form:label path="articleCategory">類別:</form:label>
				<form:select path="articleCategory">
					<c:forEach items="${categoryList}" var="category">
						<form:option value="${category.articleCategoryID}">${category.articleCategoryName}</form:option>
					</c:forEach>
				</form:select>
				<br>
				<input type="hidden" name="content" id="summernote-input">
				<div id="summernote"></div>
				<button type="submit">送出</button>
			</form:form>
		</div>
	</main>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	
	
	<script>
		$(document).ready(function() {

			$('#summernote').summernote({
				height: 400,
				callbacks : {
					onChange : function(contents, $editable) {
						$('#summernote-input').val(contents);
					}
				},
				codeviewFilter : true,
				codeviewIframeFilter : true,
				lang:'zh-TW'
				
			});

			

		});
	</script>
	
	
</body>
</html>