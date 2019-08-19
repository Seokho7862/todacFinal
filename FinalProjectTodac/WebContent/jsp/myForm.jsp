<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div style="margin-left: 300px">
	<h1>My Info</h1>
	
	<form action="">
		<table>
		<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="${member.muid}" disabled="disabled"></td>
		</tr>
		
		<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
		</tr>
		
		<tr>
		<td>생년월일</td>
		<td><input type="text" name="birth"></td>
		</tr>
		
		<tr>
		<td>폰번호</td>
		<td><input type="text" name="phone"></td>
		</tr>
		
		<tr>
		<td>주소</td>
		<td><input type="text" name="address"></td>
		</tr>
		
		<tr>
			
		<td colspan="2"><input type="submit" value="수정"></td>
		</tr>
		</table>
	
	
	
	</form>
	</div>
</body>
</html>