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
                  <hr style="width: 50%; margin: 0 auto;">
                </div>
              </div>
              <div id="discount-div" class="card-header border border-secondary" style="width: 20%;height: auto;
              min-height: 100px;margin-left: 3%;">
                <h5 class="card-title border-bottom border-info" style="margin: 2% 2%;">目前還未使用的優惠卷:</h3>

              </div>

              <div>
                <table class="table" style="min-height: 200px; height: auto;">
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
              <div id="button-div" style="display: inline-block; padding-left: 70%;">
                <button type="button" class="btn btn-primary btn-lg" id="cash-on-delivery" data-toggle="modal"
                  data-target="#checkoutModal"><i class="fa-solid fa-truck fa-2xs"></i><span> 貨到付款</span></button>
                <button type="button" class="btn btn-primary btn-lg" id="payment-flow" data-toggle="modal"
                  data-target="#checkoutModal"><i class="fa-solid fa-credit-card fa-2xs"></i><span>
                    信用卡付款</span></button>
              </div>


            </div>
            <div id="payment-flow-form">

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
                  rowHtml += "<td id='commodity-price'>" + commodityPrice + "</td>";
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
                  rowHtml += "<td id='commodity-price'>" + commodityPrice + "</td>";
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
                rowHtml += "<td id='commodity-price'>" + commodityPrice + "</td>";
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
          var appliedCoupon = null; // 当前已套用的优惠券

          // 在一開始抓到該會員購物車的資料
          fetch("${contextRoot}/api/shoppingCart/" + memberId)
            .then(response => response.json())
            .then(data => {

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

          fetch("${contextRoot}/api/coupon/unusedCoupon/" + memberId)
            .then(response => response.json())
            .then(coupons => {
              var orderTotal = document.getElementById("total").innerHTML; // 订单总金额

              // 获取 discount-div 容器
              var discountDiv = document.getElementById('discount-div');
              // 遍历优惠券数组并创建 HTML 元素
              coupons.forEach(function (coupon) {
                // 创建一个 div 元素作为每个优惠券的容器
                var couponDiv = document.createElement('div');
                couponDiv.classList.add('card-body');
                couponDiv.style = 'margin:0 3% 3% 3%;';

                // 创建并设置优惠券的文本内容
                var couponText = document.createTextNode(coupon.couponName);
                couponDiv.appendChild(couponText);

                // 创建套用按钮
                var applyButton = document.createElement('button');
                applyButton.textContent = '套用';
                applyButton.className = 'btn btn-info'
                applyButton.style = 'margin-left:3%';

                applyButton.addEventListener('click', function () {
                  var total = document.getElementById("total").innerHTML;
                  orderTotal = total;
                  if (appliedCoupon === null) {
                    // 将订单总金额乘以优惠券折扣
                    orderTotal *= parseFloat(coupon.couponDiscount);

                    // 更新订单总金额显示
                    // 假设您有一个显示订单总金额的元素，具有 id 为 "total"
                    var orderTotalElement = document.getElementById('total');
                    orderTotalElement.textContent = orderTotal;

                    // 将按钮文本更改为 "取消套用"
                    applyButton.textContent = '取消套用';

                    // 设置已套用的优惠券为当前优惠券
                    appliedCoupon = coupon;
                  } else {
                    // 恢复订单总金额为原始金额
                    orderTotal /= parseFloat(appliedCoupon.couponDiscount); // 根据实际情况修改为原始订单总金额

                    // 更新订单总金额显示
                    var orderTotalElement = document.getElementById('total');
                    orderTotalElement.textContent = orderTotal;

                    // 将按钮文本更改为 "套用"
                    applyButton.textContent = '套用';

                    // 清除已套用的优惠券
                    appliedCoupon = null;
                  }
                });

                // 将套用按钮添加到优惠券容器
                couponDiv.appendChild(applyButton);

                // 将优惠券容器添加到 discount-div 中
                discountDiv.appendChild(couponDiv);
              });
            })
            .catch(error => console.error(error));

          // 貨到付款按鈕
          document.getElementById("cash-on-delivery").addEventListener("click", function () {
            let total = document.getElementById("total").innerHTML
            var rows = document.querySelectorAll('.table tbody tr');
            let couponId = appliedCoupon ? appliedCoupon.couponId : null;
            var memberAddress = "${member.address}"; // 获取会员原本的地址
            var address = prompt('请输入您的地址:', memberAddress); // 将会员地址作为参数传递给 prompt 函数
            if (address === null) {
              // 用户点击了取消按钮
              alert('已取消填寫地址');
              return; // 结束函数执行
            }

            var confirmMessage = '您输入的地址是: ' + address + '\n请確認是否正確？';
            var confirmed = confirm(confirmMessage);
            if (confirmed) {
              // 用户确认地址无误
              alert('地址輸入成功');
              // 可以在这里对输入的地址进行处理
            } else {
              // 用户确认地址有误
              alert('請重新輸入地址');
              return;
            }
            let orderAddress;
            let order = {
              'memberId': memberId,
              'orderDetailDtos': [],
              'total': total,
              'couponId': couponId,
              'orderAddress': address
            };

            rows.forEach(function (row) {
              var commodityId = row.querySelector('#commodity-id').textContent;
              var commodityPrice = row.querySelector('#commodity-price').textContent;
              var quantity = row.querySelector('#quantity-input-' + commodityId).value;
              order.orderDetailDtos.push({
                "commodityId": commodityId,
                "quantity": quantity,
                "commodityPrice": commodityPrice
              });
            });
            if (order.orderDetailDtos.length !== 0) {
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
                      alert('加入訂單成功');
                      window.location.href = "${contextRoot}/orderSystem/order";
                    } else {
                      alert('加入訂單失敗');
                    }
                  }

                })
                .catch(error => {
                  console.error('There was a problem with the fetch operation:', error);
                });
            } else {
              console.log('加入空訂單失敗');
              alert('加入空訂單失敗');
            }
          });

          // 信用卡付款按鈕
          document.getElementById("payment-flow").addEventListener("click", function () {
            let total = document.getElementById("total").innerHTML
            var rows = document.querySelectorAll('.table tbody tr');
            let couponId = appliedCoupon ? appliedCoupon.couponId : null;
            var memberAddress = "${member.address}"; // 获取会员原本的地址
            var address = prompt('请输入您的地址:', memberAddress); // 将会员地址作为参数传递给 prompt 函数
            if (address === null) {
              // 用户点击了取消按钮
              alert('已取消填寫地址');
              return; // 结束函数执行
            }

            var confirmMessage = '您输入的地址是: ' + address + '\n请確認是否正確？';
            var confirmed = confirm(confirmMessage);
            if (confirmed) {
              // 用户确认地址无误
              alert('地址輸入成功');
              // 可以在这里对输入的地址进行处理
            } else {
              // 用户确认地址有误
              alert('請重新輸入地址');
              return;
            }
            let order = {
              'memberId': memberId,
              'orderDetailDtos': [],
              'total': total,
              'couponId': couponId,
              'orderAddress': address
            };

            rows.forEach(function (row) {
              var commodityId = row.querySelector('#commodity-id').textContent;
              console.log(commodityId);
              console.log(row.querySelector('#commodity-price'));
              var commodityPrice = row.querySelector('#commodity-price').textContent;
              var quantity = row.querySelector('#quantity-input-' + commodityId).value;
              order.orderDetailDtos.push({
                "commodityId": commodityId,
                "quantity": quantity,
                "commodityPrice": commodityPrice
              });
            });
            if (order.orderDetailDtos.length !== 0) {
              fetch('${contextRoot}/api/order/ecpayCheckout', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify(order)
              })
                .then(response => response.text())
                .then(html => {
                  let paymentFlowForm = document.getElementById("payment-flow-form");
                  paymentFlowForm.innerHTML = html;
                  // 手動觸發表單提交
                  const form = document.getElementById('allPayAPIForm');
                  form.submit();
                  form.addEventListener('submit', function (event) {
                    event.preventDefault(); // 取消預設的提交事件
                    form.submit();
                  });
                })
                .catch(error => console.log(error));
            } else {
              console.log('加入空訂單失敗');
              alert('加入空訂單失敗');
            }
          });
        });

      </script>

      </html>

      <!-- https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5 -->