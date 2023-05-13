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
                    <i class="fa-solid fa-cart-shopping"></i>
                    心願清單商品
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
        <jsp:include page="../../layout/footer.jsp"></jsp:include>
        <!-- End Footer -->

      </body>


      </html>