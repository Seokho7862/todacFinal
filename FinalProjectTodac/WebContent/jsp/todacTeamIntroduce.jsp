<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#TeamIntroImg{
width:90%;

margin-left: auto;
}
#TeamIntroTable{
width:98%;
margin-left: auto; 
}
td{
font-size: large;
}

</style>
</head>

<body>
<!--::header part start::-->
	<jsp:include page="header2.jsp"></jsp:include>
	<!-- Header part end-->
<div id="TeamIntroDiv" style="width: 100%;">
<img id="TeamIntroImg" alt="" src="img/TeamTodacItroduce.PNG">
<table id="TeamIntroTable">

<tr>
<td width="22%">thugLife 씌운사람</td>
<td width="23%">소진누나</td>
<td width="30%">별넙치</td>
<td width="25%">24세<br>팀의 막내<br>헤더, 서비스소개, 질병정보 검색, <br>건강정보, 공지사항, 회원가입 <br>그리고 이런 서비스 소개를 만든 장본인</td>
</tr>

</table>
</div>

	<!--::header part start::-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Header part end-->
</body>
</html>