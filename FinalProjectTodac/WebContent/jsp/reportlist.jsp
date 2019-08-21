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

<div style="margin-left: 300px">
<h1>신고 리스트</h1>
<form action="">
<table>
  <tr>
  <th>No.</th>
  <th>신고자</th>
  <th>신고사유</th>
  <th>신고게시물</th>
  <th>게시물ID</th>
  <th>삭제</th>
  <th>신고</th>
  </tr>
  
  <c:forEach var="" items="">
  <tr>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td><input type="button" value="삭제" onclick="location.href="></td>
  <td><input type="button" value="신고" onclick="location.href="></td>
  
  </tr>
  
  </c:forEach>
  

</table>

</form>
</div>
</body>
</html>