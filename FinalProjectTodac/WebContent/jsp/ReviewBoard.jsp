<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<title>Insert title here</title>
	<style type="text/css">
		
		.mainFrame{
			font-family : 'Jua';
  			padding-left: 5%;
  			padding-right: 5%;
  			border: solid 1px;
  			margin-left: 5%;
  			margin-right: 5%;
  			
  			margin-top: 5%;
  		}
  		a,h2{
  			text-align: center;
  			margin-top: auto;
  			
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
		
		textarea {
			overflow : scroll;
			height : 600px;
			width : 100%;
			max-height : 600px;
		}
		td{
			text-align: center;
			text-shadow: blue;
			font-size : 18px;
			float: center
		}
		th{
			
			float: center;
			font-size: 22px;
		}
		.modal_ul{
  			list-style: none;
  			list-style-position: inherit;
  			float: none;
  			text-align: left;
  		}
  		.modal-body{
  			text-align: inherit;
  			text-overflow: inherit;
  			
  		}
	</style>
</head>
<body>
<jsp:include page="header3.jsp"></jsp:include>
<div class="mainFrame" >
	<!-- 병원 후기 -->
	<div></div>
	<!-- 병원 후기 폼 테이블 -->
	<div>
		<table border="1">
			<tr>
				<th style="text-align: center;"> 작성자  </th>
				<td>${review.muid}</td>
				<th style="text-align: center;">작성일자 </th>
				<td>${review.rdate}</td>
				<th style="text-align: center;">
					<button class="btn btn-primary reportIcon" data-toggle="modal" data-target="#myModal">
						<img src="image/reporticon.png" style="height : 20px; width: 20px;" class="reportIcon">신고
					</button>
					<input type="hidden" value="${review.rid}"/>
					<input type="hidden" value="${review.muid}"/>
					<input type="hidden" value="${review.title}"/>
			   </th>
			</tr>
		
			<tr>
				
				<th colspan="2" style="text-align: center;"> 제목 </th>
				<td colspan="3">${review.title}</td>
				
			</tr>
			
			<tr>
				<td colspan="5" > <textarea disabled="disabled" draggable="false">${review.content} </textarea> </td>
			</tr>
			
			<%-- <c:if test="${review.rfile != null }">
				<tr>
					
					<td colspan="5"><img src="${review.rfile}" style="width: 400px; height: 300px;"> ${review.rfile} </td>
				</tr>
			</c:if> --%>
			
			<tr>
				<td colspan="5"> <a>평점 :</a> 
					<c:choose>
								<c:when test="${review.grade == 1}">
									<span style="color : black; size: 17px;">★☆☆☆☆</span>
								</c:when>
								<c:when test="${review.grade == 2}">
									<span style="color : black; size: 17px;">★★☆☆☆</span>
								</c:when>
								<c:when test="${review.grade == 3}">
									<span style="color : black; size: 17px;">★★★☆☆</span>
								</c:when>
								<c:when test="${review.grade == 4}">
									<span style="color : black; size: 17px;">★★★★☆</span>
								</c:when>
								<c:otherwise>
									<span style="color : black; size: 17px;">★★★★★</span>
								</c:otherwise>	
					</c:choose>
				 </td>
			</tr>
			
		</table>
		
		<table border="1">
			<tr>
				<td colspan="3" style="width : 40%; text-align: left;" class="prevReview"> 
					<a> </a>이전글 : <span style="color : blue;">${prev.title}</span>
					<input type="hidden" value="${prev.rid}"/>
				</td>
				<td rowspan= "2" style="width : 60%;" >
					<input type="button" value="삭제" onclick="return deleteReview()"/>
					<input type="button" value="뒤로"/>
				</td>			
			</tr>			
	
			<tr>
				<td style="width : 40%; text-align: left; " class="nextReview">
				    <a> </a> 다음글 : <span style="color : blue;">${next.title}</span>  
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
	
	$('.reportIcon').on('click',function(){
		
	});
</script>
<jsp:include page="footer.jsp"></jsp:include>

<div class="modal" id="myModal" style="font-family: 'Jua';">
	 <div class="modal-dialog">
		  <div class="modal-content">
		      
		   <!-- Modal Header -->
		 	  <div class="modal-header">
		          <h4 class="modal-title">신고</h4>
		         	<!--  <button type="button" class="close" data-dismiss="modal">&times;</button>  -->
		       </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          	<table>
		          		<tr style="height: 60px;">
		          			<th>작성자</th>
		          			<td><a class="modal-transit-Data-getmuid"></a><td>
		          		</tr>
		          		<tr style="height: 90px; max-height : 80px; overflow: scroll;">
		          			<th>내용</th>
		          			<td><a class="modal-transit-Data-getTitle"></a></td>
		          		</tr>
		          		<tr style="height: 40px;">
		          			<th>사유선택</th>
		          			<td>여러사유에 해당 될 경우 대표적인 사유 1개를 선택해주세요</td>
		          		</tr>
		          		<tr style="height: 200px; ">
		          			<td colspan="2">
		          				<ul class="modal_ul">
		          					<li> <input type="radio" name="radiogroup"  value="부적절한 홍보 게시물" checked="checked" /> 부적절한 홍보 게시물<br></li>
		          					<li> <input type="radio" name="radiogroup" value="음란성 또는 청소년에게 부적합한 내용"/> 음란성 또는 청소년에게 부적합한 내용<br></li>
		          					<li> <input type="radio" name="radiogroup" value="특정인 대상의 비방/욕설"/> 특정인 대상의 비방/욕설<br></li>
		          					<li> <input type="radio" name="radiogroup" value="명예훼손/사생활 침해 및 저작권 활동"/>명예훼손/사생활 침해 및 저작권 활동<br></li>
		          					<li> <input type="radio" name="radiogroup" value="기타"/><a >기타 자유양식 작성 </a> | <a style="color: blue;"class="etc_TextDiv">사유작성</a></li>
		          					<li class="etc_TextInput"> 내용 입력  :  <input class="etc_TextInput" type="text" placeholder="내용을 입력해 주세요"/></li>
		          						
		          				</ul>
		          				<input type="hidden" class="modal-transit-Data_rid" value=""> <!-- 신고당하는 rid -->
		          				<input type="hidden" class="modal-transit-Data_muid" value=""> <!-- 신고당하는 인간 이름 -->
		          				
		          			<td>
		          			
		          		</tr>
		          		<tr>
		          			<td></td>
		          		</tr>
		          	</table>
		        </div>
		        
		        <!-- Modal footer -->
		       <div class="modal-footer">
		          <button type="button" onclick="modalCheck()" class="btn btn-danger" data-dismiss="modal">확인</button>
		          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
		      </div>  
		 </div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.etc_TextInput').hide();
	});
	
	//신고 버튼 클릭시 <신고 폼> -> 모달로 할 계획
	$('.reportIcon').on('click',function(){
		var rid = $(this).closest('th').find('input:eq(0)').val();
		var muid = $(this).closest('th').find('input:eq(1)').val();
		var title = $(this).closest('th').find('input:eq(2)').val();
		var t_rid = $('.modal-transit-Data_rid').val(rid).val();
		var t_muid = $('.modal-transit-Data_muid').val(muid).val();
		$('.modal-transit-Data-getmuid').text(t_muid);
		$('.modal-transit-Data-getTitle').text(title);
	
	});
	
	$('.etc_TextDiv').on('click',function(){
		 
		 $('.etc_TextInput').slideToggle();
	});
	
	function modalCheck(){
		var status = ${status};
		var checked = $('.modal_ul').find('input[name="radiogroup"]:checked').val();// find('input[name="radiogroup"]:selected');
		var rid = $('.modal-transit-Data_rid').val();
		var reportreason=null;
		
		if(checked == "기타"){
			reportreason = $('.etc_TextInput').find('.etc_TextInput').val(); // $('.etc_TextInput').text();
		}
		else{
			reportreason = checked;
			
		}
		if(2==status){
			$.ajax({
				url : "ReportInsert.do",
				type : "post",
				data : { 
					rid : rid,
					reportreason : reportreason 
				},
				datatype : "json",
				success : function(){
					alert("성공적으로 신고하였습니다");
				},
				error :  function(){
					alert("에러가 발생했습니다.");
				}
			
			});
		}
		else{
			alert("해당병원의 관계자만 신고할 수 있습니다");
		}
	}
		
	function deleteReview(){
		var x = confirm("정말 게시글을 삭제 하시겠습니까?");
		if(x==true){
			var rid = ${review.rid};
			var hpid = "${review.hpid}";
			
			
			$.ajax({
				url : "Reviewdelete.do",
				type : "post",
				data : { 
					rid : rid
				},
				datatype : "json",
				success : function(){
					alert("게시글을 삭제했습니다.");
					location.href="HospitalInfo_InfoForm.do?hpid="+hpid;
				},
				error :  function(){
					alert("에러가 발생했습니다.");
				}
			});
			
			
			return true
		}else{
			return false;
		}
		
	}
</script>
</body>
</html>