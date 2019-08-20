<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>공지사항 수정</h1>

<form action="noticeModify.do">
<table>
<tr><td><input type="text" name="title" value="${notice.title }"> </td></tr>
<tr><td><textarea name="content">${notice.content} </textarea></td></tr>
</table>
<input type="text" name="nid" value="${notice.nid}">
<input type="text" name="maid">
<input type="submit" value="완료">
<input type="button" value="취소" onclick="location.href='noticeReadForm.do?nid='+${notice.nid}">

</form>



</body>
</html>