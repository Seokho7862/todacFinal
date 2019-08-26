<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					alert("??");
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
							alert(d.key);
							if(d.result==""){
								$('#chk').on('click',function(){
								alert($('#checknum').val()+" 입력값");
									if(d.key==$('#checknum').val()){
										
										alert(data);
										location.href='loginForm.do';
									}
									else{
										alert("실패");
									}
								});
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
<jsp:include page="myPage.jsp"></jsp:include>

<div class="container">
<div class="row">
<div class="col-4"></div>
<div class="col-4">
<form>
<h1>아이디 찾기</h1>
이름<input type="text" id="name"> <br>
핸드폰<input type="text" id="phone">
<div id="message"></div>
<input type="button" id="authPhone" value="인증하기">
</form>
<a href="find_pw_form.do">  비밀번호 찾기</a>
</div>
<div class="col-4"></div>
</div>
</div>


<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>