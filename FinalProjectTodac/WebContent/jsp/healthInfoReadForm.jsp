<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>건강정보 읽기</h1>

	<table border="1">
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>게시일</th>

		</tr>

		<tr>
			<th>${healthInfo.title}</th>
			<th>${healthInfo.writer}</th>
			<th>${healthInfo.iDate}</th>
		</tr>
		<tr>
			<td colspan="3">
			<img src="${healthInfo.hfile}">
					  

			
			<br> ${healthInfo.hfile} <br> ${healthInfo.content}</td>
		</tr>

		<tr>
			<td>page: ${pageInfo.page}</td>
			<td>searchType: ${pageInfo.searchType}</td>
			<td>keyword: ${pageInfo.keywords}</td>

		</tr>

	</table>
	조회수:${healthInfo.readcount}
	<br>

	<input type="button" value="목록으로"
		onclick="location.href='healthInfoList.do?page=${pageInfo.page}&keyword=${pageInfo.keyword}&searchType=${pageInfo.searchType}'">
	<input type="button" value="삭제"
		onclick="location.href='deleteHealthInfo.do?iid=${healthInfo.iid}'">
	<input type="button" value="수정"
		onclick="location.href='updateHealthInfoForm.do?iid=${healthInfo.iid}&page=${pageInfo.page}&keyword=${pageInfo.keyword}&searchType=${pageInfo.searchType}'">

</body>
</html>