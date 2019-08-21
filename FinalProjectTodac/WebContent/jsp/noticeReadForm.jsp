<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항 읽기</h1>
<table border="1">
<tr><td style="width: 800px;">${notice.title }</td><td>${notice.readcount }</td></tr>
<tr><td style="width: 100%;" colspan="2">${notice.content }</td></tr>

</table>
<input type="button" value="수정하기" onclick="location.href='noticeModifyForm.do?nid=${notice.nid}'">
<input type="button" value="삭제하기" onclick="location.href='noticeDelete.do?nid=${notice.nid}'">
<input type="button" value="목록" onclick="location.href='noticeListForm.do?'">

</body>
</html>