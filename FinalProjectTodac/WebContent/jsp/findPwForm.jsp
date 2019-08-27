<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<script type="text/javascript">
$(function(){
	$('#authPhone').on('click',function(){
		$.ajax({
			url : 'find_pw.do',
			data:{
				name : $('#name').val(),
				muid : $('#muid').val(),
				phone :$('#phone').val()
			},
			type : 'post',
			success:function(data){
				if(data!=""){
					alert("??");
					var input = "";
					input += "<input type='text' id='checknum'><br>";
					input += "<input type='button' id='chk' value='확인'>";
					$('#authPhone').after(input);
					
					$.ajax({
						url : 'authSms.do',
						data : {
							phone : $('#phone').val()
						},
						type : "post",
						success :  function(d){
							alert(d.key);
							if(d.result==true){
								$('#chk').on('click',function(){
								alert($('#checknum').val()+" 입력값");
									if(d.key==$('#checknum').val()){
										
										alert(data);
										var table ="";
										table +="<input type='text' id='pwd' placeholder='비밀번호 재설정'><br>";
										table +="<input type='text' id='ckpwd' placeholder='비밀번호 재설정 확인'><br>";
								table += "<input type='button' id='renewbtn' value='재설정'>";
								$('#chk').after(table);
	$('#renewbtn').on('click',function(){
			alert($('#pwd').val());
			alert($('#ckpwd').val());
		if($('#pwd').val()==$('#ckpwd').val()){
			alert("되냐");
			$.post('renew_pwd.do',{muid : $('#muid').val(),pwd:$('#pwd').val()},function(){
				alert("비밀번호가 재설정 되었습니다.");
			});
				location.href='loginForm.do';
		}
		else
			alert("비밀번호가 일치하지 않습니다.");
		
		
	});
									}
									else{
										alert("실패");
									}
								});
							}
							else{
								alert("다시시도해주세요");
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
<h1>비밀번호 찾기</h1>
<form>

이름&nbsp;	<input type="text" id="name"><br>
아이디&nbsp;	<input type="text" id="muid"><br>
핸드폰&nbsp;	<input type="text" id="phone" placeholder="-없이 숫자만 입력해주세요"><br>
<input type="button" id="authPhone" value="인증하기"><br>
</form>
<hr>
<a href="find_id_form.do">아이디 찾기 </a>&ensp;	&frasl;&ensp;&ensp;	<a href="loginForm.do"> 로그인 </a>
</div>
<div class="col-4"></div>
</div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>