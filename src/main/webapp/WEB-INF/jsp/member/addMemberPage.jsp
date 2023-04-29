<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <h1>註冊會員</h1>
    <form:form method="post" modelAttribute="member">
        <table>
            <tr>
                <td>姓名：</td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td>帳號：</td>
                <td><form:input path="account" /></td>
            </tr>
            <tr>
                <td>密碼：</td>
                <td><form:input path="password" /></td>
            </tr>
            <tr>
                <td>生日：</td>
                <td><form:input path="birthday" type="date" /></td>
            </tr>
            <tr>
                <td>Email：</td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td>電話：</td>
                <td><form:input path="phone" /></td>
            </tr>
            <tr>
                <td>地址：</td>
                <td><form:input path="address" /></td>
            </tr>
            
            
            <tr>
                <td colspan="2"><input type="submit" value="註冊" /></td>
            </tr>
        </table>
    </form:form>
      </main>


      <!-- End #main -->

    </body>

    </html>