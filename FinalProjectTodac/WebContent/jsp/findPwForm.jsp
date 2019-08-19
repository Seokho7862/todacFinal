<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
					input += "<input type='text' id='checknum'>";
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
							if(d.result==""){
								$('#chk').on('click',function(){
								alert($('#checknum').val()+" 입력값");
									if(d.key==$('#checknum').val()){
										
										alert(data);
										var table ="";
										table +="<input type='text' id='pwd'>";
										table +="<input type='text' id='ckpwd'>";
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
아이디<input type="text" id="muid">
핸드폰<input type="text" id="phone">
<div id="message"></div>
<input type="button" id="authPhone" value="인증하기">
</form>

</body>
</html>