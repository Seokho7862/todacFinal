<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){

	
var date = new Date();
var dates="";
dates+=date.getFullYear()+"-";
dates+=date.getMonth()+"-";
dates+=date.getDay();
$('.col-sm-8').find('h5').text(date);
	
});


</script>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Todac&mdash;	관리자</h1>
  <p>오늘의 토닥</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="admin_main.do">
  <img src="img/color_to2.png" style="width:60px"/>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="apply_list.do">관계자 신청목록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="report_list.do">신고 관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">데이터</a>
      </li>    
    </ul>
  </div>  
</nav>

<div class="container" style="margin-top:30px;margin-left: 20px">
  <div class="row">
    <div class="col-sm-4">
      <h2>관리자 모드</h2>
      <h5>${muid}님</h5>
      <div class="fakeimg"><img src="img/to_icon.png" style="width:100px"></div>
      <p></p>
      <hr>
      <h3 style="margin-top: 30px"><a href="admin_main.do">관리 목록</a></h3>
      <p></p>
      <ul id="navAd" class="nav nav-pills flex-column">
   
        <li class="nav-item">
          <a class="nav-link" href="apply_list.do">병원관계자 신청관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="report_list.do">신고목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="over_report_list.do">탈퇴예정 목록</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    
    
    <div class="col-sm-4">
      <h2>병원관계자 신청목록 </h2>
      <h5></h5>
      <div class="fakeimg"><img src="img/doc.png" onclick="location.href='apply_list.do'"/></div>
      <p>병원 관계자로 신청한 사용자들의 목록입니다.</p>
      <br>
      </div>
    <div class="col-sm-4">
      <h2>신고 리스트 목록</h2>
      <h5></h5>
      <div class="fakeimg"><img src="img/doc.png" onclick="location.href='report_list.do'"/></div>
      <p>후기게시물에서 경고를 받은 목록입니다.</p>
    </div>
  </div>
</div>

<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>