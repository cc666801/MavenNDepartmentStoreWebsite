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
                    <i class="fa-solid fa-truck-fast fa-sm"></i>
                    購物車商品
                  </h3>
                </div>
              </div>

              <div>
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col"></th>
                      <th scope="col">商品名稱</th>
                      <th scope="col" style=width:30%;>商品數量</th>
                      <th scope="col">商品價格</th>
                      <th scope="col">小計</th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table>
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
        function decreaseQuantity(memberId, commodityId) {

        }

        function increaseQuantity(memberId, commodityId) {

        }

        // load on 事件
        document.addEventListener("DOMContentLoaded", function () {

          var memberId = "${member.id}";
          console.log(memberId);

          // 在一開始抓到該會員購物車的資料
          fetch("${contextRoot}/api/shoppingCart/" + memberId)
            .then(response => response.json())
            .then(data => {
              console.log(data);

              var tbody = document.querySelector("table tbody");
              var htmlString = "";

              data.forEach(function (shoppingCartCommodityDto, index) {
                var commodityId = shoppingCartCommodityDto.commodityId;
                var commodityName = shoppingCartCommodityDto.commodityName;
                var quantity = shoppingCartCommodityDto.quantity;
                var commodityPrice = shoppingCartCommodityDto.commodityPrice;
                var subTotal = quantity * commodityPrice;

                var rowHtml = "<tr>";
                rowHtml += "<td>" + (index + 1) + "</td>";
                rowHtml += "<td>" + commodityName + "</td>";
                rowHtml += "<td style='width: auto;'><button class='btn btn-sm btn-danger' onclick='decreaseQuantity(" + memberId + ", " + commodityId + ")'>-</button><input type='text' style='width: 12%; display:inline-block;' class='form-control quantity-input' value='" + quantity + "'><button class='btn btn-sm btn-primary' style='display:inline-block;' onclick='increaseQuantity(" + memberId + ", " + commodityId + ")'>+</button></td>";
                rowHtml += "<td>" + commodityPrice + "</td>";
                rowHtml += "<td>" + subTotal + "</td>";
                rowHtml += "</tr>";

                htmlString += rowHtml;
              });

              tbody.innerHTML = htmlString;
            })
            .catch(error => console.error(error));


        });

      </script>

      </html>