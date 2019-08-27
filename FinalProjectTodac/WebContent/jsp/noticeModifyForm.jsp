<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
#writeTable {
	width: 90%;
	height: 500px;
	margin: auto;
	margin-top: 50px;
}
</style>
</head>
<body>
	<!--::header part start::-->
	<jsp:include page="header2.jsp"></jsp:include>
	<!-- Header part end-->
<h1>공지사항 수정</h1>

<form action="noticeModify.do">
<table class="table-bordered" id="writeTable">
<tr><td><input type="text" name="title" value="${notice.title }" style="width: 100%; height: 100%;"> </td></tr>
<tr><td height="500px;"><textarea name="content" style="width: 100%; height: 100%;">${notice.content} </textarea></td></tr>
</table>
<input type="text" name="nid" value="${notice.nid}">
<input type="text" name="maid">
<input type="submit" value="완료">
<input type="button" value="취소" onclick="location.href='noticeReadForm.do?nid='+${notice.nid}">

</form>


	<!--::header part start::-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Header part end-->
</body>
</html>