<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="forcss/todac.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



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
<h1>마이페이지</h1>
<%-- <jsp:include page="header.jsp"></jsp:include> --%>



<div class="jumbotron text-center text-light" style="margin-bottom:0">
   <div class="container">
    <h1>MY PAGE</h1>
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <p><a class="btn btn-primary btn-lg" role="button">자세히 알아보기 &raquo;</a></p>
  </div>
</div>


<div class="container" style="margin-top:30px">
  <div class="row">
<!--     <div class="col-sm-4">
   
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="#">Active</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Disabled</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div> -->


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
        <li class="list-group-item"><a href="review_list.dos">내가 쓴 리뷰</a></li>
      </ul>
</div>      

<!-- 패널 타이틀3 -->
<!-- <div class="panel panel-info">
  <div class="panel-heading">
    <h3 class="panel-title">Panel Title</h3>
  </div>
      사이드바 메뉴목록3
      <ul class="list-group">
        <li class="list-group-item"><a href="#">About</a></li>
        <li class="list-group-item"><a href="#">Help</a></li>
      </ul>
    </div> -->
    
    </div>
    <div class="col-md-8">
    <div class="container contact-form">
            <div class="contact-image">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>
            <form method="post">
                <h3>Drop Us a Message</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="txtName" class="form-control" placeholder="Your Name *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="txtEmail" class="form-control" placeholder="Your Email *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="txtPhone" class="form-control" placeholder="Your Phone Number *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" name="btnSubmit" class="btnContact" value="Send Message" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea name="txtMsg" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
                        </div>
                    </div>
                </div>
            </form>
</div>
    
    </div>
    
</div> 


</body>
</html>