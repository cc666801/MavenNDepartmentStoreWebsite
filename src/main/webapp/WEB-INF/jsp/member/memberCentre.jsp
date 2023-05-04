<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="member" class="com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member" scope="page"/>

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
    <meta charset="UTF-8">
    <title>會員詳細資料</title>
</head>
<body>
    <main id="main">
        <h1>會員詳細資料</h1>
        <table>
            <tr>
                <th>帳號</th>
                <td>${member.account}</td>
            </tr>
            <tr>
                <th>密碼</th>
                <td>${member.password}</td>
            </tr>
            <tr>
                <th>姓名</th>
                <td>${member.name}</td>
            </tr>
            <tr>
                <th>生日</th>
                <td><c:out value="${member.birthday}" /></td>
            </tr>
            <tr>
                <th>電話</th>
                <td>${member.phone}</td>
            </tr>
            <tr>
                <th>地址</th>
                <td>${member.address}</td>
            </tr>
            <tr>
                <th>email</th>
                <td>${member.email}</td>
            </tr>
            <tr>
                <th>點數</th>
                <td>${member.points}</td>
            </tr>
        </table>
    </main>
</body>
</html>
