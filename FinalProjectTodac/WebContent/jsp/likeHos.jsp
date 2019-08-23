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
<h1>즐겨찾기</h1>
<form action="">
<table>
  <tr>
  <th>No.</th>
  <th>병원이름</th>
  <th>병원주소</th>
  </tr>
  
  <c:forEach items="${likelist}" var="l" varStatus="status" >
  <tr>
  <td>${status.count}</td>
  <td>${l.dutyName}</td>
  <td>${l.dutyAddr}</td>
  </tr>
  
  </c:forEach>

</table>

</form>
</div>
</body>
</html>