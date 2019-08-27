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
	$('.deletelike').on('click',function(){
	var llid=$(this).parent('td').siblings('td').find('input.likeid').val();
	$.ajax({
		url : 'delete_like.do',
		data:{
			llid :llid
		},
		success : function(data){
			if(data==1){
				
			alert("즐겨찾기 삭제했습니다.");
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
<h1>즐겨찾기</h1>
<form action="">
<table>
  <tr>
  <th colspan="2">No.</th>
  <th>병원이름</th>
  <th>병원주소</th>
  <th>삭제</th>
  </tr>
  
  <c:forEach items="${likelist}" var="l" varStatus="status" >
  <tr>
  <td><input type="hidden" class="likeid" value="${l.lid}"></td>
  <td>${status.count}</td>
  <td>${l.dutyName}</td>
  <td>${l.dutyAddr}</td>
  <td><button class="deletelike">삭제</button></td>
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