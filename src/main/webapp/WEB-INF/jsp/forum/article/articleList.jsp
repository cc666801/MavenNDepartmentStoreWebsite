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
										class="img-fluid" style="max-width: 80%; max-height: 80%;">
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
												<img src="${contextRoot}/assetsForFrontend/img/person-2.jpg"
													alt="" class="img-fluid">
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
										<a href="?p=${page.previousPageable().pageNumber+1}"
											class="prev">Prevous</a>
									</c:if>
									<c:forEach var="i" begin="1" end="${page.totalPages}">
										<c:choose>
											<c:when test="${i == page.number + 1}">
												<a href="#" class="active">${i}</a>
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
									<input type="text" name="search" id="searchInput"
										placeholder="搜尋文章標題">
									<button type="submit">搜索</button>
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
		// 				$(function() {
		// 					$("#sortSelect").change(function(event) {
		// 						event.preventDefault(); // 阻止表單提交後跳轉頁面的預設行為
		// 						var selectedValue = $("#sortSelect").val();

		// 						$.ajax({
		// 							url : $("#sortForm").attr("action"),
		// 							type : "GET",
		// 							data : $("#sortForm").serialize(),
		// 							success : function(data) {
		// 								$("#articleList").html(data);
		// 								$("#sortSelect").val(selectedValue);
		// 							}
		// 						});
		// 					});
		// 				});

		// 		    $(function() {
		// 		        $("#searchForm, #sortForm").change(function(event) {
		// 		            event.preventDefault(); // 阻止表單提交後跳轉頁面的預設行為
		// 		            var selectedValue = $("#sortSelect").val();
		// 		            var searchedValue = $("#search").val();
		// 		            $.ajax({
		// 		                url : $("#searchForm").attr("action"),
		// 		                type : "GET",
		// 		                data : $("#searchForm, #sortForm").serialize(),
		// 		                success : function(data) {
		// 		                    $("#articleList").html(data);
		// 		//                     $("#sortSelect").val(selectedValue);
		// 		                    $("#search").val(searchedValue);

		// 		                }
		// 		            });
		// 		        });
		// 		    });

		// function refreshPage() {
		//     var sortBy = $('#sortSelect').val();
		//     var category = $('#categoryForm a.active').data('category');
		//     var search = $('#search').val();
		//     $.ajax({
		//         url: '${pageContext.request.contextPath}/articleList',
		//         data: {
		//             sortBy: sortBy,
		//             category: category,
		//             search: search
		//         },
		//         success: function(data) {
		//             $('#page').html(data);
		//         }
		//     });
		// }

		// // 排序的select
		// $('#sortSelect').on('change', function() {
		//     refreshPage();
		// });

		// // 類別的選項
		// $('#categoryForm a').on('click', function(event) {
		//     event.preventDefault();
		//     $('#categoryForm a').removeClass('active');
		//     $(this).addClass('active');
		//     refreshPage();
		// });

		// // 關鍵字的input
		// $('#searchForm').on('submit', function(event) {
		//     event.preventDefault();
		//     refreshPage();
		// });

		function updateArticleList() {
			var sortBy = $('#sortBySelect').val();
			var search = $('#searchInput').val();
			var categoryId = $('ul.aside-tags button.active').data('category-id');

			$.ajax({
				type : 'GET',
				url : '${contextRoot}/articleList',
				data : {
					sortBy : sortBy,
					search : search,
					articleCategoryID : categoryId
				},
				success : function(data) {
					$("#articleList").html(data);
				},
				error : function() {
					alert('錯誤發生');
				}
			});
		}

		$('#sortBySelect').on('change', function() {
			updateArticleList();
		});

		$('#searchForm').on('submit', function(event) {
			event.preventDefault();
			updateArticleList();
		});

		$('ul.aside-tags button').on('click', function() {
			$(this).addClass('active').siblings().removeClass('active');
			updateArticleList();
		});
	</script>

</body>
</html>
