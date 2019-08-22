<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


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
	$('#modBtn').on('click',function(){
		alert("클릭확인");
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
		$.ajax({
			url : 'modify_member.do',
			data : {
				muid:$('#muid').val(),
				phone : $('#phone').val(),
				post_num:$('#post_num').val(),
				address_detail : $('#address_detail').val(),
				address_base : $('#address_base').val(),
				address_road : $('#address_road').val(),
				latitude : data.documents[0].x,
				longitude : data.documents[0].y
			}
		});
				alert("회원수정이 완료되었습니다.");
			}
		
	});
	
});
});
</script>


</head>
<body>
		<form id="form" name="form" method="post">
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-left: 300px">
	<h1>My Info</h1>
		<table>
		<tr>
		<td>아이디</td>
		<td><input type="text" id="muid" disabled="disabled" value="${member.muid}"></td>
		</tr>
		
		<tr>
		<td>이름</td>
		<td><input type="text" id="name" value="${member.name }"></td>
		</tr>
		
		<tr>
		<td>생년월일</td>
		<td><fmt:formatDate value="${member.birth}" type="date" pattern="yyyy-MM-dd"/></td>
		</tr>
		
		<tr>
		<td>폰번호</td>
		<td><input type="text" id="phone" value="${member.phone }"></td>
		</tr>
			<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value="">
						<input type="text" id="post_num" readonly style="width:100px" value="${member.post_num}">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th><label>도로명주소</label></th>
					<td><input type="text" id="address_road" style="width:85%" value="${member.address_road }"></td>
				</tr>
				<tr>
					<th><label>지번주소</label></th>
					<td><input type="text" id="address_base" style="width:85%" value="${member.address_base}"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="address_detail" style="width:40%" value="${member.address_detail}">
					</td>
				</tr>
				<tr>
					<th>좌표정보</th>
					<td>
						<input type="text" id="latitude" style="width:40%" value="${member.latitude}">
						<input type="text" id="longitude"  style="width:40%" value="${member.longitude}">
					</td>
				</tr>
		<tr>
			
		<td>
		<button id="modBtn" type="button" class="btn btn-primary">
		수정</button>
		</td>
		<td>
		<button type="button" class="btn btn-primary">
		탈퇴</button>
		</td>
	
		</tr>
		</table>
	</div>
	
				</form>
</body>
</html>