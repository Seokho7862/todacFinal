<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	
  	<style type="text/css">
  		.mainFrame{
  			padding-left: 5%;
  			padding-right: 5%;
  			border: solid 1px;
  			margin-left: 7%;
  			margin-right: 7%;
  			margin-bottom : 5%;
  			margin-top: 5%;
  		}
  		div,a,h2{
  			text-align: center;
  			margin: auto;
  			margin-top: auto;
  			margin-bottom: auto;
  			padding :inherit;
  			 
  		}
  		ul{
  			list-style: none;
  		}
  		li{
  			text-align: center;
  			margin: auto;
  			margin-top: auto;
  			margin-bottom: auto;
  			padding : 2px;
  			list-style : none;
  		 	float:left;
  		}
  		.reviewTable{
  			border-color : #D6D7D0;
  			font-size : 13px;
  			text-overflow : inherit;
  			max-height : 200px;
  			overflow: scroll;
	
  		}
  		.divBlur{
  			pointer-events: none;
  			filter: blur(8px);
 		    -webkit-filter: blur(8px);
  		}
  		.no_drag{
  			-webkit-user-select: none;
			-khtml-user-select: none;
			-moz-user-select: none;
			-o-user-select: none;
			user-select: none;
  		}
  		
  		.table table-hover{
  			font-size: 13px;	
  		}
  		.titleClick:hover{
  			font-size : 110% inherit;
  			font : lighter;
  			background-color: #D6D7D0;
  		}
  		.reportBtn:hover{
  			font-size : 110% inherit;
  			font : sans-serif;
  			background-color: #D6D7D0;
  		}
  		.infoTr{
  			font-size : 13px;
  		}
  		.infoTr > tr{
  			width : 50px; 
  		}
  		.infoTr:hover{
  			font-size : 14px;
  			font : bold;
  			background-color: #D6D7D0;
  		}
  		.writeReview{
  			color : blue; 
  		}
  		.modal_ul{
  			list-style: none;
  			list-style-position: inherit;
  			float: none;
  		}
  		.modal-body{
  			text-align: inherit;
  			text-overflow: inherit;
  			
  		}
  	
  	</style>
<title>Insert title here</title>
</head>
<body>

<!-- 헤더부분 -->

<div class="mainFrame">
	<!-- 병원 이미지 맵으로 구현 -->
	<div >
		<div id="map"></div>
		<h2>${hlist.dutyName}</h2>
	</div>
	<!-- 즐겨찾기, 후기 작성 버튼-->
	<hr>
	<div>
		${sessionid } 
		<a href="#" data-toggle="tooltip" title="즐겨찾기를 해보세요!"><img class="clickLikeBtn" src="image/like_none.jpg" style="height: 50px; width: 50px"></a>
		<a data-toggle="tooltip" title="작성 페이지로 이동해요" class="writeReview">후기작성<input type="hidden" value="${hlist.hpid}"></a>
		<a>별점</a>
		<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
		</script>
	</div>
	<hr>
	<!-- 진료시간 -->
	<div>
		<a> 병원 정보 </a>
		<table class="table table-hover">
		
			<tr>
				<th>월요일</th>
				<th>화요일</th>
				<th>수요일</th>
				<th>목요일</th>				
			</tr>
			
			<tr>
				<td>
					<c:choose>
						<c:when test="${hlist.dutyTime1s != null && hlist.dutyTime1c != null}"> ${hlist.dutyTime1s} ~ ${hlist.dutyTime1c} </c:when>
						<c:otherwise>휴무</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${hlist.dutyTime2s != null && hlist.dutyTime3s != null}">${hlist.dutyTime2s} ~ ${hlist.dutyTime2c} </c:when>
						<c:otherwise>휴무</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${hlist.dutyTime3s != null && hlist.dutyTime4c !=null}">${hlist.dutyTime3s} ~ ${hlist.dutyTime3c} </c:when>
						<c:otherwise>휴무</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${hlist.dutyTime4s != null && hlist.dutyTime4c !=null}">${hlist.dutyTime4s} ~ ${hlist.dutyTime4c} </c:when>
						<c:otherwise>휴무</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>금요일</th>
				<th>토요일</th>
				<th>일요일</th>
				<th>공휴일</th>				
			</tr>
			<tr>
					<td>
					<c:choose>
						<c:when test="${hlist.dutyTime5s != null && hlist.dutyTime5c != null}">${hlist.dutyTime5s} ~ ${hlist.dutyTime5c} </c:when>
						<c:otherwise>휴무</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${hlist.dutyTime6s != null && hlist.dutyTime6s != null}">${hlist.dutyTime6s} ~ ${hlist.dutyTime6c} </c:when>
						<c:otherwise>휴무</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${hlist.dutyTime7s != null && hlist.dutyTime7c !=null}">${hlist.dutyTime7s} ~ ${hlist.dutyTime7c} </c:when>
						<c:otherwise>휴무</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${hlist.dutyTime8s != null && hlist.dutyTime8c !=null}">${hlist.dutyTime8s} ~ ${hlist.dutyTime8c} </c:when>
						<c:otherwise>휴무</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>
	
	<hr>
	
	<!-- 진료과 /전화번호/추가정보 -->
	<div>
		<div>
			<table class="table table-hover">
				<c:choose>
						<c:when test="${dlist != null}">				
							<tr class="infoTr">
								<th>진료과</th>
								<td>
									<c:forEach var="i" items="${ dlist }" >
										<li>${i}, </li>
									</c:forEach>
								</td>
							</tr>
						 </c:when>
						 <c:otherwise>
						 	<tr class="infoTr">
								<th>진료과</th>
								<td> - </td>
							</tr>
						 </c:otherwise>
					</c:choose>
				<c:if test="${hlist.dutyTel1 != null}">
					<tr class="infoTr">
						<th>전화번호1</th>
						<td>${hlist.dutyTel1}</td>
					</tr>
				</c:if>
					<c:if test="${hlist.dutyTel3 != null}">
					<tr class="infoTr">
						<th>전화번호2</th>
						<td>${hlist.dutyTel3}</td>
					</tr>
				</c:if>
				<tr class="infoTr">
					<th>추가정보</th>
					<td> - </td>
				</tr>
				
			</table>
			
		</div>
	</div>
	<hr>
	<a>병원후기</a>
	<!-- 병원 후기 -->
	<div>
		<div class="reviewTable" >
			<table class="table table-hover">
				<tr class="reviewTalbe_header">
					<th>아이디</th>
					<th>제목</th>
					<th>조회수</th>
					<th>별점</th>
					<th>신고</th>					
				</tr>
				<c:forEach items="${rlist}" var="l"> 
					<tr>
						<td>${l.muid}</td>
						<td class="titleClick" >
							<!-- <a href="HospitalInfo_ReviewBoard.do?hpid=${l.rid}">  -->
							${l.title}
							<input type="hidden" value="${l.rid}"/>
						</td>
						<td>${l.readcount}</td>
						<td>${l.grade}</td>
						<td class="reportBtn"> 
							<button style="size : inherit;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
							   	신고 
							</button>
							<input type="hidden" value="${l.rid}"/>
						</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
	</div>
</div>

<div class="modal" id="myModal">
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
		          			<td>session id<td>
		          		</tr>
		          		<tr style="height: 90px; max-height : 80px; overflow: scroll;">
		          			<th>내용</th>
		          			<td></td>
		          		</tr>
		          		<tr style="height: 40px;">
		          			<th>사유선택</th>
		          			<td>여러사유에 해당 될 경우 대표적인 사유 1개를 선택해주세요</td>
		          		</tr>
		          		<tr style="height: 200px; ">
		          			<td colspan="2">
		          				<ul class="modal_ul">
		          					<li> <input type="radio" name="radiogroup"  value="부적절한 홍보 게시물" checked="checked" /> 부적절한 홍보 게시물</li>
		          					<li> <input type="radio" name="radiogroup" value="음란성 또는 청소년에게 부적합한 내용"/> 음란성 또는 청소년에게 부적합한 내용</li>
		          					<li> <input type="radio" name="radiogroup" value="특정인 대상의 비방/욕설"/> 특정인 대상의 비방/욕설</li>
		          					<li> <input type="radio" name="radiogroup" value="명예훼손/사생활 침해 및 저작권 활동"/> 명예훼손/사생활 침해 및 저작권 활동</li>
		          					<li> <input type="radio" name="radiogroup" value="기타 사유(자유 양식)"/> 기타 사유(자유 양식)</li>
		          				</ul>
		          				<input type="hidden" class="modal-transit-Data" value="">
		          				
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
<!-- 페이지 함수 부분 -->

<script type="text/javascript">
	function modalCheck(){
		var checked = $('.modal_ul').find('input[name="radiogroup"]');
		var rid = $('.modal-transit-Data').val();
		var reportreason=null;
		for(var i=0; i<checked.length; i++){		
			if(checked[i].checked == true){
				reportreason=checked[i].value;
				alert(reportreason);
				alert(rid);	
			}
		}
		
		$.ajax({
			url : "ReportInsert.do",
			type : "post",
			data : { 
				rid : rid,
				reportreason : reportreason 
			},
			datatype : "json",
			success : function(){
				alert("성공");
			},
			error :  function(){
				alert("json 에러");
			}
			
			
		});
		
	
	}
		
	//제목 버튼 클릭시 <병원 후기 게시글 이동>
	$('.titleClick').on('click',function(){
		var rid = $(this).find('input:eq(0)').val();
		location.href = "HospitalInfo_ReviewBoard.do?rid="+rid;
	});
	
	//신고 버튼 클릭시 <신고 폼> -> 모달로 할 계획
	$('.reportBtn').on('click',function(){
		var rid = $(this).find('input').val();
		alert(rid+"를 신고합니다");
		var x = $('.modal-transit-Data').val(rid).val();

	});
	
	$('.writeReview').on('click',function(){
		var hpid = $(this).find('input').val();
		location.href = "HospitalInfo_ReviewWriteForm.do?hpid="+hpid;
		alert(hpid+"병원의 리뷰작성 페이지로 이동합니다");
	});
	
	$(document).ready(function(){
		//만약 sessionID 가 없을때
		if(false){
			$('.reviewTable').addClass("divBlur");
			$('.reviewTable').addClass("no_drag");
		}
	})
	
	
	$(document).on('click','.clickLikeBtn',function(){
		var muid = "${sessionid}";
		var	hpid = "${hlist.hpid}";
		var imgsrc = $(this).attr('src');
		
		if(imgsrc=="image/like_none.jpg"){
			$(this).attr('src','image/like_done.jpg');
			
			$.ajax({
				url : "InsertFavorite.do",
				type : "post",
				data : { 
					muid : muid,
					hpid : hpid
				},
				datatype : "json",
				success : function(){
					alert("성공");
				},
				error :  function(){
					alert("json 에러");
				}
	
			});
			
		}else{
			$(this).attr('src','image/like_none.jpg');
			
			$.ajax({
				url : "DeleteFavorite.do",
				type : "post",
				data : { 
					muid : muid,
					hpid : hpid
				},
				datatype : "json",
				success : function(){
					alert("성공");
				},
				error :  function(){
					alert("json 에러");
				}
	
			});
		}
			

	});
	
	
</script>

<!-- 풋터부분 -->
</body>
</html>