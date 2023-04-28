<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>

		<body>
			<div id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<div class="sb-sidenav-menu-heading">Core</div>
							<a class="nav-link" href="${contextRoot}/exampleBackendPage">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> 後台範例頁面
							</a>
							<div class="sb-sidenav-menu-heading">後台系統</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon">
									<i class="fas fa-columns"></i>
								</div> 廠商後台系統
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
								data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="${contextRoot}/company/addCompanyPage">新增廠商資料</a>
									<a class="nav-link" href="${contextRoot}/company/showAllCompanys">查詢所有廠商</a>
									<a class="nav-link" href="${contextRoot}/companycounters/add">廠商租用櫃位</a>
									<a class="nav-link" href="${contextRoot}/companycounters/">查詢所有租用紀錄</a>
								</nav>
							</div>

							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon">
									<i class="fas fa-columns"></i>
								</div> 商品後台系統
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
								data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="${contextRoot}/Store/CommCate/add">新增類別欄位</a>
									<a class="nav-link" href="${contextRoot}/Store/Commcate/ShowAll">查詢所有類別</a>
									<a class="nav-link" href="${contextRoot}/Store/Commodity/add">新增商品資料</a>
									<a class="nav-link" href="${contextRoot}/Store/Commodity/ShowAll">查詢所有商品</a>
								</nav>
							</div>

							<!-- ======= 餐廳後台 ======= -->
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon">
									<i class="fas fa-columns"></i>
								</div> 餐廳後台系統
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
								data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="${contextRoot}/restaurant">查詢訂位</a>
								</nav>
							</div>
							<!-- ======= 餐廳後台end ======= -->

							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
								<div class="sb-nav-link-icon">
									<i class="fas fa-book-open"></i>
								</div> Pages
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
								data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
									<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
										data-bs-target="#pagesCollapseAuth" aria-expanded="false"
										aria-controls="pagesCollapseAuth"> Authentication
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordionPages">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="login.html">Login</a> <a class="nav-link"
												href="register.html">Register</a> <a class="nav-link"
												href="password.html">Forgot Password</a>
										</nav>
									</div>
									<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
										data-bs-target="#pagesCollapseError" aria-expanded="false"
										aria-controls="pagesCollapseError"> Error
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordionPages">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="401.html">401 Page</a> <a class="nav-link"
												href="404.html">404 Page</a> <a class="nav-link" href="500.html">500
												Page</a>
										</nav>
									</div>
								</nav>
							</div>
							<div class="sb-sidenav-menu-heading">Addons</div>
							<a class="nav-link" href="charts.html">
								<div class="sb-nav-link-icon">
									<i class="fas fa-chart-area"></i>
								</div> Charts
							</a> <a class="nav-link" href="tables.html">
								<div class="sb-nav-link-icon">
									<i class="fas fa-table"></i>
								</div> Tables
							</a>
						</div>
					</div>
					<div class="sb-sidenav-footer">
						<div class="small">Logged in as:</div>
						Start Bootstrap
					</div>
				</nav>
			</div>
		</body>

		</html>