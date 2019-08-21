<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
p{
margin-left: 15px;
margin-bottom: 0px;
}

</style>
</head>
<body>

	<h1>건강정보 읽기</h1>

	<table border="1" class="table-bordered" style="width:1250px; min-height: 700px;">

		<tr height="30px;">
			<th width="1280px;"><p>${healthInfo.title}</p></th>
			<th width="150px;"><p>${healthInfo.writer}</th>
			<th width="150px;"><p>${healthInfo.iDate}</th>
			<th width="150px;"><p>조회수:${healthInfo.readcount}</th>
		</tr>
		<tr>
			<td colspan="4">
			<img src="${healthInfo.hfile}" style="margin-top:-200px; margin-left:400px; width: 400px; height: auto;">
					  

			<br>
			 ${healthInfo.content}</td>
		</tr>

	

	</table>
<div class="btn-group">
	<input type="button" class="btn btn-outline-secondary" value="목록으로"
		onclick="location.href='healthInfoList.do?page=${pageInfo.page}&keyword=${pageInfo.keyword}&searchType=${pageInfo.searchType}'">
	<input type="button" class="btn btn-outline-secondary" value="삭제"
		onclick="location.href='deleteHealthInfo.do?iid=${healthInfo.iid}'">
	<input type="button" class="btn btn-outline-secondary" value="수정"
		onclick="location.href='updateHealthInfoForm.do?iid=${healthInfo.iid}&page=${pageInfo.page}&keyword=${pageInfo.keyword}&searchType=${pageInfo.searchType}'">
</div>
</body>
</html>