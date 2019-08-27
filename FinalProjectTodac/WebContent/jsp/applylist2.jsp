<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todac</title>
 


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">


$(function(){
	
	
	
	
	$('.userId').click(function(){
		var index = $(this).attr('id');
		$(this).parents('tr').siblings('tr').find('td#'+index).find('.detailCon').slideToggle();
		
	});
	
	$('.busBtn').on('click',function(){
		 var a = window.open("https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml",'subWin','width=600,height=300');
	});
	
	var muid;
	var hpid;
	var username;
	var business;
	var photo;
	$('.acceptHos').on('click',function(){
		alert("승인하시겠습니까?");//시간나면 모달로 받아서 승인,거부 다시 물어보기
		alert($(this).parent('td').siblings('td.userId').text());
		alert($(this).parent('td').siblings('td').find('input.hpid').val());
		alert($(this).parent('td').siblings('td').find('input.aid').val());
		alert($(this).parent('td').siblings('td').find('input.username').val());
		alert($(this).parent('td').siblings('td').find('input.business').val());
		alert($(this).parent('td').siblings('td').find('input.photo').val());
		
		var findb = $(this).parents('tr').find('td').find('button.acceptHos');
		muid = $(this).parent('td').siblings('td.userId').text();
		hpid = $(this).parent('td').siblings('td').find('input.hpid').val();
		aid = $(this).parent('td').siblings('td').find('input.aid').val()
		username = $(this).parent('td').siblings('td').find('input.username').val();
		business = $(this).parent('td').siblings('td').find('input.business').val();
		photo = $(this).parent('td').siblings('td').find('input.photo').val();
		
		$('.applyMuid').text(muid);
		$('.ap_num').text(business);
		var imginput = "";
		imginput +="<img src="+photo+">";
		$('.ap_photo').append(imginput);
		
		
		});
		$('#applyAc').on('click',function(){
			 $('.ap_photo').empty(); 
		$.ajax({
			url:'accept_manager.do',
			data:{
				muid : muid,
				hpid : hpid,
				haid : aid
			},
			success : function(data){
				alert(data)
				if(data==1){
					
				alert("성공");
				history.go(0);
			
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
		
		$('.close').on('click',function(){
			$('.ap_photo').empty(); 
		});
		
		$('#applyDe').on('click',function(){
			$('.ap_photo').empty(); 
			$.ajax({
				url: 'deny_apply.do',
				data:{
					haid : aid
				},
				success :function(data){
					if(data=="1"){
						
					alert("승인이 거절되었습니다.");
					history.go(0);
					
					}
					else{
						alert("다시 거절해주세요.");
					}
				},
				error : function(){
					alert("다시 시도해주세요");
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
          <a class="nav-link active" href="apply_list.do">병원관계자 신청관리</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>




<div class="col-10">
<h1>병원신청자리스트</h1>
<div class="container">
<div class="row">
<table class="table table-hover">
<thead>
<tr>
<th>아이디</th>
<th>신청자</th>
<th colspan="6">병원명</th>
<th>사업자번호</th>
<th>확인</th>
</tr>
</thead>
<tbody id="applyl">

<c:forEach items="${applylist}" var="a" varStatus="status">
<tr>
<td id="${status.index}" class="userId">${a.muid}</td>
<td>${a.name}</td>
<td>${a.dutyName}</td>
<td><input class="hpid" type="hidden" value="${a.hpid}"></td>
<td><input class="aid" type="hidden" value="${a.aid}"></td>
<td><input class="username" type="hidden" value="${a.name}"></td>
<td><input class="business" type="hidden" value="${a.bisunessNumber}"></td>
<td><input class="photo" type="hidden" value="${a.relFile}"></td>
<td>${a.bisunessNumber}</td>
<td>
<button data-toggle="modal" data-target="#myModal" data-backdrop="static" class="acceptHos">확인</button>
</td>

</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>

<!-- 승인 모달 -->
 <div class="modal fade" id="myModal" >
    <div class="modal-dialog modal-dialog-centered" >
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">관계자 신청</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <table>
        <tr>
        <th>신청자</th>
        <td class="applyMuid"></td>
        </tr>
        <tr>
        <th>사업자 등록번호</th>
        <td class="ap_num"></td>
        </tr>
        <tr>
        <th>사업자 등록 사진</th>
        <td class="ap_photo">
        </td>
        </tr>
        <tr>
        <th>확인
        </th>
        <td><button class="busBtn">check</button></td>
        </tr>
        
     
        </table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="applyAc" type="button" class="btn btn-secondary" data-dismiss="modal">승인</button>
          <button id="applyDe" type="button" class="btn btn-secondary" data-dismiss="modal">거절</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>