<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$('#pwdBtn').on('click',function(){
		$.ajax({
			url :'chk_pwd.do',
			data :{
				pwd : $('#pwd').val()
			},
			success : function(data){
				if(data==1){
					if(${from=='member'}){
						
					location.href='update_form.do';
					}else{
						
					location.href='hos_update_form.do';
					}
				}
				else{
					
					alert("정확한 정보를 입력해주세요");
					location.href='show_pwd_form.do';
				}
			},
			error : function(){
				alert("다시 입력해주세요");
			}
			
		});
		
		
	});
	
	
});

</script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-left: 300px">
<h1>비밀번호입력</h1>
비밀번호
<input type="password" id="pwd">
<input type="button" id="pwdBtn" value="확인">
</div>
</body>
</html>