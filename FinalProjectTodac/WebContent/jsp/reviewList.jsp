<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-left: 300px">
<h1>내가 쓴 리뷰</h1>
<form action="">
<table>
  <tr>
  <th>No.</th>
  <th>제목</th>
  <th>병원이름</th>
  <th>병원주소</th>
  <th>평점</th>
  <th>작성일</th>
  </tr>
  <c:forEach items="${reviewlist}" var="r" varStatus="status">
  <tr>
  <td>${status.count}</td>
  <td>${r.title}</td>
  <td>${r.dutyName}</td>
  <td>${r.dutyAddr}</td>
  <td>${r.grade}</td>
  <td>${r.rdate}</td>
  </tr>
  
  </c:forEach>
  

</table>

</form>
</div>
</body>
</html>