<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	$('#renewBtn').on('click',function(){
		
		if($('#newPwd').val()!=$('#newCheck').val()){
			alert("비밀번호가 일치하지 않습니다.");
		}
		
		$.ajax({
			url : 're_pwd.do',
			data : {
				pwd : $('#pwd').val(),
				newPwd : $('#newPwd').val(),
				newCheck : $('#newCheck').val()
			},
			success : function(data){
				if(data==1){
					alert("비밀번호가 수정되었습니다.")
					location.href='show_pwd_form.do';
				}
				else 
					alert("정확한 정보를 입력해주세요.");
			},
			error : function(){
				alert("다시시도해주세요.")
			}
			
			
		});
		
	});
	
	
});


</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-left: 300px">
<h1>비밀번호수정</h1>
<hr>
비밀번호입력
<hr>
현재비밀번호 
<input type="password" id="pwd">
새 비밀번호
<input type="password" id="newPwd">
비밀번호 확인
<input type="password" id="newCheck">

<input type="button" value="확인" id="renewBtn">
</div>
</body>
</html>