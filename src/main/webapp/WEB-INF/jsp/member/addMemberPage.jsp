<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
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
      <!-- ======= Header ======= -->
      <jsp:include page="../layout/header.jsp"></jsp:include>
      <!-- End Header -->
    </head>

    <body>
      <main id="main">
        <div>會員註冊</div>

        <form method="post" action="../InsertMember">
          <p>
            輸入會員姓名 : <input type="text" name="MemberName" /><br>
          <p>
            輸入會員生日 : <input type="text" name="MemberBirthday" /><br>
          <p>
            輸入會員信箱 : <input type="text" name="MemberEmail" /><br>
          <p>
            輸入會員帳號 : <input type="text" name="MemberAccount" /><br>
          <p>
            輸入會員密碼 : <input type="text" name="MemberPassword" /><br>
          <p>
            輸入會員電話 : <input type="text" name="MemberPhone" /><br>
          <p>
            輸入會員地址 : <input type="text" name="MemberAddress" /><br>
          <p>



            <input type="submit" value="確定" />
        </form>


      </main>


      <!-- End #main -->

    </body>

    </html>