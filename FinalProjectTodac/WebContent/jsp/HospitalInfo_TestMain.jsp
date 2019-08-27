<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
 <meta name="viewport" content="width=device-width, initial-scale=1">
  
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  -->
    
<title>Insert title here</title>

<style type="text/css">
.overlay_info {border-radius: 5px; margin-bottom: 7px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {display: block; background: #d95050; background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 12px; border-radius: 6px 6px 0 0}
    .overlay_info a strong {background: #d95050 src(image/hospicon.png) no-repeat; padding-left: 17px;}
    .overlay_info .desc {padding:10px;position: relative; min-width: 180px; height: 40px}
    .overlay_info .address {font-size: 10px; color: #333; position: absolute; margin : auto; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 19px; height: 12px; background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
	
	body{
		
		font-family: 'Jua' sans-serif;
	}
	#hospitalListDutyName{
		margin-left: 40px;
		list-style: decimal;
	}
	
	div#container-fluid{
		border : solid;
		width : 25%;
		height : 700px;
		float : left;
		overflow : scroll;
		
	}
	
	div#navigation_hosp{
		height : 650px;
		overflow : scroll;
	}
	div#home1{
		height : 650px;
		overflow : scroll;
	}
	div#map{
		border : solid;
		width : 100%;
		float : right;
		height: 650px;
		overflow : scroll;
	}
	
	
	button{
		width : 100%;
		height : 40px;
		font-size: 10px;
	}
	input#findLocation{
		width:75%;
		position: static;
		
	}
	div#searchLocList{
		width:100%;
		overflow : scroll;
		border : 1px solid;
		position: absolute;
		background-color : white;
		max-height : 200px;
		top : 28px;
		
		
	}
	table#diagnosisTable{
		font-family : 'Jua' sans-serif;
		margin : auto;
		border: 1px thin;
		width: 100%;
	}
	talbe#diagnosisTable>button{
		width : 50%;
		height: 50px;
		align-items: initial; 
	}
	#diag_tab1{
		border: 1px solid;
		
	}
	button{
	  background:#efeff5;
	  color:#fff;
	  
	  position:relative;
	  height:45px;
	  font-size:1.6em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	  
	}
	button:hover{
	  background:#fff;
	  color:#1AAB8A;
	  
	}
	button:before,button:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #1AAB8A;
	  transition:400ms ease all;
	}
	button:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	  
	}
	button:hover:before,button:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	button {
	  
	  font-family: 'Jua', sans-serif;
	  padding: 0;
	  margin: 0;
	  font-size: 14px;
	} 
	img.imgiconDiag{
		width: 30px;
		height: 30px;
		margin-right: 20px;
		position: relative;
		left : 10px; 
		
	}
	.listHover:hover{
		background-color: lightgrey;
	}
	

</style>

</head>
<body>	
		<jsp:include page="header3.jsp"></jsp:include>
		
		
		
		<div style ="margin-top: 23px; margin-left: 10px; font-family: 'Jua'; border-color : purple; border: groove;">
			<div class="container-fluid" >
		  <div class="row">
		    <div class="col-sm-4" style="width : 20%; " >
					
				<ul class="nav nav-tabs">
				    <li class="active"><a data-toggle="tab" href="#home1">진료과</a></li>
				    <li><a data-toggle="tab" href="#keyworddiag">키워드</a></li>
				</ul>
				
				<div class="tab-content">
					<!--  여기서 css 씹힘  -->
				    <div  id="home1" class="tab-pane fade in active" >
				    	<div>
				    		<div>
				    			<!-- <h5 style="text-align: center;">원하시는 진료과를 선택하세요</h5> -->
				    			<br>
				    			<div >
				    				<div style="width: 100%;  text-align: center;" id="selector">
				    					<i>진료과목   :</i><input type="text" value="전체선택" id="diag_keyword" style="margin-left: 5%;">
				    				</div> 
				    			</div>
				    		</div>
				    		    		
				    		
				    		<div style=" text-align: center; font-size: 17px;">
				    			<a>검색 결과 <label class="countText" style="color: purple;">0</label> 건</a>
				    		</div>
				    		
				    		<div id="diag_tab1" >
				    			<table id="diagnosisTable" >
					      			<tr>
					      				<td colspan="2">
						      				<h5 style="text-align: center;">원하시는 진료과를 선택하세요</h5>
				    		 			</td>
					      			</tr>
						      		<tr>
						      			<td><button value="전체"><img class="imgiconDiag" src="image/like_done.jpg">전체선택</button></td>
						      			<td><button value="종합"><img class="imgiconDiag"  src="image/diag2.png">종합병원</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="한방"><img class="imgiconDiag"  src="image/diag3.JPG">한의원</button></td>
						      			<td><button value="요양"><img class="imgiconDiag"  src="image/diag4.JPG">요양병원</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="내과"><img class="imgiconDiag"  src="image/diag5.JPG">내과</button></td>
						      			<td><button value="외과"><img class="imgiconDiag" src="image/diag6.JPG">외과</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="이비인후과"><img class="imgiconDiag" src="image/diag7.JPG">이비인후과</button></td>
						      			<td><button value="치과"><img class="imgiconDiag" src="image/diag8.JPG">치과</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="안과"><img class="imgiconDiag" src="image/diag9.JPG">안과</button></td>
						      			<td><button value="소아과"><img class="imgiconDiag" src="image/diag10.JPG">소아과</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="신경"><img class="imgiconDiag" src="image/diag11.JPG">신경외과</button></td>
						      			<td><button value="방사선"><img class="imgiconDiag" src="image/diag12.JPG">방사선과</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="성형"><img class="imgiconDiag" src="image/diag13.JPG">성형외과</button></td>
						      			<td><button value="산부인"><img class="imgiconDiag" src="image/diag14.JPG">산부인과</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="응급"><img class="imgiconDiag" src="image/diag15.JPG">응급의학과</button></td>
						      			<td><button value="정신"><img class="imgiconDiag" src="image/diag16.JPG">정신건강의학과</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="피부"><img class="imgiconDiag" src="image/diag17.JPG">피부과</button></td>
						      			<td><button value="마취"><img class="imgiconDiag" src="image/diag18.JPG">마취통증학과</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="핵의학"><img class="imgiconDiag" src="image/diag19.JPG">핵의학과</button></td>
						      			<td><button value="흉부"><img class="imgiconDiag" src="image/diag20.JPG">흉부외과</button></td>
						      		</tr>
						      		<tr>
						      			<td><button value="재활"><img class="imgiconDiag" src="image/diag21.JPG">재활의학과</button></td>
						      			<td><button value="신경"><img class="imgiconDiag" src="image/diag22.JPG">신경과</button></td>
						      		</tr>	
						      	
						      	</table>
				    		</div>
				    		<div id ="diag_tab2" style="border: 1px solid; border-color: grey; padding-left: 5%;">
				    			<ul id="hosptialListByDiagnosis" class="hosptialListByDiagnosis1">
				      			</ul>
				      			
				    		</div>
				    	</div>	
				    </div>
				    
				    <div id="keyworddiag" class="tab-pane fade" >
				    	<input type="search" style="margin-left : 20%; align-self :center; width: 60%; background-color: #d9d9d9;" placeholder="여기서 검색하세요 " id="Keyword">
				    	
				      	<div id="navigation_hosp" style="border: 1px solid; border-color: grey; padding-left: 5%;">
							<ul id="hospitalList">			
							</ul>
						</div>
				    </div>
				</div>	
			</div>
		    
		    <!-- 맵 주소창 및 맵 화면 구현 부분 -->
		    <div class="col-sm-8" style="width : 70%;">
		    	<input width="74%" type="text" id="findLocation" placeholder="찾으시는 주소를 입력해주세요"/>
		    	<input width="24%" type="button" onclick="findAddr()" value="주소검색"/>
		    	
		    	<div id="searchLocList" style="display : none;">
		    		<ul id="searchLocList_ul">
		    			
		    		</ul>
		    	</div>
		    	<div id="map">map</div> 
			</div>
		  </div>
		  
		</div>
		
	
	</div>
	
		

	
	
	<p id="result"></p>
	<!-- 주소 검색 스크립트 부분 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- 맵관련 스크립트 부분 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7100ed85365a3b66382c0f7cab33b611&libraries=clusterer,services"></script>
	
	<!-- 함수 기능 정리 -->
	<script type="text/javascript">
		
		$(function(){		
			$('#Keyword').on('keyup',function(){
				var keyword = $('#Keyword').val();
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
								list += '<li class="listHover" style=" margin-left : 5%"><a style="margin-left : 2%; font-size: 15px" class="hospitalListDutyName" href=HospitalInfo_InfoForm.do?hpid='+data[i].HPID+'>' +  (i+1) + ". " + data[i].DUTYNAME +'</a><br><a style="font-size: 7px " class="hospitalListDutyName">' + data[i].DUTYADDR+ '</a></li>';
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
			
			$('#selector').on('click',function(){
				$('#diag_tab2').hide();
				$('#diag_tab1').show();
			});
			
			
		});		
		
		function findAddr() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("findLocation").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {					
	                        var result = results[0]; //첫번째 결과의 값을 활용
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);

	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                    }
	                });
	            }
	        }).open();   
		}
		
		
	
	</script>
	
	 
	 
	<script type="text/javascript">
	
	
	function mapMove(){
		
	    var mapBounds = map.getBounds();
	    var sw = mapBounds.getSouthWest();
	    var ne = mapBounds.getNorthEast();
	    var swLat = sw.getLat();
	    var swLng = sw.getLng();
	    var neLat = ne.getLat();
	    var neLng = ne.getLng();
	    
	    $.ajax({
	    	url : "HospitalInfo_FirstMarker.do",
	    	type : "post",
	    	data : {
	    		swLat : swLat,
	    		swLng : swLng,
	    		neLat : neLat,
	    		neLng : neLng
	    	},
	    	datatype :  "json",
	    	success : function(data){
	    		
	    		
	    		
	    		$('#hospitalList li').remove();
	    		$('#hospitalList hr').remove();
				var list= "";
				for(var i = 0; i < data.length ; i++){
					
					list += '<li class="listHover" style="list-style : decimal; margin-left : 3%"><a style="font-size: 15px; margin-left : 15px;" class="hospitalListDutyName" href="HospitalInfo_InfoForm.do?hpid='+data[i].HPID+'">' + data[i].DUTYNAME +' <input type="hidden" value="'+data[i].WGS84LAT+'" name="lat"><input type="hidden" value="'+data[i].WGS84LON+'" name="lon"><input type="hidden" value="'+data[i].DUTYNAME+'"></a><input type="hidden" value="'+data[i].HPID+'"><input type="hidden" value="'+data[i].DUTYADDR+'"></a><br>';
					list += '<a style="font-size: 7px; margin-left : 15px;">' + data[i].DUTYADDR+ '</a> </li>';
					list += '<hr>';
					
				}
				$('#hospitalList').append(list);
	    		
	    		var markers = $(data).map(function(i, position) {
	                //마커를 하나 새로 만드는데, 위치값을 지정하고 클릭이 가능하게 설정함.
	                
	                //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	                
	                var marker = new kakao.maps.Marker({
	                    position : new kakao.maps.LatLng(position.WGS84LAT, position.WGS84LON),
	                    clickable : true
	                });
	                marker.setImage(markerImage);

	                           //띄울 인포윈도우 정의
	                var iwContent = '<div style="padding:5px;">'
		                        +'<a href=HospitalInfo_InfoForm.do?hpid='+position.HPID+' style="font-size: 15px; text-align : center;" >'+position.DUTYNAME+'</a><br/>'
		                        //+position.DUTYNAME+
		                        + '<a style="font-size: 9px; float : inherit;">'+position.DUTYADDR+'</a>' 
		                        '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	                            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	                            // 인포윈도우를 생성합니다
	                var infowindow = new kakao.maps.InfoWindow({
	                      content : iwContent,
	                      removable : iwRemoveable
	                });
	            	// 마커에 클릭이벤트를 등록합니다
	                // 마커에 클릭이벤트를 등록합니다
	                kakao.maps.event.addListener(marker, 'mouseover', function() {
	                	infowindow.open(map, marker); 
	                	var markeremp = new kakao.maps.MarkerImage(
	                		    'image/markerEmp3.png',
	                		    new kakao.maps.Size(50, 50));
	                		marker.setImage(markeremp);
	                });
	                
	                kakao.maps.event.addListener(marker, 'mouseout', function() {
	                	infowindow.close(map, marker);      
	                	//marker.setImage(null);
	                	marker.setImage(markerImage);
	                });
	                kakao.maps.event.addListener(marker, 'click', function() {
	                	location.href="HospitalInfo_InfoForm.do?hpid="+position.HPID;      
	                });
	                
	                //생성된 마커를 반환합니다.
	                return marker;
	    		});
	    		kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
	          		// 현재 지도 레벨에서 1레벨 확대한 레벨
	          		var level = map.getLevel()-1;
	           		// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	                map.setLevel(level, {anchor: cluster.getCenter()});
	          	});
	                    
	         	 //클러스터에 마커들을 저장합니다.
	       		clusterer.addMarkers(markers);
	    		
	       		
	    	},
	    	error :function(){
				alert("error");
			}
		});
	}
	
	function markerByCategoryName(value){
		var mapBounds = map.getBounds();
	    var sw = mapBounds.getSouthWest();
	    var ne = mapBounds.getNorthEast();
	    var swLat = sw.getLat();
	    var swLng = sw.getLng();
	    var neLat = ne.getLat();
	    var neLng = ne.getLng();
	    
	    $.ajax({
	    	url : "HospitalInfo_DiagnosisByName.do",
	    	type : "post",
	    	data : {
	    		keyword : value,
	    		swLat : swLat,
	    		swLng : swLng,
	    		neLat : neLat,
	    		neLng : neLng
	    	},
	    	datatype :  "json",
	    	success : function(data){
	    		clusterer.clear();
	    		
	    		var Listlen = data.length;
	    		
	    		$('.countText').text(Listlen);
	    		
	    		$('#diag_tab1').hide();
	    		$('#hosptialListByDiagnosis li').remove();
	    		$('#hosptialListByDiagnosis hr').remove();
				var list= "";
				for(var i = 0; i < data.length ; i++){
					var latlng = new kakao.maps.LatLng(data[i].WGS84LAT, data[i].WGS84LON);
					list += '<li class="listHover"  style="list-style : decimal;margin-left : 3%"><a style="font-size: 15px; margin-left : 15px;" class="hospitalListDutyName" href="HospitalInfo_InfoForm.do?hpid='+data[i].HPID+'">' +   data[i].DUTYNAME +' <input type="hidden" value="'+data[i].WGS84LAT+'" name="lat"><input type="hidden" value="'+data[i].WGS84LON+'" name="lon"><input type="hidden" value="'+data[i].DUTYNAME+'"></a><input type="hidden" value="'+data[i].HPID+'"><input type="hidden" value="'+data[i].DUTYADDR+'"></a><br>'
					list += '<a style="font-size: 7px; margin-left : 15px;">' + data[i].DUTYADDR+ '</a> </li>';
					list += '<hr>';
					
				}

				$('#hosptialListByDiagnosis').append(list);
	    		
	    		var markers = $(data).map(function(i, position) {
	                //마커를 하나 새로 만드는데, 위치값을 지정하고 클릭이 가능하게 설정함.
	                
	                //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	                
	                var marker = new kakao.maps.Marker({
	                    position : new kakao.maps.LatLng(position.WGS84LAT, position.WGS84LON),
	                    clickable : true
	                    
	                });
	                marker.setImage(markerImage);

	                           //띄울 인포윈도우 정의
	                var iwContent = '<div style="padding:5px;">'
	                           +'<a href=HospitalInfo_InfoForm.do?hpid='+position.HPID+' style="font-size: 15px; text-align : center;" >'+position.DUTYNAME+'</a><br/>'
	                           //+position.DUTYNAME+
	                           + '<a style="font-size: 9px; float : inherit;">'+position.DUTYADDR+'</a>' 
	                           '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	                            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	                            // 인포윈도우를 생성합니다
	                var infowindow = new kakao.maps.InfoWindow({
	                      content : iwContent,
	                      removable : iwRemoveable
	                });
	            	// 마커에 클릭이벤트를 등록합니다
	                kakao.maps.event.addListener(marker, 'mouseover', function() {
	                	infowindow.open(map, marker); 
	                	var markeremp = new kakao.maps.MarkerImage(
	                		    'image/markerEmp3.png',
	                		    new kakao.maps.Size(50, 50));
	                		marker.setImage(markeremp);
	                });
	                
	                kakao.maps.event.addListener(marker, 'mouseout', function() {
	                	infowindow.close(map, marker);      
	                	//marker.setImage(null);
	                	marker.setImage(markerImage);
	                });
	                kakao.maps.event.addListener(marker, 'click', function() {
	                	location.href="HospitalInfo_InfoForm.do?hpid="+position.HPID;      
	                });
	                //생성된 마커를 반환합니다.
	                return marker;
	    		});
	    		kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
	          		// 현재 지도 레벨에서 1레벨 확대한 레벨
	          		var level = map.getLevel()-1;
	           		// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	                map.setLevel(level, {anchor: cluster.getCenter()});
	          	});
	                    
	         	 //클러스터에 마커들을 저장합니다.
	       		clusterer.addMarkers(markers);
	    		
	       		
	    	},
	    	error :function(){
				alert("error");
			}
		});
	}
	
	</script>

	<!-- 맵 부분 -->
	<script type="text/javascript">
		//마커 이미지 선언부
		//var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png'; // 마커이미지의 주소입니다   
		var imageSrc = 'image/markerHospital.png'; // 마커이미지의 주소입니다   
		
		var ICON_S = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(30, 33));
		var ICON_M = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(30, 33));
		var ICON_L = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(30, 33));
		

		var x= "${longitude}";
		var y= "${latitude}";
	    
		if(x == "" && y==""){
	   
			var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		        	center : new kakao.maps.LatLng(37.5012581268, 127.0397092587), // 지도의 중심좌표      
		        level : 3 // 지도의 확대 레벨
		    });
		}else{
			var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
				center : new kakao.maps.LatLng(x, y), // 지도의 중심좌표	       
		        level : 3 // 지도의 확대 레벨
		    });	
		}
		var geocoder = new daum.maps.services.Geocoder();
		var pointedMarker;
		var customOverlay;
		//키워드 부분 
		var keywordVal="";
		
		var markerImage;
		var level = map.getLevel();
	    if (1 <= level && level <= 2) {
	        markerImage = ICON_S;
	    } else if (3 <= level && level <= 6) {
	        markerImage = ICON_M;
	    } else if (7 <= level) { // 10레벨 이상에서도 마커이미지는 필요합니다. 예외처리 필요.
	        markerImage = ICON_L;
	    }
		
		var mapBounds = map.getBounds();
	    var sw = mapBounds.getSouthWest();
	    var ne = mapBounds.getNorthEast();
	    var swLat = sw.getLat();
	    var swLng = sw.getLng();
	    var neLat = ne.getLat();
	    var neLng = ne.getLng();
		
		var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
	        minLevel: 4, // 클러스터 할 최소 지도 레벨
	        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
	    });
		
	
		$.ajax({
	    	url : "HospitalInfo_FirstMarker.do",
	    	type : "post",
	    	data : {
	    		swLat : swLat,
	    		swLng : swLng,
	    		neLat : neLat,
	    		neLng : neLng
	    	},
	    	datatype :  "json",
	    	success : function(data){
	    		
				$('#hospitalList li').remove();
				
				var list= "";
				for(var i = 0; i < data.length ; i++){
					
					list += '<li class="listHover" style="list-style : decimal; margin-left : 3%"><a style="font-size: 15px; margin-left : 15px;" class="hospitalListDutyName" href="HospitalInfo_InfoForm.do?hpid='+data[i].HPID+'">' +   data[i].DUTYNAME +' <input type="hidden" value="'+data[i].WGS84LAT+'" name="lat"><input type="hidden" value="'+data[i].WGS84LON+'" name="lon"><input type="hidden" value="'+data[i].DUTYNAME+'"></a><input type="hidden" value="'+data[i].HPID+'"><input type="hidden" value="'+data[i].DUTYADDR+'"></a><br>'
					list += '<a style="font-size: 7px; margin-left : 15px;">' + data[i].DUTYADDR+ '</a> </li>';
					list += '<hr>';
				}
				
				$('#hospitalList').append(list);
				
				
				
	    		var markers = $(data).map(function(i, position) {
	                //마커를 하나 새로 만드는데, 위치값을 지정하고 클릭이 가능하게 설정함.
	               
	                imageSize = new kakao.maps.Size(10, 21); // 마커이미지의 크기입니다
					      
					//var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    
	                var marker = new kakao.maps.Marker({
	                    position : new kakao.maps.LatLng(position.WGS84LAT, position.WGS84LON),
	                    clickable : true, 
	                });
	                marker.setImage(markerImage);
	                
	                           //띄울 인포윈도우 정의
	                var iwContent = '<div style="padding:5px;">'
		                        +'<a href="HospitalInfo_InfoForm.do?hpid='+position.HPID+'" style="font-size: 15px; text-align : center;" >'+position.DUTYNAME+'</a><br/>'
		                        //+position.DUTYNAME+
		                        + '<a style="font-size: 9px; float : inherit;">'+position.DUTYADDR+'</a>' 
		                        '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	                            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
								
	                            // 인포윈도우를 생성합니다
	                var infowindow = new kakao.maps.InfoWindow({
	                      content : iwContent,
	                      removable : iwRemoveable
	                });
	            	// 마커에 클릭이벤트를 등록합니다
	                kakao.maps.event.addListener(marker, 'mouseover', function() {
	                	infowindow.open(map, marker); 
	                	//marker.setImage(null);
	                	
	                	
	                	var markeremp = new kakao.maps.MarkerImage(
	                		    'image/markerEmp3.png',
	                		    new kakao.maps.Size(50, 50));
	                	marker.setImage(markeremp);
	                });
	                
	                kakao.maps.event.addListener(marker, 'mouseout', function() {
	                	infowindow.close(map, marker);      
	                	marker.setImage(markerImage);
	                });
	                kakao.maps.event.addListener(marker, 'click', function() {
	                	location.href="HospitalInfo_InfoForm.do?hpid="+position.HPID;      
	                });
	                
	                           
	                //생성된 마커를 반환합니다.
	                return marker;
	    		});
	    		kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
	          		// 현재 지도 레벨에서 1레벨 확대한 레벨
	          		var level = map.getLevel()-1;
	           		// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	                map.setLevel(level, {anchor: cluster.getCenter()});
	          	});
	                    
	         	 //클러스터에 마커들을 저장합니다.
	       		clusterer.addMarkers(markers);
	    		 
	    	},
	    	error :function(){
				alert("error");
			}
		});
		
		
		kakao.maps.event.addListener(map, 'idle', function() {
			clusterer.clear();
			if(keywordVal==""){	
				mapMove();
			}
			else{
				markerByCategoryName(keywordVal);
			}
		});
		
		//키워드 버튼 스위칭
		$('button').click(function(){
			var value= $(this).val();
			var text= $(this).text();
			keywordVal= $(this).val();
			$('#diag_keyword').val(text);
			$('#diag_tab2').show();
			markerByCategoryName(keywordVal);
		});
		
		
	</script>
	<!-- list에 DutyName을 마우스오버했을 때 -->
	<script>
		
		$(document).on('mouseover','.hospitalListDutyName',function(){
			
			var lat = $(this).closest('li').find('input:eq(0)').val();
			var lon = $(this).closest('li').find('input:eq(1)').val();
			var name = $(this).closest('li').find('input:eq(2)').val();
			var hpid = $(this).closest('li').find('input:eq(3)').val();
			var addr = $(this).closest('li').find('input:eq(4)').val();
			pointedMarker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(lat, lon)
			});
			
			var content = '<div class="overlay_info">';
			content += '<a href="HospitalInfo_InfoForm.do?hpid='+ hpid +'" target="_blank"><img src="image/hospicon.png" style="width:30px;"><strong>'+name+'</strong></a>';
			content += '    <div class="desc">';
			content += '        <span class="address">'+ addr +'</span>';
			content += '    </div>';
			content += '</div>';
			
			customOverlay = new kakao.maps.CustomOverlay({
			    position: new kakao.maps.LatLng(lat, lon),
			    content : content,
			    xAnchor: 0.5, 
			    yAnchor: 1.23
			});
			customOverlay.setMap(map);
			
			
		});
		
		$(document).on('mouseout','.hospitalListDutyName',function(){
			customOverlay.setMap(null);
		});
	</script>
	

	
	<!-- 풋터 부분-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>