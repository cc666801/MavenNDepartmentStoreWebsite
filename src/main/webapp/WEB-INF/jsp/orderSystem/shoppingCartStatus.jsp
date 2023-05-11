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
                    <i class="fa-solid fa-cart-shopping"></i>
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
                  <tfoot>
                    <tr>
                      <td colspan="5" style="padding-left: 82%;">總計: <span id="total"
                          style="display: inline-block;"></span></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              <button type="button" class="btn btn-primary btn-lg" id="cash-on-delivery" data-toggle="modal"
                data-target="#checkoutModal"><i class="fa-solid fa-truck fa-2xs"></i><span> 貨到付款</span></button>
              <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#checkoutModal"><i
                  class="fa-solid fa-credit-card fa-2xs"></i><span> 信用卡付款</span></button>

            </div>
          </section>
        </main>
        <!-- End #floor-plans-container -->

        <!-- ======= Footer ======= -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
        <!-- End Footer -->

      </body>
      <script>
        // Event for - button update quantityInput
        function decreaseQuantity(memberId, commodityId) {
          let quantityInput = document.getElementById("quantity-input-" + commodityId);
          // 數量大於 1 在 quantityInput -1 後發請求更新數量
          if (quantityInput.value > 1) {
            quantityInput.value = parseInt(quantityInput.value) - 1;
            // 發請求更新數量
            fetch("${contextRoot}/api/shoppingCart/" + encodeURIComponent(memberId) + "/" + encodeURIComponent(commodityId) + "/" + encodeURIComponent(quantityInput.value), {
              method: "PUT"
            })
              .then(response => response.json())
              .then(data => {
                console.log(data);
                // 把新資料放進表格
                var tbody = document.querySelector("table tbody");
                var htmlString = "";
                var total = 0;

                data.forEach(function (shoppingCartCommodityDto, index) {
                var commodityId = shoppingCartCommodityDto.commodityId;
                var commodityName = shoppingCartCommodityDto.commodityName;
                var quantity = shoppingCartCommodityDto.quantity;
                var commodityPrice = shoppingCartCommodityDto.commodityPrice * shoppingCartCommodityDto.commodityDiscount;
                var subTotal = quantity * commodityPrice;
                total += subTotal;

                var rowHtml = "<tr>";
                rowHtml += "<td>" + (index + 1) + "</td>";
                rowHtml += "<td id='commodity-id' style='display:none'>" + commodityId + "</td>";
                rowHtml += "<td>" + commodityName + "</td>";
                rowHtml += "<td style='width: auto;'><button class='btn btn-sm btn-danger' onclick='decreaseQuantity(" + memberId + ", " + commodityId + ")'>-</button><input type='text' id='quantity-input-" + commodityId + "' style='width: 12%; display:inline-block;' class='form-control quantity-input' value='" + quantity + "'><button class='btn btn-sm btn-primary' style='display:inline-block;' onclick='increaseQuantity(" + memberId + ", " + commodityId + ")'>+</button></td>";
                rowHtml += "<td>" + commodityPrice + "</td>";
                rowHtml += "<td>" + subTotal + "</td>";
                rowHtml += "</tr>";

                htmlString += rowHtml;
              });

                document.getElementById("total").innerHTML = total;
                tbody.innerHTML = htmlString;
              })
              .catch(error => console.error(error));

            // 數量小於等於 1 發請求刪除購物車內的商品
          } else {
            fetch("${contextRoot}/api/shoppingCart/" + encodeURIComponent(memberId) + "/" + encodeURIComponent(commodityId), {
              method: "DELETE"
            })
              .then(response => response.json())
              .then(data => {
                console.log(data);
                // 把新資料放進表格
                var tbody = document.querySelector("table tbody");
                var htmlString = "";
                var total = 0;


                data.forEach(function (shoppingCartCommodityDto, index) {
                var commodityId = shoppingCartCommodityDto.commodityId;
                var commodityName = shoppingCartCommodityDto.commodityName;
                var quantity = shoppingCartCommodityDto.quantity;
                var commodityPrice = shoppingCartCommodityDto.commodityPrice * shoppingCartCommodityDto.commodityDiscount;
                var subTotal = quantity * commodityPrice;
                total += subTotal;

                var rowHtml = "<tr>";
                rowHtml += "<td>" + (index + 1) + "</td>";
                rowHtml += "<td id='commodity-id' style='display:none'>" + commodityId + "</td>";
                rowHtml += "<td>" + commodityName + "</td>";
                rowHtml += "<td style='width: auto;'><button class='btn btn-sm btn-danger' onclick='decreaseQuantity(" + memberId + ", " + commodityId + ")'>-</button><input type='text' id='quantity-input-" + commodityId + "' style='width: 12%; display:inline-block;' class='form-control quantity-input' value='" + quantity + "'><button class='btn btn-sm btn-primary' style='display:inline-block;' onclick='increaseQuantity(" + memberId + ", " + commodityId + ")'>+</button></td>";
                rowHtml += "<td>" + commodityPrice + "</td>";
                rowHtml += "<td>" + subTotal + "</td>";
                rowHtml += "</tr>";

                htmlString += rowHtml;
              });

                tbody.innerHTML = htmlString;
                document.getElementById("total").innerHTML = total;
              })
              .catch(error => console.error(error));

          }
          console.log(quantityInput.value);
        }

        // Event for + button update quantityInput
        function increaseQuantity(memberId, commodityId) {
          let quantityInput = document.getElementById("quantity-input-" + commodityId);
          quantityInput.value = parseInt(quantityInput.value) + 1;
          console.log(quantityInput.value);


          // 發請求更新數量
          fetch("${contextRoot}/api/shoppingCart/" + encodeURIComponent(memberId) + "/" + encodeURIComponent(commodityId) + "/" + encodeURIComponent(quantityInput.value), {
            method: "PUT"
          })
            .then(response => response.json())
            .then(data => {
              console.log(data);
              // 把新資料放進表格
              var tbody = document.querySelector("table tbody");
              var htmlString = "";
              var total = 0;


              data.forEach(function (shoppingCartCommodityDto, index) {
                var commodityId = shoppingCartCommodityDto.commodityId;
                var commodityName = shoppingCartCommodityDto.commodityName;
                var quantity = shoppingCartCommodityDto.quantity;
                var commodityPrice = shoppingCartCommodityDto.commodityPrice * shoppingCartCommodityDto.commodityDiscount;
                var subTotal = quantity * commodityPrice;
                total += subTotal;

                var rowHtml = "<tr>";
                rowHtml += "<td>" + (index + 1) + "</td>";
                rowHtml += "<td id='commodity-id' style='display:none'>" + commodityId + "</td>";
                rowHtml += "<td>" + commodityName + "</td>";
                rowHtml += "<td style='width: auto;'><button class='btn btn-sm btn-danger' onclick='decreaseQuantity(" + memberId + ", " + commodityId + ")'>-</button><input type='text' id='quantity-input-" + commodityId + "' style='width: 12%; display:inline-block;' class='form-control quantity-input' value='" + quantity + "'><button class='btn btn-sm btn-primary' style='display:inline-block;' onclick='increaseQuantity(" + memberId + ", " + commodityId + ")'>+</button></td>";
                rowHtml += "<td>" + commodityPrice + "</td>";
                rowHtml += "<td>" + subTotal + "</td>";
                rowHtml += "</tr>";

                htmlString += rowHtml;
              });

              document.getElementById("total").innerHTML = total;
              tbody.innerHTML = htmlString;
            })
            .catch(error => console.error(error));
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
              var total = 0;
              data.forEach(function (shoppingCartCommodityDto, index) {
                var commodityId = shoppingCartCommodityDto.commodityId;
                var commodityName = shoppingCartCommodityDto.commodityName;
                var quantity = shoppingCartCommodityDto.quantity;
                var commodityPrice = shoppingCartCommodityDto.commodityPrice * shoppingCartCommodityDto.commodityDiscount;
                var subTotal = quantity * commodityPrice;
                total += subTotal;

                var rowHtml = "<tr>";
                rowHtml += "<td>" + (index + 1) + "</td>";
                rowHtml += "<td id='commodity-id' style='display:none'>" + commodityId + "</td>";
                rowHtml += "<td>" + commodityName + "</td>";
                rowHtml += "<td style='width: auto;'><button class='btn btn-sm btn-danger' onclick='decreaseQuantity(" + memberId + ", " + commodityId + ")'>-</button><input type='text' id='quantity-input-" + commodityId + "' style='width: 12%; display:inline-block;' class='form-control quantity-input' value='" + quantity + "'><button class='btn btn-sm btn-primary' style='display:inline-block;' onclick='increaseQuantity(" + memberId + ", " + commodityId + ")'>+</button></td>";
                rowHtml += "<td id='commodity-price'>" + commodityPrice + "</td>";
                rowHtml += "<td>" + subTotal + "</td>";
                rowHtml += "</tr>";

                htmlString += rowHtml;
              });
              document.getElementById("total").innerHTML = total;
              tbody.innerHTML = htmlString;
            })
            .catch(error => console.error(error));

            document.getElementById("cash-on-delivery").addEventListener("click", function () {
            let total = document.getElementById("total").innerHTML
            var rows = document.querySelectorAll('.table tbody tr');
            let order = {
              'memberId': memberId,
              'orderDetailDtos': [],
              'total': total
            };

            rows.forEach(function (row) {
              var commodityId = row.querySelector('#commodity-id').textContent;
              var commodityPrice = row.querySelector('#commodity-price').textContent;
              var quantity = row.querySelector('#quantity-input-' + commodityId).value;
              order.orderDetailDtos.push({
                "commodityId": commodityId,
                "quantity": quantity,
                "commodityPrice":commodityPrice
              });
            });
            if(order.orderDetailDtos.length!==0){
            fetch('${contextRoot}/api/order', {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify(order)
            })
              .then(response => {
                {
                  if (response.ok) {
                        // handle response
                        document.getElementById("total").innerHTML = 0;
                        var tbody = document.querySelector("table tbody");
                      var htmlString = "";
                        tbody.innerHTML = htmlString;
												console.log('加入訂單成功');
												alert('加入訂單成功');
											} else {
												console.log('加入訂單失敗');
												alert('加入訂單失敗');
											}
										}

              })
              .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
              });
            }else {
												console.log('加入空訂單失敗');
												alert('加入空訂單失敗');
											}


          });

        });

      </script>

      </html>