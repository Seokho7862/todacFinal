<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


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
					}
					else{
						
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
<jsp:include page="header2.jsp"></jsp:include>
<jsp:include page="myPage.jsp"></jsp:include>

<div class="container">
<div class="row">
<jsp:include page="mypagenav.jsp"></jsp:include>
<div class="col-md-8">
<h1 style="font-family: 'Jua';">비밀번호입력</h1>
비밀번호
<input type="password" id="pwd">
<input type="button" id="pwdBtn" value="확인">
</div>
</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>