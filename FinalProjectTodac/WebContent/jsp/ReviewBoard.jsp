<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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
  		div,a,h2{
  			text-align: center;
  			margin: auto;
  			margin-top: auto;
  			margin-bottom: auto;
  			margin-left: auto;
  			margin-rigth: auto;
  			padding :inherit;
  			 
  		}
  		textarea {
			overflow: scroll;
			max-height: 600px;
		}
		table{
			height : 90%;
			width : 90%;
			margin: auto;
  			margin-top: auto;
  			margin-bottom: auto;
  			margin-left: auto;
  			margin-rigth: auto;
  			padding :inherit;
		}
		th{
			float: left;
		}
		textarea {
			overflow : scroll;
			height : 600px;
			width : 100%;
			max-height : 600px;
		}
		td{
			text-align: left;
			
		}
		
	</style>
</head>
<body>

<div class="mainFrame">
	<!-- 병원 후기 -->
	<div></div>
	<!-- 병원 후기 폼 테이블 -->
	<div>
		<table border="1">
			<tr>
				<td colspan="3">이미지 올리기</td>
			</tr>
			<tr>
				<td style="width : 40%;"><a>작성자</a> ${review.muid} </td>
				<td style="width : 40%;"><a>작성일자</a> ${review.rdate} </td>
				<td style="width : 20%;"> 신고 ${review.rid} </td>
			</tr>
		
			<tr>
				
				<td colspan="2"> <a>제목</a> ${review.title}</td>
				<td> <a>작성일자</a> </td>
			</tr>
			<tr>
				<td colspan="3" > <textarea disabled="disabled" draggable="false">${review.content} </textarea> </td>
			</tr>
			<tr>
				<td colspan="3"> <a>평점</a> ${review.grade} </td>
			</tr>
			
		</table>
		
		<table border="1">
			<tr>
				<td style="width : 40%;" class="prevReview"> 
					<a> </a>이전글 : ${prev.title} 
					<input type="hidden" value="${prev.rid}"/>
				</td>
				<td rowspan= "2" style="width : 60%;" >
					<input type="button" value="삭제"/>
					<input type="button" value="수정"/>
					<input type="button" value="뒤로"/>
				</td>			
			</tr>			
	
			<tr>
				<td style="width : 40%" class="nextReview">
				    <a> </a> 다음글 : ${next.title} 
					<input type="hidden" value="${next.rid}"/>
				</td>
			</tr>
		</table>
	</div>
</div>

<script type="text/javascript">
	

	$('.prevReview').on('click',function(){
		var rid = $(this).find('input:eq(0)').val();
		if(rid!=""){
			location.href = "HospitalInfo_ReviewBoard.do?rid="+rid;
		}
	});
	
	$('.nextReview').on('click',function(){
		var rid = $(this).find('input:eq(0)').val();
		if(rid!=""){
			location.href = "HospitalInfo_ReviewBoard.do?rid="+rid;
		}
	});
</script>

</body>
</html>