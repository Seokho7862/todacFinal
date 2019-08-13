<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
<title>Insert title here</title>

<style type="text/css">
	div#nav{
		border : solid;
		width : 25%;
		height : 700px;
		float : left;
		overflow : scroll;
	}
	div##navigation{
		overflow : scroll;
	}
	div#map{
		border : solid;
		width : 74%;
		float : right;
		height: 700px;
		overflow : scroll;
	}
	
	a#hospitalListDutyName:hover{
		background-color: teal;
		
	}
	
</style>

</head>
<body>

	
	<!-- 해더 부분 -->
	
	
	
	<div>
		<div id="nav">			
			<input type ="button" value="진료과" width="50%" onclick="diaBtn()"/>
			<input type ="button" value="키워드" width="50%" onclick="keyBtn()"/>
			<a style="font-size: 6px">gg</a>
			<hr>
			<div id="navigation" >
					<input type="search" style="left : 10%" placeholder="여기서 검색하세요 " id="Keyword">
				<ul id="hospitalList">			
				</ul>
			</div>
			
		</div>
		
		<div id="map">map</div>
	</div>
	
	
	<p id="result"></p>

	<!-- 맵관련 스크립트 부분 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7100ed85365a3b66382c0f7cab33b611&libraries=services,clusterer,drawing"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7100ed85365a3b66382c0f7cab33b611&libraries=clusterer"></script>
	
	<script type="text/javascript">
		
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
								list += '<li style="list-style : upper-alpha"><a style="font-size: 13px" id="hospitalListDutyName" href="HospitalInfo_InfoForm.do?hpid='+data[i].HPID+'">' + data[i].DUTYNAME +'</a><br><a style="font-size: 7px">' + data[i].DUTYADDR+ '</a></li>';
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
	
	 
	 
	<script type="text/javascript">
	function mapMove(){
		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png'; // 마커이미지의 주소입니다   
		var ICON_S = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(40, 40));
		var ICON_M = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(30, 30));
		var ICON_L = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(20, 20));
		
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
	    		
	    		//clusterer.clear();
	    		$('#hospitalList li').remove();
	    		$('#hospitalList hr').remove();
				var list= "";
				for(var i = 0; i < data.length ; i++){
					list += '<li style="list-style : upper-alpha"><a style="font-size: 13px" id="hospitalListDutyName">' + data[i].DUTYNAME +'</a><br><a style="font-size: 7px">' + data[i].DUTYADDR+ '</a></li>';
					list += '<hr>'
				}
				$('#hospitalList').append(list);
	    		
	    		var markers = $(data).map(function(i, position) {
	                //마커를 하나 새로 만드는데, 위치값을 지정하고 클릭이 가능하게 설정함.
	                
	                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	                
	                var marker = new kakao.maps.Marker({
	                    position : new kakao.maps.LatLng(position.WGS84LAT, position.WGS84LON),
	                    clickable : true
	                });
	                marker.setImage(markerImage);

	                           //띄울 인포윈도우 정의
	                var iwContent = '<div style="padding:5px;">'
	                           +'<a href=HospitalInfo_InfoForm.do?hpid='+position.HPID+'>'+position.HPID+'</a><br/>'
	                           +position.DUTYNAME+
	                           '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	                            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	                            // 인포윈도우를 생성합니다
	                var infowindow = new kakao.maps.InfoWindow({
	                      content : iwContent,
	                      removable : iwRemoveable
	                });
	            	// 마커에 클릭이벤트를 등록합니다
	                kakao.maps.event.addListener(marker, 'click', function() {
	                	infowindow.open(map, marker);      
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
	
	
	
	
	
	<script type="text/javascript">
		//마커 이미지 선언부
		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png'; // 마커이미지의 주소입니다   
		var ICON_S = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(40, 40));
		var ICON_M = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(30, 30));
		var ICON_L = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(20, 20));
		
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new kakao.maps.LatLng(37.5012581268, 127.0397092587), // 지도의 중심좌표
	        level : 3 // 지도의 확대 레벨
	    });

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
	        minLevel: 5, // 클러스터 할 최소 지도 레벨
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
	    		alert("success");
	    		
				$('#hospitalList li').remove();
				
				var list= "";
				for(var i = 0; i < data.length ; i++){
					list += '<li style="list-style : upper-alpha"><a style="font-size: 17px" id="hospitalListDutyName" ><input type="hidden" value="'+data[i].HPID+'">' + data[i].DUTYNAME +'</a><br><a style="font-size: 10px">' + data[i].DUTYADDR+ '</a></li>';
					list += '<hr>'
				}
				$('#hospitalList').append(list);
				
				
				
	    		var markers = $(data).map(function(i, position) {
	                //마커를 하나 새로 만드는데, 위치값을 지정하고 클릭이 가능하게 설정함.
	               
	                imageSize = new kakao.maps.Size(10, 21); // 마커이미지의 크기입니다
					      
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    
	                var marker = new kakao.maps.Marker({
	                    position : new kakao.maps.LatLng(position.WGS84LAT, position.WGS84LON),
	                    clickable : true, 
	                });
	                marker.setImage(markerImage);
	                
	                           //띄울 인포윈도우 정의
	                var iwContent = '<div style="padding:5px;">'
	                           +'<a href=HospitalInfo_InfoForm.do?hpid='+position.HPID+'>'+position.HPID+'</a><br/>'
	                           +position.DUTYNAME+
	                           '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	                            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	                            // 인포윈도우를 생성합니다
	                var infowindow = new kakao.maps.InfoWindow({
	                      content : iwContent,
	                      removable : iwRemoveable
	                });
	            	// 마커에 클릭이벤트를 등록합니다
	                kakao.maps.event.addListener(marker, 'click', function() {
	                // 마커 위에 인포윈도우를 표시합니다         
	                infowindow.open(map, marker);      
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
		    mapMove();
		});
		
		
	
		/*
		$(document).ready(function(){
			$('#searchKeyword').on('click',function(){
				$.ajax({
					url : "HospitalInfo_searchKeyword.do",
					data : {keyword : $('#Keyword').val()},
					type : "post",
					success : function(data){
						
						$('#hospitalList li:gt(0)').remove();
						
						var list= "";
						for(var i = 0; i < 5 ; i++){
							list += '<li>' + data[i].DUTYNAME + '</li>';
						}
						$('#hospitalList').append(list);
					},
					error :function(){
						alert("error");
					}
				});	
			});
		}); 
		*/
	
	</script>
	
	
	
	
	<!-- 풋터 부분-->
</body>

</html>