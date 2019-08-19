<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-left: 300px">
	<h1>My Info</h1>
		<table>
		<tr>
		<td>아이디</td>
		<td><input type="text" name="id" disabled="disabled" value="${member.muid}"></td>
		</tr>
		
		<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="${member.name }"></td>
		</tr>
		
		<tr>
		<td>생년월일</td>
		<td><input type="text" name="birth" value="${member.birth}"></td>
		</tr>
		
		<tr>
		<td>폰번호</td>
		<td><input type="text" name="phone" value="${member.phone }"></td>
		</tr>
		
		<tr>
		<td>주소</td>
		<td><input type="text" name="address" value="${member.address_road }"></td>
		</tr>
		
		<tr>
			
		<td>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#pwdCheck" data-backdrop="static">
		수정</button>
		</td>
		<td>
		<button type="button" class="btn btn-primary">
		탈퇴</button>
		</td>
	
		</tr>
		</table>
	</div>
	
	 <!-- The Modal -->
  <div class="modal fade" id="pwdCheck" >
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	비밀번호
          <input type="password" id="checkPwd">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="confirmBtn" type="button" class="btn btn-secondary">confirm</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  <script type="text/javascript">
  $('#confirmBtn').on('click',function(){
	  location.href="";
	  
  });
  </script>
</body>
</html>