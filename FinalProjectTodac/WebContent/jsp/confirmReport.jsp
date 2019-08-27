<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	var user;
	$('.deleteUser').on('click',function(){
		user = $(this).parent('td').siblings('td.userId').text();
		alert(user);
		$('.confirmDel').text(user+"님을 탈퇴하시겠습니까?");
		
	});
	$('#conDelete').on('click',function(){
		alert(user);
		$.ajax({
			url : 'delete_user.do',
			data:{
				muid : user
			},
			success:function(data){
				alert(data);
				if(data==1){
				alert("탈퇴가 완료되었습니다.");
				history.go(0);
				}
				else{
					alert("다시 탈퇴를 진행해주세요.");
				}
			},
			error : function(){
				alert("다시 시도해주세요.");
			}
			
			
		});
		
	});
	
});

</script>



</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Todac&mdash;	관리자</h1>
  <p>오늘의 토닥</p> 
</div>
<jsp:include page="forAdmin_nav.jsp"></jsp:include>


<div class="container" style="margin-top:30px;margin-left: 20px">
  <div class="row">
    <div class="col-2">
      <h2>관리자 모드</h2>
      <h5>${muid}님</h5>
      <div class="fakeimg">Fake Image</div>
      <p></p>
      <hr>
      <h3 style="margin-top: 30px"><a href="admin_main.do">관리 목록</a></h3>
      <p></p>
      <ul id="navAd" class="nav nav-pills flex-column">
      
        <li class="nav-item">
          <a class="nav-link" href="report_list.do">신고 목록 리스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="over_report_list.do">탈퇴예정 목록</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    
   <div class="col-10">
<h1>탈퇴예정 리스트</h1>
<div class="container">
<div class="row">
<table class="table table-hover">
<thead>
<tr>
<th>NO.</th>
<th>신고받은 ID</th>
<th>이름</th>
<th>E-Mail</th>
<th>전화번호</th>
<th>주소</th>
<th>탈퇴</th>
</tr>
</thead>
<tbody id="reportl">

<c:forEach items="${overlist}" var="o" varStatus="status">
<tr>

<td>${ status.index+1}</td>
<td class="userId">${o.muid}</td>
<td>${o.name}</td>
<td>${o.email}</td>
<td>${o.phone}</td>
<td>${o.address_road}+${o.address_detail}</td>
<td><button data-toggle="modal" data-target="#myModal" data-backdrop="static" class="deleteUser">탈퇴</button> </td>
</tr>

</c:forEach>
</tbody>
</table>
</div> 
</div>

  <div class="modal fade" id="myModal" >
    <div class="modal-dialog modal-dialog-centered" >
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">탈퇴 확인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <p class="confirmDel"></p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="conDelete" type="button" class="confirm btn btn-secondary" data-dismiss="modal">탈퇴</button>
        </div>
        
      </div>
    </div>
  </div>


</div>
</div>
</body>
</html>