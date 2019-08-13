<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function(){
	
	$('#managerbtn').on('click',function(){
		alert("Ȯ��");
		
		$.ajax({
			url : 'loginManager.do',
			data : {
				muid : $('#muid').val(),
				pwd : $('#pwd').val()
			},
			type : 'post',
			success : function(data){
				alert(data);
				if(data=="1"){
					alert("${muid} �� ȯ���մϴ�.");
					
					location.href='openMain.do';
					
					
				}
				else
					alert("�������� �ʴ� ȸ���Դϴ�.");
			},
			error : function(request,status,error){
				alert("�ٽ� �õ����ּ���.");				
			}
		});
		
	});
	
	
	
});

</script>			
</head>
<body>
<div class="tabbable" id="tabs-343454">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active show" href="#tab1" data-toggle="tab">�����</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#tab2" data-toggle="tab">������</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
					<p>
<h1>����� �α���</h1>
<form action="loginUser.do">
���̵�<input type="text" name="muid"> <br>
��й�ȣ<input type="password" name="pwd">
<input type="submit" value="�α���">
</form>
					</p>
					</div>
					<div class="tab-pane" id="tab2">
						<p>
<h1>������ �α���</h1>
���̵�<input type="text" id="muid"> <br>
��й�ȣ<input type="password" id="pwd">
<input type="button" id="managerbtn" value="�α���">
						</p>
					</div>
				</div>
			</div>



</body>
</html>