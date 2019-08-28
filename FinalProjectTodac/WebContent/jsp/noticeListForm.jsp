<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>토닥&mdash;Todac</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
.table-bordered{

max-height: 800px;
}
td{
font-size:large;
cursor: pointer;

}
#tableDiv{
width:100%;
max-height: 600px;
overflow: scroll;

}
#ListTable{
width: 100%;

}


  </style>
  
</head>
<body>
	<!--::header part start::-->
	<jsp:include page="header2.jsp"></jsp:include>
	<!-- Header part end-->

	<div id="header">
	<%-- <jsp:include page="header2.jsp"></jsp:include> --%>
	</div>

<div id="tableDiv">
<table class="table-hover" class="table-bordered" id="ListTable"> 
<thead><tr><th style="text-align: center;">공지번호</th><th>　  제목</th><th style="text-align: center;"> 작성자 　</th><th style="text-align: center;"> 작성일</th></tr></thead>
<c:forEach items="${noticeList}" var="notice">
<tr>
<td style="text-align: center;">${notice.nid }</td><td onclick="location.href='noticeReadForm.do?nid=${notice.nid}'" style="width: 800px;">　  ${notice.title}</td><td style="text-align: center;">  관리자　</td><td style="text-align: center;"> ${notice.ndate }　</td>
</tr>
</c:forEach>


	</table>
	</div>
<c:if test="${sessionScope.status==7}">
<input class="btn btn-outline-secondary" type="button" value="공지사항 작성" onclick="location.href='noticeWriteForm.do'">
</c:if>
	<!--::header part start::-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Header part end-->
</body>
</html>