<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function check(){
	if($('#file').val()=="")
	{	alert("사업자 증명서 사진이 지정되지 않았습니다. 다시 확인해주세요.")
	return false;}
	if($('#hpid').val()==""){
	alert("병원이 지정되지 않았습니다. 다시 확인해주세요.");
	return false;}
	if($('#bisunessNumber').val()==""){
		alert("사업자 번호를 적지 않았습니다. 다시 확인해주세요.")
		return false;
	}
	return true;
}


	$('document').ready(function() {
		function readURL(input) {
			  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    
			    reader.onload = function(e) {
			    	$('#blah').removeAttr('hidden')
			      $('#blah').attr('src', e.target.result);
			    }
			    
			    reader.readAsDataURL(input.files[0]);
			  }
			}

			$('#file').change(function() {
			  readURL(this);
			});
		$('#hospitalListTd').css("display", "none");
		
		$('#hospitalSearchBtn').bind('click',function(){
			$.ajax({
				data:{ keyword: $('input[name=keyword]').val(), searchType: $('select[name=searchType]').val()},
				url : 'hospitalSearch.do',
				success: function(result){
		
					var content = "";
					content = '<table class="table-hover" id="hospitalListTable" style="width: 100%;"><tr><th class="hospitalListTd">병원명</th><th>주소</th></tr>';
					for (var i = 0; i < result.length; i++) {
						content = content + '<tr class="hospitalSelect"><td hidden="true">'+result[i].hpid+'</td><td class="hospitalName">'+result[i].dutyName+'</td><td class="hospitalAddr">'+result[i].dutyAddr+'</td></tr>'
					}
					content = content + "</table>"
					$('#hospitalListTd').css("display", "");
					$('#hospitalListDiv').html(content);
					
					$('.hospitalSelect').bind('click',function(){
						
						
						content ='<table style="width: 100%;"><tr><th class="hospitalListTd">병원명</th><th>병원주소</th></tr>';
						
						var sHpid = $(this).children().eq(0).html()
						var sHosName = $(this).children().eq(1).html()
						var sHosAddr = $(this).children().eq(2).html()
						
						content = content+ '<tr><td hidden="true">'+sHpid+'</td><td>'+sHosName+'</td><td>'+sHosAddr+'</td></tr></table>'
						
						
						
						$('#hospitalListDiv').html(content);
						$('#hpid').val(sHpid);
			
					});
					
				}
			});
			
		})
		
	})
</script>

<script type="text/javascript">

</script>
<style type="text/css">
#hospitalListTable{
padding: 0px;
}
.hospitalListTd{
width: 20%
}
.table-bordered{
width: 80%;
max-width:80%;
margin-left: 10%;
margin-top: 7%;
}
img{
max-width: 400px; 
height: auto;
}
#hospitalListDiv{
overflow: scroll;
max-height: 600px;
}

</style>

</head>
<body>
	<h1>병원 관계자 계정 신청</h1>

	<form action="managerApply.do" enctype="multipart/form-data" method="post" onsubmit="return check();">
		<table class="table-bordered">

			<tr>
				<td>사업자 번호</td>
				<td><input type="text" name="bisunessNumber" id="bisunessNumber""></td>
			</tr>
			<tr>
				
				<td colspan="1">
				<select name="searchType">
				<option value="1">병원명 검색</option>
				<option value="2">병원 도로명 검색</option>
				</select>
			</td>
			<td>
				<input type="text" name="keyword" value="성모내과">
				<input type="button" id="hospitalSearchBtn" value="검색">
				</td>
			</tr>
		
			<tr>
				<td colspan="2" style="height: 0px;" id="hospitalListTd">
					<div id="hospitalListDiv">
						
					</div>
				</td>
			</tr>

			<tr>
				<td>사업자 등록증 사진<br> <img id="blah" src="#" hidden=""></td>
				<td><input type="file" name="file" id="file"></td>
			
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>

		</table>
<input type="hidden" id="hpid" name="hpid">


	</form>



</body>
</html>