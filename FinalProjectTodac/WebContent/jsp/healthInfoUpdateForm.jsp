<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#cancleBtn').bind('click',function(){
		history.back();
	});
	
})
</script>
<style type="text/css">
td {
	width: 100%;
}

.table-bordered {
	width: 90%;
	margin: auto;
}
</style>
</head>

<body>
	<!--::header part start::-->
	<jsp:include page="header2.jsp"></jsp:include>
	<!-- Header part end-->

	<h1>건강정보 수정폼</h1>

	<form action="updateHealthInfo.do">
		<table class="table-bordered">
			<tr>
				<td><input type="text" name="title" style="width: 100%"
					value="${healthInfo.title }"></td>
			</tr>
			<tr>
				<td><textarea style="width: 100%; height: 500px;" name="content">${healthInfo.content }</textarea><br>
				</td>
			</tr>
			<tr>
				<td><input style="width: 100%" type="file" name="hfile" ${healthInfo.hfile}><br>
				</td>
			</tr>
			<tr><td><input	type="submit" value="수정하기"> 
			<input type="button" value="취소"	id="cancleBtn"></td></tr>

		</table>

		<input type="text" name="iid" value="${healthInfo.iid}">  <br> <br> <input
			type="text" value="${pageInfo.page}" name="page"> <input
			type="text" value="${pageInfo.keyword}" name="keyword"> <input
			type="text" value="${pageInfo.searchType}" name="searchType">
	</form>


</body>
</html>