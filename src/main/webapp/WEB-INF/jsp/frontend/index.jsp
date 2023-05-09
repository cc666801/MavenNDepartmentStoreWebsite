<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!-- 這邊是給jstl 不是c 跟其他我寫的網頁不同 要注意 -->
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<!-- =======================================================
  * Template Name: ZenBlog
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
  * Author: BootstrapMade.com
  * License: https:///bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Hero Slider Section ======= -->
		<section id="hero-slider" class="hero-slider">
			<div class="container-md" data-aos="fade-in">
				<div class="row">
					<div class="col-12">
						<div class="swiper sliderFeaturedPosts">
							<div class="swiper-wrapper">
								<jstl:forEach var="advertise" items="${findAllAdvertise}"
								varStatus="status">
								<div class="swiper-slide">
												
									<a href="single-post.html"
										class="img-bg d-flex align-items-end"
										style="background-image: url(data:image/png;base64,${advertise.base64StringadvertisePicture});">
										<div class="img-bg-inner">
											<h2>${advertise.advertiseName}</h2>
											<p>${advertise.advertiseDesc}</p>
										</div>
									</a>
								</div>
								</jstl:forEach>

								
							</div>
							<div class="custom-swiper-button-next">
								<span class="bi-chevron-right"></span>
							</div>
							<div class="custom-swiper-button-prev">
								<span class="bi-chevron-left"></span>
							</div>

							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Hero Slider Section -->


		
		<!-- ======= Post Grid Section ======= -->
		<section id="posts" class="posts">
			<div class="container" data-aos="fade-up">
				<div class="row g-5">
					<div class="col-lg-4">
						<div class="post-entry-1 lg">
							<a href="single-post.html"><img
								src="assetsForFrontend/img/post-landscape-1.jpg" alt=""
								class="img-fluid"></a>
							<div class="post-meta">
								<span class="date">Culture</span> <span class="mx-1">&bullet;</span>
								<span>Jul 5th '22</span>
							</div>
							<h2>
								<a href="single-post.html">這是大篇的文章 特別不同的地方
									</a>
							</h2>
							<p class="mb-4 d-block">這邊是很不同的  跟其它長得不一樣的位置</p>

							<div class="d-flex align-items-center author">
								<div class="photo">
									<img src="assetsForFrontend/img/person-1.jpg" alt=""
										class="img-fluid">
								</div>
								<div class="name">
									<h3 class="m-0 p-0">Cameron Williamson</h3>
								</div>
							</div>
						</div>

					</div>

					<div class="col-lg-8">
						<div class="row g-5">
							<div class="col-lg-4 border-start custom-border">
								<div class="post-entry-1">
									<jstl:forEach var="advertise"  items="${findAllAdvertise}" varStatus="status" begin="0" end="2">

										<a href="single-post.html"><img
											src="data:image/png;base64,${advertise.base64StringadvertisePicture} "alt=" "
											class="img-fluid"></a>
											<div class="post-meta">
												<span class="date">${advertise.advertiseName}</span> <span class="mx-1">&bullet;</span>
												<span>${advertise.advertiseDesc}</span>
											</div>
											<h2>
												<a href="single-post.html">${advertise.company.companyName}</a>
											</h2>
									</jstl:forEach>
								</div>
								
							</div>

							<!-- 這邊我要來放熱門商品 -->
							<div class="col-lg-4 border-start custom-border">
								<div class="post-entry-1">
									<jstl:forEach var="commodity"  items="${findAllCommodities}" varStatus="status" begin="10" end="12">
									<a href="single-post.html"><img
										src="data:image/png;base64,${commodity.base64StringcommPicture}" alt=""
										class="img-fluid"></a>
									<div class="post-meta">
										<span class="date">${commodity.commName}</span> <span class="mx-1">&bullet;</span>
										<span>${commodity.commDesc}</span>
									</div>
									<h2>
										<a href="single-post.html">${commodity.commCate.cateName}</a>
									</h2>
									</jstl:forEach>
								</div>
								
							</div>

							<!-- Trending Section -->
							<div class="col-lg-4">

								<div class="trending">
									<h3>Trending</h3>
									<ul class="trending-post">
										<li><a href="single-post.html"> <span class="number">1</span>
												<h3>The Best Homemade Masks for Face (keep the Pimples
													Away)</h3> <span class="author">Jane Cooper</span>
										</a></li>
										<li><a href="single-post.html"> <span class="number">2</span>
												<h3>17 Pictures of Medium Length Hair in Layers That
													Will Inspire Your New Haircut</h3> <span class="author">Wade
													Warren</span>
										</a></li>
										<li><a href="single-post.html"> <span class="number">3</span>
												<h3>13 Amazing Poems from Shel Silverstein with
													Valuable Life Lessons</h3> <span class="author">Esther
													Howard</span>
										</a></li>
										<li><a href="single-post.html"> <span class="number">4</span>
												<h3>9 Half-up/half-down Hairstyles for Long and Medium
													Hair</h3> <span class="author">Cameron Williamson</span>
										</a></li>
										<li><a href="single-post.html"> <span class="number">5</span>
												<h3>Life Insurance And Pregnancy: A Working Mom’s Guide</h3>
												<span class="author">Jenny Wilson</span>
										</a></li>
									</ul>
								</div>

							</div>
							<!-- End Trending Section -->
						</div>
					</div>

				</div>
				<!-- End .row -->
			</div>
		</section>
		<!-- End Post Grid Section -->

		

		

		<!-- ======= Lifestyle Category Section ======= -->
		<section class="category-section">
			<div class="container" data-aos="fade-up">

				<div
					class="section-header d-flex justify-content-between align-items-center mb-5">
					<h2>Lifestyle</h2>
					<div>
						<a href="category.html" class="more">See All Lifestyle</a>
					</div>
				</div>

				<div class="row g-5">
					<div class="col-lg-4">
						<div class="post-entry-1 lg">
							<a href="single-post.html"><img
								src="assetsForFrontend/img/post-landscape-8.jpg" alt=""
								class="img-fluid"></a>
							<div class="post-meta">
								<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
								<span>Jul 5th '22</span>
							</div>
							<h2>
								<a href="single-post.html">11 Work From Home Part-Time Jobs
									You Can Do Now</a>
							</h2>
							<p class="mb-4 d-block">Lorem ipsum dolor sit, amet
								consectetur adipisicing elit. Vero temporibus repudiandae,
								inventore pariatur numquam cumque possimus exercitationem? Nihil
								tempore odit ab minus eveniet praesentium, similique blanditiis
								molestiae ut saepe perspiciatis officia nemo, eos quae cumque.
								Accusamus fugiat architecto rerum animi atque eveniet, quo,
								praesentium dignissimos</p>

							<div class="d-flex align-items-center author">
								<div class="photo">
									<img src="assetsForFrontend/img/person-7.jpg" alt=""
										class="img-fluid">
								</div>
								<div class="name">
									<h3 class="m-0 p-0">Esther Howard</h3>
								</div>
							</div>
						</div>

						<div class="post-entry-1 border-bottom">
							<div class="post-meta">
								<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
								<span>Jul 5th '22</span>
							</div>
							<h2 class="mb-2">
								<a href="single-post.html">The Best Homemade Masks for Face
									(keep the Pimples Away)</a>
							</h2>
							<span class="author mb-3 d-block">Jenny Wilson</span>
						</div>

						<div class="post-entry-1">
							<div class="post-meta">
								<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
								<span>Jul 5th '22</span>
							</div>
							<h2 class="mb-2">
								<a href="single-post.html">10 Life-Changing Hacks Every
									Working Mom Should Know</a>
							</h2>
							<span class="author mb-3 d-block">Jenny Wilson</span>
						</div>

					</div>

					<div class="col-lg-8">
						<div class="row g-5">
							<div class="col-lg-4 border-start custom-border">
								<div class="post-entry-1">
									<a href="single-post.html"><img
										src="assetsForFrontend/img/post-landscape-6.jpg" alt=""
										class="img-fluid"></a>
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2>
										<a href="single-post.html">Let’s Get Back to Work, New
											York</a>
									</h2>
								</div>
								<div class="post-entry-1">
									<a href="single-post.html"><img
										src="assetsForFrontend/img/post-landscape-5.jpg" alt=""
										class="img-fluid"></a>
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 17th '22</span>
									</div>
									<h2>
										<a href="single-post.html">How to Avoid Distraction and
											Stay Focused During Video Calls?</a>
									</h2>
								</div>
								<div class="post-entry-1">
									<a href="single-post.html"><img
										src="assetsForFrontend/img/post-landscape-4.jpg" alt=""
										class="img-fluid"></a>
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Mar 15th '22</span>
									</div>
									<h2>
										<a href="single-post.html">Why Craigslist Tampa Is One of
											The Most Interesting Places On the Web?</a>
									</h2>
								</div>
							</div>
							<div class="col-lg-4 border-start custom-border">
								<div class="post-entry-1">
									<a href="single-post.html"><img
										src="assetsForFrontend/img/post-landscape-3.jpg" alt=""
										class="img-fluid"></a>
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2>
										<a href="single-post.html">6 Easy Steps To Create Your Own
											Cute Merch For Instagram</a>
									</h2>
								</div>
								<div class="post-entry-1">
									<a href="single-post.html"><img
										src="assetsForFrontend/img/post-landscape-2.jpg" alt=""
										class="img-fluid"></a>
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Mar 1st '22</span>
									</div>
									<h2>
										<a href="single-post.html">10 Life-Changing Hacks Every
											Working Mom Should Know</a>
									</h2>
								</div>
								<div class="post-entry-1">
									<a href="single-post.html"><img
										src="assetsForFrontend/img/post-landscape-1.jpg" alt=""
										class="img-fluid"></a>
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2>
										<a href="single-post.html">5 Great Startup Tips for Female
											Founders</a>
									</h2>
								</div>
							</div>
							<div class="col-lg-4">

								<div class="post-entry-1 border-bottom">
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2 class="mb-2">
										<a href="single-post.html">How to Avoid Distraction and
											Stay Focused During Video Calls?</a>
									</h2>
									<span class="author mb-3 d-block">Jenny Wilson</span>
								</div>

								<div class="post-entry-1 border-bottom">
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2 class="mb-2">
										<a href="single-post.html">17 Pictures of Medium Length
											Hair in Layers That Will Inspire Your New Haircut</a>
									</h2>
									<span class="author mb-3 d-block">Jenny Wilson</span>
								</div>

								<div class="post-entry-1 border-bottom">
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2 class="mb-2">
										<a href="single-post.html">9 Half-up/half-down Hairstyles
											for Long and Medium Hair</a>
									</h2>
									<span class="author mb-3 d-block">Jenny Wilson</span>
								</div>

								<div class="post-entry-1 border-bottom">
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2 class="mb-2">
										<a href="single-post.html">Life Insurance And Pregnancy: A
											Working Mom’s Guide</a>
									</h2>
									<span class="author mb-3 d-block">Jenny Wilson</span>
								</div>

								<div class="post-entry-1 border-bottom">
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2 class="mb-2">
										<a href="single-post.html">The Best Homemade Masks for
											Face (keep the Pimples Away)</a>
									</h2>
									<span class="author mb-3 d-block">Jenny Wilson</span>
								</div>

								<div class="post-entry-1 border-bottom">
									<div class="post-meta">
										<span class="date">Lifestyle</span> <span class="mx-1">&bullet;</span>
										<span>Jul 5th '22</span>
									</div>
									<h2 class="mb-2">
										<a href="single-post.html">10 Life-Changing Hacks Every
											Working Mom Should Know</a>
									</h2>
									<span class="author mb-3 d-block">Jenny Wilson</span>
								</div>

							</div>
						</div>
					</div>

				</div>
				<!-- End .row -->
			</div>
		</section>
		<!-- End Lifestyle Category Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- End Footer -->



</body>






</html>