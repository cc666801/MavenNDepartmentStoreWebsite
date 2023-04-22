<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>失物招領-後台</title>
</head>
<body>
<h1>失物招領管理</h1>
<form action="${contextRoot}/LostAndFoundBack/add">
  <button type="submit">新增</button>
</form>
<table>
 <thead>
        <tr>
<th>拾獲物登錄單號</th>
<th>拾獲日期</th>
<th>拾獲品項/數量</th>
<th>拾獲地點</th>
<th>狀態</th>
<th>編輯</th>
<th>刪除</th>
</tr>
    </thead>
    <tbody>
<c:forEach var="lost" items="${lostList}">
    <tr>
        <td>${lost.id}</td>
        <td>${lost.founddate}</td>
        <td>${lost.item}</td>
        <td>${lost.place}</td>
        <td>${lost.state}</td>
        <td><form action="${contextRoot}/LostAndFoundBack/edit">
						   <input type="hidden" name="id" value="${lost.id}" />
						   <input type="submit"  value="編輯" />
						</form></td>
        <td><form action="${contextRoot}/LostAndFoundBack/delete" method="post">
						   <input type="hidden" name="_method" value="delete" />
						   <input type="hidden" name="id" value="${lost.id}" />
						   <input type="submit" value="刪除" />
						</form></td>
    </tr>
</c:forEach>
</tbody>
</table>

</body>
</html>