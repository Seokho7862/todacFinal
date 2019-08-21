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
	$(document)
		.ready(
			function() {
				$('.btn').bind('click',function() {
		var getType = 0;
		if ($(this).attr('id') == "weeklyBest") {
		getType = 1;
		} else if ($(this).attr('id') == "monthlyBest") {
		getType = 2;
		} else {
		getType = 3;}
		var te = "<tr>";
		$.ajax({url : "getListOfTop3.do",
				data : {"getType" : getType},
				success : function(data) {
		for (var i = 0; i < data.length; i++) {
			
			te = te+'<td align="center" style="width:200px;">'+'<div onclick='+'"location.href='+"'healthInfoReadForm.do?iid="+data[i].iid+"'"+'">';
			te = te+ '<img src="'+data[i].hfile+'"class="thumbnail"><br><div class="titleDiv">'+data[i].title+'</div><br>'+data[i].writer+'</div></td>';
		}
		te= te+'</tr>';
	
		$('#resultTbody').html(te);}
					});

			});

	});
</script>

<style type="text/css">
td{padding: 30px;}

#pageDiv{
position: relative;
width: 500px;
margin-top:20px;
margin-right: auto;
margin-left: auto;}
#searchDiv{
position: relative;
width:500px;
height:auto;
margin-top:20px;
margin-left: auto;
margin-right: auto;
align-items: center;
}

.thumbnail{
max-height: 180px;
width: auto;
max-width: 180px;
}
#top3Div{
align-content: center;
align-self: center;
align-items: center;
}
.titleDiv{
font-weight: bold;
margin-bottom: -15px;
}
</style>
</head>
<body>

<div id="top3Div">
		<h1>인기 게시물</h1>
	<div class="btn-group" style="margin-left: 1000px;" >
		<input type="button" value="주간" id="weeklyBest" class="btn btn-outline-secondary">
		<input type="button" value="월간" id="monthlyBest" class="btn btn-outline-secondary">
		<input type="button" value="전체" id="totallyBest" class="btn btn-outline-secondary">
	</div>
		<table style="width: 100%" class="table-borderless">
	
		<tbody id="resultTbody">
				<tr>
			<c:forEach items="${top3}" var="top" step="1">
<td align="center">
		<div class="top3InnerDiv" onclick="location.href='healthInfoReadForm.do?iid=${top.iid}'">
<img alt="" src="${top.hfile }" class="thumbnail"> <br><div class="titleDiv">${top.title}</div><br>${top.writer }</div></td>		
	
			</c:forEach>
				</tr>
		</tbody>

		</table>
	</div>



	<h1>건강정보 리스트</h1>

	<table class="table-borderless" style="width: 100%; max-width: 1250px;">
		

<tr>
	<c:forEach items="${healThInfoList}" var="HealthInfo" step="1" begin="0" end="4">

		<td>
			<div style="text-align: center;" onclick="location.href='healthInfoReadForm.do?iid=${HealthInfo.iid}&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}&page=${pageinfo.page }'">
		<img alt="" src="${HealthInfo.hfile}" class="thumbnail" onclick="location.href='healthInfoReadForm.do?iid=${HealthInfo.iid}&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}&page=${pageinfo.page }'"><br><div class="titleDiv">${HealthInfo.title }</div><br>${HealthInfo.writer }
			</div>
		</td>
		
		</c:forEach>
	<tr>
	<c:forEach items="${healThInfoList}" var="HealthInfo" step="1" begin="5" end="9">

		<td>
			<div style="text-align: center;"  onclick="location.href='healthInfoReadForm.do?iid=${HealthInfo.iid}&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}&page=${pageinfo.page }'">
		<img alt="" src="${HealthInfo.hfile}" class="thumbnail"><br><div class="titleDiv">${HealthInfo.title }</div><br>${HealthInfo.writer }
			</div>
		</td>
		
		</c:forEach>
	</tr>
		

	</table>
	


<div id="pageDiv">
	<c:forEach var="nums" begin="${pageinfo.startPage }"
		end="${pageinfo.endPage }">
		<input type="button" value="${nums}"
			onclick="location.href='healthInfoList.do?page=${nums}&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}'"class="btn btn-outline-secondary" style="margin: 5px;">
	</c:forEach>
</div>
	<div id="searchDiv" style="width: 440px; height: auto; ">
	
		<form action="healthInfoList.do" method="get" class="form-inline">
			<select name="searchType" style="width: 90px; height: 37px;" class="form-control">
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">작성자</option>
			</select> <input type="text" name="keyword"
				style="width: 250px; height: 37px;" class="form-control"> 
				<input type="submit" value="검색" class="btn btn-secondary" style="margin-left: 3px;">
		</form>
	</div>
	<input style=" margin-left:1000px; height: 40px;" type="button" value="글쓰기" onclick="location.href='healthInfoWriteForm.do'" class="btn btn-secondary">
	
	

	


</body>
</html>