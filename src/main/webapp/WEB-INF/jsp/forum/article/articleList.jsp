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
<title>文章列表</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.aside-block button {
	background-color: #f5f5f5;
	border: none;
	padding: 8px 16px;
	margin-bottom: 10px;
	cursor: pointer;
}

.aside-block button.active {
	background-color: #ebebeb;
}
</style>

</head>
<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>

	<main id="main">
		<div id="articleList">
			<!-- ======= Search Results ======= -->
			<section id="search-result" class="search-result">
				<div class="container">
					<div class="row">
						<div class="col-md-9">
							<div style="text-align: right;">
								<a href="${contextRoot}/articleFront/add"><button
										class="btn btn-primary">發文</button></a>
							</div>


							<h3 class="category-title">討論區文章列表</h3>

							<form id="sortForm" method="get" action="#">
								<select name="sortBy" id="sortBySelect">
									<option value="articleEditTime"
										${sortBy == 'articleEditTime' ? 'selected' : ''}>最後發表</option>
									<option value="articleLikeCount"
										${sortBy == 'likesCount' ? 'selected' : ''}>熱門</option>
									<option value="commentCount"
										${sortBy == 'commentCount' ? 'selected' : ''}>最高人氣</option>
									<option value="comments.commentEditTime"
										${sortBy == 'comments.commentEditTime' ? 'selected' : ''}>最後回覆</option>
								</select>
							</form>
							<br>


							<c:forEach var="art" items="${page.content}">

								<div class="d-md-flex post-entry-2 small-img">
									<a href="${contextRoot}/articleContent/${art.articleID}"
										class="me-4 thumbnail"> <img
										src="data:image/jpeg;base64,${art.articleBase64}" alt=""
										class="img-fluid" style="max-width: 200px; max-height: 200px;">
									</a>
									<div>
										<div class="post-meta">
											<span class="date">${art.articleCategory.articleCategoryName}</span>
											<span class="mx-1">&bullet;</span> <span>${art.articleCreateTime}</span>
											<span>留言數:${commentCounts[art.articleID]}/讚數:${art.articleLikes.size()}</span>
										</div>
										<h3>
											<a href="${contextRoot}/articleContent/${art.articleID}">${art.articleTitle}</a>
										</h3>
										<p>${art.articlePreview}</p>
										<div class="d-flex align-items-center author">
											<div class="photo">
											 <img id="randomImage-${art.articleID}" src="" alt="隨機圖片" class="img-fluid">
<%-- 												<img src="${contextRoot}/assetsForFrontend/img/person-2.jpg" --%>
<!-- 													alt="" class="img-fluid"> -->
											</div>
											<div class="name">
												<h3 class="m-0 p-0">${art.member.name}</h3>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>



							<!-- Paging -->
<div class="text-start py-4">
    <div class="custom-pagination">

        <c:if test="${not page.first}">
            <a href="?p=${page.previousPageable().pageNumber+1}" class="prev">Previous</a>
        </c:if>
        <c:forEach var="i" begin="1" end="${page.totalPages}">
            <c:choose>
                <c:when test="${i == page.number+1}">
                    <a href="?p=${i}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="?p=${i}" class="page-link">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${not page.last}">
            <a href="?p=${page.nextPageable().pageNumber+1}" class="next">Next</a>
        </c:if>
    </div>
</div>
<!-- End Paging -->


						</div>

						<div class="col-md-3">
							<div class="aside-block">
								<form id="searchForm" method="get" action="#">
									<div class="input-group">
										<input type="text" class="form-control" name="search"
											id="searchInput" placeholder="搜尋文章標題">
										<button type="submit" class="btn btn-primary">搜索</button>
									</div>
								</form>
							</div>
							<div class="aside-block">
								<h3 class="aside-title">類別選單</h3>
								<div id="category">
									<ul class="aside-tags list-unstyled">
										<li><button data-category-id="">所有類別</button></li>
										<c:forEach var="category" items="${categoryList}">
											<li><button
													data-category-id="${category.articleCategoryID}">${category.articleCategoryName}</button></li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<!-- End Tags -->


							<!-- ======= Sidebar ======= -->
							<div class="aside-block">

								<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab"
									role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="pills-popular-tab"
											data-bs-toggle="pill" data-bs-target="#pills-popular"
											type="button" role="tab" aria-controls="pills-popular"
											aria-selected="true">熱門文章</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="pills-trending-tab"
											data-bs-toggle="pill" data-bs-target="#pills-trending"
											type="button" role="tab" aria-controls="pills-trending"
											aria-selected="false">最多回覆</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="pills-latest-tab"
											data-bs-toggle="pill" data-bs-target="#pills-latest"
											type="button" role="tab" aria-controls="pills-latest"
											aria-selected="false">最新文章</button>
									</li>
								</ul>

								<div class="tab-content" id="pills-tabContent">

									<!-- Popular -->

									<div class="tab-pane fade" id="pills-popular" role="tabpanel"
										aria-labelledby="pills-popular-tab">
										<c:forEach var="art" items="${hotsArticles.content}">
											<div class="post-entry-1 border-bottom">
												<div class="post-meta">
													<span class="date">${art.articleCategory.articleCategoryName}</span>
													<span class="mx-1">&bullet;</span> <span>${art.articleCreateTime}</span>
												</div>
												<h2 class="mb-2">
													<a href="${contextRoot}/articleContent/${art.articleID}">${art.articleTitle}</a>
												</h2>
												<span class="author mb-3 d-block">${art.member.name}</span>
											</div>
										</c:forEach>
									</div>
									<!-- End Popular -->

									<!-- Trending -->
									<div class="tab-pane fade show active" id="pills-trending"
										role="tabpanel" aria-labelledby="pills-trending-tab">
										<c:forEach var="art" items="${commentsArticles.content}">
											<div class="post-entry-1 border-bottom">
												<div class="post-meta">
													<span class="date">${art.articleCategory.articleCategoryName}</span>
													<span class="mx-1">&bullet;</span> <span>${art.articleCreateTime}</span>
												</div>
												<h2 class="mb-2">
													<a href="${contextRoot}/articleContent/${art.articleID}">${art.articleTitle}</a>
												</h2>
												<span class="author mb-3 d-block">${art.member.name}</span>
											</div>
										</c:forEach>
									</div>
									<!-- End Trending -->

									<!-- Latest -->

									<div class="tab-pane fade" id="pills-latest" role="tabpanel"
										aria-labelledby="pills-latest-tab">
										<c:forEach var="art" items="${latestArticles.content}">
											<div class="post-entry-1 border-bottom">
												<div class="post-meta">
													<span class="date">${art.articleCategory.articleCategoryName}</span>
													<span class="mx-1">&bullet;</span> <span>${art.articleCreateTime}</span>
												</div>
												<h2 class="mb-2">
													<a href="${contextRoot}/articleContent/${art.articleID}">${art.articleTitle}</a>
												</h2>
												<span class="author mb-3 d-block">${art.member.name}</span>
											</div>
										</c:forEach>
									</div>


									<!-- End Latest -->

								</div>

							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- End Search Result -->
		</div>
	</main>

	<!-- End #main -->

	<jsp:include page="../../layout/footer.jsp"></jsp:include>

	<!-- 排序 -->
	<script>
		$(document).ready(
				function() {
					var currentSortBy = localStorage.getItem('sortBy') || ''; // 当前的sortBy值
					var currentKeyword = localStorage.getItem('keyword') || ''; // 当前的keyword值
					var currentCategoryId = localStorage.getItem('categoryId')
							|| null; // 当前的categoryId值

					// 设置选择框的初始值
					$("#sortBySelect").val(currentSortBy);
					$("#searchInput").val(currentKeyword);

					// 如果存在当前的categoryId值，则高亮相应的分类按钮
					if (currentCategoryId) {
						$(
								'#category button[data-category-id="'
										+ currentCategoryId + '"]').addClass(
								'active');
					}

					// 监听排序方式选择改变事件
					$('#sortBySelect').on('change', function() {
						currentSortBy = $(this).val(); // 保存当前的sortBy值
						localStorage.setItem('sortBy', currentSortBy); // 将当前的sortBy值存储到localStorage中
						updateArticleList();
					});

					// 监听搜索表单提交事件
					$('#searchForm').on('submit', function(event) {
						event.preventDefault(); // 阻止表单默认提交行为
						currentKeyword = $('#searchInput').val(); // 保存当前的keyword值
						localStorage.setItem('keyword', currentKeyword); // 将当前的keyword值存储到localStorage中
						updateArticleList();
					});

					// 监听分类按钮点击事件
					$('#category button').on('click', function() {
						currentCategoryId = $(this).data('category-id'); // 保存当前的categoryId值
						localStorage.setItem('categoryId', currentCategoryId); // 将当前的categoryId值存储到localStorage中
						updateArticleList(currentCategoryId);

					});

					// 更新文章列表的函数
					function updateArticleList(categoryId) {
						var requestData = {}; // 创建空对象

						requestData.sortBy = currentSortBy; // 使用保存的当前sortBy值
						requestData.keyword = currentKeyword; // 使用保存的当前keyword值

						// 如果存在分类ID，则将其添加到requestData对象中
						if (categoryId) {
							requestData.categoryId = categoryId;
						} else {
							currentCategoryId = null; // 如果categoryId为空，则重置保存的当前categoryId值
						}

						// 构造AJAX请求的URL
						var url = '${contextRoot}/articleList';

						// 发送AJAX请求
						$.ajax({
							url : url,
							type : 'GET',
							data : requestData, // 将requestData对象作为data参数传递给后端
							success : function(data) {
								// 更新文章列表的内容
								$('#articleList').html(data);
								$("#sortSelect").val(currentSortBy); // 设置当前的sortBy值
								$("#search").val(currentKeyword); // 设置当前的keyword值
							},
							error : function(xhr, status, error) {
								console.error(error);
							}
						});
					}
				});
	</script>
<!-- 	亂數頭像 -->
<script>
  // JavaScript
  function getRandomImage(articleID) {
    // Image paths array
    var imagePaths = [
      "${contextRoot}/assetsForFrontend/img/person-1.jpg",
      "${contextRoot}/assetsForFrontend/img/person-2.jpg",
      "${contextRoot}/assetsForFrontend/img/person-3.jpg",
      "${contextRoot}/assetsForFrontend/img/person-4.jpg",
      "${contextRoot}/assetsForFrontend/img/person-5.jpg",
      "${contextRoot}/assetsForFrontend/img/person-6.jpg",
      "${contextRoot}/assetsForFrontend/img/person-7.jpg",
      // Add more image paths here
    ];

    // Randomly select an image path
    var randomIndex = Math.floor(Math.random() * imagePaths.length);
    var randomImagePath = imagePaths[randomIndex];

    // Set the src attribute of the image element
    var imgElement = document.getElementById("randomImage-" + articleID);
    imgElement.src = randomImagePath;
  }

  // Get the article IDs and call getRandomImage for each ID
  var articleIDs = [];
  <c:forEach var="art" items="${page.content}">
    articleIDs.push(${art.articleID});
  </c:forEach>

  articleIDs.forEach(function(articleID) {
    getRandomImage(articleID);
  });
</script>
</body>
</html>
