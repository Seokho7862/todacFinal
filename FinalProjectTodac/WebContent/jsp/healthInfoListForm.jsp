<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document)
		.ready(
			function() {
				$('.bestBtn').bind('click',function() {
		var getType = 0;
		if ($(this).attr('id') == "weeklyBest") {
		getType = 1;
		} else if ($(this).attr('id') == "monthlyBest") {
		getType = 2;
		} else {
		getType = 3;}
		var te = "";
		$.ajax({url : "getListOfTop3.do",
				data : {"getType" : getType},
				success : function(data) {
		for (var i = 0; i < data.length; i++) {
			te = te+ '<tr><td><a href=healthInfoReadForm.do?iid=';
			te = te+ data[i].iid
			te = te+ '&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">';
			te = te+ data[i].iid
			te = te+ '</a></td>'
			
			te = te+ '<td><a href=healthInfoReadForm.do?iid=';
			te = te+ data[i].iid
			te = te+ '&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">';
			te = te+ data[i].title
			te = te+ '</a></td>';
			
			te = te+ '<td><a href=healthInfoReadForm.do?iid=';
			te = te+ data[i].iid
			te = te+ '&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">';
			te = te+ data[i].writer
			te = te+ '</a></td>';
			
			te = te+ '<td><a href=healthInfoReadForm.do?iid=';
			te = te+ data[i].iid
			te = te+ '&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">';
			te = te+ data[i].readcount
			te = te+ '</a></td>';
		}
		
			$('#resultTbody').html(te);}
					});

			});

	});
</script>
</head>
<body>
	<h1>건강정보 리스트</h1>

	<table border="1">
		<tr>
			<td>작성자</td>
			<td>제목</td>
			<td>내용</td>
			<td>조회수</td>
		</tr>

		<c:forEach items="${healThInfoList}" var="HealthInfo" step="1">

			<tr>
				<td><a
					href="healthInfoReadForm.do?iid=${HealthInfo.iid}&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">${HealthInfo.writer}</a></td>
				<td><a
					href="healthInfoReadForm.do?iid=${HealthInfo.iid}&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">${HealthInfo.title}</a></td>
				<td><a
					href="healthInfoReadForm.do?iid=${HealthInfo.iid}&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">${HealthInfo.content}</a></td>
				<td><a
					href="healthInfoReadForm.do?iid=${HealthInfo.iid}&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">${HealthInfo.readcount}</a></td>

			</tr>

		</c:forEach>

	</table>
	<form action="healthInfoList.do" method="get">
		검색타입 체크박스 <select name="searchType">
			<option value="1">제목</option>
			<option value="2">내용</option>
			<option value="3">작성자</option>
		</select> <br> <input type="text" name="keyword"> <input
			type="submit" value="검색">
	</form>

	<input type="button" value="글쓰기"
		onclick="location.href='healthInfoWriteForm.do'">


	<c:forEach var="nums" begin="${pageinfo.startPage }"
		end="${pageinfo.endPage }">
		<input type="button" value="${nums}"
			onclick="location.href='healthInfoList.do?page=${nums}&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}'">
	</c:forEach>
	<br> 총 게시글 수: ${pageinfo.num}
	<br> 총 페이지 수: ${pageinfo.lastPage }
	<br> 첫 페이지 : ${pageinfo.startPage }
	<br> 끝 페이지 : ${pageinfo.endPage }
	<br> 현 페이지 : ${pageinfo.page }
	<br>
	<br>

	<div id="top3Div">
		<h1>인기 게시물</h1>
		<input type="button" value="주간" id="weeklyBest" class="bestBtn">
		<input type="button" value="월간" id="monthlyBest" class="bestBtn">
		<input type="button" value="전체" id="totallyBest" class="bestBtn">
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		<tbody id="resultTbody">
			<c:forEach items="${top3}" var="top" step="1">
				<tr>
					<td><a
						href="healthInfoReadForm.do?iid=${top.iid}&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">${top.iid }</a></td>
					<td><a
						href="healthInfoReadForm.do?iid=${top.iid}&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">${top.title }</a></td>
					<td><a
						href="healthInfoReadForm.do?iid=${top.iid}&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">${top.writer }</a></td>
					<td><a
						href="healthInfoReadForm.do?iid=${top.iid}&page=${pageinfo.page }&keyword=${pageinfo.keyword}&searchType=${pageinfo.searchType}">${top.readcount }</a></td>
				</tr>
			</c:forEach>
		</tbody>

		</table>
	</div>


</body>
</html>