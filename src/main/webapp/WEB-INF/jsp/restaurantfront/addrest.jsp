<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
      .text img{
        width: 100%;
      }
    </style>
<title>餐廳頁面測試</title>
</head>
<body>
<!-- ======= Header ======= -->
 <jsp:include page="../layout/header.jsp"></jsp:include>
<!-- End Header -->
	<main id="main">
	<div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12 col-md-2">
          <div class="text">
            <img src="https://picsum.photos/80?random=1" class="rounded mx-auto d-block">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Itaque earum veniam saepe dolor suscipit velit est voluptatum, expedita dolorem asperiores non ullam doloribus dolores unde atque dolorum, praesentium laudantium autem.
          </div>
        </div>
        <div class="col-12 col-md-2">
          <div class="text">
            <img src="https://picsum.photos/80?random=1" class="rounded mx-auto d-block">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Itaque earum veniam saepe dolor suscipit velit est voluptatum, expedita dolorem asperiores non ullam doloribus dolores unde atque dolorum, praesentium laudantium autem.
          </div>
        </div>
        <div class="col-12 col-md-2">
          <div class="text">
            <img src="https://picsum.photos/80?random=1" class="rounded mx-auto d-block">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Itaque earum veniam saepe dolor suscipit velit est voluptatum, expedita dolorem asperiores non ullam doloribus dolores unde atque dolorum, praesentium laudantium autem.
          </div>
        </div>
     
       
       
        
      </div>
    </div>
	</main>
</body>
</html>