<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<style type="text/css">
	.mainFrame{
	  	background-image: url(image/backgroudcolor2.png);
	}
	</style>
	<link rel="stylesheet" href="css/reviewWriteForm.css">
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="mainFrame">
		<div>
			이미지(병원 후기 작성) ${h.hpid}
			
		</div >
		<div class="writeFormDiv">
			<form action="reviewWrite.do" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${h.hpid}" name="hpid">
				<table style="width : 100%;">
					<tr>
						<th>병원명</th>
						<td colspan="4" style="font-size: 20px; color: blue;">${h.dutyName}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="2"><input id="titleText" type="text" name="title" style="width: 90%; margin-right: 10%;" placeholder="제목을 입력해주세요"/></td>
						<th>평점</th>
						<td>
							<select name="grade" >
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
							</select>
						</td>
					</tr>
					<tr>
						<th colspan="5">내용</th>
					</tr>
					<tr>
						<td colspan="5"><textarea id="textAreaText" style="width : 100%; height : 400px; overflow: scroll;" name="content" placeholder="내용을 입력해주세요"></textarea> </td>
					</tr>
					<tr>
						<th colspan="2"> </th>
						<td rowspan="4"><input type="file" value="첨부" name="rfile"  /></td>
					</tr>
					<tr>
						<td colspan="2">사진첨부</td>
						<td colspan="2" >
							<input id="ChangeAttrDisabled" type="submit" value="작성" disabled="disabled" style="margin-bottom: 20%;"/>
							<input type="button" value="뒤로" onclick="history.go(-1)"/>
							
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			 var content;
			 var title;
			 
			 $('#titleText, #textAreaText').keyup(function(){
				title = document.getElementById('titleText');
				content = document.getElementById('textAreaText');
				var titleval = title.value;
				var contentval = content.value;
				
				if(titleval.length > 0 && contentval.length >0){
					$('#ChangeAttrDisabled').removeAttr('disabled');	
				}
				else{
					$('#ChangeAttrDisabled').attr('disabled','disabled');	
				}
			 });
		});
	
		
	</script>
		
</body>
</html>