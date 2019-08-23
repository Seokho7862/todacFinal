<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
$(function(){
	
$('.list-group').hide();



$('.panel-heading').click(function(){
	$(this).parents('div.panel').find('ul.list-group').slideToggle();

});
});
</script>
</head>
<body>
<div class="col-md-4">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
<div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">회원정보</h3>
    </div>
    <!-- 사이드바 메뉴목록1 -->
    <ul class="list-group">
      <li class="list-group-item"><a href="show_pwd_form.do?from=member">내 정보 수정</a></li>
      <li class="list-group-item"><a href="renew_form.do">비밀번호 재설정</a></li>
      <li class="list-group-item"><a href="show_pwd_form.do?from=hos">내 병원정보 수정</a></li>
    </ul>
</div>
  <!-- 패널 타이틀2 -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">나의 목록</h3>
  </div>
    <!-- 사이드바 메뉴목록2 -->
      <ul class="list-group">
        <li class="list-group-item"><a href="like_list.do">병원 즐겨찾기</a></li>
        <li class="list-group-item"><a href="review_list.do">내가 쓴 리뷰</a></li>
      </ul>
</div>      
    
    </div>
 
</body>
</html>