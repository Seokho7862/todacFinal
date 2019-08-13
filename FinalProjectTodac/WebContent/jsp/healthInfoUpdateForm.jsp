<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>건강정보 수정폼</h1>

<form action="updateHealthInfo.do">
제목 <input type="text" name="title" value="${healthInfo.title }">
<br>
본문 <textarea rows="15" cols="400" name="content">${healthInfo.content }</textarea>><br>

파이리<input type="file" name="hfile" ${healthInfo.hfile}><br>

<input type="text" name="iid" value="${healthInfo.iid}"><br>



<input type="submit" value="수정하기">
<input type="button" value="취소" onclick="location.href='뒤로 돌아가기'">
<br>
<br>
<input type="text" value="${pageInfo.page}" name="page">
<input type="text" value="${pageInfo.keyword}" name="keyword">
<input type="text" value="${pageInfo.searchType}" name="searchType">
</form>


</body>
</html>