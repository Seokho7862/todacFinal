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
	$('.deleteUser').on('click',function(){
		var user = $(this).parent('td').siblings('td.userId').text();
		alert(user);
		$('.confirmDel').text(user+"님을 탈퇴하시겠습니까?");
		
	});
	
	
});

</script>



</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<h1>탈퇴예정 리스트</h1>
<div class="container">
<div class="row">
<table>
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
          <button type="button" class="confirm btn btn-secondary" data-dismiss="modal">탈퇴</button>
        </div>
        
      </div>
    </div>
  </div>


</div>
</div>
</body>
</html>