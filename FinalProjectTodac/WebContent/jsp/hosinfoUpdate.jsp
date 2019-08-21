<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todac</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-left: 300px">
<form action="memModi.do" enctype="multipart/form-data" method="post" onsubmit="return pwcheck()" class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
	
	<h2 class="w3-center">병원정보</h2>
	
	<div class="w3-row w3-section">
  	<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
      <input type="text" value="병원명" >
    </div>
	</div>
	
	<div class="w3-row w3-section">
  	<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <input type="text" value="대표">
    </div>
	</div>
	
	<div class="w3-row w3-section">
  	<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
   	월 <input type="time" value="00:00">~<input type="time" value="00:00">
  	화<input type="time" value="00:00">~<input type="time" value="00:00">
        수<input type="time" value="00:00">~<input type="time" value="00:00">
 	 목<input type="time" value="00:00">~<input type="time" value="00:00">
  	금<input type="time" value="00:00">~<input type="time" value="00:00">
 	 토<input type="time" value="00:00">~<input type="time" value="00:00">
       일<input type="time" value="00:00">~<input type="time" value="00:00">
     공휴일<input type="time" value="00:00">~<input type="time" value="00:00">
    </div>
	</div>
	
	<div class="w3-row w3-section">
  	<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
      <div class="w3-rest">
      <input type="text" value="전화번호" >
    </div>
	</div>
	
	<div class="w3-row w3-section">
  	<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
       <div class="w3-rest">
      <input type="text" value="주소" >
    </div>
	</div>
	
	<div class="w3-row w3-section">
  	<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
      <div class="w3-rest">
      <input type="text" value="병원사진">
    </div>
	</div>	
		
	<div class="w3-row w3-section">
  	<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
     <div class="w3-rest">
      <input type="text" value="병원설명">
    </div>
	</div>
	
	<div class="w3-row w3-section">
  	<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
     <div class="w3-rest">
      <input type="file" name="ufile">
    </div>
	</div>
			
<p class="w3-center">
<input class="w3-button w3-section w3-black w3-ripple" type="submit" value="수정">
</p>
	
	

</form>
</div>
</body>
</html>