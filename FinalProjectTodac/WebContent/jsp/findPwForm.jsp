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
					input += "<input type='button' id='chk' value='Ȯ��'>";
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
										var table ="";
										table +="<input type='text' id='pwd'>";
										table +="<input type='text' id='ckpwd'>";
								table += "<input type='button' id='renewbtn' value='�缳��'>";
								$('#chk').after(table);
	$('#renewbtn').on('click',function(){
			alert($('#pwd').val());
			alert($('#ckpwd').val());
		if($('#pwd').val()==$('#ckpwd').val()){
			alert("�ǳ�");
			$.post('renew_pwd.do',{muid : $('#muid').val(),pwd:$('#pwd').val()},function(){
				alert("��й�ȣ�� �缳�� �Ǿ����ϴ�.");
			});
				location.href='loginForm.do';
		}
		else
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		
		
	});
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
���̵�<input type="text" id="muid">
�ڵ���<input type="text" id="phone">
<div id="message"></div>
<input type="button" id="authPhone" value="�����ϱ�">
</form>

</body>
</html>