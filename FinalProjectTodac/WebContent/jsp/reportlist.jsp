<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;TODAC</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">


$(function(){
	var reportedid="";
	var deltr="";
	var reid="";
	$('.reportAcc').on('click',function(){
		reportedid = $(this).parents('tr').find('input.reportedid').val();
		alert(reportedid);
		var reviewcon = $(this).parents('tr').find('input.reCon').val();
		var redate = $(this).parents('tr').find('input.reDate').val();
		var remuid = $(this).parents('tr').find('input.reDate').val();
		reid = $(this).parents('tr').find('input.reportid').val();
		deltr = $(this).parent('td').parent('tr');
		alert(reviewcon);
		$('.reviewCon').text(reviewcon);
		$('.reviewdate').text(redate);
		$('.reMuid').text(reportedid);
		
		
		
	});
	$('#confirm').on('click',function(){
		alert(reportedid);
		$.ajax({
			url : 'confirm_report.do',
			data:{
				muid : reportedid
			},
			success:function(data){
				alert(data);
				if(data==1){
				alert("신고가 완료되었습니다.");
				deltr.remove();
				}
				else{
					alert("다시 신고를 해주세요.");
				}
			},
			error : function(){
				alert("다시 시도해주세요.");
			}
			
			
		});
		
	});
	
	
	$('#deleteU').on('click',function(){
		alert(reid);
		$.ajax({
			url : 'delete_report.do',
			data:{
				reportid : reid
			},
			success:function(data){
				alert(data);
				if(data==1){
				alert("신고가 삭제되었습니다.");
				history.go(0);
				}
				else{
					alert("다시 되돌리기를 해주세요.");
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
          <a class="nav-link active" href="report_list.do">신고 목록 리스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="over_report_list.do">탈퇴예정 목록</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    
<div class="col-10">
<h1>신고받은 리스트</h1>
<div class="container">
<div class="row">
<table class="table table-hover">
<thead>
<tr>
<th>NO</th>
<th>신고자</th>
<th>신고받은 사용자</th>
<th>신고일자</th>
<th>신고사유</th>
<th>게시물ID</th>
<th>신고</th>
</tr>
</thead>
<tbody id="reportl">

<c:forEach items="${reportlist}" var="p" varStatus="status">
<tr>
<input class="reportid" type="hidden" value="${p.REPORTID}">
<input class="reportedid" type="hidden" value="${p.MUID_1}">
<input class="reCon" type="hidden" value="${p.CONTENT}">
<input class="reDate" type="hidden" value="${p.RDATE}">
<td>${ status.index+1}</td>
<td id="${status.index}" class="userId">${p.MUID}</td>
<td>${p.MUID_1}</td>
<td>${p.REPORTDATE}</td>
<td>${p.REPORTREASON}</td>
<td>${p.RID}</td>
<td><button data-toggle="modal" data-target="#myModal" data-backdrop="static" class="reportAcc">신고</button> </td>
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
          <h4 class="modal-title">신고된 게시물</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <table>
        <tr>
        <th>작성자</th>
        <td class="reMuid"></td>
        </tr>
        <tr>
        <th>신고된 후기내용</th>
        <td class="reviewCon"></td>
        </tr>
        <tr>
        <th>게시물 일자</th>
        <td class="reviewdate"></td>
        </tr>
        
     
        </table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="confirm" type="button" class="btn btn-secondary" data-dismiss="modal">신고하기</button>
          <button id="deleteU" type="button" class="btn btn-secondary" data-dismiss="modal">되돌리기</button>
        </div>
        
      </div>
    </div>
  </div>


</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>