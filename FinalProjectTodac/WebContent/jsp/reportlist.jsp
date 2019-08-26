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
	var reportedid="";
	var deltr="";
	$('.reportAcc').on('click',function(){
		reportedid = $(this).parents('tr').find('input.reportedid').val();
		alert(reportedid);
		var reviewcon = $(this).parents('tr').find('input.reCon').val();
		var redate = $(this).parents('tr').find('input.reDate').val();
		var remuid = $(this).parents('tr').find('input.reDate').val();
		deltr = $(this).parent('td').parent('tr');
		alert(reviewcon);
		$('.reviewCon').text(reviewcon);
		$('.reviewdate').text(redate);
		$('.reMuid').text(reportedid);
		
		
		
	});
	$('.confirm').on('click',function(){
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
	
	
	$('.deleteBtn').on('click',function(){
		var reid = $(this).parents('tr').find('td').find('input.reportid').val();
		alert(reid);
		
		
	});
	
	

	
	
});
</script>


</head>
<body>
<h1>신고받은 리스트</h1>
<div class="container">
<div class="row">
<table>
<thead>
<tr>
<th>NO</th>
<th>신고자</th>
<th>신고일자</th>
<th>신고사유</th>
<th>게시물ID</th>
<th>신고</th>
<th>삭제</th>
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
<td>${p.REPORTDATE}</td>
<td>${p.REPORTREASON}</td>
<td>${p.RID}</td>
<td><button data-toggle="modal" data-target="#myModal" data-backdrop="static" class="reportAcc">신고</button> </td>
<td><button class="deleteBtn">삭제</button> </td>
</tr>
<%-- <tr>
<td id="${status.index}" colspan="4">
<div class="detailCon">
<img width="100px" height="200px" src="download.do?aid=${a.aid}">
 <br>
${a.name} <br>
${a.bisunessNumber}
<button class="busBtn">check</button>
</div>
</td>
</tr> --%>
</c:forEach>
</tbody>
</table>

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
          <button type="button" class="confirm btn btn-secondary" data-dismiss="modal">신고하기</button>
        </div>
        
      </div>
    </div>
  </div>


</div>
</div>

</body>
</html>