<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항</h1>
<table border="1"> 
<c:forEach items="${noticeList}" var="notice">
<tr>
<td onclick="location.href='noticeReadForm.do?nid=${notice.nid}'" style="width: 800px;">${notice.title}</td><td>관리자</td>
</tr>
</c:forEach>


</table>
<input type="button" value="공지사항 작성" onclick="location.href='noticeWriteForm.do'">


</body>
</html>