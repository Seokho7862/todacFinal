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
	$('document').ready(function() {
		$('#hospitalListTd').css("display", "none");
		
		$('#hospitalSearchBtn').bind('click',function(){
			$.ajax({
				data:{ keyword: $('input[name=keyword]').val(), searchType: $('select[name=searchType]').val()},
				url : 'hospitalSearch.do',
				success: function(result){
		
					var content = "";
					content = '<table border="1" style="width: 100%;"><tr><th>병원명</th><th>주소</th></tr>';
					for (var i = 0; i < result.length; i++) {
						content = content + '<tr class="hospitalSelect"><td hidden="true">'+result[i].hpid+'</td><td class="hospitalName">'+result[i].dutyName+'</td><td class="hospitalAddr">'+result[i].dutyAddr+'</td></tr>'
					}
					content = content + "</table>"
					
					$('#hospitalListDiv').html(content);
					
					$('.hospitalSelect').bind('click',function(){
						
						
						content ='<table border="1" style="width: 100%;"><tr><th>병원명</th><th>병원주소</th></tr>';
						
						var sHpid = $(this).children().eq(0).html()
						var sHosName = $(this).children().eq(1).html()
						var sHosAddr = $(this).children().eq(2).html()
						
						content = content+ '<tr><td hidden="true">'+sHpid+'</td>+<td>'+sHosName+'</td><td>'+sHosAddr+'</td></tr></table>'
						$('#hospitalListTd').css("display", "show");
						$('#hospitalListDiv').html(content);
						$('#hpid').val(sHpid);
			
					});
					
				}
			});
			
		})
		
	})
</script>
</head>
<body>
	<h1>병원 관계자 계정 신청</h1>

	<form action="managerApply.do" enctype="multipart/form-data" method="post">
		<table border="1" class="table">

			<tr>
				<td>사업자 번호</td>
				<td><input type="text" name="bisunessNumber"></td>
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
				<td>사업자 등록증 사진</td>
				<td><input type="file" name="file" id="file"></td>
			
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
			</tr>

		</table>
<input type="text" id="hpid" name="hpid">

<input type="text" id="muid" name="muid" value="매니저 지원 테스트 아이디">

	</form>



</body>
</html>