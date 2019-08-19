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
					input += "<input type='text' id='checknum'>";
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

<form>
이름<input type="text" id="name">
핸드폰<input type="text" id="phone">
<div id="message"></div>
<input type="button" id="authPhone" value="인증하기">
</form>

</body>
</html>