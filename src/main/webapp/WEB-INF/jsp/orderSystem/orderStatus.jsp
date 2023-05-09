<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
      </head>

      <body style="background-color: #f4f0e6; font-family: 微軟正黑體;">
        <!-- ======= Header ======= -->
        <jsp:include page="../layout/header.jsp"></jsp:include>
        <!-- End Header -->

        <main id="main">
          <section id="contact" class="contact mb-5">
            <div class="container" data-aos="fade-up">
              <div class="row">
                <div class="col-lg-12 text-center mb-5">
                  <h3 class="page-title">
                    <i class="fa-solid fa-file-invoice-dollar"></i>
                    訂單狀態
                  </h3>
                </div>
              </div>
              <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  Order #123
                  <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#order123" aria-expanded="false" aria-controls="order123">Details</button>
                </li>
                <div class="collapse" id="order123">
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">Product 1</li>
                    <li class="list-group-item">Product 2</li>
                    <li class="list-group-item">Product 3</li>
                  </ul>
                </div>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  Order #456
                  <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#order456" aria-expanded="false" aria-controls="order456">Details</button>
                </li>
                <div class="collapse" id="order456">
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">Product 4</li>
                    <li class="list-group-item">Product 5</li>
                  </ul>
                </div>
              </ul>
              <div>

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

        // load on 事件
        document.addEventListener("DOMContentLoaded", function () {

          var memberId = "${member.id}";
          console.log(memberId);

          // 在一開始抓到該會員購物車的資料
          fetch("${contextRoot}/api/order/" + memberId)
            .then(response => response.json())
            .then(data => {
              console.log(data);

              
             
              
            })
            .catch(error => console.error(error));


        });

</script>

      </html>