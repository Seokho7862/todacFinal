<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script type="text/javascript">
$(function(){
	
		$('.detailCon').hide();
	
	
	
	$('.userId').click(function(){
		var index = $(this).attr('id');
		$(this).parents('tr').siblings('tr').find('td#'+index).find('.detailCon').slideToggle();
		
	});
	
	
	
});
</script>
</head>
<body>
<h1>병원신청자리스트</h1>
<table>
<thead>
<tr>
<th>아이디</th>
<th>신청자</th>
<th>병원명</th>
<th>사업자번호</th>
<th colspan="2">승인여부</th>
</tr>
</thead>
<tbody>
<c:forEach items="${applylist}" var="a" varStatus="status">
<tr>
<td id="${status.index}" class="userId">${a.muid}</td>
<td>${a.name}</td>
<td>${a.dutyName}</td>
<td>${a.bisunessNumber}</td>
<td><button id="acceptHos">승인</button> </td>
<td> <button>거부</button> </td>
</tr>
<tr>
<td id="${status.index}" colspan="4">
<div class="detailCon">
${a.relFile} <br>
${a.name} <br>
${a.bisunessNumber}
<button>check</button>
</div>
</td>
</tr>
</c:forEach>
</tbody>
</table>
  <div class="modal fade" id="myModal" >
    <div class="modal-dialog modal-dialog-centered" >
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <p class="text_blur">
          Modal body..
        </p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>