<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">


<title></title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextRoot}/">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${contextRoot}/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextRoot}/message/add">Message</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="">顧客服務</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>