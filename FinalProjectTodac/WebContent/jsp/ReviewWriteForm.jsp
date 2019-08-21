<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<style type="text/css">
		.mainFrame{
  			padding-left: 5%;
  			padding-right: 5%;
  			border: solid 1px;
  			margin-left: 5%;
  			margin-right: 5%;
  			margin-bottom : 5%;
  			margin-top: 5%;
  		}
	</style>

</head>
<body>
	<textarea name="textarea" class="jqte-test">TEXTAREA</textarea>
	<div class="mainFrame">
		<div>
			이미지(병원 후기 작성)<br>
			
		</div>
		<div>
			<form action="reviewWrite.do" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${h.hpid}" name="hpid">
				<table border="1">
					<tr>
						<td>병원명</td>
						<td colspan="4">${h.dutyName}</td>
					</tr>
					<tr>
						<td>제목${h.hpid}</td>
						<td colspan="2"><input type="text" name="title" /></td>
						<td>평점</td>
						<td>
							<select name="grade" >
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★★</option>
								<option value="5">★★★★★★</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="5">내용</td>
					</tr>
					<tr>
						<td colspan="5"><textarea name="content"></textarea> </td>
					</tr>
					<tr>
						<td>사진첨부</td>
						<td rowspan="4"><input type="file" value="첨부" name="rfile" /></td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td colspan="2">
							<input type="submit" value="작성"/>
							<input type="button" value="뒤로" onclick="history.go(-1)"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		 
		
	</script>
		
</body>
</html>