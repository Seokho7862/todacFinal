<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.deleteBtn').on('click',function(){
	var rrid=$(this).parent('td').siblings('td').find('input.rrid').val();
	
	$.ajax({
		url : 'delete_review.do',
		data:{
			rrid :rrid
		},
		success : function(data){
			if(data==1){
				
			alert("리뷰를 삭제했습니다.");
			}else{
				alert("다시 삭제를 눌러주세요.");
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
<jsp:include page="myPage.jsp"></jsp:include>

<div class="container">
<div class="row">
<jsp:include page="mypagenav.jsp"></jsp:include>

<div class="col-md-8">
<h1>내가 쓴 리뷰</h1>
<form action="">
<table>
  <tr>
  <th colspan="2">No.</th>
  <th>제목</th>
  <th>병원이름</th>
  <th>병원주소</th>
  <th>평점</th>
  <th>작성일</th>
  <th>삭제</th>
  </tr>
  <c:forEach items="${reviewlist}" var="r" varStatus="status">
  <tr>
  <td>${status.count}</td>
   <td><input type="hidden" class="rrid" value="${r.rid}"></td>
  <td>${r.title}</td>
  <td>${r.dutyName}</td>
  <td>${r.dutyAddr}</td>
  <td>${r.grade}</td>
  <td>${r.rdate}</td>
  <td><button class="deleteBtn">삭제</button></td>
  </tr>
  
  </c:forEach>
  

</table>

</form>
</div>
</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>