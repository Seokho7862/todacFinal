<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
					var ss = "<table>";
					
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
						 subjects= subjects+result.subjects[j]
						 if(j<result.subjects.length-1){
							 subjects=subjects+"/"
						 }
						 
					 }
					 $('#subjectsDiv').html(subjects);
					 
					 
				}
			});
			
		})
	})
	
</script>

</head>
<body>
	<h1>질병 검색 페이지</h1>


	<input type="text" id="keyword">
	<input type="button" value="검색" id="bttn">


	<div id="subjectsDiv">
	이 div 안에는 검색한 질병명에 해당하는 진료과가 출력됩니다.
	</div>
	
	<hr>

	<div id="searchResultDiv">
	이 div 안에는 검색 결과가 출력 됩니다.
	</div>
	
	<hr>
	
	<div id="hospitalDiv">
	이 div 안에는 검색한 질병의 진료과에 해당하는 병원의 리스트가 출력됩니다. (키워드 검색-진료과로 검색하기 기능 구현시 추가함)
	</div>


	


</body>
</html>