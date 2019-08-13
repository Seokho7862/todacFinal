<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>건강정보 글쓰기</h1>
<form action="healthInfoWrite.do" method="post" enctype="multipart/form-data">
ID<input type="text" name="muid" value="testID"><br>
NICK<input type="text" name="writer" value="testID"><br>
제목:<input type="text" name="title"> <br>
내용:<input type="text" name="content"><br>
FILE<input type="file" name="infoFile"><br>
<input type="submit" value="등록하기">
</form>

</body>
</html>