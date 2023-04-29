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
<title>文章列表</title>
</head>
<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>

	<main id="main">

		<!-- ======= Search Results ======= -->
		<section id="search-result" class="search-result">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div style="text-align: right;">
							<a href="${contextRoot}/articleFront/add"><button>發文</button></a>
						</div>
						<h3 class="category-title">討論區文章列表</h3>
						<c:forEach var="art" items="${page.content}">
							<div class="d-md-flex post-entry-2 small-img">
								<a href="${contextRoot}/articleContent/${art.articleID}"
									class="me-4 thumbnail"> <img
									src="assetsForFrontend/img/post-landscape-1.jpg" alt=""
									class="img-fluid">
								</a>
								<div>
									<div class="post-meta">
										<span class="date">${art.articleCategory.articleCategoryName}</span>
										<span class="mx-1">&bullet;</span> <span>${art.articleCreateTime}</span>
									</div>
									<h3>
										<a href="${contextRoot}/articleContent/${art.articleID}">${art.articleTitle}</a>
									</h3>
									<p>${art.articlePreview}</p>
									<div class="d-flex align-items-center author">
										<div class="photo">
											<img src="assets/img/person-2.jpg" alt="" class="img-fluid">
										</div>
										<div class="name">
											<h3 class="m-0 p-0">發文者名稱</h3>
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
						<!-- ======= Sidebar ======= -->
						<div class="aside-block">

							<ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab"
								role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="pills-popular-tab"
										data-bs-toggle="pill" data-bs-target="#pills-popular"
										type="button" role="tab" aria-controls="pills-popular"
										aria-selected="true">Popular</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="pills-trending-tab"
										data-bs-toggle="pill" data-bs-target="#pills-trending"
										type="button" role="tab" aria-controls="pills-trending"
										aria-selected="false">Trending</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="pills-latest-tab"
										data-bs-toggle="pill" data-bs-target="#pills-latest"
										type="button" role="tab" aria-controls="pills-latest"
										aria-selected="false">Latest</button>
								</li>
							</ul>

							<div class="tab-content" id="pills-tabContent">

								<!-- Popular -->
								<div class="tab-pane fade show active" id="pills-popular"
									role="tabpanel" aria-labelledby="pills-popular-tab">
									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Sport</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">How to Avoid Distraction and Stay Focused
												During Video Calls?</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">17 Pictures of Medium Length Hair in Layers
												That Will Inspire Your New Haircut</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Culture</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">9 Half-up/half-down Hairstyles for Long and
												Medium Hair</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">Life Insurance And Pregnancy: A Working Mom’s
												Guide</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Business</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">The Best Homemade Masks for Face (keep the
												Pimples Away)</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">10 Life-Changing Hacks Every Working Mom
												Should Know</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>
								</div>
								<!-- End Popular -->

								<!-- Trending -->
								<div class="tab-pane fade" id="pills-trending" role="tabpanel"
									aria-labelledby="pills-trending-tab">
									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">17 Pictures of Medium Length Hair in Layers
												That Will Inspire Your New Haircut</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Culture</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">9 Half-up/half-down Hairstyles for Long and
												Medium Hair</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">Life Insurance And Pregnancy: A Working Mom’s
												Guide</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Sport</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">How to Avoid Distraction and Stay Focused
												During Video Calls?</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>
									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Business</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">The Best Homemade Masks for Face (keep the
												Pimples Away)</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">10 Life-Changing Hacks Every Working Mom
												Should Know</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>
								</div>
								<!-- End Trending -->

								<!-- Latest -->
								<div class="tab-pane fade" id="pills-latest" role="tabpanel"
									aria-labelledby="pills-latest-tab">
									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">Life Insurance And Pregnancy: A Working Mom’s
												Guide</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Business</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">The Best Homemade Masks for Face (keep the
												Pimples Away)</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">10 Life-Changing Hacks Every Working Mom
												Should Know</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Sport</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">How to Avoid Distraction and Stay Focused
												During Video Calls?</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">17 Pictures of Medium Length Hair in Layers
												That Will Inspire Your New Haircut</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

									<div class="post-entry-1 border-bottom">
										<div class="post-meta">
											<span class="date">Culture</span> <span class="mx-1">&bullet;</span>
											<span>Jul 5th '22</span>
										</div>
										<h2 class="mb-2">
											<a href="#">9 Half-up/half-down Hairstyles for Long and
												Medium Hair</a>
										</h2>
										<span class="author mb-3 d-block">Jenny Wilson</span>
									</div>

								</div>
								<!-- End Latest -->



								<div class="aside-block">
									<h3 class="aside-title">Categories</h3>
									<ul class="aside-links list-unstyled">
										<li><a href="category.html"><i
												class="bi bi-chevron-right"></i> Business</a></li>
										<li><a href="category.html"><i
												class="bi bi-chevron-right"></i> Culture</a></li>
										<li><a href="category.html"><i
												class="bi bi-chevron-right"></i> Sport</a></li>
										<li><a href="category.html"><i
												class="bi bi-chevron-right"></i> Food</a></li>
										<li><a href="category.html"><i
												class="bi bi-chevron-right"></i> Politics</a></li>
										<li><a href="category.html"><i
												class="bi bi-chevron-right"></i> Celebrity</a></li>
										<li><a href="category.html"><i
												class="bi bi-chevron-right"></i> Startups</a></li>
										<li><a href="category.html"><i
												class="bi bi-chevron-right"></i> Travel</a></li>
									</ul>
								</div>
								<!-- End Categories -->

								<div class="aside-block">
									<h3 class="aside-title">Tags</h3>
									<ul class="aside-tags list-unstyled">
										<li><a href="category.html">Business</a></li>
										<li><a href="category.html">Culture</a></li>
										<li><a href="category.html">Sport</a></li>
										<li><a href="category.html">Food</a></li>
										<li><a href="category.html">Politics</a></li>
										<li><a href="category.html">Celebrity</a></li>
										<li><a href="category.html">Startups</a></li>
										<li><a href="category.html">Travel</a></li>
									</ul>
								</div>
								<!-- End Tags -->

							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Search Result -->

	</main>
	<!-- End #main -->

	<jsp:include page="../../layout/footer.jsp"></jsp:include>


</body>
</html>