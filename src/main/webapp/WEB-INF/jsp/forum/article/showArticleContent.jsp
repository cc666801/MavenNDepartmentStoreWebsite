<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章內容</title>
<!-- icon CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

</head>
<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<main id="main">

		<section class="single-post-content">
			<div class="container">
				<div class="row">
					<div class="col-md-9 post-content" data-aos="fade-up">
						<button id="like-btn">讚</button>
						<!-- ======= Single Post Content ======= -->
						<div class="single-post">
							<div class="post-meta">
								<span class="date">${article.articleCategory.articleCategoryName}</span>
								<span class="mx-1">&bullet;</span> <span>${article.articleCreateTime}</span>
							</div>
							<h1 class="mb-5">${article.articleTitle}</h1>
							<div class="card">
								<spring:escapeBody>${article.articleContent}</spring:escapeBody>
							</div>
						</div>
						<!-- End Single Post Content -->

						<!-- ======= Comments ======= -->

						<div class="comments">
							<h5 class="comment-title py-4">${commentCount}Comments</h5>
							<c:forEach items="${comment}" var="c">
								<div class="comment d-flex mb-4">
									<div class="comment d-flex">
										<div class="flex-shrink-0">
											<div class="avatar avatar-sm rounded-circle">
												<img class="avatar-img"
													src="../assetsForFrontend/img/person-2.jpg" alt=""
													class="img-fluid">
											</div>
										</div>
										<div class="flex-shrink-1 ms-2 ms-sm-3">
											<div class="comment-meta d-flex">
												<h6 class="me-2">${c.member.name}</h6>
												<span class="text-muted">${c.commentCreateTime}</span>
											</div>
											<div class="comment-body">${c.commentContent}</div>
											<c:if
												test="${currentMember != null and c.member.id == currentMember.id}">
												<div class="edit-comment-form" style="display:none;">
													<form id="edit-comment-form-${c.commentID}"
														action="${contextRoot}/showArticleContent/${article.articleID}/commentEdit/${c.commentID}"
														method="POST">
														<textarea class="form-control" name="commentContent">${c.commentContent}</textarea>
														<button type="submit" class="btn btn-primary mt-3">Save</button>
														<button type="button"
															class="btn btn-secondary mt-3 ms-2 cancel-edit-button"
															data-comment-id="${c.commentID}">Cancel</button>
													</form>
												</div>

												<div class="d-flex justify-content-end align-items-end">
													<!-- edit comment button -->
													<button type="button"
														class="btn btn-link text-secondary me-3 edit-comment-button"
														data-comment-id="${c.commentID}">
														<i class="fa fa-edit"></i>
													</button>
													<!-- delete comment button -->
													<form:form method="DELETE"
														action="${contextRoot}/showArticleContent/${article.articleID}/commentDelete">
														<input type="hidden" name="commentID"
															value="${c.commentID}" />
														<input type="hidden" name="id"
															value="${article.articleID}" />
														<button type="submit" class="btn btn-link text-danger"
															onclick="return confirm('確定要刪除這則留言嗎？')">
															<i class="fa fa-trash"></i>
														</button>
													</form:form>
												</div>
											</c:if>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- End Comments -->


						<!-- ======= Comments Form ======= -->
						<div class="row justify-content-center mt-5">

							<div class="col-lg-12">
								<h5 class="comment-title">Leave a Comment</h5>
								<div class="row">

									<div class="col-12 mb-3">

										<form method="post"
											action="${contextRoot}/showArticleContent/${article.articleID}/comment">
											<div class="form-group">
												<label for="comment-message">留言内容：</label>
												<textarea class="form-control" id="comment-message"
													name="commentContent" placeholder="請在此回覆文章" cols="30"
													rows="5" required="required"></textarea>
											</div>
											<br>
											<div class="col-12">
												<button type="submit" class="btn btn-primary">提交留言</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- End Comments Form -->
					</div>
					<div class="col-md-3">
						<!-- ======= Sidebar ======= -->
						<!--             <div class="aside-block"> -->

						<!--               <ul class="nav nav-pills custom-tab-nav mb-4" id="pills-tab" role="tablist"> -->
						<!--                 <li class="nav-item" role="presentation"> -->
						<!--                   <button class="nav-link active" id="pills-popular-tab" data-bs-toggle="pill" data-bs-target="#pills-popular" type="button" role="tab" aria-controls="pills-popular" aria-selected="true">Popular</button> -->
						<!--                 </li> -->
						<!--                 <li class="nav-item" role="presentation"> -->
						<!--                   <button class="nav-link" id="pills-trending-tab" data-bs-toggle="pill" data-bs-target="#pills-trending" type="button" role="tab" aria-controls="pills-trending" aria-selected="false">Trending</button> -->
						<!--                 </li> -->
						<!--                 <li class="nav-item" role="presentation"> -->
						<!--                   <button class="nav-link" id="pills-latest-tab" data-bs-toggle="pill" data-bs-target="#pills-latest" type="button" role="tab" aria-controls="pills-latest" aria-selected="false">Latest</button> -->
						<!--                 </li> -->
						<!--               </ul> -->

						<!--               <div class="tab-content" id="pills-tabContent"> -->

						<!--                 Popular -->
						<!--                 <div class="tab-pane fade show active" id="pills-popular" role="tabpanel" aria-labelledby="pills-popular-tab"> -->
						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Sport</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">17 Pictures of Medium Length Hair in Layers That Will Inspire Your New Haircut</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">9 Half-up/half-down Hairstyles for Long and Medium Hair</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">Life Insurance And Pregnancy: A Working Mom’s Guide</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">The Best Homemade Masks for Face (keep the Pimples Away)</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">10 Life-Changing Hacks Every Working Mom Should Know</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->
						<!--                 </div> End Popular -->

						<!--                 Trending -->
						<!--                 <div class="tab-pane fade" id="pills-trending" role="tabpanel" aria-labelledby="pills-trending-tab"> -->
						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">17 Pictures of Medium Length Hair in Layers That Will Inspire Your New Haircut</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">9 Half-up/half-down Hairstyles for Long and Medium Hair</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">Life Insurance And Pregnancy: A Working Mom’s Guide</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Sport</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->
						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">The Best Homemade Masks for Face (keep the Pimples Away)</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">10 Life-Changing Hacks Every Working Mom Should Know</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->
						<!--                 </div> End Trending -->

						<!--                 Latest -->
						<!--                 <div class="tab-pane fade" id="pills-latest" role="tabpanel" aria-labelledby="pills-latest-tab"> -->
						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">Life Insurance And Pregnancy: A Working Mom’s Guide</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Business</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">The Best Homemade Masks for Face (keep the Pimples Away)</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">10 Life-Changing Hacks Every Working Mom Should Know</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Sport</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">How to Avoid Distraction and Stay Focused During Video Calls?</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">17 Pictures of Medium Length Hair in Layers That Will Inspire Your New Haircut</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                   <div class="post-entry-1 border-bottom"> -->
						<!--                     <div class="post-meta"><span class="date">Culture</span> <span class="mx-1">&bullet;</span> <span>Jul 5th '22</span></div> -->
						<!--                     <h2 class="mb-2"><a href="#">9 Half-up/half-down Hairstyles for Long and Medium Hair</a></h2> -->
						<!--                     <span class="author mb-3 d-block">Jenny Wilson</span> -->
						<!--                   </div> -->

						<!--                 </div> End Latest -->

						<!--               </div> -->
						<!--             </div> -->

						<!--             <div class="aside-block"> -->
						<!--               <h3 class="aside-title">Video</h3> -->
						<!--               <div class="video-post"> -->
						<!--                 <a href="https://www.youtube.com/watch?v=AiFfDjmd0jU" class="glightbox link-video"> -->
						<!--                   <span class="bi-play-fill"></span> -->
						<!--                   <img src="assets/img/post-landscape-5.jpg" alt="" class="img-fluid"> -->
						<!--                 </a> -->
						<!--               </div> -->
						<!--             </div>End Video -->

						<!--             <div class="aside-block"> -->
						<!--               <h3 class="aside-title">Categories</h3> -->
						<!--               <ul class="aside-links list-unstyled"> -->
						<!--                 <li><a href="category.html"><i class="bi bi-chevron-right"></i> Business</a></li> -->
						<!--                 <li><a href="category.html"><i class="bi bi-chevron-right"></i> Culture</a></li> -->
						<!--                 <li><a href="category.html"><i class="bi bi-chevron-right"></i> Sport</a></li> -->
						<!--                 <li><a href="category.html"><i class="bi bi-chevron-right"></i> Food</a></li> -->
						<!--                 <li><a href="category.html"><i class="bi bi-chevron-right"></i> Politics</a></li> -->
						<!--                 <li><a href="category.html"><i class="bi bi-chevron-right"></i> Celebrity</a></li> -->
						<!--                 <li><a href="category.html"><i class="bi bi-chevron-right"></i> Startups</a></li> -->
						<!--                 <li><a href="category.html"><i class="bi bi-chevron-right"></i> Travel</a></li> -->
						<!--               </ul> -->
						<!--             </div>End Categories -->

						<!--             <div class="aside-block"> -->
						<!--               <h3 class="aside-title">Tags</h3> -->
						<!--               <ul class="aside-tags list-unstyled"> -->
						<!--                 <li><a href="category.html">Business</a></li> -->
						<!--                 <li><a href="category.html">Culture</a></li> -->
						<!--                 <li><a href="category.html">Sport</a></li> -->
						<!--                 <li><a href="category.html">Food</a></li> -->
						<!--                 <li><a href="category.html">Politics</a></li> -->
						<!--                 <li><a href="category.html">Celebrity</a></li> -->
						<!--                 <li><a href="category.html">Startups</a></li> -->
						<!--                 <li><a href="category.html">Travel</a></li> -->
						<!--               </ul> -->
						<!--             </div>End Tags -->
					</div>
				</div>
			</div>

		</section>
	</main>
	<!-- End #main -->

	<jsp:include page="../../layout/footer.jsp"></jsp:include>

	<!-- 	點讚 -->
	<!-- 	<script> -->
	<!-- 		$(document).ready(function() { -->
	<!--  			$('#like-btn').click(function() { -->
	<!--  				var articleId = 1; // 假設這裡的文章 ID 是 1 -->
	<!--  				var memberId = 2; // 假設這裡的會員 ID 是 2 -->
	<!-- 				$.ajax({ -->
	<!--  					url : '/like', -->
	<!-- 					type : 'POST', -->
	<!-- 					data : { -->
	<!-- 						articleId : articleId, -->
	<!--  						memberId : memberId -->
	<!--  					}, -->
	<!--  					success : function(response) { -->
	<!--  						// 成功點讚後的動作 -->
	<!--  						$('#like-btn').text('取消讚'); -->
	<!--  					}, -->
	<!--  					error : function(jqXHR, textStatus, errorThrown) { -->
	<!--  						// 失敗時的動作 -->
	<!--  						alert(jqXHR.responseText); -->
	<!--  					} -->
	<!-- 				}); -->
	<!-- 			}); -->
	<!--  		}); -->
	<!-- 	</script> -->
	<script>
	$(document).ready(function() {
		// 監聽編輯 icon 的點擊事件
		$('.edit-comment-button').click(function() {
			var commentID = $(this).data('comment-id'); // 留言 ID
			var commentContent = $(this).closest('.comment').find('.comment-body').text().trim(); // 留言內容
			// 將留言內容放入一個 textarea 元素中
			var textarea = $('<textarea>').addClass('form-control').attr('name', 'commentContent').text(commentContent);
			var form = $('<form>').addClass('edit-comment-form').attr('id', 'edit-comment-form-' + commentID)
				.attr('action', '${contextRoot}/showArticleContent/${article.articleID}/commentEdit/' + commentID)
				.attr('method', 'POST');
			form.append(textarea); // 添加 textarea 元素到表單中
			form.append($('<button>').addClass('btn btn-primary mt-3').attr('type', 'submit').text('Save')); // 添加 save 按鈕到表單中
			form.append($('<button>').addClass('btn btn-secondary mt-3 ms-2 cancel-edit-button').attr('type', 'button')
				.attr('data-comment-id', commentID).text('Cancel')); // 添加 cancel 按鈕到表單中
			$(this).closest('.comment').find('.comment-body').html(form); // 將表單添加到留言容器中
			$(this).closest('.comment').find('.edit-comment-form').show(); // 顯示編輯表單
		});

		// 監聽取消編輯按鈕的點擊事件
		$(document).on('click', '.cancel-edit-button', function() {
			var commentID = $(this).data('comment-id'); // 留言 ID
			$('#edit-comment-form-' + commentID).remove(); // 刪除表單元素
			// 將留言內容恢復為原始內容
			var commentContent = $(this).closest('.comment').find('.comment-body').data('comment-content');
			$(this).closest('.comment').find('.comment-body').html(commentContent);
		});
	});
	</script>

</body>
</html>