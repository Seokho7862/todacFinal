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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(changBtn).bind('click',function(){
	var loc = $('#sample4_roadAddress').val();
	$.ajax({url: 'https://dapi.kakao.com/v2/local/search/address.json?',
			data : {'query': loc},
			headers: { 'Authorization': 'KakaoAK 00695ec487505656d830c294acef3108',
						}, 
			type: 'GET' }).done(function(data) { 
				
				for (var i = 0; i < data.documents.length; i++) {
	
				$(latitude).val(data.documents[i].address.x);
				$(longitude).val(data.documents[i].address.y);
				
				var year = $(birth1).val();
				var month = $(birth2).val();
				if(month<10){month="0"+month}
				var day = $(birth3).val();
				if(day<10){day="0"+day}
				var birthDay = year+"-"+month+"-"+day;
				$(birth).val(birthDay);
				
				}
				console.log(data); 
			});
	
		
	});
	
	$(muid).focusout(function(){
		var id = $('#muid').val();
		var result ="";
		$.ajax({
			url: 'idCheck.do',
			data: {muid: $('#muid').val()},
			type: 'get',
			success : function(data){
				if(data==0){
					result= result+"사용가능한 아이디입니다.";
				}else{
					result= result+"이미 사용중인 아이디입니다.";
				}
				
				$('#idCheckDiv').html(result);
			}
			});
	});
	
	
$('#submitBtn').mouseover(function(){locAndBirth();})
});

function locAndBirth(){
	$(changBtn).trigger('click');	
}



	function signUpCheck(){
		
		if($('#name').val()==""){
			alert("이름을 입력하지 않으셨습니다. 다시 확인해주세요.")
			return false;
		}
		else if($('#muid').val()==""){
			alert("ID를 입력하지 않으셨습니다. 다시 확인해주세요.")
			return false;
		}
		else if($('#pwd').val()==""){
			alert("비밀번호를 입력하지 않으셨습니다. 다시 확인해주세요.")
			return false;
		}else if($('#pwchk').val()==""){
			alert("비밀번호 확인을 입력하지 않으셨습니다. 다시 확인해주세요.")
			return false;
		}else if($('#email').val()==""){
			alert("이메일을 입력하지 않으셨습니다. 다시 확인해주세요.")
			return false;
		}else if($('#phone').val()==""){
			alert("휴대전화 번호를 입력하지 않으셨습니다. 다시 확인해주세요.")
			return false;
		}else if($('#sample4_roadAddress').val()==""){
			alert("주소를 입력하지 않으셨습니다. 다시 확인해주세요.")
			return false;
		} else if($('#idCheckDiv').html()=="이미 사용중인 아이디입니다."){
			alert("중복된 아이디가 존재합니다. \n 다른 아이디를 입력해주세요.")
			return false;
		}else if($('#idCheckDiv').html()==""){
			alert("ID중복확인을 진행해주세요.")
			return false;
		}
		else if($('#pwd').val()!=($('#pwchk').val())){
			alert("비밀번호 확인이 일치하지 않습니다. 다시 확인해주세요.");
			return false;
		}
		
		else{
			
			locAndBirth();
			
			return true;
				
	}
	}
	
	

</script>
<style type="text/css">
.table-borderless{
width: 70%;
margin-left:auto;
font-size:large;
font-weight: bold;
}
.form-control{
width: 50%;}

</style>

</head>
<body>
<h1>회원가입</h1>
<form action="signUp.do" method="get" onsubmit='return signUpCheck()' class="form-group"> 
<table class="table-borderless">
<tr><td>이름:<br><input type="text" name="name" id="name" class="form-control"></td></tr>
<tr><td>아이디 <br><input type="text" name="muid" id="muid" class="form-control"><br><div id="idCheckDiv" style="color: red"></div></td></tr>

<tr><td>비밀번호 : <br><input type="text" name="pwd" id="pwd" class="form-control"></td></tr>
<tr><td>비밀번호 확인: <br><input type="text" name="pwchk" id="pwchk" class="form-control"></td></tr>
<tr><td>생년월일: <br>
<div class="form-inline">
<select id="birth1" class="form-control" style="width: 100px;">
       <%for(int i=2013; i>=1900; i--){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
     </select>년 &nbsp;
     <select id="birth2" class="form-control" style="width: 100px;">
       <%for(int i=1; i<=12; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
     </select>월  &nbsp;
     <select id="birth3" class="form-control" style="width: 100px;">
       <%for(int i=1; i<=31; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
     </select>일</div></td></tr>

<tr><td>이메일:<br><input name="email" type="email" id="email" class="form-control"></td></tr>
<tr><td>휴대전화번호:<br><input type="text" name="phone" placeholder=" - 없이 숫자만 입력해주세요. " class="form-control"></td></tr>

<tr><td>주소 검색<br><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form-control"><br>
<input type="text" id="sample4_postcode" name="sample4_postcode" placeholder="우편번호" readonly="readonly" class="form-control"><br>
<input type="text" name="sample4_roadAddress" id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly" class="form-control"><br>
<input type="text" name="sample4_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly" class="form-control"><br>
<input type="text" name="sample4_extraAddress" id="sample4_extraAddress" placeholder="참고항목" class="form-control">
<span id="guide" style="color:#999;display:none"></span><br>
</td></tr>

<tr><td ><br><input type="text" name="latitude" id="latitude" class="form-control"></td></tr>
<tr><td ><br><input type="text" name="longitude" id="longitude" class="form-control"><br><input name="birth" type="text" id="birth" class="form-control"></td></tr>

<tr><td><input type="submit" value="회원가입 완료" id="submitBtn"></td></tr>
</table>
</form>
<input type="button" id="changBtn" hidden="true">

</body>
</html>