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

      <body style="background-color: #f4f0e6;font-family:微軟正黑體;">
        <!-- ======= Header ======= -->
        <jsp:include page="../layout/header.jsp"></jsp:include>
        <!-- End Header -->

        <main id="floor-plans-container">
          <section class="floor-plans-section">
            <div class="floor-info">
              <h3 class="floor-info-title-left" id="floor-info">樓層簡介</h3>
              <ul class="floor-info-list" id="floor-info-ul">
                <li class="list-floor-item" style="display: none;" onclick="fetchFloorData('B1')">B1</li>
                <li class="list-floor-item" style="display: none;" onclick="fetchFloorData('B2')">B2</li>
                <li class="list-floor-item" style="display: none;" onclick="fetchFloorData('1F')">1F</li>
                <li class="list-floor-item" style="display: none;" onclick="fetchFloorData('2F')">2F</li>
                <li class="list-floor-item" style="display: none;" onclick="fetchFloorData('3F')">3F</li>
                <li class="list-floor-item" style="display: none;" onclick="fetchFloorData('4F')">4F</li>
              </ul>
              <h3 class="floor-info-title-left" id="floor-search">品牌搜尋</h3>

            </div>
            <div class="floor-info-body">
              <div id="search-box" style="display: none;">
                <span id="search-span">請輸入條件進行搜尋</span>
                <br>
                <select id="search-option1">
                  <option value="">請選擇產業類別</option>
                  <jstl:forEach items="${industryCategories}" var="industryCategory">
                    <option value="${industryCategory.industryCategoryId}">
                      ${industryCategory.industryCategoryName}
                    </option>
                  </jstl:forEach>
                </select>
                <select id="search-option2">
                  <option value="">請選擇樓層</option>
                </select>
                <br>
                <input type="text" id="search-input" placeholder="請輸入關鍵字">
                <button>搜尋</button>
              </div>

              <div id="search-result" style="display: none;">
                <span>搜尋結果</span>
                <table id="result-table">
                  <thead>
                    <tr>
                      <th>品牌名稱</th>
                      <th>所在樓層</th>
                      <th>產業類別</th>
                      <th>電話</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
              <div id="company-box">
                <h3 class="floor-info-title">所有上櫃中的廠商名稱</h3>
                <div class="floor-company" id="floor-company"></div>
              </div>
              <div id="company-image-box">
                <h3 class="floor-info-title">樓層圖</h3>
                <!-- <span ><a href=https://www.qsquare.com.tw/floor.php>連結為https://www.qsquare.com.tw/floor.php</a></span> -->
                <div class="floor-plan-wrapper">
                  <img class="floor-plan-img" src="${contextRoot}/assetsForFrontend/img/樓層圖.png" alt="樓層平面圖">
                </div>
                <br>
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
        // 定義一個事件來通過樓層找到該樓層上櫃中的廠商
        function fetchFloorData(floorValue) {
          fetch('${contextRoot}/api/company/findAllCompanyOnCounterAndFloor/' + floorValue)
            .then(response => response.json())
            .then(data => {
              console.log(data);
              let companySpace = document.getElementById('floor-company');
              companySpace.innerHTML = '';
              data.forEach(company => {
                companySpace.innerHTML += '<span class="floor-company-name">' + '<img src="data:image/jpeg;base64,' + company.base64StringCompanyLogo + '" style="width: 30px;height: 20px;padding-right:5px;"></img>' + company.companyName + '</span>';
              });
              // 更改h3的內容為li的value
              document.querySelector('.floor-info-title').textContent = floorValue + ' 的所有廠商';
            })
            .catch(error => {
              console.error('Error:', error);
            });
          }
          // load on 事件
          document.addEventListener("DOMContentLoaded", function () {
            
            // 在一開始抓到所有上櫃中的公司資料
            fetch('${contextRoot}/api/company/findAllCompanyOnCounter')
            .then(response => response.json())
            .then(data => {
              let companySpace = document.getElementById('floor-company');
              data.forEach(company => {
                companySpace.innerHTML += '<span class="floor-company-name">' + '<img src="data:image/jpeg;base64,' + company.base64StringCompanyLogo + '" style="width: 30px;height: 20px;padding-right:5px;"></img>' + company.companyName + '</span>';
              });
            })
            .catch(error => console.error(error));
            
            
            
          // Event for 左邊的 品牌搜尋
          const searchTitle = document.getElementById('floor-search');
          const searchBox = document.getElementById('search-box');
          const companyBox = document.getElementById('company-box');
          const searchResult = document.getElementById('search-result');
          const companyImageBox = document.getElementById('company-image-box');
          
          searchTitle.addEventListener('click', function () {
            if (searchBox.style.display === 'none') {
              searchBox.style.display = 'block';
              searchResult.style.display = 'block';
              companyBox.style.display = 'none';
              companyImageBox.style.display = 'none';
            }
          });
          
          // Event for 左邊的 樓層簡介
          var myFloorInfo = document.getElementById('floor-info');
          // 按下樓層簡介
          myFloorInfo.addEventListener('click', function () {
            let myList = document.getElementById('floor-info-ul');
            var lis = myList.getElementsByTagName('li');
            if (companyBox.style.display != 'none') {
              for (var i = 0; i < lis.length; i++) {
                if (lis[i].style.display === 'none') {
                  lis[i].style.display = 'block';
                } else {
                  lis[i].style.display = 'none';
                }
              }
            }
            if (searchBox.style.display !== 'none') {
              searchBox.style.display = 'none';
              searchResult.style.display = 'none';
              companyBox.style.display = 'block';
              companyImageBox.style.display = 'inline-block';
            }
            
            // 恢復為所有廠商的資料
            fetch('${contextRoot}/api/company/findAllCompanyOnCounter')
            .then(response => response.json())
            .then(data => {
              let companySpace = document.getElementById('floor-company');
              companySpace.innerHTML = "";
              data.forEach(company => {
                companySpace.innerHTML += '<span class="floor-company-name">' + '<img src="data:image/jpeg;base64,' + company.base64StringCompanyLogo + '" style="width: 30px;height: 20px;padding-right:5px;"></img>' + company.companyName + '</span>';
              });
              // 更改h3的內容為li的value
              document.querySelector('.floor-info-title').textContent = '所有上櫃中的廠商名稱';
            })
            .catch(error => console.error(error));
          });
          
          // 增加所有樓層的選項
          const floorList = document.querySelectorAll('.list-floor-item');
          const searchOption2 = document.getElementById('search-option2');

          floorList.forEach(floor => {
            const option = document.createElement('option');
            option.value = floor.textContent;
            option.textContent = floor.textContent;
            searchOption2.appendChild(option);
          });





        });
      </script>

      </html>