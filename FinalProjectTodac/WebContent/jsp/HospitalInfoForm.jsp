<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
  	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  -->
  	<style type="text/css">
  		th{
  			text-align: center;
  		}
  		.mainFrame{
  			padding-left: 5%;
  			padding-right: 5%;
  			border: solid 1px;
  			margin-left: 7%;
  			margin-right: 7%;
  			margin-bottom : 5%;
  			margin-top: 5%;
  			text-align: center;
  		}
  		.innerDiv{
  			text-align: center;
  			margin: auto;
  			margin-top: auto;
  			margin-bottom: auto;
  			padding :inherit;
  		}
  		a,h2{
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
<jsp:include page="header3.jsp"></jsp:include>
<!-- 헤더 -->
<div style="font-family : 'Jua'; border: solid;" class="mainFrame">
	<!-- 병원 이미지 맵으로 구현 -->
	<div id="map" style="height: 300px;width: 500px; border: 1px thin; margin: auto;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7100ed85365a3b66382c0f7cab33b611"></script>
	<script type="text/javascript">
		var x = ${hlist.wgs84Lat};
		var y = ${hlist.wgs84Lon};
			
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        	center : new kakao.maps.LatLng(x, y), // 지도의 중심좌표      
        	level : 3 // 지도의 확대 레벨
    	});
		var position =  new kakao.maps.LatLng(x, y);
		var marker = new kakao.maps.Marker({
			  position: position,
			  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		});
		
		marker.setMap(map);
			
	</script>
	<div class="innerDiv">
		

		<h2>${hlist.dutyName}</h2>
		<h4 style="color: teal;">[${hlist.dutyAddr }]</h4>
		<c:if test="${hlist.hfile != null}">
			<div id="img"> <img src="${hlist.hfile}" style="width: 50%; height: 200px; position: static;"> </div>
		</c:if>
	</div >
	<!-- 즐겨찾기, 후기 작성 버튼-->
	<hr>
	<div class="innerDiv">
		
		<a href="#" data-toggle="tooltip" title="즐겨찾기를 해보세요!"><c:choose>
			<c:when test="${f_img == 1}">
				<img class="clickLikeBtn" src="image/like_done.jpg" style="height: 50px; width: 50px">
			</c:when>
			<c:otherwise>
				<img class="clickLikeBtn" src="image/like_none.jpg" style="height: 50px; width: 50px">
			</c:otherwise>
		</c:choose></a>
		<a data-toggle="tooltip" title="작성 페이지로 이동해요" class="writeReview"><img src="image/reviewWrite.png" style="height: 50px; width: 50px"><input type="hidden" value="${hlist.hpid}"></a>
		<a style="font-size: 24px;">평점 : 
		<c:choose>
			<c:when test="${avgRate != 'nu'}">${avgRate}</c:when>
			<c:otherwise>없음</c:otherwise>
		</c:choose>
		</a>
		<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
		</script>
	</div>
	<hr>
	<!-- 진료시간 -->
	<div class="innerDiv"> 
		<a style="font-size: 24px;"> 병원 정보   </a>
		<table class="table table-hover">
		
			<tr>
				<th style="text-align: center;">월요일</th>
				<th style="text-align: center;">화요일</th>
				<th style="text-align: center;">수요일</th>
				<th style="text-align: center;">목요일</th>				
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
				<th style="text-align: center;">금요일</th>
				<th style="text-align: center;">토요일</th>
				<th style="text-align: center;">일요일</th>
				<th style="text-align: center;">공휴일</th>				
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
	<div class="innerDiv">
		<div>
			<table class="table table-hover">
				<c:choose>
						<c:when test="${dlist != null}">				
							<tr class="infoTr">
								<th>진료과</th>
								<td style="text-align: center;">
									<c:forEach var="i" items="${ dlist }" >
										<li style="text-align: center;">${i}, </li>
									</c:forEach>
								</td>
							</tr>
						 </c:when>
						 <c:otherwise>
						 	<tr class="infoTr">
								<th>진료과</th>
								<td style="text-align: center;"> - </td>
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
	<div class="innerDiv">
		<div class="reviewTable innerDiv" >
			<table class="table table-hover">
				<tr class="reviewTalbe_header">
					<th style="text-align: center;">아이디</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">조회수</th>
					<th style="text-align: center;">별점</th>
					<c:if test="${adminchk != null}">
						<th>신고</th>					
					</c:if>
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
						<td style="text-align: center;">
							<c:choose>
								<c:when test="${l.grade == 1}">
									<span style="color : black; size: 17px;">★☆☆☆☆</span>
								</c:when>
								<c:when test="${l.grade == 2}">
									<span style="color : black; size: 17px;">★★☆☆☆</span>
								</c:when>
								<c:when test="${l.grade == 3}">
									<span style="color : black; size: 17px;">★★★☆☆</span>
								</c:when>
								<c:when test="${l.grade == 4}">
									<span style="color : black; size: 17px;">★★★★☆</span>
								</c:when>
								<c:otherwise>
									<span style="color : black; size: 17px;">★★★★★</span>
								</c:otherwise>	
							</c:choose>
						
						
						
						</td>
						<c:if test="${status == 2}">
							<td class="reportBtn"> 
								<button style="size : inherit;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
								   	신고 
								</button>
								<input type="hidden" value="${l.rid}"/>
								<input type="hidden" value="${l.muid}"/>
								<input type="hidden" value="${l.title}"/>
								
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</div>
<div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
ㅂㅇㅂㅇ



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
		          					<li> <input type="radio" name="radiogroup" value="기타"/><a>기타 자유양식 작성 </a> | <a style="color: blue;"class="etc_TextDiv">사유작성</a></li>
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
<!-- 페이지 함수 부분 -->

<script type="text/javascript">
	$(document).ready(function(){
		$('.etc_TextInput').hide();
	});
		
	function modalCheck(){
		var status="${status}";
		var checked = $('.modal_ul').find('input[name="radiogroup"]:checked').val();// find('input[name="radiogroup"]:selected');
		var rid = $('.modal-transit-Data_rid').val();
		var reportreason=null;
		if(checked == "기타"){
			reportreason = $('.etc_TextInput').find('.etc_TextInput').val(); // $('.etc_TextInput').text();
			alert("기타일때");
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
		
	//제목 버튼 클릭시 <병원 후기 게시글 이동>
	$('.titleClick').on('click',function(){
		var rid = $(this).find('input:eq(0)').val();
		location.href = "HospitalInfo_ReviewBoard.do?rid="+rid;
	});
	
	//신고 버튼 클릭시 <신고 폼> -> 모달
	$('.reportBtn').on('click',function(){
		var rid = $(this).find('input:eq(0)').val();
		var muid = $(this).find('input:eq(1)').val();
		var title = $(this).find('input:eq(2)').val();
		var t_rid = $('.modal-transit-Data_rid').val(rid).val();
		var t_muid = $('.modal-transit-Data_muid').val(muid).val();
		$('.modal-transit-Data-getmuid').text(t_muid);
		$('.modal-transit-Data-getTitle').text(title);

	});
	
	$('.writeReview').on('click',function(){
		var muid = "${muid}";
		if(muid==""){
			alert("로그인을 해주세요");	
		}
		else{
			var hpid = $(this).find('input').val();
			location.href = "HospitalInfo_ReviewWriteForm.do?hpid="+hpid;
		}
		
	});
	//
	$(document).ready(function(){
		//만약 sessionID 가 없을때
		var muid = "${muid}";
		if(muid==""){
			$('.reviewTable').addClass("divBlur");
			$('.reviewTable').addClass("no_drag");
		}
	});
	
	$('.etc_TextDiv').on('click',function(){
		 
		 $('.etc_TextInput').slideToggle();
	});
	
	//좋아요 체크
	$(document).on('click','.clickLikeBtn',function(){
		var muid = "${muid}";
		//아이디가 있을때 좋아요 추가 진행, 아이디가 없을 때는 좋아요 진행 하지 않음
		if(muid==""){
			alert("로그인해주세요");
		}
		else{
			var	hpid = "${hlist.hpid}";
			var imgsrc = $(this).attr('src');
			
			var status;
			if(imgsrc=="image/like_none.jpg"){
				$(this).attr('src','image/like_done.jpg');
				status = 0;
				
			}else{
				$(this).attr('src','image/like_none.jpg');
				status = 1;
			}
			$.ajax({
				url : "ClickFavorite.do",
				type : "post",
				data : { 
					muid : muid,
					hpid : hpid,
					status : status
				},
				datatype : "json",
				success : function(){
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