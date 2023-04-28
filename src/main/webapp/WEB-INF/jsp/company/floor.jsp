<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
      <!DOCTYPE html>
      <html>

      <head>

        <!-- =======================================================
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
<!DOCTYPE html>
<html>
<head>

  <!-- =======================================================
>>>>>>> 78801b5350ab16da7067cc55804354c900e46b54
  * Template Name: ZenBlog
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/zenblog-bootstrap-blog-template/
  * Author: BootstrapMade.com
  * License: https:///bootstrapmade.com/license/
  ======================================================== -->
<<<<<<< HEAD

      </head>

      <body>
        <!-- ======= Header ======= -->
        <jsp:include page="../layout/header.jsp"></jsp:include>
        <!-- End Header -->

        <main id="floor-plans-container">
          <section class="floor-plans-section">
            <div class="floor-info">
              <h3 class="floor-info-title-left" id="floor-info">樓層簡介</h3>
              <ul class="floor-info-list" id="floor-info-ul">

                <li class="list-floor-item" style="display: none;">B1</li>
                <li class="list-floor-item" style="display: none;">B2</li>
                <li class="list-floor-item" style="display: none;">1F</li>
                <li class="list-floor-item" style="display: none;">2F</li>
                <li class="list-floor-item" style="display: none;">3F</li>
                <li class="list-floor-item" style="display: none;">4F</li>
              </ul>
              <h3 class="floor-info-title-left" id="floor-search">品牌搜尋</h3>

            </div>
            <div class="floor-info-body">
              <div id="search-box" style="display: none;">
                <input type="text" placeholder="請輸入關鍵字...">
                <button>搜尋</button>
              </div>
              <div id="company-box">
                <h3 class="floor-info-title">所有上櫃中的廠商</h3>
                <div class="floor-company" id="floor-company"></div>
              </div>
            </div>
            <div class="floor-info-body">
              <h3 class="floor-info-title">樓層平面圖</h3>
              <div class="floor-plan-wrapper">
                <img class="floor-plan-img" src="${contextRoot}/assetsForFrontend/img/樓層平面圖0.jpg" alt="樓層平面圖">
              </div>
            </div>
          </section>
        </main>
        <!-- End #floor-plans-container -->

        <!-- ======= Footer ======= -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
        <!-- End Footer -->

      </body>
      <script>
        document.addEventListener("DOMContentLoaded", function () {
          var myFloorInfo = document.getElementById('floor-info');
          myFloorInfo.addEventListener('click', function () {
            let myList = document.getElementById('floor-info-ul');
            var lis = myList.getElementsByTagName('li');
            for (var i = 0; i < lis.length; i++) {
              if (lis[i].style.display === 'none') {
                lis[i].style.display = 'block';
              } else {
                lis[i].style.display = 'none';
              }
            }
          });

          // Event for search-box
          const searchTitle = document.getElementById('floor-search');
          const searchBox = document.getElementById('search-box');
          const companyBox = document.getElementById('company-box');

          searchTitle.addEventListener('click', function () {
            if (searchBox.style.display === 'none') {
              searchBox.style.display = 'block';
              companyBox.style.display = 'none';
            } else {
              searchBox.style.display = 'none';
              companyBox.style.display = 'block';
            }
          });



          fetch('${contextRoot}/api/company/findAllCompanyOnCounter')
            .then(response => response.json())
            .then(data => {
              console.log(data)
              let companySpace = document.getElementById('floor-company');
              data.forEach(company => {
                companySpace.innerHTML += '<span class="floor-company-name">' + company.companyName + '</span>';
              });
            })
            .catch(error => console.error(error));
        });
      </script>

      </html>
=======
  
</head>
<body>
<!-- ======= Header ======= -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
<!-- End Header --> 

	<main id="main">
		<section class="section-floor-plans">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <ul class="list-group" id="myList">
                        <h3 class="section-title">樓層簡介</h3>
                        
                            <li class="list-group-item" style="display:none;">B1</li>
                            <li class="list-group-item" style="display:none;">B2</li>
                            <li class="list-group-item" style="display:none;">1F</li>
                            <li class="list-group-item" style="display:none;">2F</li>
                            <li class="list-group-item" style="display:none;">3F</li>
                            <li class="list-group-item" style="display:none;">4F</li>
                        </ul>
                        <ul class="list-group" id="myList">
                        <h3 class="section-title">品牌搜尋</h3>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3 class="section-title">樓層平面圖</h3>
                        <div class="floor-plan-wrapper">
                            <img class="img-fluid1" src="${contextRoot}/assetsForFrontend/img/樓層平面圖0.jpg" alt="Floor Plan" style="weight:200px">
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main><!-- End #main -->
	
<!-- ======= Footer ======= -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- End Footer --> 
	 
</body>
<script>
document.addEventListener("DOMContentLoaded", function() {
	  var myList = document.getElementById('myList');
	  myList.addEventListener('click', function() {
	    var lis = myList.getElementsByTagName('li');
	    for (var i = 0; i < lis.length; i++) {
	      if (lis[i].style.display === 'none') {
	        lis[i].style.display = 'block';
	      } else {
	        lis[i].style.display = 'none';
	      }
	    }
	  });
	  
	  fetch('http://localhost:8080/MavenNDepartmentStoreWebsite/api/companyCounter/findByCounterFloor/2樓')
	    .then(response => response.json())
	    .then(data => console.log(data))
	    .catch(error => console.error(error));
	});
</script>
</html>
>>>>>>> 78801b5350ab16da7067cc55804354c900e46b54
