<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<head>

<!-- =======================================================
  * Template Name: ZenBlog
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
  * Author: BootstrapMade.com
  * License: https:///bootstrapmade.com/license/
  ======================================================== -->

</head>

<body style="background-color: #f4f0e6; font-family: 微軟正黑體;">
	<!-- ======= Header ======= -->
	<jsp:include page="../../layout/header.jsp"></jsp:include>
	<!-- End Header -->

	<main id="main">
		<section id="contact" class="contact mb-5">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-lg-12 text-center mb-5">
						<h3 class="page-title">
							<i class="fa-solid fa-cart-shopping"></i> 心願清單商品
						</h3>
					</div>
				</div>

				<div>
					<table class="table">
						<thead>
							<tr>

								<th scope="col">商品名稱</th>
								<th scope="col" style="width: 30%;">商品價格</th>
								<th>刪除</th>

							</tr>
						</thead>
						<tbody>
							<jstl:forEach var="commodity" items="${wishListInfo}">
								<tr>

									<td>${commodity.commodity.commName}</td>
									<td>${commodity.commodity.commPrice}</td>
									<td><form:form
											action="${contextRoot}/Store/wishList/delete" method="DELETE">
											<input type="hidden" name="commId"
												value="${commodity.commodity.commId}">
											<input type="hidden" name="memberId"
												value="${commodity.member.id}">
											<button type="submit" class="btn btn-warning">刪除</button>
										</form:form></td>

									<td>
										<button type="submit"
											class="btn btn-outline-warning shopping-cart-button"
											data-comm-id="${commodity.commodity.commId}">加入購物車</button>
									</td>


								</tr>
							</jstl:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5" style="padding-left: 82%;">
									<a href="${contextRoot}/orderSystem/shoppingCart">
									<button type="button" class="btn btn-primary">
										查看購物車 <span id="total"></span>
									</button>
									</a>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>


			</div>
		</section>
	</main>
	<!-- End #floor-plans-container -->

	<!-- ======= Footer ======= -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<!-- End Footer -->

</body>


<script>
document.addEventListener("DOMContentLoaded", function () {
	var memberId = "${member.id}";
	var shoppingCartButtons = document.querySelectorAll('.shopping-cart-button');
	shoppingCartButtons.forEach(function (button) {
		button.addEventListener('click', function () {
			var quantity = 1;
			var commodityId = button.getAttribute('data-comm-id');
			// 發 fetch 請求加入購物車，預設數量為 1
			fetch('${contextRoot}/api/shoppingCart', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({
					commodityId: commodityId,
					quantity: quantity,
					memberId: memberId
				})
			})
				.then(response => {
					if (response.ok) {
						console.log('加入購物車成功');
						alert('加入購物車成功');
					} else {
						console.log('加入購物車失敗');
						alert('加入購物車失敗');
					}
				})
				.catch(error => {
					console.error('Error:', error);
				});
		});
	});
});
</script>

</html>