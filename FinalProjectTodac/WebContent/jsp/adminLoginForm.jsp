<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todac</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$('#adminbtn').on('click',function(){
		alert("확인");
		
		$.ajax({
			url : 'admin_login.do',
			data : {
				maid : $('#maid').val(),
				pwd : $('#pwd').val()
			},
		
			success : function(data){
				alert(data);
				if(data=="1"){
					alert($('#maid').val()+" 님 환영합니다.");
					
					location.href='admin_main.do';
					
					
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
<div class="row">
<div class="col-md-4"></div>
<div class="col-md-4" style="margin-top: 150px">
<h1>관리자 로그인</h1>
아이디<input type="text" id="maid"> <br>
비밀번호<input type="password" id="pwd">
<input type="button" id="adminbtn" value="로그인">
</div>
<div class="col-md-4"></div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>