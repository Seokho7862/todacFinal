<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
font-size: large;
}
</style>
</head>
<body>	<!--::header part start::-->
	<jsp:include page="header2.jsp"></jsp:include>
	<!-- Header part end-->
<h1>　　공지사항 읽기</h1>
<table border="1" style="width: 95%; margin-left: 2.5%;">
<tr><td>${notice.nid}</td><td style="width: 97.5%;">${notice.title }</td></tr>
<tr><td colspan="3" style="height: 600px;">${notice.content }</td></tr>

</table>
　　
<input class="btn btn-outline-secondary" type="button" value="수정하기" onclick="location.href='noticeModifyForm.do?nid=${notice.nid}'">
<input class="btn btn-outline-secondary" type="button" value="삭제하기" onclick="location.href='noticeDelete.do?nid=${notice.nid}'">
<input class="btn btn-outline-secondary" type="button" value="목록" onclick="location.href='noticeListForm.do?'">

</body>
</html>