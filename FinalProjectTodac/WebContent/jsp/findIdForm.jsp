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
					input += "<input type='button' id='chk' value='idã��'>";
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
								alert($('#checknum').val()+" �Է°�");
									if(d.key==$('#checknum').val()){
										
										alert(data);
										location.href='loginForm.do';
									}
									else{
										alert("����");
									}
								});
							}
						}
					});
					
					
					
				}
				else{
				alert("������ �ٽ� �Է����ּ���");	
				}
			},
			error : function(){
				alert("������ �ٽ� �Է����ּ���");
			}
			
			
		});
	});
	

});

</script>
</head>
<body>

<form>
�̸�<input type="text" id="name">
�ڵ���<input type="text" id="phone">
<div id="message"></div>
<input type="button" id="authPhone" value="�����ϱ�">
</form>

</body>
</html>