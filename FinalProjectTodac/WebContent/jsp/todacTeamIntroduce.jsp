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
<td width="22%">27세, 토닥 팀의 팀장<br>
스프링 프레임워크 환경 구축, 데이터 베이스 설계,
카카오 지도 API를 <br>이용한 병원 검색, 병원 정보,<br> 리뷰, 신고기능 개발<br>
클라우드 환경의 백엔드 개발에<br> 관심이 많은 팀원 </td>

<td width="23%">
25세, 프로젝트 매니저<br>
의도찮은 부상으로 개발 단계에<br>
적극적으로 참여치는 못했으나,<br>
특유의 카리스마와 넓은 시야로<br>
프로젝트 설계 단계 지휘<br> <br><br>


</td>
<td width="30%">26세, 토닥 팀의 대장<br>
ID-PW찾기,로그인,MY Page를 비롯한<br> 
모든 회원 기능, 병원 평가, 메인 페이지,<br>
푸터, CSS 개발<br>
성실함과 기본기, 깔끔한 코딩과<br> 카리스마로 무장한 팀의 캡틴<br> <br> </td>

<td width="25%">24세, 팀의 막내<br>헤더, 서비스소개, 질병정보 검색, 
<br>건강정보, 공지사항, 회원가입 <br>
그리고 이런 서비스 소개를 만든 장본인<br>
판단력과 실행력, 필요한 요소를 찾고<br>
신속하게 적용하는 능력이 최대 강점 <br> <br>
</td>
</tr>

</table>
</div>

	<!--::header part start::-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Header part end-->
</body>
</html>