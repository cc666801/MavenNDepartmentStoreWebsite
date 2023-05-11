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
        function fetchOrderDetails(orderId) {
          var memberId = "${member.id}";
          const listGroup = document.querySelector(".list-group");
          listGroup.innerHTML = "";
          fetch("${contextRoot}/api/order/" + memberId + "/" + orderId, {
            method: "PUT"
          })
            .then(response => response.json())
            .then(data => {
              // 在這裡可以處理從後端取得的資料

              data.forEach(orderDto => {
                // 轉成台灣時間
                const utcDate = new Date(orderDto.createOrderTime);
                const twDate = utcDate.toLocaleString('zh-TW', { timeZone: 'Asia/Taipei' });

                // 訂單資訊 list item
                const li = document.createElement('li');
                li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');

                const span = document.createElement('span');
                span.textContent = "訂單創立時間:" + twDate + ' 訂單總金額:' + orderDto.total;
                li.appendChild(span);

                // 按鈕區域
                const buttonContainer = document.createElement('div');
                buttonContainer.classList.add('btn-group');

                // Detail 按鈕
                const detailButton = document.createElement('button');
                detailButton.classList.add('btn', 'btn-primary', 'btn-sm');
                detailButton.type = 'button';
                detailButton.dataset.bsToggle = 'collapse';
                detailButton.dataset.bsTarget = '#order' + orderDto.orderId;
                detailButton.ariaExpanded = 'false';
                detailButton.ariaControls = 'order' + orderDto.id;
                detailButton.textContent = '訂單明細';
                buttonContainer.appendChild(detailButton);

                // 你新增的按鈕
                const customButton = document.createElement('button');
                customButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'ms-1');
                customButton.type = 'button';
                customButton.textContent = '刪除訂單';
                customButton.addEventListener('click', () => {
                  fetchOrderDetails(orderDto.orderId);
                });
                buttonContainer.appendChild(customButton);

                li.appendChild(buttonContainer);
                listGroup.appendChild(li);

                // Details 區域
                const div = document.createElement('div');
                div.classList.add('collapse');
                div.id = 'order' + orderDto.orderId;
                listGroup.appendChild(div);

                const detailsUl = document.createElement('ul');
                detailsUl.classList.add('list-group', 'list-group-flush');
                div.appendChild(detailsUl);

                orderDto.orderDetailDtos.forEach(orderDetailDto => {
                  const detailsLi = document.createElement('li');
                  detailsLi.classList.add('list-group-item');

                  const commodityNameSpan = document.createElement('span');
                  commodityNameSpan.textContent = "商品名稱:" + orderDetailDto.commodityName;
                  detailsLi.appendChild(commodityNameSpan);

                  const quantitySpan = document.createElement('span');
                  quantitySpan.textContent = "商品數量:" + orderDetailDto.quantity;
                  detailsLi.appendChild(quantitySpan);

                  const commodityPriceSpan = document.createElement('span');
                  commodityPriceSpan.textContent = "商品價格:" + orderDetailDto.commodityPrice;
                  detailsLi.appendChild(commodityPriceSpan);

                  detailsUl.appendChild(detailsLi);
                });

              });
            })
            .catch(error => console.error(error));
        }



        // load on 事件
        document.addEventListener("DOMContentLoaded", function () {

          var memberId = "${member.id}";

          const listGroup = document.querySelector(".list-group");

          // 在一開始抓到該會員訂單的資料
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
                li.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');

                const span = document.createElement('span');
                span.textContent = "訂單創立時間:" + twDate + ' 訂單總金額:' + orderDto.total;
                li.appendChild(span);

                // 按鈕區域
                const buttonContainer = document.createElement('div');
                buttonContainer.classList.add('btn-group');

                // Detail 按鈕
                const detailButton = document.createElement('button');
                detailButton.classList.add('btn', 'btn-primary', 'btn-sm');
                detailButton.type = 'button';
                detailButton.dataset.bsToggle = 'collapse';
                detailButton.dataset.bsTarget = '#order' + orderDto.orderId;
                detailButton.ariaExpanded = 'false';
                detailButton.ariaControls = 'order' + orderDto.id;
                detailButton.textContent = '訂單明細';
                buttonContainer.appendChild(detailButton);

                // 你新增的按鈕
                const customButton = document.createElement('button');
                customButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'ms-1');
                customButton.type = 'button';
                customButton.textContent = '刪除訂單';
                customButton.addEventListener('click', () => {
                  fetchOrderDetails(orderDto.orderId);
                });
                buttonContainer.appendChild(customButton);

                li.appendChild(buttonContainer);
                listGroup.appendChild(li);

                // Details 區域
                const div = document.createElement('div');
                div.classList.add('collapse');
                div.id = 'order' + orderDto.orderId;
                listGroup.appendChild(div);

                const detailsUl = document.createElement('ul');
                detailsUl.classList.add('list-group', 'list-group-flush');
                div.appendChild(detailsUl);

                orderDto.orderDetailDtos.forEach(orderDetailDto => {
                  const detailsLi = document.createElement('li');
                  detailsLi.classList.add('list-group-item');

                  const commodityNameSpan = document.createElement('span');
                  commodityNameSpan.textContent = "商品名稱:" + orderDetailDto.commodityName;
                  detailsLi.appendChild(commodityNameSpan);

                  const quantitySpan = document.createElement('span');
                  quantitySpan.textContent = "商品數量:" + orderDetailDto.quantity;
                  detailsLi.appendChild(quantitySpan);

                  const commodityPriceSpan = document.createElement('span');
                  commodityPriceSpan.textContent = "商品價格:" + orderDetailDto.commodityPrice;
                  detailsLi.appendChild(commodityPriceSpan);

                  detailsUl.appendChild(detailsLi);
                });

              });

            })
            .catch(error => console.error(error));


        });

      </script>

      </html>