<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	div#nav{
		border : solid;
		width : 25%;
		height : 500px;
		float : left;
	}
	div#map{
		border : solid;
		width : 74%;
		float : right;
		height: 500px;
	}
</style>

</head>
<body>

	
	<!-- 해더 부분 -->
	<input type="button" value="ajaxBtn" id="getMarker">
	<div>
		<div id="nav">nav
			<input type="text" placeholder="여기서 검색하세요 " id="Keyword">
			<input type="button" value="검색" id="searchKeyword">
			<hr>
			<ul id="hospitalList">
			</ul>
		</div>
		<div id="map">map</div>
	</div>
	
	
	<p id="result"></p>

	<!-- 맵관련 스크립트 부분 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7100ed85365a3b66382c0f7cab33b611&libraries=services,clusterer,drawing"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7100ed85365a3b66382c0f7cab33b611&libraries=clusterer"></script>
	
	<script>

		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new kakao.maps.LatLng(37.6099919254131, 127.0134185658836), // 지도의 중심좌표
	        level : 3 // 지도의 확대 레벨
	    });
		
		
		var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
	        minLevel: 5, // 클러스터 할 최소 지도 레벨
	        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
	    });
		
		
	    $.ajax({
	    	url : "HospitalInfo_MakingMarker.do",
	    	type : "GET",
	    	data : "",
	    	datatype :  "json",
	    	success : function(data){
	    		
	    		//요청에 성공하면 DB에서 꺼낸 데이터를 json 형식으로 응답 받는다.
                
                //마커들을 저장할 변수
                var markers = $(data).map(function(i, position) {
                //마커를 하나 새로 만드는데, 위치값을 지정하고 클릭이 가능하게 설정함.
                var marker = new kakao.maps.Marker({
                    position : new kakao.maps.LatLng(position.WGS84LAT, position.WGS84LON),
                    clickable : true
                });
                           
                           //띄울 인포윈도우 정의
                var iwContent = '<div style="padding:5px;">'
                           +'<a href=HospitalInfo_Review.do?'+data.HPID+'>'+position.HPID+'</a><br/>'
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
            
	    		
	    		
             
         	 kakao.maps.event.addListener(map, 'center_changed', function() {
			     // 지도의  레벨을 얻어옵니다
			     var level = map.getLevel();
			
			     // 지도의 중심좌표를 얻어옵니다 
			     var latlng = map.getCenter(); 
			     var mapBounds = map.getBounds();
			     var sw = mapBounds.getSouthWest();
			     var ne = mapBounds.getNorthEast();
			     var swLat = sw.getLat();
			     var swLng = sw.getLng();
			     var neLat = ne.getLat();
			     var neLng = ne.getLng();
			     
			     var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
			     message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '이고</p>';
			     message += '<p>남서쪽은 위도 ' + mapBounds.toString() +  '입니당</p>';
			     message += '<p>남서쪽은 위도 ' + sw +  '입니당</p>';
			     message += '<p>북동쪽은 위도 ' + ne +  '입니당</p>';
			     message += '<p>남서쪽은 위도 ' + swLat + ' 경도 ' + swLng + '입니당</p>';
			     message += '<p>남서쪽은 위도 ' + neLat + ' 경도 ' + neLng  + '입니당</p>';
			     var resultDiv = document.getElementById('result');
			     resultDiv.innerHTML = message;
			 });
         	 
         	 // 마커 클러스터러에 클릭이벤트를 등록합니다
         	 // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
         	 // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
         	 kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
          		// 현재 지도 레벨에서 1레벨 확대한 레벨
          		var level = map.getLevel()-1;
           		// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
                map.setLevel(level, {anchor: cluster.getCenter()});
          	});
                    
         	 //클러스터에 마커들을 저장합니다.
       		clusterer.addMarkers(markers);
	    			
		    },
		    error : function(xhr, status, error){
	            //요청에 실패하면 에러코드 출력  
	            alert("에러코드 : " + xhr.status);
	        }
	    });
	</script>
	
	<script type="text/javascript">
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
	
	</script>
	
	
	
	
	<!-- 풋터 부분-->
</body>

</html>