<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항 작성</h1>

<form action="noticeWirte.do">
<table>
<tr><td><input type="text" name="title"> </td></tr>
<tr><td><textarea name="content"></textarea></td></tr>
</table>
<input type="text" name="maid">
<input type="submit" value="완료"><input type="button" value="취소" onclick="location.href='noticeListForm.do?'">


</form>



</body>
</html>