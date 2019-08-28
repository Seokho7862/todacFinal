<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function(){
	
	$('#managerbtn').on('click',function(){
		
		$.ajax({
			url : 'loginManager.do',
			data : {
				muid : $('#muid').val(),
				pwd : $('#pwd').val()
			},
		
			success : function(data){
				if(data=="1"){
					alert($('#muid').val()+" 님 환영합니다.");
					
					location.href='service_info.do';
					
					
				}
				else
					alert("존재하지 않는 회원입니다.");
			},
			error : function(request,status,error){
				alert("다시 시도해주세요.");				
			}
		});
		
	});
	
	
});

</script>			
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>

<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Todac&mdash; LOGIN</h1>
  <p>오늘의 토닥</p> 
  <p><a href="service_info.do" class="btn btn-primary btn-lg" role="button" style="font-family: 'Jua'; color: white">MAIN&raquo;</a></p>
  
</div>
<div class="container">
<div class="row">
<div class="col-md-4">
</div>
<div class="col-md-4" style="margin-top: 0">
<div class="tabbable" id="tabs-343454">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active show" href="#tab1" data-toggle="tab">사용자</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#tab2" data-toggle="tab">관계자</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
					<p>
<h1>사용자 로그인</h1>
<form action="loginUser.do">
아이디<input type="text" name="muid"> <br>
비밀번호<input type="password" name="pwd">
<input id="mainLog" type="submit" value="로그인">
</form>
					</p>
					</div>
					<div class="tab-pane" id="tab2">
						<p>
<h1>관계자 로그인</h1>
아이디<input type="text" id="muid"> <br>
비밀번호<input type="password" id="pwd">
<input type="button" id="managerbtn" value="로그인">
						</p>
					</div>
				</div>
			</div>
			<hr>
<a href="find_id_form.do">아이디  </a>&ensp;&frasl;&ensp;	<a href="find_pw_form.do">  비밀번호 찾기</a>
<br>
<button onclick="location.href='admin_login_form.do'">관리자로그인</button>&ensp;	&ensp;	
<button onclick="location.href='signUpForm.do'">회원가입</button>
</div>

<div class="col-md-4">
</div>
</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>