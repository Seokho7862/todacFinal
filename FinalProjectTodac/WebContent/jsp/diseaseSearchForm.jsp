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
		$(bttn).bind('click', function() {
			var text = $('#keyword').val();
			 $.ajax({
				url : 'diseaseSearch.do',
				type : 'post',
				dataType: 'json',
				data : {keyword : $(keyword).val()},
				success : function(result) {
					
					$('#searchResultDiv').html("");
					var ss = '<table class="table">';
					
					for(var i=0;i<result.data.length;i++){
						if (result.data[i].thumbnail!="") {
					ss= ss+'<tr><td rowspan="1"><img onclick="location.href='+"'"+result.data[i].link+ "'"+'"'+" "+ 'alt="" src="'+result.data[i].thumbnail+'">'+"</td>";							
						}
						else {
							ss=ss+'<tr>';
						}
						ss=ss+'<td colspan="2"><a onclick="location.href='+"'"+result.data[i].link+ "'" + '">'+result.data[i].title+'<br>'+result.data[i].description+'</a></td><tr>'
						
					}
					ss=ss+"</table>";
					 $('#searchResultDiv').html(ss);
					 
					 var subjects = "";
					 for(var j=0;j<result.subjects.length;j++){
						subjects= subjects+ '<span class="rounded-circle">'+result.subjects[j]+'</span>'
					
					
			  
					 }
					
				  $('#subjectsDiv').html(subjects); 
					 
					 
				}
			});
			
		})
	})
	
</script>
<style type="text/css">
span {
    display: inline-block;
    width: 120px;
    height: 120px;
    margin: 15px;
    background-color: #33ccff;
    text-align: center;
    line-height: 120px;
    color: black;
    font-size: medium;
    font-weight: bold;}
#diseaseSearchDiv{
width: 800px;
min-height: 800px;
margin-left: 20%;
margin-top:85px;
align-content: center;
}
.form-inline{
margin-left:0px;
margin-right:0px;
width: 100%;
}
    
    
    

</style>

</head>
<body>
	<h1>질병 검색 페이지</h1>

	<div id="diseaseSearchDiv">

<form class="form-inline">
	<input type="text" id="keyword" class="form-control" style="width: 85%">
	<input type="button" value="검색" id="bttn" class="btn btn-primary" style="margin-left: 5px; width: 14%;" >
</form>

	<div id="subjectsDiv">
	
	</div>
	
	<hr>

	<div id="searchResultDiv">
	이 페이지는 네이버 지식백과 API와 팀 데이터베이스 자료를 기반으로 만들어졌습니다.<br>
	검색 결과를 클릭하시면 해당 칼럼의 주소로 이동합니다.
	
	</div>
	
	<hr>
	
<!-- 	<div id="hospitalDiv">
	이 div 안에는 검색한 질병의 진료과에 해당하는 병원의 리스트가 출력됩니다. (키워드 검색-진료과로 검색하기 기능 구현시 추가함)
	</div>
 -->

	</div>
	


</body>
</html>