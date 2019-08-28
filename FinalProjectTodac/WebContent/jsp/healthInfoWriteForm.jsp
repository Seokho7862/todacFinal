<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#cancleBtn').bind('click',function(){
		history.back();
	});
	
})
</script>
<style type="text/css">
#writeTable{
width: 90%;
height: 500px;
margin: auto;
margin-top: 50px;
}


</style>
</head>
<body>
	<!--::header part start::-->
	<jsp:include page="header2.jsp"></jsp:include>
	<!-- Header part end-->
<h1>　　건강정보 작성하기</h1>
<form action="healthInfoWrite.do" method="post" enctype="multipart/form-data">
<table class="table-bordered" id="writeTable"><tr>

<td><input type="text" name="title" style="height: 100%; width: 100%;"></td>
</tr>
<tr><td height="400px;"><input type="text" name="content" style="height: 100%; width: 100%;"></td></tr>
<tr><td>FILE:<input type="file" name="infoFile"></td></tr>
<tr><td><input type="submit" value="등록하기"><input type="button" value="취소" id="cancleBtn"></td></tr>
</table>
<input type="hidden" name="muid" value="${sessionScope.muid}"><br>
<input type="hidden" name="writer" value="${writer}"><br>

</form>

</body>
	<!--::header part start::-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Header part end-->
</html>