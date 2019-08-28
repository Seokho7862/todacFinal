<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>
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
<td width="22%">27세, 팀의 연장자<br>
스프링 프레임워크 환경 구축, 데이터 베이스 설계,
카카오 지도 API를 <br>이용한 병원 검색, 병원 정보,<br> 리뷰, 신고기능 개발<br>
클라우드 환경의 백엔드 개발에<br> 관심이 많은 팀원 </td>
<td width="23%">부상병</td>
<td width="30%">별넙치</td>
<td width="25%">24세, 팀의 막내<br>헤더, 서비스소개, 질병정보 검색, <br>건강정보, 공지사항, 회원가입 <br>그리고 이런 서비스 소개를 만든 장본인</td>
</tr>

</table>
</div>

	<!--::header part start::-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Header part end-->
</body>
</html>