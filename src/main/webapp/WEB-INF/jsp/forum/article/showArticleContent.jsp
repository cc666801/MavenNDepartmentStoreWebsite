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
<style>
/* 讚 */
#like-btn {
	font-size: 30px;
	background-color: transparent;
	border: none;
	padding: 0;
	margin: 0;
	vertical-align: middle;
	float: right;
}

.card {
	min-height: 200px;
	display: flex;
	flex-direction: column;
	/*   justify-content: center; */
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card p {
	font-size: 16px;
	line-height: 1.5;
}
</style>


</head>
<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<main id="main">

		<section class="single-post-content">
			<div class="container">
				<div class="row">
					<div class="col-md-9 post-content" data-aos="fade-up">
						<button id="like-btn" data-articleID="${article.articleID}"
							data-liked="${isLiked}">
							<i class="fa${isLiked ? "s" : "r"} fa-heart"></i>
						</button>

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
							<c:forEach items="${comments}" var="c">
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
												<div class="comment">

													<form method="post" class="edit-comment-form"
														style="display: none;"
														action="${contextRoot}/showArticleContent/${article.articleID}/commentEdit">
														<textarea name="commentContent"></textarea>
														<button type="submit" class="btn btn-primary">保存</button>
														<button type="button"
															class="btn btn-secondary cancel-edit-button">取消</button>
														<input type="hidden" name="commentID"
															value="${c.commentID}" />

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

										<form method="post" id="comment-form"
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
						
					</div>
				</div>
			</div>

		</section>
	</main>
	<!-- End #main -->

	<jsp:include page="../../layout/footer.jsp"></jsp:include>

	<!-- 	點讚 -->
	<script>
		$(document)
				.ready(
						function() {
							$('#like-btn')
									.click(
											function() {

												var articleId = $(this).data(
														'articleID');
												var liked = $(this).data(
														'liked');
												// 先檢查會員登入狀態
												$
														.ajax({
															type : "GET",
															url : `${contextRoot}/checkLogin`,
															success : function(
																	response) {
																if (response === "true") {
																	// 已登入，執行點讚動作
																	if (liked) {
																		// 取消點讚
																		$
																				.ajax({
																					method : 'POST',
																					type : 'POST',
																					url : `${contextRoot}/showArticleContent/${article.articleID}/unlike`,
																					success : function() {
																						$(
																								'#like-btn')
																								.data(
																										'liked',
																										false);
																						$(
																								'#like-btn i')
																								.removeClass(
																										'fas')
																								.addClass(
																										'far');
																						console
																								.log($(
																										'#like-btn')
																										.data(
																												'liked'));
																					},
																					error : function() {
																						alert('取消點讚失敗');
																					}
																				});
																	} else {
																		// 點讚
																		$
																				.ajax({
																					method : 'POST',
																					type : 'POST',
																					url : `${contextRoot}/showArticleContent/${article.articleID}/like`,
																					success : function() {
																						$(
																								'#like-btn')
																								.data(
																										'liked',
																										true);
																						$(
																								'#like-btn i')
																								.removeClass(
																										'far')
																								.addClass(
																										'fas');
																						console
																								.log($(
																										'#like-btn')
																										.data(
																												'liked'));
																					},
																					error : function() {
																						alert('點讚失敗');
																					}
																				});
																	}
																} else {
																	// 未登入，提示用戶登入會員
																	alert('請先登入會員');
																}
															},
															error : function() {
																alert('檢查登入狀態失敗');
															}
														});
											});
						});
	</script>
	<!-- 	判斷留言會員登入 -->
	<script>
		$("#comment-form").submit(function(event) {
			event.preventDefault(); // 阻止表單提交
			// 檢查會員登入狀態
			$.ajax({
				type : "GET",
				url : `${contextRoot}/checkLogin`,
				success : function(response) {
					if (response === "true") {
						// 已登入
						$("#comment-form").unbind('submit').submit(); // 解除阻止表單提交
					} else {
						alert("請先登入會員");
					}
				}
			});
		});
	</script>

	
	
	
	<!-- 	編輯留言 -->
	<script>
		$(document)
				.ready(
						function() {
							// 監聽編輯圖示的點擊事件
							$('.edit-comment-button')
									.click(
											function() { // 切換表單的顯示狀態
												$(this)
														.closest('.comment')
														.find(
																'.edit-comment-form')
														.toggle();
												// 獲取留言內容
												var commentContent = $(this)
														.closest('.comment')
														.find('.comment-body')
														.text().trim();
												// 將留言內容放入 textarea 元素中
												$(this)
														.closest('.comment')
														.find(
																'.edit-comment-form textarea[name="commentContent"]')
														.val(commentContent);
											});

							// 監聽取消編輯按鈕的點擊事件
							$(document).on(
									'click',
									'.cancel-edit-button',
									function() {
										// 切換表單的顯示狀態
										$(this).closest('.comment').find(
												'.edit-comment-form').hide();
									});
						});
	</script>




</body>
</html>