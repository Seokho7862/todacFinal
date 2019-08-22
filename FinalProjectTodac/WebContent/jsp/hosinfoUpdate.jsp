<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todac</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script type="text/javascript">
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
    var pop = window.open("addressApi.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
						, emdNo, entX, entY){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.address_road.value = roadAddrPart1;
	document.form.address_detail.value = addrDetail;
	document.form.address_base.value = jibunAddr;
	document.form.post_num.value = zipNo;
	document.form.latitude.value = entX;
	document.form.longitude.value = entY;
}

</script>

<script type="text/javascript">
$(function(){
	
		
	$('#updatesubmit').on('click',function(){
		$.ajax({url: 'https://dapi.kakao.com/v2/local/geo/transcoord.json?input_coord=WTM&output_coord=WGS84',
			data : {'x': $('#latitude').val(),
					'y': $('#longitude').val()},
			headers: { 'Authorization': 'KakaoAK 00695ec487505656d830c294acef3108'
						}, 
			type: 'GET',
			error : function(){
				alert("다시 시도해주세요.");
			},
			success : function(data){
			alert("되라");
			
				$('#latitude').val(data.documents[0].x);
				$('#longitude').val(data.documents[0].y);
			$("form").submit();
			}
			
	});
	
	});
	
	
	$('#modPic').on('click',function(){
		alert("병원사진 등록할 수 있습니다.");
		var input="<div><input type='file' name='hfile'></div>";
		
		$(this).after(input);
		$(this).remove();
	});
	
});
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-left: 300px">
<form action="hos_update.do" enctype="multipart/form-data" method="post" id="form" name="form">
      <input type="hidden" name="hpid" value="${hoslist.HPID}" >
	
	<h2 >병원정보</h2>
	
	<div >
    <div>
      병원이름 <input type="text" name="dutyname" value="${hoslist.DUTYNAME}" >
    </div>
	</div>
	
	<div>
    <div>
      대표 <input type="text" value="${hoslist.NAME }" disabled="disabled">
    </div>
	
	<div>
	
    <div>
     월<c:choose>
     <c:when test="${hoslist.DUTYTIME1S!=null}">
     <input type="text" name="dutyTime1s" value="${hoslist.DUTYTIME1S}">~<input type="text" name="dutyTime1c" value="${hoslist.DUTYTIME1C}">
     </c:when>
     <c:otherwise>
     <input type="text" name="dutyTime1s" value="" placeholder="시간을 설정해주세요">~<input type="text" name="dutyTime1c" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     
     <c:choose>
     <c:when test="${hoslist.DUTYTIME2S!=null}">
  	화<input type="text" name="dutyTime2s" value="${hoslist.DUTYTIME2S}">~<input type="text" name="dutyTime2c" value="${hoslist.DUTYTIME2C}">
     </c:when>
     <c:otherwise>
     <input type="text" name="dutyTime2s" placeholder="시간을 설정해주세요">~<input type="text" name="dutyTime2c" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     
     <c:choose>
     <c:when test="${hoslist.DUTYTIME3S!=null}">
        수<input type="text" name="dutyTime3s" value="${hoslist.DUTYTIME3S}">~<input type="text" name="dutyTime3c" value="${hoslist.DUTYTIME3C}">
     </c:when>
     <c:otherwise>
     <input type="text" name="dutyTime3s" placeholder="시간을 설정해주세요">~<input type="text" name="dutyTime3c" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME4S!=null}">
 	 목<input type="text" name="dutyTime4s" value="${hoslist.DUTYTIME4S}">~<input type="text" name="dutyTime4c" value="${hoslist.DUTYTIME4C}">
     </c:when>
     <c:otherwise>
     <input type="text" name="dutyTime4s" placeholder="시간을 설정해주세요">~<input type="text" name="dutyTime4c" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME5S!=null}">
  	금<input type="text" name="dutyTime5s" value="${hoslist.DUTYTIME5S}">~<input type="text" name="dutyTime5c" value="${hoslist.DUTYTIME5C}">
     </c:when>
     <c:otherwise>
     <input type="text" name="dutyTime5s" placeholder="시간을 설정해주세요">~<input type="text" name="dutyTime5c" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME6S!=null}">
 	 토<input type="text" name="dutyTime6s" value="${hoslist.DUTYTIME6S}">~<input type="text" name="dutyTime6c" value="${hoslist.DUTYTIME6C}">
     </c:when>
     <c:otherwise>
     <input type="text" name="dutyTime6s" placeholder="시간을 설정해주세요">~<input type="text" name="dutyTime6c" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME7S!=null}">
       일<input type="text" name="dutyTime7s" value="${hoslist.DUTYTIME7S}">~<input type="text" name="dutyTime7c" value="${hoslist.DUTYTIME7C }">
     </c:when>
     <c:otherwise>
     <input type="text" name="dutyTime7s" placeholder="시간을 설정해주세요">~<input type="text" name="dutyTime7c" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME8S!=null}">
     공휴일<input type="text" name="dutyTime8s" value="${hoslist.DUTYTIME8S}">~<input type="text" name="dutyTime8c" value="${hoslist.DUTYTIME8S}">
     </c:when>
     <c:otherwise>
     <input type="text" name="dutyTime8s" placeholder="시간을 설정해주세요">~<input type="text" name="dutyTime8c" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     
     
    </div>
	</div>
	
	<div>
      번호 <input type="text" name="dutyTel1" value="${hoslist.DUTYTEL1 }" >
    </div>
	
	<div>
       <div class="w3-rest">
     주소 <input type="text" name="dutyAddr" value="${hoslist.DUTYADDR}" ><br>
     <tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value="">
						<input type="text" id="post_num" name="post_num" readonly style="width:100px" value="${hoslist.POSTCDN1}${hoslist.POSTCDN2}">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th><label>도로명주소</label></th>
					<td><input type="text" id="address_road" name="address_road" style="width:85%" value="${hoslist.DUTYADDR}"></td>
				</tr>
				<tr>
					<th><label>지번주소</label></th>
					<td><input type="text" id="address_base" name="address_base" style="width:85%" value="${hoslist.DUTYADDR}"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="address_detail" name="address_detail" style="width:40%" value="${hoslist.DUTYADDR}">
					</td>
				</tr>
				<tr>
					<th>좌표정보</th>
					<td>
						<input type="text" id="latitude" name="latitude" style="width:40%" value="${hoslist.WGS84LAT}">
						<input type="text" id="longitude" name="longitude" style="width:40%" value="${hoslist.WGS84LON}">
					</td>
				</tr>
	</div>
	
      <div>
     병원사진 <a id="modPic">병원사진 수정하기</a>
     <img src="${hoslist.HFILE}">
    </div>
		
     <div>
      병원 설명<input type="text" name="content" placeholder="병원을 소개해주세요">
    </div>
	
			
<input type="button" id="updatesubmit" value="수정">
	
	

</form>
</div>
</body>
</html>