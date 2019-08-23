<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
cursor: pointer;

}
#tableDiv{
width:1180px;
max-height: 600px;
overflow: scroll;

}


  </style>
  
</head>
<body>


	<div id="header">
	<jsp:include page="header2.jsp"></jsp:include>
	</div>

<div id="tableDiv">
<table class="table-bordered"> 
<thead><tr><th>글번호</th><th>　  제목</th><th> 작성자 　</th><th> 작성일</th></tr></thead>
<c:forEach items="${noticeList}" var="notice">
<tr>
<td style="text-align: center;">${notice.nid }</td><td onclick="location.href='noticeReadForm.do?nid=${notice.nid}'" style="width: 800px;">　  ${notice.title}</td><td>  관리자　</td><td> ${notice.ndate }　</td>
</tr>
</c:forEach>


	</table>
	</div>

<input class="btn" type="button" value="공지사항 작성" onclick="location.href='noticeWriteForm.do'">


</body>
</html>