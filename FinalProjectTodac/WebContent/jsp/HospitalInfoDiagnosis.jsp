<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type ="button" value="진료과" width="50%" onclick="diaBtn()"/>
	<input type ="button" value="키워드" width="50%" onclick="keyBtn()"/>
			<a style="font-size: 6px">gg</a>
			<hr>
			<div id="navigation" >
					<input type="text" style="left : 10%" placeholder="여기서 검색하세요 " id="Keyword">
				<ul id="hospitalList">			
				</ul>
			</div>
	<script>
		$(function(){		
			$('#Keyword').on('keyup',function(){
				var keyword = $('#Keyword').val();
				console.log(keyword);
				if(keyword.length >= 2){
					$.ajax({
						url : "HospitalInfo_searchKeyword.do",
				    	type : "post",
				    	data : {
				    		keyword : keyword
				    	},
				    	datatype :  "json",
				    	success : function(data){
				    		$('#hospitalList li').remove();
				    		$('#hospitalList hr').remove();
							var list= "";
							for(var i = 0; i < data.length ; i++){
								list += '<li><a style="font-size: 17px" id="hospitalListDutyName" href="HospitalInfo_InfoForm.do?hpid='+data[i].HPID+'">' + data[i].DUTYNAME +'</a><br><a style="font-size: 10px">' + data[i].DUTYADDR+ '</a></li>';
								list += '<hr>'
							}
							$('#hospitalList').append(list);
				    	},
				    	error :function(){
							alert("error");
						}
					});
				}
				
			});
		});
	</script>
</body>
</html>