<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"></jstl:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Member</title>
</head>
<body>
    <h1>更新會員</h1>
    <form action="${contextRoot}/editmember/edit" method="PUT">
        <input type="hidden" name="id" value="${member.id}" />
        <label for="name">Name:</label>
        <input type="text" name="name" value="${member.name}" />
        <br />
        <label for="email">Email:</label>
        <input type="text" name="email" value="${member.email}" />
        <br />
        <label for="password">Password:</label>
        <input type="password" name="password" value="${member.password}" />
        <br />
        <button type="submit">Update</button>
    </form>
</body>
</html>