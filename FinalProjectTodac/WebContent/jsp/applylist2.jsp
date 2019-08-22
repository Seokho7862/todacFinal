<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todac</title>
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
	
	$('.busBtn').on('click',function(){
		 var a = window.open("https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml",'subWin','width=600,height=300');
	});
	
	$('.acceptHos').on('click',function(){
		alert("승인하시겠습니까?");//시간나면 모달로 받아서 승인,거부 다시 물어보기
		alert($(this).parents('tr').find('td.userId').text());
		alert($(this).text());
		alert($(this).parents('tr').find('td').find('input.hpid').val());
		alert($(this).parents('tr').find('td').find('input.aid').val());
		
		var findb = $(this).parents('tr').find('td').find('button.acceptHos');
		var muid = $(this).parents('tr').find('td.userId').text();
		var hpid = $(this).parents('tr').find('td').find('input.hpid').val();
		var aid = $(this).parents('tr').find('td').find('input.aid').val();
		var change = $(this).text();
		
		function disChange(){
			alert(findb);
			findb.text("승인완료");
			findb.attr('disabled','disabled');
		}
		
		$.ajax({
			url:'accept_manager.do',
			data:{
				muid : muid,
				hpid : hpid,
				said : aid
			},
			success : function(data){
				alert(data)
				if(data==1){
					
				alert("성공");
				disChange();
				
			
				}
				else{
					alert("실패");
				}
				
			},
			error : function(){
				alert("다시시도해주세요.");
				
			}
			
		});
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
<tbody id="applyl">
<c:forEach items="${applylist}" var="a" varStatus="status">
<tr>
<td id="${status.index}" class="userId">${a.muid}</td>
<td>${a.name}</td>
<td>${a.hpid}</td>
<td><input class="hpid" type="hidden" value="${a.hpid}"></td>
<td><input class="aid" type="hidden" value="${a.aid}"></td>
<td>${a.dutyName}</td>
<td>${a.bisunessNumber}</td>
<td><button class="acceptHos">승인</button> </td>
<td><button class=".denyHos">거부</button> </td>
</tr>
<tr>
<td id="${status.index}" colspan="4">
<div class="detailCon">
<img width="100px" height="200px" src="download.do?aid=${a.aid}">
 <br>
${a.name} <br>
${a.bisunessNumber}
<button class="busBtn">check</button>
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
          	승인하시겠습니까?
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