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
                  <hr style="width: 50%; margin: 0 auto;">
                </div>
              </div>
              <div class="border border-secondary" style="width: 20%;margin-left: 15%;">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="cashOnDelivery" name="paymentMethod"
                    value="cashOnDelivery" checked>
                  <label class="form-check-label" for="cashOnDelivery">貨到付款訂單</label>
                </div>

                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="creditCard" name="paymentMethod"
                    value="creditCard" checked>
                  <label class="form-check-label" for="creditCard">信用卡付款訂單</label>
                </div>

                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="cancelledOrder" name="orderStatus"
                    value="cancelledOrder">
                  <label class="form-check-label" for="cancelledOrder">已取消訂單</label>
                </div>
              </div>
              <!-- style="padding-left: 20%;" -->
              <div id="cash-on-delivery-order-div" class="border-bottom"
                style="min-height: 100px; height: auto;padding-top: 1%;margin-left: 15%;">
                <h4 class="border-bottom" style="width: 20%;">貨到付款訂單</h4>
                <ul class="list-group" id="cash-on-delivery-order">

                </ul>
              </div>

              <div id="payment-flow-order-div"
                style="min-height: 100px; height: auto;padding-top: 1%;margin-left: 15%;">
                <h4 class="border-bottom" style="width: 20%;">信用卡付款訂單</h4>
                <ul class="list-group" id="payment-flow-order">

                </ul>
              </div>

              <div id="cancelled-order-div"
                style="min-height: 100px; height: auto;display: none;padding-top: 1%;margin-left: 15%;">
                <h4 class="border-bottom" style="width: 20%;">已取消訂單</h4>
                <ul class="list-group" id="cancelled-order">

                </ul>
              </div>




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
        function fetchOrderDetails(orderId) {
          var memberId = "${member.id}";

          const cashOnDeliveryOrder = document.querySelector("#cash-on-delivery-order");
          const paymentFlowOrder = document.querySelector("#payment-flow-order");
          const cancelledOrder = document.querySelector("#cancelled-order");

          cashOnDeliveryOrder.innerHTML = "";
          paymentFlowOrder.innerHTML = "";
          cancelledOrder.innerHTML = "";

          // 更改訂單狀態
          fetch("${contextRoot}/api/order/" + memberId + "/" + orderId, {
            method: "PUT"
          })
            .then(response => {
              if (response.ok) {
                // 订单状态更新成功后获取数据
                return Promise.all([
                  fetch("${contextRoot}/api/order/cashOnDeliverOrder/" + memberId),
                  fetch("${contextRoot}/api/order/paymentFlowOrder/" + memberId),
                  fetch("${contextRoot}/api/order/cancelledOrder/" + memberId)
                ]);
              } else {
                throw new Error("Failed to update order status");
              }
            })
            .then(responses => Promise.all(responses.map(response => response.json())))
            .then(data => {
              const cashOnDeliveryData = data[0];
              const paymentFlowData = data[1];
              const cancelledData = data[2];
              cashOnDeliveryData.forEach(orderDto => {
                // 轉成台灣時間
                const utcDate = new Date(orderDto.createOrderTime);
                const twDate = utcDate.toLocaleString('zh-TW', { timeZone: 'Asia/Taipei' });

                // 訂單資訊 list item
                const li = document.createElement('li');
                li.style = 'width:80%'
                li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');

                const orderDtoCreateDateSpan = document.createElement('span');
                orderDtoCreateDateSpan.textContent = "訂單創立時間:" + twDate;
                li.appendChild(orderDtoCreateDateSpan);
                const orderDtoTotalSpan = document.createElement('span');
                orderDtoTotalSpan.textContent = '訂單總金額:' + orderDto.total;
                li.appendChild(orderDtoTotalSpan);

                // 按鈕區域
                const buttonContainer = document.createElement('div');
                buttonContainer.classList.add('btn-group');

                // 訂單明細按鈕
                const detailButton = document.createElement('button');
                detailButton.classList.add('btn', 'btn-primary', 'btn-sm');
                detailButton.type = 'button';
                detailButton.dataset.bsToggle = 'collapse';
                detailButton.dataset.bsTarget = '#order' + orderDto.orderId;
                detailButton.ariaExpanded = 'false';
                detailButton.ariaControls = 'order' + orderDto.id;
                detailButton.textContent = '訂單明細';
                buttonContainer.appendChild(detailButton);

                // 刪除訂單按鈕
                const customButton = document.createElement('button');
                customButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'ms-1');
                customButton.type = 'button';
                customButton.textContent = '刪除訂單';
                customButton.addEventListener('click', () => {
                  fetchOrderDetails(orderDto.orderId);
                });
                buttonContainer.appendChild(customButton);

                li.appendChild(buttonContainer);
                cashOnDeliveryOrder.appendChild(li);

                // Details 區域
                const div = document.createElement('div');
                div.classList.add('collapse');
                div.style = 'width:80%'
                div.id = 'order' + orderDto.orderId;
                cashOnDeliveryOrder.appendChild(div);

                const detailsUl = document.createElement('ul');
                detailsUl.classList.add('list-group', 'list-group-flush');
                div.appendChild(detailsUl);

                orderDto.orderDetailDtos.forEach(orderDetailDto => {
                  const detailsLi = document.createElement('li');
                  detailsLi.classList.add('list-group-item');

                  const commodityNameSpan = document.createElement('span');
                  commodityNameSpan.style = 'margin-right:2%'
                  commodityNameSpan.innerHTML = "商品名稱:" + '<img src="data:image/jpeg;base64,' + orderDetailDto.base64CommodityPictureString + '" style="width: 30px;height: 20px;padding-right:5px;padding-left:5px;"></img>'+orderDetailDto.commodityName;
                  detailsLi.appendChild(commodityNameSpan);

                  const quantitySpan = document.createElement('span');
                  quantitySpan.style = 'margin-right:2%'
                  quantitySpan.textContent = "商品數量:" + orderDetailDto.quantity;
                  detailsLi.appendChild(quantitySpan);

                  const commodityPriceSpan = document.createElement('span');
                  commodityPriceSpan.style = 'margin-right:2%'
                  commodityPriceSpan.textContent = "商品價格:" + orderDetailDto.commodityPrice;
                  detailsLi.appendChild(commodityPriceSpan);

                  const subTotalSpan = document.createElement('span');
                  subTotalSpan.style = 'margin-right:2%'
                  subTotalSpan.textContent = "小計:" + orderDetailDto.commodityPrice * orderDetailDto.quantity;
                  detailsLi.appendChild(subTotalSpan);

                  detailsUl.appendChild(detailsLi);
                });

              });


              paymentFlowData.forEach(orderDto => {
                // 轉成台灣時間
                const utcDate = new Date(orderDto.createOrderTime);
                const twDate = utcDate.toLocaleString('zh-TW', { timeZone: 'Asia/Taipei' });

                // 訂單資訊 list item
                const li = document.createElement('li');
                li.style = 'width:80%'
                li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');

                const orderDtoCreateDateSpan = document.createElement('span');
                orderDtoCreateDateSpan.textContent = "訂單創立時間:" + twDate;
                li.appendChild(orderDtoCreateDateSpan);
                const orderDtoTotalSpan = document.createElement('span');
                orderDtoTotalSpan.textContent = '訂單總金額:' + orderDto.total;
                li.appendChild(orderDtoTotalSpan);

                // 按鈕區域
                const buttonContainer = document.createElement('div');
                buttonContainer.classList.add('btn-group');

                // 訂單明細按鈕
                const detailButton = document.createElement('button');
                detailButton.classList.add('btn', 'btn-primary', 'btn-sm');
                detailButton.type = 'button';
                detailButton.dataset.bsToggle = 'collapse';
                detailButton.dataset.bsTarget = '#order' + orderDto.orderId;
                detailButton.ariaExpanded = 'false';
                detailButton.ariaControls = 'order' + orderDto.id;
                detailButton.textContent = '訂單明細';
                buttonContainer.appendChild(detailButton);

                // 刪除訂單按鈕
                const customButton = document.createElement('button');
                customButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'ms-1');
                customButton.type = 'button';
                customButton.textContent = '刪除訂單';
                customButton.addEventListener('click', () => {
                  fetchOrderDetails(orderDto.orderId);
                });
                buttonContainer.appendChild(customButton);

                li.appendChild(buttonContainer);
                paymentFlowOrder.appendChild(li);

                // Details 區域
                const div = document.createElement('div');
                div.classList.add('collapse');
                div.style = 'width:80%'
                div.id = 'order' + orderDto.orderId;
                paymentFlowOrder.appendChild(div);

                const detailsUl = document.createElement('ul');
                detailsUl.classList.add('list-group', 'list-group-flush');
                div.appendChild(detailsUl);

                orderDto.orderDetailDtos.forEach(orderDetailDto => {
                  const detailsLi = document.createElement('li');
                  detailsLi.classList.add('list-group-item');

                  const commodityNameSpan = document.createElement('span');
                  commodityNameSpan.style = 'margin-right:2%'
                  commodityNameSpan.innerHTML = "商品名稱:" + '<img src="data:image/jpeg;base64,' + orderDetailDto.base64CommodityPictureString + '" style="width: 30px;height: 20px;padding-right:5px;padding-left:5px;"></img>'+orderDetailDto.commodityName;
                  detailsLi.appendChild(commodityNameSpan);

                  const quantitySpan = document.createElement('span');
                  quantitySpan.style = 'margin-right:2%'
                  quantitySpan.textContent = "商品數量:" + orderDetailDto.quantity;
                  detailsLi.appendChild(quantitySpan);

                  const commodityPriceSpan = document.createElement('span');
                  commodityPriceSpan.style = 'margin-right:2%'
                  commodityPriceSpan.textContent = "商品價格:" + orderDetailDto.commodityPrice;
                  detailsLi.appendChild(commodityPriceSpan);

                  const subTotalSpan = document.createElement('span');
                  subTotalSpan.style = 'margin-right:2%'
                  subTotalSpan.textContent = "小計:" + orderDetailDto.commodityPrice * orderDetailDto.quantity;
                  detailsLi.appendChild(subTotalSpan);

                  detailsUl.appendChild(detailsLi);
                });

              });

              cancelledData.forEach(orderDto => {
                // 轉成台灣時間
                const utcDate = new Date(orderDto.createOrderTime);
                const twDate = utcDate.toLocaleString('zh-TW', { timeZone: 'Asia/Taipei' });

                // 訂單資訊 list item
                const li = document.createElement('li');
                li.style = 'width:80%'
                li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');

                const orderDtoCreateDateSpan = document.createElement('span');
                orderDtoCreateDateSpan.textContent = "訂單創立時間:" + twDate;
                li.appendChild(orderDtoCreateDateSpan);
                const orderDtoTotalSpan = document.createElement('span');
                orderDtoTotalSpan.textContent = '訂單總金額:' + orderDto.total;
                li.appendChild(orderDtoTotalSpan);

                // 按鈕區域
                const buttonContainer = document.createElement('div');
                buttonContainer.classList.add('btn-group');

                // 訂單明細按鈕
                const detailButton = document.createElement('button');
                detailButton.classList.add('btn', 'btn-primary', 'btn-sm');
                detailButton.type = 'button';
                detailButton.dataset.bsToggle = 'collapse';
                detailButton.dataset.bsTarget = '#order' + orderDto.orderId;
                detailButton.ariaExpanded = 'false';
                detailButton.ariaControls = 'order' + orderDto.id;
                detailButton.textContent = '訂單明細';
                buttonContainer.appendChild(detailButton);

                li.appendChild(buttonContainer);
                cancelledOrder.appendChild(li);

                // Details 區域
                const div = document.createElement('div');
                div.style = 'width:80%'
                div.classList.add('collapse');
                div.id = 'order' + orderDto.orderId;
                cancelledOrder.appendChild(div);

                const detailsUl = document.createElement('ul');
                detailsUl.classList.add('list-group', 'list-group-flush');
                div.appendChild(detailsUl);

                orderDto.orderDetailDtos.forEach(orderDetailDto => {
                  const detailsLi = document.createElement('li');
                  detailsLi.classList.add('list-group-item');

                  const commodityNameSpan = document.createElement('span');
                  commodityNameSpan.style = 'margin-right:2%'
                  commodityNameSpan.innerHTML = "商品名稱:" + '<img src="data:image/jpeg;base64,' + orderDetailDto.base64CommodityPictureString + '" style="width: 30px;height: 20px;padding-right:5px;padding-left:5px;"></img>'+orderDetailDto.commodityName;
                  detailsLi.appendChild(commodityNameSpan);

                  const quantitySpan = document.createElement('span');
                  quantitySpan.style = 'margin-right:2%'
                  quantitySpan.textContent = "商品數量:" + orderDetailDto.quantity;
                  detailsLi.appendChild(quantitySpan);

                  const commodityPriceSpan = document.createElement('span');
                  commodityPriceSpan.style = 'margin-right:2%'
                  commodityPriceSpan.textContent = "商品價格:" + orderDetailDto.commodityPrice;
                  detailsLi.appendChild(commodityPriceSpan);

                  const subTotalSpan = document.createElement('span');
                  subTotalSpan.style = 'margin-right:2%'
                  subTotalSpan.textContent = "小計:" + orderDetailDto.commodityPrice * orderDetailDto.quantity;
                  detailsLi.appendChild(subTotalSpan);

                  detailsUl.appendChild(detailsLi);
                });

              });

            })
            .catch(error => console.error(error));
        }




        // load on 事件
        document.addEventListener("DOMContentLoaded", function () {

          var memberId = "${member.id}";

          const cashOnDeliveryOrder = document.querySelector("#cash-on-delivery-order");
          const paymentFlowOrder = document.querySelector("#payment-flow-order");
          const cancelledOrder = document.querySelector("#cancelled-order");

          // 在一開始抓到該會員貨到付款訂單的資料
          fetch("${contextRoot}/api/order/cashOnDeliverOrder/" + memberId)
            .then(response => response.json())
            .then(data => {
              console.log(data);

              data.forEach(orderDto => {
                // 轉成台灣時間
                const utcDate = new Date(orderDto.createOrderTime);
                const twDate = utcDate.toLocaleString('zh-TW', { timeZone: 'Asia/Taipei' });

                // 訂單資訊 list item
                const li = document.createElement('li');
                li.style = 'width:80%'
                li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');

                const orderDtoCreateDateSpan = document.createElement('span');
                orderDtoCreateDateSpan.textContent = "訂單創立時間:" + twDate;
                li.appendChild(orderDtoCreateDateSpan);
                const orderDtoTotalSpan = document.createElement('span');
                orderDtoTotalSpan.textContent = '訂單總金額:' + orderDto.total;
                li.appendChild(orderDtoTotalSpan);

                // 按鈕區域
                const buttonContainer = document.createElement('div');
                buttonContainer.classList.add('btn-group');

                // 訂單明細按鈕
                const detailButton = document.createElement('button');
                detailButton.classList.add('btn', 'btn-primary', 'btn-sm');
                detailButton.type = 'button';
                detailButton.dataset.bsToggle = 'collapse';
                detailButton.dataset.bsTarget = '#order' + orderDto.orderId;
                detailButton.ariaExpanded = 'false';
                detailButton.ariaControls = 'order' + orderDto.id;
                detailButton.textContent = '訂單明細';
                buttonContainer.appendChild(detailButton);

                // 刪除訂單按鈕
                const customButton = document.createElement('button');
                customButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'ms-1');
                customButton.type = 'button';
                customButton.textContent = '刪除訂單';
                customButton.addEventListener('click', () => {
                  fetchOrderDetails(orderDto.orderId);
                });
                buttonContainer.appendChild(customButton);

                li.appendChild(buttonContainer);
                cashOnDeliveryOrder.appendChild(li);

                // Details 區域
                const div = document.createElement('div');
                div.classList.add('collapse');
                div.style = 'width:80%'
                div.id = 'order' + orderDto.orderId;
                cashOnDeliveryOrder.appendChild(div);

                const detailsUl = document.createElement('ul');
                detailsUl.classList.add('list-group', 'list-group-flush');
                div.appendChild(detailsUl);

                orderDto.orderDetailDtos.forEach(orderDetailDto => {
                  const detailsLi = document.createElement('li');
                  detailsLi.classList.add('list-group-item');

                  const commodityNameSpan = document.createElement('span');
                  commodityNameSpan.style = 'margin-right:2%'
                  commodityNameSpan.innerHTML = "商品名稱:" + '<img src="data:image/jpeg;base64,' + orderDetailDto.base64CommodityPictureString + '" style="width: 30px;height: 20px;padding-right:5px;padding-left:5px;"></img>'+orderDetailDto.commodityName;
                  detailsLi.appendChild(commodityNameSpan);

                  const quantitySpan = document.createElement('span');
                  quantitySpan.style = 'margin-right:2%'
                  quantitySpan.textContent = "商品數量:" + orderDetailDto.quantity;
                  detailsLi.appendChild(quantitySpan);

                  const commodityPriceSpan = document.createElement('span');
                  commodityPriceSpan.style = 'margin-right:2%'
                  commodityPriceSpan.textContent = "商品價格:" + orderDetailDto.commodityPrice;
                  detailsLi.appendChild(commodityPriceSpan);

                  const subTotalSpan = document.createElement('span');
                  subTotalSpan.style = 'margin-right:2%'
                  subTotalSpan.textContent = "小計:" + orderDetailDto.commodityPrice * orderDetailDto.quantity;
                  detailsLi.appendChild(subTotalSpan);

                  detailsUl.appendChild(detailsLi);
                });

              });

            })
            .catch(error => console.error(error));

          // 在一開始抓到該會員信用卡付款訂單的資料
          fetch("${contextRoot}/api/order/paymentFlowOrder/" + memberId)
            .then(response => response.json())
            .then(data => {

              data.forEach(orderDto => {
                // 轉成台灣時間
                const utcDate = new Date(orderDto.createOrderTime);
                const twDate = utcDate.toLocaleString('zh-TW', { timeZone: 'Asia/Taipei' });

                // 訂單資訊 list item
                const li = document.createElement('li');
                li.style = 'width:80%'
                li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');

                const orderDtoCreateDateSpan = document.createElement('span');
                orderDtoCreateDateSpan.textContent = "訂單創立時間:" + twDate;
                li.appendChild(orderDtoCreateDateSpan);
                const orderDtoTotalSpan = document.createElement('span');
                orderDtoTotalSpan.textContent = '訂單總金額:' + orderDto.total;
                li.appendChild(orderDtoTotalSpan);

                // 按鈕區域
                const buttonContainer = document.createElement('div');
                buttonContainer.classList.add('btn-group');

                // 訂單明細按鈕
                const detailButton = document.createElement('button');
                detailButton.classList.add('btn', 'btn-primary', 'btn-sm');
                detailButton.type = 'button';
                detailButton.dataset.bsToggle = 'collapse';
                detailButton.dataset.bsTarget = '#order' + orderDto.orderId;
                detailButton.ariaExpanded = 'false';
                detailButton.ariaControls = 'order' + orderDto.id;
                detailButton.textContent = '訂單明細';
                buttonContainer.appendChild(detailButton);

                // 刪除訂單按鈕
                const customButton = document.createElement('button');
                customButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'ms-1');
                customButton.type = 'button';
                customButton.textContent = '刪除訂單';
                customButton.addEventListener('click', () => {
                  fetchOrderDetails(orderDto.orderId);
                });
                buttonContainer.appendChild(customButton);

                li.appendChild(buttonContainer);
                paymentFlowOrder.appendChild(li);

                // Details 區域
                const div = document.createElement('div');
                div.classList.add('collapse');
                div.style = 'width:80%'
                div.id = 'order' + orderDto.orderId;
                paymentFlowOrder.appendChild(div);

                const detailsUl = document.createElement('ul');
                detailsUl.classList.add('list-group', 'list-group-flush');
                div.appendChild(detailsUl);

                orderDto.orderDetailDtos.forEach(orderDetailDto => {
                  const detailsLi = document.createElement('li');
                  detailsLi.classList.add('list-group-item');

                  const commodityNameSpan = document.createElement('span');
                  commodityNameSpan.style = 'margin-right:2%'
                  commodityNameSpan.innerHTML = "商品名稱:" + '<img src="data:image/jpeg;base64,' + orderDetailDto.base64CommodityPictureString + '" style="width: 30px;height: 20px;padding-right:5px;padding-left:5px;"></img>'+orderDetailDto.commodityName;
                  detailsLi.appendChild(commodityNameSpan);

                  const quantitySpan = document.createElement('span');
                  quantitySpan.style = 'margin-right:2%'
                  quantitySpan.textContent = "商品數量:" + orderDetailDto.quantity;
                  detailsLi.appendChild(quantitySpan);

                  const commodityPriceSpan = document.createElement('span');
                  commodityPriceSpan.style = 'margin-right:2%'
                  commodityPriceSpan.textContent = "商品價格:" + orderDetailDto.commodityPrice;
                  detailsLi.appendChild(commodityPriceSpan);

                  const subTotalSpan = document.createElement('span');
                  subTotalSpan.style = 'margin-right:2%'
                  subTotalSpan.textContent = "小計:" + orderDetailDto.commodityPrice * orderDetailDto.quantity;
                  detailsLi.appendChild(subTotalSpan);

                  detailsUl.appendChild(detailsLi);
                });

              });

            })
            .catch(error => console.error(error));


          // 在一開始抓到該會員已取消訂單的資料
          fetch("${contextRoot}/api/order/cancelledOrder/" + memberId)
            .then(response => response.json())
            .then(data => {
              console.log(data);

              data.forEach(orderDto => {
                // 轉成台灣時間
                const utcDate = new Date(orderDto.createOrderTime);
                const twDate = utcDate.toLocaleString('zh-TW', { timeZone: 'Asia/Taipei' });

                // 訂單資訊 list item
                const li = document.createElement('li');
                li.style = 'width:80%'
                li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');

                const orderDtoCreateDateSpan = document.createElement('span');
                orderDtoCreateDateSpan.textContent = "訂單創立時間:" + twDate;
                li.appendChild(orderDtoCreateDateSpan);
                const orderDtoTotalSpan = document.createElement('span');
                orderDtoTotalSpan.textContent = '訂單總金額:' + orderDto.total;
                li.appendChild(orderDtoTotalSpan);

                // 按鈕區域
                const buttonContainer = document.createElement('div');
                buttonContainer.classList.add('btn-group');

                // 訂單明細按鈕
                const detailButton = document.createElement('button');
                detailButton.classList.add('btn', 'btn-primary', 'btn-sm');
                detailButton.type = 'button';
                detailButton.dataset.bsToggle = 'collapse';
                detailButton.dataset.bsTarget = '#order' + orderDto.orderId;
                detailButton.ariaExpanded = 'false';
                detailButton.ariaControls = 'order' + orderDto.id;
                detailButton.textContent = '訂單明細';
                buttonContainer.appendChild(detailButton);

                li.appendChild(buttonContainer);
                cancelledOrder.appendChild(li);

                // Details 區域
                const div = document.createElement('div');
                div.classList.add('collapse');
                div.style = 'width:80%'
                div.id = 'order' + orderDto.orderId;
                cancelledOrder.appendChild(div);

                const detailsUl = document.createElement('ul');
                detailsUl.classList.add('list-group', 'list-group-flush');
                div.appendChild(detailsUl);

                orderDto.orderDetailDtos.forEach(orderDetailDto => {
                  const detailsLi = document.createElement('li');
                  detailsLi.classList.add('list-group-item');

                  const commodityNameSpan = document.createElement('span');
                  commodityNameSpan.style = 'margin-right:2%'
                  commodityNameSpan.innerHTML = "商品名稱:" + '<img src="data:image/jpeg;base64,' + orderDetailDto.base64CommodityPictureString + '" style="width: 30px;height: 20px;padding-right:5px;padding-left:5px;"></img>'+orderDetailDto.commodityName;
                  detailsLi.appendChild(commodityNameSpan);

                  const quantitySpan = document.createElement('span');
                  quantitySpan.style = 'margin-right:2%'
                  quantitySpan.textContent = "商品數量:" + orderDetailDto.quantity;
                  detailsLi.appendChild(quantitySpan);

                  const commodityPriceSpan = document.createElement('span');
                  commodityPriceSpan.style = 'margin-right:2%'
                  commodityPriceSpan.textContent = "商品價格:" + orderDetailDto.commodityPrice;
                  detailsLi.appendChild(commodityPriceSpan);

                  const subTotalSpan = document.createElement('span');
                  subTotalSpan.style = 'margin-right:2%'
                  subTotalSpan.textContent = "小計:" + orderDetailDto.commodityPrice * orderDetailDto.quantity;
                  detailsLi.appendChild(subTotalSpan);

                  detailsUl.appendChild(detailsLi);
                });

              });

            })
            .catch(error => console.error(error));
        });
        // 获取复选框元素
        var cashOnDeliveryCheckbox = document.getElementById('cashOnDelivery');
        var creditCardCheckbox = document.getElementById('creditCard');
        var cancelledOrderCheckbox = document.getElementById('cancelledOrder');

        // 监听复选框变化事件
        cashOnDeliveryCheckbox.addEventListener('change', function () {
          if (cashOnDeliveryCheckbox.checked) {
            // 货到付款订单复选框被选中
            document.getElementById('cash-on-delivery-order-div').style.display = 'block';
          } else {
            // 货到付款订单复选框未选中
            document.getElementById('cash-on-delivery-order-div').style.display = 'none';
          }
        });

        creditCardCheckbox.addEventListener('change', function () {
          if (creditCardCheckbox.checked) {
            // 信用卡付款订单复选框被选中
            document.getElementById('payment-flow-order-div').style.display = 'block';
          } else {
            // 信用卡付款订单复选框未选中
            document.getElementById('payment-flow-order-div').style.display = 'none';
          }
        });

        cancelledOrderCheckbox.addEventListener('change', function () {
          if (cancelledOrderCheckbox.checked) {
            // 已取消订单复选框被选中
            document.getElementById('cancelled-order-div').style.display = 'block';
          } else {
            // 已取消订单复选框未选中
            document.getElementById('cancelled-order-div').style.display = 'none';
          }
        });
      </script>

      </html>