<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>


<script type="text/javascript">
$(function(){
	$('#authPhone').on('click',function(){
		$.ajax({
			url : 'find_id.do',
			data:{
				name : $('#name').val(),
				phone :$('#phone').val()
			},
			type : 'post',
			success:function(data){
				if(data!=""){
					var input = "";
					input += "<input type='text' id='checknum'><br>";
					input += "<input type='button' id='chk' value='id찾기'>";
					$('#authPhone').after(input);
					
					$.ajax({
						url : 'authSms.do',
						data : {
							phone : $('#phone').val()
						},
						type : "post",
						success :  function(d){
							if(d.result==true){
								$('#chk').on('click',function(){
									if(d.key==$('#checknum').val()){
										
										location.href='loginForm.do';
									}
									else{
										alert("실패");
									}
								});
							}
							else{
								alert("다시 시도해주세요");
							}
						}
					});
					
					
					
				}
				else{
				alert("정보를 다시 입력해주세요");	
				}
			},
			error : function(){
				alert("정보를 다시 입력해주세요");
			}
			
			
		});
	});
	

});

</script>
</head>
<body>
<!-- header -->
<jsp:include page="header2.jsp"></jsp:include>
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Todac&mdash; ID & PASSWORD</h1>
  <p>오늘의 토닥</p>
  <p><a href="service_info.do" class="btn btn-primary btn-lg" role="button" style="font-family: 'Jua'; color: white">MAIN&raquo;</a></p>
   
</div>

<div class="container">
<div class="row">
<div class="col-4"></div>
<div class="col-4" style="text-align: center">
<form>
<h1>아이디 찾기</h1>
이름&nbsp;	<input type="text" id="name"> <br>
핸드폰&nbsp;	<input type="text" id="phone" placeholder="-없이 숫자만 입력해주세요">
<input type="button" id="authPhone" value="인증하기">
</form>
<hr>
<a href="find_pw_form.do">  비밀번호 찾기</a>&ensp;	&frasl;&ensp;&ensp;	<a href="loginForm.do"> 로그인 </a>
</div>
<div class="col-4"></div>
</div>
</div>


<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>